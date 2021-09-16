using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class destroyStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }
        protected void show_Click(object sender, EventArgs e)
        {

            if (from1.Text != "" && to1.Text != "")
            {


                Response.Redirect("destroyStock.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);




            }


        }
    }
}