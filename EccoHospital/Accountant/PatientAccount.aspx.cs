using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Accountant
{
    public partial class PatientAccount : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
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

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    patient invit = db.patient.FirstOrDefault(a => a.id == x);

                    txt_code.Text = invit.id.ToString();
                    patientlist.SelectedValue = invit.id.ToString();
                    //txt_code_TextChanged(sender, e)
                    btn_deltails.Visible = true;


                }
            }
        }

        protected void txt_code_TextChanged(object sender, EventArgs e)
        {
            if (txt_code.Text != "")
            {

                int id = int.Parse(txt_code.Text);
                if (db.ticket.Any(a => a.code == id && a.flag == true))
                {
                    lblticket.Visible = false;

                    ticket s = db.ticket.FirstOrDefault(a => a.code == id && a.flag == true);




                    patientlist.ClearSelection();
                    patientlist.Items.FindByValue(s.patient_id.ToString()).Selected = true;

                    patientlist_SelectedIndexChanged(sender, e);
                }
                else if (db.ticket.Any(a => a.code == id && a.flag == false))
                {
                    lblticket.Visible = true;
                    lblticket.Text = " تم اغلاق هذه التذكره ";

                }
                else
                {
                    lblticket.Visible = true;

                    lblticket.Text = " خطا ف  رقم التذكره ";

                }
            }
        }


        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (patientlist.Text != "")
            {
                int id = int.Parse(patientlist.SelectedValue.ToString());

                ticket st = db.ticket.FirstOrDefault(a => a.patient_id == id && a.flag == true);
                if (st != null)
                {
                    txt_code.Text = st.code.ToString();
                    lblticket.Visible = false;
                }
                else
                {
                    txt_code.Text = "";
                    lblticket.Visible = true;
                    lblticket.Text = "لاتوجد تذكره مفتوحه باسم المريض ";
                }
                // Response.Redirect("dr_rad.aspx?p_id=" + id);


            }

        }


        protected void btn_deltails_Click(object sender, EventArgs e)
        {
            if (txt_code.Text!="")
            {
                
                Response.Redirect("patientInfo.aspx?id=" + txt_code.Text);
            }
            }
    }
}