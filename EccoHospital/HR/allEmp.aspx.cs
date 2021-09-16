using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital
{
    public partial class allEmp : System.Web.UI.Page
    {
       EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                {
                    int empid = 0;
                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                    {

                        empid = int.Parse(Request.QueryString["print"].ToString());
                        string q = @"select * from employee it where    it.id= " + empid + "";
                        string cr = "emp1.rpt";
                        Session["query"] = q;
                        Session["cr"] = cr;


                        Response.Redirect("report.aspx");
                    }
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
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("allEmp.aspx");
        }



        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                //if (db.employee.Any(a => a.id == x))
                //{

                //    var p = (from s in db.employee where s.id == x select s).FirstOrDefault();
                //    p.del= true;
                //    db.SaveChanges();

                //}
                Response.Redirect("allEmp.aspx");

            }
        }

        protected void print_Click(object sender, EventArgs e)
        {
            string q = @"select * from employee it  where it.del='false'  ";
            string cr = "allemps.rpt";
            Session["query"] = q;
            Session["cr"] = cr;


            Response.Redirect("report.aspx");

        }
    }

}