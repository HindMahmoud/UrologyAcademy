using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class paymentSearch2 : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (db.payementList.Any())
                {

                    var aaa = (from g in db.payementList select g).ToList();
                    ddltype.DataSource = aaa;
                    ddltype.DataTextField = "name";
                    ddltype.DataValueField = "id";

                    ddltype.DataBind();
                    ddltype.Items.Insert(0, string.Empty);
                }

                

            }
        }

        protected void docList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (txt_from.Text != "" && txt_to.Text != "")
            {
                if (ddltype.Text != "")
                {
                    Response.Redirect("paymentSearch2.aspx?n=" + ddltype.SelectedValue.ToString() + "&&date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

                }
                else {
                    Response.Redirect("paymentSearch2.aspx?date1=" + txt_from.Text + "&&date2=" + txt_to.Text);
                }
            }
        }

    }
}