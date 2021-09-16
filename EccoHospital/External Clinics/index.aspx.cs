using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class index : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["idrec"])))
            {
                int idrec = int.Parse(Request.QueryString["idrec"]);
                var patient = (from i in db.clinic_reception where i.id == idrec select i).FirstOrDefault();
                if (patient.status == false)
                { patient.status = true; db.SaveChanges(); }
                else { patient.status = false; db.SaveChanges();
                }
            }

        }
        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                clinic_reception p = db.clinic_reception.FirstOrDefault(a => a.id == x);
                clinic_reception p2 = db.clinic_reception.Where(a => a.id == x).FirstOrDefault();

                db.clinic_reception.Remove(p);
                db.SaveChanges();
                success_m.Visible = true;
            }

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");

        }
    }
}