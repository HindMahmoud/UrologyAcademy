using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.rad
{
    public partial class rad_today : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            codePat.Focus();
        }
        protected void codePat_TextChanged(object sender, EventArgs e)
        { EccoHospitalEntities y = new EccoHospitalEntities();

            if (codePat.Text != "")
            {
                int id = int.Parse(codePat.Text);
               // int f = Convert.ToInt32(id);
                if (y.patient.Any(ey => ey.code == id.ToString()))
                {
                    Response.Redirect("radProfile.aspx?p_id=" + id.ToString());
                }
            }
        }
    }
}