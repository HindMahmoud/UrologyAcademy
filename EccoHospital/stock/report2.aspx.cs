using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class report2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void show_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "" && Textbox1.Text != "")
            {
                Response.Redirect("report2.aspx?from=" + from1.Text + "&&to=" + to1.Text + "&&num=" + Textbox1.Text);

            }
            else if (from1.Text != "" && to1.Text != "" && Textbox1.Text == "")
            {
                Response.Redirect("report2.aspx?from=" + from1.Text + "&&to=" + to1.Text);

            }
            else if (from1.Text == "" && to1.Text == "" && Textbox1.Text != "")
            {
                Response.Redirect("report2.aspx?num=" + Textbox1.Text);

            }
            else
            {
                Response.Redirect("report2.aspx");

            }
        }
    }
}