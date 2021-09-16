using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class DailyIncomes : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                


               if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }

            }
        }


        protected void btn_Click(object sender, EventArgs e)
        {
            if (ddlincome.Text == "")
            {
                MsgBox("ادخل البند", this.Page, this);
            }
           else if (txt_price.Value == "")
            {
                MsgBox("ادخل السعر", this.Page, this);

            }
            else if (txt_date.Text == "")
            {
                MsgBox("ادخل التاريخ", this.Page, this);

            }



            else
            {
                string uname = "";
                int uid = 0;

                if (Session["user"] == null)
                {
                }
                else
                {
                    uid = int.Parse(Session["user_id"].ToString());
                    uname = Session["user"].ToString();

                }


                if(ddlincome.SelectedValue=="save")
                {
                    savee pp = new savee
                    {
                        type = "حسابات",
                        in_value=0,
                        out_value = double.Parse(txt_price.Value),
                        notes = txt_notes.Value,
                        date = Convert.ToDateTime(txt_date.Text),
                        title="تسليم عهده للحسابات",
                        user_id = uid,
                        user_name = uname,
                        del=false

                    };
                    db.savee.Add(pp);
                    db.SaveChanges();
                }

                double x = double.Parse(txt_price.Value);

                if(ddlincome.SelectedValue.ToString()=="dental")
                {
                    doctor_account da = new doctor_account
                    {
                       
                        in_val = double.Parse(doc_txt.Text),
                        out_val = 0,
                        date = DateTime.Now.Date,
                        doc_id = int.Parse(docList.SelectedValue.ToString()),
                    doc_name = docList.SelectedItem.ToString(),
                        title = "ايراد اسنان",
                        type = "اسنان",
                      

                    };
                    db.doctor_account.Add(da);
                    db.SaveChanges();
                    x = double.Parse(hos_txt.Text);
                }

                Acc_save p = new Acc_save
                {
                    title = "ايراد يومي",
                        type = ddlincome.SelectedItem.ToString(),
                        in_value = x,
                        notes=txt_notes.Value,
                        date=Convert.ToDateTime(txt_date.Text),
                        out_value=0,
                        user_id = uid,
                        user_name = uname,
                        del=false

                    };
                    db.Acc_save.Add(p);
                    db.SaveChanges();
                    success_m.Visible = true;
                



            }
        }

        protected void print_Click(object sender, EventArgs e)
        {

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DailyIncomes.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                Acc_save p = db.Acc_save.FirstOrDefault(a => a.id == x);
               

                db.Acc_save.Remove(p);
                db.SaveChanges();
                Response.Redirect("DailyIncomes.aspx");

            }
        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        protected void ddlincome_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlincome.Text!="")
            {
                if(ddlincome.SelectedValue.ToString()=="dental")
                {
                    div4.Visible = true;
                    div5.Visible = true;
                    div6.Visible = true;
                    if (db.doctor.Any())
                    {
                        var a = (from s in db.doctor select s).ToList();
                        docList.DataTextField = "name";
                        docList.DataValueField = "id";
                        docList.DataSource = a;

                        docList.DataBind();
                        docList.Items.Insert(0, string.Empty);
                    }

                }
                else
                {
                    div4.Visible = false;
                    div5.Visible = false;
                    div6.Visible = false;
                }
            }
        }
        protected void hos_txt_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != "" && doc_txt.Text != "" && hos_txt.Text != "")
            {
                double d = double.Parse(doc_txt.Text);
                double h = double.Parse(hos_txt.Text);
                double t = double.Parse(txt_price.Value);

                doc_txt.Text = (t - h).ToString();
                //hos_txt.Text = (t - d).ToString();

            }

        }
        protected void show_Click(object sender, EventArgs e)
        {
           
                if (from1.Text != "" && to1.Text != "")
                {
                    Response.Redirect("DailyIncomes.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
                }
            
        }
        protected void doc_txt_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != "" && doc_txt.Text != "" && hos_txt.Text != "")
            {
                double d = double.Parse(doc_txt.Text);
                double h = double.Parse(hos_txt.Text);
                double t = double.Parse(txt_price.Value);

                // doc_txt.Text = (t - h).ToString();
                hos_txt.Text = (t - d).ToString();

            }
        }

    }
}