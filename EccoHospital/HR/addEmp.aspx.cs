using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital
{
    public partial class addEmp : System.Web.UI.Page
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
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
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
            Response.Redirect("addEmp.aspx");


        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("addEmp.aspx");
        }



        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                if (db.add_list.Any(a => a.id == x))
                {

                    var p = (from s in db.add_list where s.id == x select s).FirstOrDefault();



                    p.del = true;
                    db.SaveChanges();

                }
                Response.Redirect("addEmp.aspx");

            }
        }
        protected void show_Click(object sender, EventArgs e)
        {
            if (emp.Text != "")
            {
                var em = emp.SelectedValue.ToString();
                Response.Redirect("addEmp.aspx?emp_id=" + em);
            }
        }
        protected void print_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["emp_id"])))
            {
                int emp_id = int.Parse(Request.QueryString["emp_id"]);




                string q = @"select * from add_list it  where it.del='false' and emp_id ='" + emp_id + "'";
                string cr = "addEmpRPT.rpt";
                Session["query"] = q;
                Session["cr"] = cr;


                Response.Redirect("report.aspx");
            }
        }
    }
}