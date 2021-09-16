using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class SearchByID : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["rid"]))
                {
                    int id = int.Parse(Request.QueryString["rid"]);
                    string q = @"select * from [dbo].[clinic_reception] as c join [dbo].[session_med] as m on c.id =m.[Clinic_RecID] where c.patient_id=" + id + " ";
                    string cr = "CReport/SearchR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");
                }
            }

        }

        protected void txt_code_TextChanged(object sender, EventArgs e)
        {
            if (txt_code.Text == "" && TextBox1.Text != "")
            {
                string name = TextBox1.Text;
                if (db.patient.Any(a => a.name == name))
                {

                    Response.Redirect("SearchByID.aspx?str=" + name);
                }
                else
                {
                    Label.Text = "لا يوجد مريض بهذا الاسم ";
                }
            }
            else if (txt_code.Text != "" && TextBox1.Text == "")
            {
                int id = int.Parse(txt_code.Text);
                if (db.patient.Any(a => a.id == id))
                {

                    Response.Redirect("SearchByID.aspx?id=" + id);
                }

                else
                {
                    Label.Text = "لا يوجد مريض بهذا الرقم ";
                }
            }
            else if (txt_code.Text != "" && TextBox1.Text != "")
            {
                int id = int.Parse(txt_code.Text);
                string name = TextBox1.Text;
                if (db.patient.Any(a => a.id == id && a.name == name))
                {

                    Response.Redirect("SearchByID.aspx?id=" + id + "&&str=N'" + name + "'");
                }

                else
                {
                    Label.Text = "لا يوجد مريض بهذه البيانات ";
                }
            }
            else { Label.Text = "لا يوجد مريض بهذه البيانات "; }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (txt_code.Text == "" && TextBox1.Text != "")
            {
                string name = TextBox1.Text;
                if (db.patient.Any(a => a.name == name))
                {

                    Response.Redirect("SearchByID.aspx?str=" + name);
                }
                else
                {
                    Label.Text = "لا يوجد مريض بهذا الاسم ";
                }
            }
            else if (txt_code.Text != "" && TextBox1.Text == "")
            {
                int id = int.Parse(txt_code.Text);
                if (db.patient.Any(a => a.id == id))
                {

                    Response.Redirect("SearchByID.aspx?id=" + id);
                }

                else
                {
                    Label.Text = "لا يوجد مريض بهذا الرقم ";
                }
            }
            else if (txt_code.Text != "" && TextBox1.Text != "")
            {
                int id = int.Parse(txt_code.Text);
                string name = TextBox1.Text;
                if (db.patient.Any(a => a.id == id && a.name == name))
                {

                    Response.Redirect("SearchByID.aspx?id=" + id + "&&str=N'" + name + "'");
                }

                else
                {
                    Label.Text = "لا يوجد مريض بهذه البيانات ";
                }
            }
            else { Label.Text = "لا يوجد مريض بهذه البيانات "; }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txt_code.Text == "" && TextBox1.Text != "")
            {
                string name = TextBox1.Text;
                if (db.patient.Any(a => a.name == name))
                {

                    Response.Redirect("SearchByID.aspx?str=" + name);
                }
                else
                {
                    Label.Text = "لا يوجد مريض بهذا الاسم ";
                }
            }
            else if (txt_code.Text != "" && TextBox1.Text == "")
            {
                int id = int.Parse(txt_code.Text);
                if (db.patient.Any(a => a.id == id))
                {

                    Response.Redirect("SearchByID.aspx?id=" + id);
                }

                else
                {
                    Label.Text = "لا يوجد مريض بهذا الرقم ";
                }
            }
            else if (txt_code.Text != "" && TextBox1.Text != "")
            {
                int id = int.Parse(txt_code.Text);
                string name = TextBox1.Text;
                if (db.patient.Any(a => a.id == id && a.name == name))
                {

                    Response.Redirect("SearchByID.aspx?id=" + id + "&&str=N'" + name + "'");
                }

                else
                {
                    Label.Text = "لا يوجد مريض بهذه البيانات ";
                }
            }
            else { Label.Text = "لا يوجد مريض بهذه البيانات "; }
        }
    }
}