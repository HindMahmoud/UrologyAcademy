using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.rad
{
    public partial class rad_files : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["iiid"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["files"])))
                {

                    int x = int.Parse(Request.QueryString["iiid"].ToString());
                    int fil = int.Parse(Request.QueryString["files"].ToString());
                    image f = db.image.FirstOrDefault(a => a.id == x);
                    db.image.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("rad_files.aspx?files=" + fil); ;


                }

            }
        }

       
           // Page.ClientScript.RegisterStartupScript(this.GetType(), "Print", "javascript:window.print();", true);

        


    }
}
