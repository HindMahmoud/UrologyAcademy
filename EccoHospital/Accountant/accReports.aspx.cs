using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.Accountant
{
    public partial class accReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {
               
                    Response.Redirect("SurgryReport.aspx?date1=" + txt_from.Text + "&&date2=" + txt_to.Text);
               
            }
        }
    

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {

                Response.Redirect("NursReport.aspx?date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {

                Response.Redirect("clinicReport.aspx?date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {

                Response.Redirect("clinicDetails.aspx?date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {

                Response.Redirect("ServiceDetails.aspx?n=عنايه&&date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {

                Response.Redirect("ServiceDetails.aspx?n=حضانه&&date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {

                Response.Redirect("ServiceDetails.aspx?n=عمليات&&date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

            }

        }
    }
}