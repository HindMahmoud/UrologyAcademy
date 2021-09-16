using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.reception
{
    public partial class DoctorVisit : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                DateTime dt = DateTime.Now.Date;
                int f = (int)dt.DayOfWeek;


                if (db.patient.Any())
                {
                    var rep = (from s in db.patient select s).ToList();

                    patientlist.DataSource = rep;

                    patientlist.DataTextField = "name";
                    patientlist.DataValueField = "id";
                    patientlist.DataBind();
                    patientlist.Items.Insert(0, "");

                }
                if (db.doctor.Any())
                {
                    var a = (from s in db.doctor select s).ToList();
                    docList.DataTextField = "name";
                    docList.DataValueField = "id";
                    docList.DataSource = a;

                    docList.DataBind();
                    docList.Items.Insert(0, string.Empty);
                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }



            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("DoctorVisit.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
               
                db.patient_history.Remove(p);


                db.SaveChanges();

                
            Response.Redirect("DoctorVisit.aspx");


            }
        }

        protected void print_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (txt_code.Text == "")
            {
                MsgBox("ادخل كود المريض", this.Page, this);
            }

            else if (docList.SelectedValue == "")
            {
                MsgBox("ادخل اسم الدكتور", this.Page, this);

            }
            else if (txt_price.Text == "")
            {
                MsgBox("ادخل السعر ", this.Page, this);

            }

            else
            {

                string uname = "";
                int uid = 0;

                if (Session["user"] == null)
                {
                }
                else
                {
                    uid = int.Parse(Session["user_id"].ToString());
                    uname = Session["user"].ToString();

                }

                
                patient_history p = new patient_history
                {
                    p_id = int.Parse(txt_code.Text),
                    p_name = patientlist.SelectedItem.ToString(),
                    price = double.Parse(txt_price.Text),
                    date = DateTime.Now,
                    service_id = -2,
                    service_name = "مرور طبيب",
                    type = "مرور",
                    details_id = null,
                    check_out = false,
                    //doc_acc = false,
                    confirm_calc = false,
                    doc_id=int.Parse(docList.SelectedValue.ToString()),
                    doc_name=docList.SelectedItem.ToString(),
                    user_name = uname,
                    user_id = uid

                };
                db.patient_history.Add(p);
                db.SaveChanges();
                success_m.Visible = true;
            }









        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
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

        protected void ddl_lab_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (name1.Text != "")
            {
                patient p = new patient
                {
                    name = name1.Text,
                    age = age.Text,
                    phone = mob.Text,
                    nationalty = nationalty.Text,
                    address = address.Text,
                    government = gov.SelectedItem.ToString(),
                    type = type.Text,
                    city = city.Text,
                    job = job.Text,
                    social_state = social.SelectedItem.ToString(),
                    ssi = ssi_st.Text,
                    gender = gender.Text
                };
                db.patient.Add(p);
                db.SaveChanges();
                // message.Visible = true;
                Response.Redirect("DoctorVisit.aspx");

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





        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "")
            {
               

                Response.Redirect("DoctorVisit.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //DateTime dt = DateTime.Now.Date;
            //DateTime dt2 = dt.AddDays(1);


            //if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
            //{
            //    dt = Convert.ToDateTime(Request.QueryString["date1"]);

            //    dt2 = Convert.ToDateTime(Request.QueryString["date2"]);
            //}
            //string aa = dt.ToString("yyyy-MM-dd HH:mm:ss.fff");
            //string bb = dt2.ToString("yyyy-MM-dd HH:mm:ss.fff");
            //string q = @"select * from clinic_reception it  where datenow >= '" + aa + "' and datenow <= '" + bb + "' ORDER  BY clinic_id  ";
            //string cr = "CReport/ClinicRecR.rpt";
            //Session["query"] = q;
            //Session["cr"] = cr;


            //Response.Redirect("~/report.aspx");
        }

     
    }
}