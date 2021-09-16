using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;


namespace EccoHospital.PR
{
    public partial class adduser : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //var clinics = (from cli in db.clinic select cli).ToList();
                //clinicID.DataSource = clinics;
                //clinicID.DataTextField = "name";
                //clinicID.DataValueField = "id";
                //clinicID.DataBind();
                //clinicID.Items.Insert(0,"اختار العيادة");

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.user f = db.user.FirstOrDefault(a => a.id == x);
                    txt_name.Value = f.name.ToString();
                    txt_user.Value = f.user_name.ToString();
                    txt_password.Value = f.password.ToString();
                    if(f.priv!=null)
                    privlsit.SelectedValue = f.priv.ToString();

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
            int c = 0;
            string nameclinic="";
            if (txt_name.Value == "")
            {
                MsgBox("ادخل الاسم", this.Page, this);
            }
            if (txt_user.Value == "")
            {
                MsgBox("ادخل اسم المستخدم", this.Page, this);

            }
            if (txt_password.Value == "")
            {
                MsgBox("ادخل  الرقم السرى", this.Page, this);

            }
           
            else
            {
                //if (clinicID.SelectedIndex > 0)
                //{
                //    c = int.Parse(clinicID.SelectedValue);
                //    nameclinic = clinicID.SelectedItem.Text;
                //}
                if (btn.Text == "تعديل")
                {

                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {

                        int x = int.Parse(Request.QueryString["edit"].ToString());

                        EccoHospital.Models.user f = db.user.FirstOrDefault(a => a.id == x);
                        f.name = txt_name.Value;
                        f.user_name = txt_user.Value;
                        f.password = txt_password.Value;
                        f.priv = privlsit.SelectedValue.ToString();
                       // f.clinic_id = c;
                        //f.clinic_name = nameclinic;

                        db.SaveChanges();
                        success_m.Visible = true;

                    }

                }

                else
                {

                    user p = new user
                    {
                        name = txt_name.Value,
                        user_name = txt_user.Value,
                        password = txt_password.Value,
                        priv = privlsit.SelectedValue.ToString(),
                        //clinic_id=c,
                        //clinic_name=nameclinic
                    };
                    db.user.Add(p);
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
            Response.Redirect("adduser.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                user p = db.user.FirstOrDefault(a => a.id == x);
                user p2 = db.user.Where(a => a.id == x).FirstOrDefault();

                db.user.Remove(p);
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