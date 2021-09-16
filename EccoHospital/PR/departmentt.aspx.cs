using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.PR
{
    public partial class department : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.departments f = db.departments.FirstOrDefault(a => a.id == x);
                    txt_name.Value = f.name.ToString();
                   


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



                if (btn.Text == "تعديل")
                {

                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {

                        int x = int.Parse(Request.QueryString["edit"].ToString());

                        EccoHospital.Models.departments f = db.departments.FirstOrDefault(a => a.id == x);
                        f.name = txt_name.Value;
                      
                        db.SaveChanges();
                        success_m.Visible = true;

                    }

                }

                else
                {

                    departments p = new departments
                    {
                        name = txt_name.Value,
                        user_id=uid,
                        user_name=uname
                           };
                    db.departments.Add(p);
                    db.SaveChanges();
                    success_m.Visible = true;
                }



            }

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                departments p = db.departments.FirstOrDefault(a => a.id == x);
                departments p2 = db.departments.Where(a => a.id == x).FirstOrDefault();

                db.departments.Remove(p);
                db.SaveChanges();
                success_m.Visible = true;
            }

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("departmentt.aspx");

        }

        protected void print_Click(object sender, EventArgs e)
        {

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