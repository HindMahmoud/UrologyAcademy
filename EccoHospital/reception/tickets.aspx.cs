using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.reception
{
    public partial class tickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("tickets.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }
            else if (from1.Text == "" && to1.Text != "")
            {
                Response.Redirect("tickets.aspx?date2=" + to1.Text);
            }
            else if (from1.Text != "" && to1.Text == "")
            {
                Response.Redirect("tickets.aspx?date1=" + from1.Text);
            }
            else 
            {
                Response.Redirect("tickets.aspx");
            }
        }
    }
}