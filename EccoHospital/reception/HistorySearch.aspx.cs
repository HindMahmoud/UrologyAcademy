using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.reception
{
    public partial class HistorySearch : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                

                if (db.patient.Any())
                {
                    var rep = (from s in db.patient select s).ToList();

                    patientlist.DataSource = rep;

                    patientlist.DataTextField = "name";
                    patientlist.DataValueField = "id";
                    patientlist.DataBind();
                    patientlist.Items.Insert(0, "");

                }
            }
            }

        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (patientlist.Text != "")
            {
                int id = int.Parse(patientlist.SelectedValue.ToString());
                patient st = db.patient.FirstOrDefault(a => a.id == id);
                txt_code.Text = st.id.ToString();

                // Response.Redirect("dr_rad.aspx?p_id=" + id);


            }
        }

        protected void txt_code_TextChanged(object sender, EventArgs e)
        {
            if (txt_code.Text != "")
            {

                int id = int.Parse(txt_code.Text);
                if (db.patient.Any(a => a.id == id))
                {

                    patient s = db.patient.FirstOrDefault(a => a.id == id);




                    patientlist.ClearSelection();
                    patientlist.Items.FindByValue(s.id.ToString()).Selected = true;

                    patientlist_SelectedIndexChanged(sender, e);
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if(from1.Text!=""&&to1.Text!=""&&patientlist.Text!="")
            {
                Response.Redirect("HistorySearch.aspx?c=" + txt_code.Text + "&&date1=" + from1.Text + "&&date2=" + to1.Text);
            }
        }
    }
}