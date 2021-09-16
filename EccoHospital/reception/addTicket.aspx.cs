using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.reception
{
    public partial class addTicket : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gender.SelectedValue = "1";
            }
        }

        protected void btnSavepatient_Click(object sender, EventArgs e)
        {
            
        }
        

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

       

        

        protected void btnSavepatient_Click1(object sender, EventArgs e)
        {
            if (namepat.Text != "")
            {if (labssi.Visible ==true||labphone.Visible==true)
                {
                    Response.Write("<script>alert('هذا المريض موجود سابقا')</script>");
                    return;
                }
               // int c = 1;
                //if (db.patient.Any()) {
                //     c = (from n in db.patient select n.id).Max();
                //    c += 1;
                //}
                patient p = new patient
                {
                    name = namepat.Text,
                    age = age.Text,

                    government = govv.Text,
                    ssi = natPatient.Text,
                    city = m.Text,
                    address = vall.Text,
                    phone = txtPhone.Text,
                    Mobile = mobiletxt.Text,
                    other = othertxt.Text,
                    gender=gender.SelectedItem.Text
                   
                };
                db.patient.Add(p);
                db.SaveChanges();
                var r = (from b in db.patient select b.id).Max();
                var maxpatient = (from n in db.patient where n.id == r select n).FirstOrDefault();
                maxpatient.code = r.ToString();
                db.SaveChanges();
                if (TextBox1.Text != "")
                {
                    Rel_patient relpatient = new Rel_patient
                    {
                        name = TextBox1.Text,
                        age = TextBox4.Text,
                        phone = TextBox2.Text,
                        national_id = TextBox3.Text,
                        Rel_num = TextBox5.Text,
                        patient_id = r
                    };
                    db.Rel_patient.Add(relpatient);
                    db.SaveChanges();
                }
                string d = @"select name,code from patient where id =" + r;
                string cr = "CReport/newpatientR.rpt";
                Session["query"] = d;
                Session["cr"] = cr;
                Response.Redirect("~/report.aspx");
                namepat.Text = natPatient.Text = age.Text = govv.Text=m.Text = "";
                message.Visible = true;
                Label1.Visible = false;
                
            }
            else { Label1.Visible = true;  }
        }



        protected void natPatient_TextChanged(object sender, EventArgs e)
        {
            if ( natPatient.Text != "")
            {
                var p = (from m in db.patient where m.ssi==natPatient.Text select m).FirstOrDefault();
                if (p != null)
                {
                    labssi.Visible = true;
                }
                else { labssi.Visible = false; }
            }
        }
        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {
            if ( txtPhone.Text != "")
            {
                var p = (from m in db.patient where m.phone == txtPhone.Text select m).FirstOrDefault();
                if (p != null)
                {
                    labphone.Visible = true;
                }
                else { labphone.Visible = false; }
            }
        }
    }
}