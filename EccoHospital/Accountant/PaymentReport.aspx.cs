using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class PaymentReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void show_Click(object sender, EventArgs e)
        {

            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("PaymentReport.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }



        }
    }
}