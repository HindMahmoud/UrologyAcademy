using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class IncomesSearch : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<string> incomes = new List<string>();
                incomes.Add("عمليات");
                incomes.Add("عنايه");
                incomes.Add("حضانه");
                incomes.Add("أقامه");
                incomes.Add("تحاليل");

                incomes.Add("أشعه");
                incomes.Add("عيادات");
                incomes.Add("مرور");

                incomes.Add("علاج");
                if (incomes.Any())
                {
                  
                   
                    ddltype.DataSource = incomes;

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
            if ( txt_from.Text != "" && txt_to.Text != "")
            {
                if (ddltype.Text != "")
                {
                    Response.Redirect("IncomesSearch.aspx?n=" + ddltype.SelectedValue.ToString() + "&&date1=" + txt_from.Text + "&&date2=" + txt_to.Text);

                }
                else {
                    Response.Redirect("IncomesSearch.aspx?date1=" + txt_from.Text + "&&date2=" + txt_to.Text);
                }
                }
        }

        
    }
}