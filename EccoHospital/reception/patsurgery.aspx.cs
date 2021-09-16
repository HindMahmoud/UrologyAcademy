using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.reception
{
    public partial class patsurgery : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["remove"]))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            
                Response.Redirect("patsurgery.aspx");
           
        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["remove"]))
            {
                int r = int.Parse(Request.QueryString["remove"]);
                Surgery_history t = (from n in db.Surgery_history where n.id == r select n).FirstOrDefault();
                db.Surgery_history.Remove(t);
                db.SaveChanges();
                Response.Redirect("patsurgery.aspx");

            }
        }
    }
}