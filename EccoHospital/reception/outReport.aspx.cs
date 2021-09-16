using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.reception
{
    public partial class outReport : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                RadioButtonList1.SelectedValue = "r1";
                if (!String.IsNullOrEmpty(Request.QueryString["clinicRec"]))
                { int clinicid = int.Parse(Request.QueryString["clinicRec"].ToString());
                    var clinicdate =(from n in db.clinic_reception where n.id == clinicid select n).FirstOrDefault();
                    if (clinicdate != null)
                    {
                        datelabl.Text = Convert.ToDateTime(clinicdate.date).ToString();
                        complaintxt.Text = clinicdate.Diagnosis;
                    }
                    else datelabl.Text = DateTime.Now.ToString();
                }
            }
        }
        protected void print_Click(object sender, EventArgs e)
        {
            int pat = int.Parse(Request.QueryString["p_id"]);
            int recid = int.Parse(Request.QueryString["clinicRec"]);
            var tpat = (from v in db.patient where v.id == pat select v).FirstOrDefault();
            //tpat.Temp = temptxt.Text;
            //tpat.plus = plusee.Text;
            //tpat.weight = kg.Text;
            //tpat.BR1 = bp.Text;
            //tpat.BR2 = bp2.Text;
            //tpat.Diabetes = diab.Text;
            //tpat.diac = diactxt.Text;
            //tpat.hepatitis = hep.Text;
            //tpat.Asthma = asthmatxt.Text;
            //tpat.pregnancy = preg.Text;
            //tpat.Respiral = rep.Text;
            //db.SaveChanges();
            DateTime vf = DateTime.Now;
            out_report r = new out_report
            {
               
                arrival_date =Convert.ToDateTime( datelabl.Text),
                date_report = DateTime.Now,
                p_id = tpat.id,
                p_name=tpat.name,
                arrival_type=RadioButtonList1.SelectedItem.Text,
                medical_no=(tpat.id).ToString(),
                Medical_histoy= medtxt.Text,
                physical_finding=physicaltxt.Text,
                Rec_id=recid,
                notes= notetxt.Text,
                operation=operation.Text,

            };
            db.out_report.Add(r);
            db.SaveChanges();
            RadioButtonList1.Visible = false;
            typee.Text = RadioButtonList1.SelectedItem.Text;
            
            typee.Visible = true;
            print.Visible = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Print", "javascript:window.print();", true);
            //ClientScript.RegisterStartupScript(this.GetType(), "PrintOperation", "printing()", true);
            // print.Attributes.Add("onclick", "return printing()");

        }
    }
}