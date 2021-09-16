using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class session_medicines : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"]))&&!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["sess_id"])))
                {
                    
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;

                }
             }
        }


        protected void cancel_Click(object sender, EventArgs e)
        {
            Div2.Visible = false;
            delbtn.Visible = false;
            cancel.Visible = false;

        }
        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["sess_id"])))
            {
                int id= int.Parse(Request.QueryString["id"]);
                int sess_id = int.Parse(Request.QueryString["sess_id"]);
                if (db.session_med.Any(a => a.id == id))
                {
                    var t = (from m in db.session_med where m.id == id select m).FirstOrDefault();
                    db.session_med.Remove(t);
                    db.SaveChanges();
                    Response.Redirect("session_medicines.aspx?sess_id="+ sess_id);
                }
            }
        }

        protected void show_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["sess_id"])))
            {
                var id = int.Parse(Request.QueryString["sess_id"]);
                var r = (from b in db.clinic_reception where b.id==id select b).FirstOrDefault();
                var rr= (from b in db.clinic_reception where b.id == id  select b).FirstOrDefault();
                if (rr != null)
                {
                    rr.printFlag = true;
                    db.SaveChanges();
                }
                
                    string q = @"select p.patient_name,name,p.date,extra,Complaint,s.note,p.doctor_name,p.clinic_name from session_med s join clinic_reception p on s.Clinic_RecID=p.id where s.Clinic_RecID=" + id + " ";
                    string cr = "reception/session_medR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");

                //}
                //else {
                //    string q = @"select p.patient_name,name,p.date,extra,Complaint,s.note,p.doctor_name,p.clinic_name from session_med s join clinic_reception p on s.Clinic_RecID=p.id where s.Clinic_RecID=" + id + " ";
                //    string cr = "External Clinics/session_medR2.rpt";
                //    Session["query"] = q;
                //    Session["cr"] = cr;
                //    Response.Redirect("~/report.aspx");
                //}
            }
        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            if (name.SelectedValue == "")
            {
                MsgBox("اختار العلاج", this.Page, this);
            }
            
           
            else
            {
                //if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["sess_id"])))
                //{

                    int id = int.Parse(Request.QueryString["sess_id"]);
                    var p_id = (from m in db.clinic_reception where m.id == id select m).FirstOrDefault();
                    session_med v = new session_med
                    {
                        Clinic_RecID = id,
                        patient_id = p_id.patient_id,
                        TypeService = p_id.type,
                        //extra = extra.Value,
                        note = note.Value,
                        name=name.SelectedItem.Text

                    };
                    db.session_med.Add(v);
                    db.SaveChanges();
                p_id.status = true;
                db.SaveChanges();
                    Response.Redirect("session_medicines.aspx?sess_id=" + id);

                //}
            }
        }

        protected void report_click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["sess_id"])))
            {
                var id = int.Parse(Request.QueryString["sess_id"]);
                var r = (from b in db.clinic_reception where b.id == id select b).FirstOrDefault();
                var rr = (from b in db.clinic_reception where b.id == id select b).FirstOrDefault();
                if (rr != null)
                {
                    rr.printFlag = true;
                    db.SaveChanges();
                }

                string q = @"select p.patient_name,p.patient_id,name,p.date,extra,Complaint,s.note,p.doctor_name,p.clinic_name from session_med s join clinic_reception p on s.Clinic_RecID=p.id where s.Clinic_RecID=" + id + " ";
                string cr = "External Clinics/session_medR2.rpt";
                Session["query"] = q;
                Session["cr"] = cr;
                Response.Redirect("~/report.aspx");
            }
            }
    }
}