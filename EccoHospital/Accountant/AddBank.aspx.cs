using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class AddBank : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if(db.laboratory.Any())
                //{
                //    var f = (from s in db.laboratory select s).ToList();
                //    labss.DataSource = f;
                //    labss.DataTextField = "name";
                //    labss.DataValueField = "id";
                //    labss.DataBind();

                //}

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    bank f = db.bank.FirstOrDefault(a => a.id == x);
                    nametxt.Value = f.name.ToString();
                    acc_no.Value = f.account_num.ToString();

                   
                    btn.Text = "تعديل";


                }

                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["del"])))
                {
                    int x = int.Parse(Request.QueryString["del"].ToString());

                    var ff = db.bank.Where(a => a.id == x).FirstOrDefault();

                    db.bank.Remove(ff);
                    db.SaveChanges();


                    Response.Redirect("AddBank.aspx");
                }
            }
        }


        protected void reload_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBank.aspx");


        }
        protected void btn_Click(object sender, EventArgs e)
        {

            // int lab_id = int.Parse(labss.SelectedValue.ToString());


            if (btn.Text != "تعديل")
            {


                bank u = new bank
                {

                    name = nametxt.Value,
                     account_num = acc_no.Value,
               


            };
                db.bank.Add(u);
                db.SaveChanges();
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
                if (balancetxt.Value != "0" && balancetxt.Value != "")
                {
                    var max_id = (from s in db.bank select s.id).Max();

                    bank_balance bb = new bank_balance
                    {
                        bank_id = max_id,
                        bank_name = nametxt.Value,
                        in_val = double.Parse(balancetxt.Value),
                        date = DateTime.Now,
                        out_val = 0,
                        type = "رصيد افتتاحي",
                        user_name=uname,
                        user_id=uid

                    };
                    db.bank_balance.Add(bb);
                    db.SaveChanges();
                }
                // formContent.Visible = false;
                success_m.Visible = true;

            }
            else
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());
                bank f = db.bank.FirstOrDefault(a => a.id == x);
                f.account_num = acc_no.Value;
               

                f.name = nametxt.Value;


                db.SaveChanges();

            }


            //            formContent.Visible = false;
            success_m.Visible = true;

            // MsgBox("Added successfully", this.Page, this);
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