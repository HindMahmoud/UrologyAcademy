using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;


namespace EccoHospital.PR
{
    public partial class addService : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //if (db.departments.Any())
                //{
                //    var rep = (from s in db.departments select s).ToList();

                //    depList.DataSource = rep;

                //    depList.DataTextField = "name";
                //    depList.DataValueField = "id";
                //    depList.DataBind();
                //    depList.Items.Insert(0, "");

                //}


                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.service f = db.service.FirstOrDefault(a => a.id == x);
                    txt_name.Value = f.name.ToString();
                    txt_price.Value = f.price.ToString();
                    //depList.SelectedValue = f.dep_id.ToString();
                    if (f.serType != null)
                        DropDownList1.SelectedValue = f.serType.ToString();


                    btn.Text = "تعديل";

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }

            }
        }


        protected void btn_Click(object sender, EventArgs e)
        {
            if (txt_name.Value == "")
            {
                MsgBox("ادخل الاسم", this.Page, this);
            }
            if (txt_price.Value == "")
            {
                MsgBox("ادخل السعر", this.Page, this);

            }

            if (DropDownList1.Text == "")
            {
                MsgBox("ادخل النوع", this.Page, this);

            }

            else
            {
                string uname = "";
                int uid = 0;

                if(Session["user"]==null)
                {
                }
                else
                {
                    uid = int.Parse(Session["user_id"].ToString());
                    uname = Session["user"].ToString();

                }


                if (btn.Text == "تعديل")
                {

                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {

                        int x = int.Parse(Request.QueryString["edit"].ToString());

                        EccoHospital.Models.service f = db.service.FirstOrDefault(a => a.id == x);
                        f.name = txt_name.Value;
                        f.price = float.Parse(txt_price.Value);
                        //f.dep_id = int.Parse(depList.SelectedValue.ToString());
                        //f.dep_name = depList.SelectedItem.ToString();
                        f.serType = DropDownList1.Text.ToString();
                        db.SaveChanges();
                        success_m.Visible = true;

                    }

                }

                else
                {

                    service p = new service
                    {
                        name = txt_name.Value,
                        price = float.Parse(txt_price.Value),
                        //T_perc = int.Parse(T.SelectedValue.ToString()),
                        //dep_name = depList.SelectedItem.ToString(),
                        serType = DropDownList1.SelectedValue.ToString(),
                        user_id=uid,
                        user_name = uname

                    };
                    db.service.Add(p);
                    db.SaveChanges();
                    success_m.Visible = true;
                }



            }
        }

        protected void print_Click(object sender, EventArgs e)
        {

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("addService.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                service p = db.service.FirstOrDefault(a => a.id == x);
                service p2 = db.service.Where(a => a.id == x).FirstOrDefault();

                db.service.Remove(p);
                db.SaveChanges();
                success_m.Visible = true;
            }
        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

    }
}