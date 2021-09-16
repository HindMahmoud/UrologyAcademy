using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Accountant
{
    public partial class SearchPayment : System.Web.UI.Page
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
            }

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                if (db.Acc_save.Any(a => a.id == x))
                {

                    var p = (from s in db.Acc_save where s.id == x select s).FirstOrDefault();



                    db.Acc_save.Remove(p);
                    db.SaveChanges();

                }
                Response.Redirect("SearchPayment.aspx");

            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchPayment.aspx");

        }

        protected void show_Click(object sender, EventArgs e)
        {

            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("SearchPayment.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }



        }

        protected void print_Click(object sender, EventArgs e)
        {

        }
    }
}