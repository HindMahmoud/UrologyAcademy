using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Saavee
{
    public partial class SearchIncome : System.Web.UI.Page
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


                if (db.savee.Any(a => a.id == x))
                {

                    var p = (from s in db.savee where s.id == x select s).FirstOrDefault();



                    p.del = true;
                    db.SaveChanges();

                }
                Response.Redirect("SearchIncome.aspx");

            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SearchIncome.aspx");

        }

        protected void show_Click(object sender, EventArgs e)
        {

            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("SearchIncome.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }



        }

        protected void print_Click(object sender, EventArgs e)
        {

        }

    }
}