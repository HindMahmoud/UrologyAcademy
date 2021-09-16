using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital
{
    public partial class add_sanc : System.Web.UI.Page
    {
        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                //if (db.employee.Any())
                //{
                //    var f = (from s in db.employee where s.del != true select s).ToList();
                //    emp.DataSource = f;
                //    emp.DataTextField = "name";
                //    emp.DataValueField = "id";
                //    emp.DataBind();
                //    emp.Items.Insert(0, "");

                //}
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.sanc_list f = db.sanc_list.FirstOrDefault(a => a.id == x);
                    sancc.Text = f.sanc_id.ToString();
                    txt_value.Value = f.sanc_value.ToString();
                    emp.Text = f.emp_id.ToString();



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
            Response.Redirect("add_sanc.aspx");


        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_sanc.aspx");
        }



        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                if (db.sanc_list.Any(a => a.id == x))
                {

                    var p = (from s in db.sanc_list where s.id == x select s).FirstOrDefault();
                    p.del = true;
                    db.SaveChanges();

                }
                Response.Redirect("add_sanc.aspx");

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


                EccoHospital.Models.sanc_list u = new EccoHospital.Models.sanc_list
                {

                    emp_name = emp.SelectedItem.ToString(),
                    emp_id = int.Parse(emp.SelectedValue.ToString()),

                    sanc_id = int.Parse(sancc.SelectedValue.ToString()),

                    sanc_name = sancc.SelectedItem.ToString(),

                    sanc_value = float.Parse(txt_value.Value),
                    date=DateTime.Now,
                    user_id=user_id,
                    user_name=n,
                    del = false
                };
                db.sanc_list.Add(u);
                db.SaveChanges();
                // formContent.Visible = false;
                success_m.Visible = true;

            }
            else
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());
                EccoHospital.Models.sanc_list f = db.sanc_list.FirstOrDefault(a => a.id == x);




                f.emp_name = emp.SelectedItem.ToString();
                f.emp_id = int.Parse(emp.SelectedValue.ToString());

                f.sanc_id = int.Parse(sancc.SelectedValue.ToString());

                    f.sanc_name = sancc.SelectedItem.ToString();

                    f.sanc_value = float.Parse(txt_value.Value);

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
    

        protected void sancc_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(sancc.Text !="")
            {
                int s = int.Parse(sancc.SelectedValue.ToString());
                EccoHospital.Models.sanctions emp = db.sanctions.FirstOrDefault(a => a.id == s);
                txt_value.Value = emp.value.ToString();

            }
        }
    }
}