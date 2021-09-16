using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital
{
    public partial class addall : System.Web.UI.Page
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
            Response.Redirect("addall.aspx");


        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("addall.aspx");
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
                Response.Redirect("addall.aspx");

            }
        }
        protected void show_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "" && emp.Text == "")
            {
                Response.Redirect("addall.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }
            else if (from1.Text != "" && to1.Text != "" && emp.Text !="")
            {
                Response.Redirect("addall.aspx?date1=" + from1.Text + "&&date2=" + to1.Text + "&&pro=" + emp.Text);
            }
            if (from1.Text == "" && to1.Text == "" && emp.Text != "")
            {
                Response.Redirect("addall.aspx?pro=" + emp.Text);
            }
        }
        protected void print_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["pro"])))
            {
                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);
                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);


                string aa = d1.ToString("yyyy-MM-dd HH:mm:ss.fff");
                string bb = d2.ToString("yyyy-MM-dd HH:mm:ss.fff");

                 int po = Convert.ToInt32(Request.QueryString["pro"]);



                string q = @"select * from add_list it  where it.del='false' and date >='" + aa + "' and date <='" + bb + "' and emp_id = '"+po+"'";
                string cr = "addRPT.rpt";
                Session["query"] = q;
                Session["cr"] = cr;


                Response.Redirect("report.aspx");
            }
           else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["pro"])))
            {
               

                int po = Convert.ToInt32(Request.QueryString["pro"]);



                string q = @"select * from add_list it  where it.del='false' and emp_id = '" + po + "'";
                string cr = "addRPT.rpt";
                Session["query"] = q;
                Session["cr"] = cr;


                Response.Redirect("report.aspx");
            }
            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
            {
                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);
                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);


                string aa = d1.ToString("yyyy-MM-dd HH:mm:ss.fff");
                string bb = d2.ToString("yyyy-MM-dd HH:mm:ss.fff");




                string q = @"select * from add_list it  where it.del='false' and date >='" + aa + "' and date <='" + bb + "'";
                string cr = "addRPT.rpt";
                Session["query"] = q;
                Session["cr"] = cr;


                Response.Redirect("report.aspx");
            }
        }
    }
}