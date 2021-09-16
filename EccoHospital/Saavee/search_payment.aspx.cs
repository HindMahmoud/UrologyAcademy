using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;


namespace EccoHospital.Saavee
{
    public partial class search_payment : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    danger_m.Visible = true;
                    cancel.Visible = true;
                    delbtn.Visible = true;
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                {

                    int x = int.Parse(Request.QueryString["print"].ToString());

                    string q = @"select * from savee  where id=" + x + " ";
                    string cr = "CReport/payR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;


                    Response.Redirect("~/report.aspx");

                }
            }

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                if (db.savee.Any(a => a.id == x))
                {

                    var p = (from s in db.savee where s.id == x select s).FirstOrDefault();


                 
                    p.del = true;
                    db.SaveChanges();

                }
                Response.Redirect("search_payment.aspx");

            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("search_payment.aspx");

        }

        protected void show_Click(object sender, EventArgs e)
        {

            if (from1.Text != "" && to1.Text != "" && bandName.Text != "")
            {
                Response.Redirect("search_payment.aspx?date1=" + from1.Text + "&&date2=" + to1.Text + "&&bandname=" + bandName.Text);
            }
            else if (from1.Text != "" && to1.Text != "" && bandName.Text == "")
            {
                Response.Redirect("search_payment.aspx?date1=" + from1.Text + "&&date2=" + to1.Text );
            }
            else if (from1.Text == "" && to1.Text == "" && bandName.Text != "")
            {
                Response.Redirect("search_payment.aspx?bandname=" + bandName.Text);
            }
            else
            {
                Response.Redirect("search_payment.aspx");
            }



        }

        protected void print_Click(object sender, EventArgs e)
        {

        }
    }
}