using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StationSales
{
    public partial class additions : System.Web.UI.Page
    {
        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());
                  
                    EccoHospital.Models.addition f = db.addition.FirstOrDefault(a => a.id == x);
                    txt_name.Value = f.title.ToString();
                    txt_value.Value = f.value.ToString();



                    btn.Text = "تعديل";


                }

                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    danger_m.Visible = true;
                    cancel.Visible = true;
                    delbtn.Visible = true;
                }
            }
        }
        protected void reload_Click(object sender, EventArgs e)
        {
            Response.Redirect("additions.aspx");


        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("additions.aspx");
        }



        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                if (db.addition.Any(a => a.id == x))
                {

                    var p = (from s in db.addition where s.id == x select s).FirstOrDefault();
                    p.del = true;
                    db.SaveChanges();

                }
                Response.Redirect("additions.aspx");

            }
        }
        protected void btn_Click(object sender, EventArgs e)
        {


            string n = "";
            if (Session["user"] != null)
            {
                n = Session["user"].ToString();
            }
            int user_id = (from s in db.user where s.user_name == n select s.id).FirstOrDefault();

            if (btn.Text != "تعديل")
            {


                EccoHospital.Models.addition u = new EccoHospital.Models.addition
                {

                    title = txt_name.Value,
                    value = float.Parse(txt_value.Value),
                    user_id = user_id,
                    user_name = n,

                    del = false
                };
                db.addition.Add(u);
                db.SaveChanges();
                // formContent.Visible = false;
                success_m.Visible = true;

            }
            else
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());
                EccoHospital.Models.addition f = db.addition.FirstOrDefault(a => a.id == x);




                f.title = txt_name.Value;
                f.value = float.Parse(txt_value.Value);


                db.SaveChanges();

            }


            //            formContent.Visible = false;
            success_m.Visible = true;


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