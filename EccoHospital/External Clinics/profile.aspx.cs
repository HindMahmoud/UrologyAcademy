using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class profile : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["patid"])))
            {
               
                int recpid = int.Parse(Request.QueryString["patid"]);
                var patientProfileData = (from m in db.clinic_reception join i in db.patient on m.patient_id equals i.id where m.id== recpid select m ).FirstOrDefault();
                
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
           
        }
    }
}