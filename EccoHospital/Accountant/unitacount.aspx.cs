using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.Accountant
{
    public partial class unitacount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void labbtn_Click(object sender, EventArgs e)
        {
            if (fromlab.Text != "" && tolab.Text != "")
            {
                Response.Redirect("unitacount.aspx?date1=" + fromlab.Text + "&&date2=" + tolab.Text);
            }
        }
    }
}