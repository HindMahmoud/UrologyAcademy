using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital
{
    public partial class solfaall : System.Web.UI.Page
    {
       EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

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
        protected void reload_Click(object sender, EventArgs e)
        {
            Response.Redirect("solfaall.aspx");


        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("solfaall.aspx");
        }



        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                if (db.loan.Any(a => a.id == x))
                {


                    if(db.loan_installment.Any(a=>a.loan_id==x))
                    {
                        var pp = (from s in db.loan_installment where s.loan_id == x select s).ToList();
                        if(pp!=null)
                        {
                            db.loan_installment.RemoveRange(pp);
                            db.SaveChanges();

                        }
                    }

                    var p = (from s in db.loan where s.id == x select s).FirstOrDefault();


                    db.loan.Remove(p);
                    db.SaveChanges();

                }
                Response.Redirect("solfaall.aspx");

            }
        }
        protected void show_Click(object sender, EventArgs e)
        {

            if (from1.Text != "" && to1.Text != "" )
            {
                Response.Redirect("solfaall.aspx?date1=" + from1.Text + "&&date2=" + to1.Text );
            }
            

        }

    }
}