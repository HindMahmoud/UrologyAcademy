using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.Accountant
{
    public partial class reportdoctors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EccoHospitalEntities db = new EccoHospitalEntities();
            if (!IsPostBack) {
                //if (db.doctor.Any())
                //{
                //    var ddl = (from t in db.doctor select t).ToList();
                //    ddldoctors.DataSource = ddl;
                //    ddldoctors.DataTextField = "name";
                //    ddldoctors.DataValueField = "id";
                //    ddldoctors.DataBind();
                //    ddldoctors.Items.Insert(0, "");

                //}
            }

        }
        protected void search_Click(object sender, EventArgs e)
        {
            //if (ddldoctors.SelectedItem.ToString() != "" && servfrom.Text == "" && servto.Text == "")
            //{
            //    Response.Redirect("reportdoctors.aspx?docname=" + ddldoctors.SelectedItem.ToString());
            //}
            //else if (ddldoctors.SelectedItem.ToString() != "" && servfrom.Text != "" && servto.Text != "")
            //{
            //    Response.Redirect("reportdoctors.aspx?docname=" + ddldoctors.SelectedItem.ToString() + "&&servfrom=" + servfrom.Text + "&&servto=" + servto.Text);

            //}
             if ( servfrom.Text != "" && servto.Text != "")
            {
                Response.Redirect("reportdoctors.aspx?servfrom=" + servfrom.Text + "&&servto=" + servto.Text);

            }
        }
    }
}