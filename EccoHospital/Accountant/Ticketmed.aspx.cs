using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Accountant
{
    public partial class Ticketmed : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                               if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }



            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
            {

                int n = int.Parse(Request.QueryString["t_id"].ToString());
                Response.Redirect("Ticketmed.aspx?t_id="+n);
            }

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int n = int.Parse(Request.QueryString["t_id"].ToString());

                int x = int.Parse(Request.QueryString["id"].ToString());

                treatment p = db.treatment.FirstOrDefault(a => a.id == x);


                //PH_sup_Stock phs = db.PH_sup_Stock.FirstOrDefault(A => A.pro_id == p.med_id && A.dep_id == p.dep_id);
                //phs.quantity = phs.quantity + p.quantity;
                //db.SaveChanges();


                db.treatment.Remove(p);


                db.SaveChanges();




                Response.Redirect("Ticketmed.aspx?t_id=" + n);

            }
        }

        protected void print_Click(object sender, EventArgs e)
        {

        }

     
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

       
    }
}