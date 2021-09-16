using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class ReportReserveClinic : System.Web.UI.Page
    {
       EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)

            {
                var clinlist = (from er in db.clinic select er).ToList();
                DropDownList1.DataSource = clinlist;
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0,string.Empty);

                if (Session["role"].ToString() != "Admin")
                {
                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["ClinicName"])))
                    {
                        DropDownList1.SelectedItem.Text = Convert.ToString(Session["ClinicName"]);
                        
                    }
                    DropDownList1.Enabled = false;

                }
                else
                {
                    DropDownList1.Enabled = true;
                   // DropDownList1.SelectedItem.Text = Convert.ToString(Request.QueryString["clinicName"]);
                    
                }

            }
        }

        protected void show_Click(object sender, EventArgs e)
        {
            if (Session["role"].ToString() != "Admin")
            {
                DropDownList1.Enabled = false;
                string ClinName = Convert.ToString(Session["ClinicName"]);

                if (from1.Text != "" && to1.Text != "")
                {
                    Response.Redirect("ReportReserveClinic.aspx?date1=" + from1.Text + "&&date2=" + to1.Text + "&&clinicName=" + ClinName);

                }

            }
            else
            {
                if (from1.Text != "" && to1.Text != "" && DropDownList1.SelectedIndex < 0)
                {

                    Response.Redirect("ReportReserveClinic.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
                }
                else if (DropDownList1.SelectedIndex > 0 && from1.Text != "" && to1.Text != "")
                {
                    Response.Redirect("ReportReserveClinic.aspx?date1=" + from1.Text + "&&date2=" + to1.Text + "&&clinicName=" + DropDownList1.SelectedItem.Text);

                }
                else if (from1.Text == "" && to1.Text == "" && DropDownList1.SelectedIndex > 0)
                {
                    
                    Response.Redirect("ReportReserveClinic.aspx?clinicName=" + DropDownList1.SelectedItem.Text);
                }
                else {
                    Response.Redirect("ReportReserveClinic.aspx");
                }
                }
        }

        protected void button1_Click(object sender, EventArgs e)
        {

            if (Session["ClinicName"] != null)
            {
                string clinicName = Convert.ToString(Session["ClinicName"]);
                if (!String.IsNullOrEmpty(Request.QueryString["date1"]) && !String.IsNullOrEmpty(Request.QueryString["date2"]))
                {
                    DateTime date1 = Convert.ToDateTime(Request.QueryString["date1"]);
                    DateTime date2 = Convert.ToDateTime(Request.QueryString["date2"]);
                    string q = @"select * from clinic_reception where [clinic_name]=N'" + clinicName + "' and date>='" + date1 + "' and date <='" + date2 + "'";
                    string cr = "CReport/ExclinicR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");
                }
                else {

                    string q = @"select * from clinic_reception where [clinic_name]=N'" + clinicName + "'";
                    string cr = "CReport/ExclinicR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");

                }
            }
            else
            { if (String.IsNullOrEmpty(Request.QueryString["clinicName"]) && !String.IsNullOrEmpty(Request.QueryString["date1"]) && !String.IsNullOrEmpty(Request.QueryString["date2"]))
                {

                    string clinicName = Convert.ToString(Request.QueryString["clinicName"]);
                    DateTime date1 = Convert.ToDateTime(Request.QueryString["date1"]);
                    DateTime date2 = Convert.ToDateTime(Request.QueryString["date2"]);
                    string q = @"select * from clinic_reception where  date>='" + date1 + "' and date <='" + date2 + "'";
                    string cr = "CReport/ExclinicR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");


                }
                else if (!String.IsNullOrEmpty(Request.QueryString["clinicName"]) && !String.IsNullOrEmpty(Request.QueryString["date1"]) && !String.IsNullOrEmpty(Request.QueryString["date2"]))
                {
                    string clinicName = Convert.ToString(Request.QueryString["clinicName"]);
                    DateTime date1 = Convert.ToDateTime(Request.QueryString["date1"]);
                    DateTime date2 = Convert.ToDateTime(Request.QueryString["date2"]);
                    string q = @"select * from clinic_reception where [clinic_name]=N'" + clinicName + "' and date>='" + date1 + "' and date <='" + date2 + "'";
                    string cr = "CReport/ExclinicR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");

                }
                else if (!String.IsNullOrEmpty(Request.QueryString["clinicName"]) && String.IsNullOrEmpty(Request.QueryString["date1"]) && String.IsNullOrEmpty(Request.QueryString["date2"]))
                {
                    string clinicName = Convert.ToString(Request.QueryString["clinicName"]);
                    string q = @"select * from clinic_reception where [clinic_name]=N'" + clinicName + "'";
                    string cr = "CReport/ExclinicR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");
                }
                else
                {
                    string q = @"select * from clinic_reception";
                    string cr = "CReport/ExclinicR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");

                }
            }
        }
    }
}