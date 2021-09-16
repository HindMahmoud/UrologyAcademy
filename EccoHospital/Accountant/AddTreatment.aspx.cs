using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class AddTreatment : System.Web.UI.Page
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
               if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }



            }




        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);

                if (db.doctor_account.Any(a => a.p_historyID == p.id))
                {
                    doctor_account d = db.doctor_account.Where(a => a.p_historyID == p.id).FirstOrDefault();

                    db.doctor_account.Remove(d);
                    db.SaveChanges();
                }
                db.patient_history.Remove(p);


                db.SaveChanges();

                
                success_m.Visible = true;
            }

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddTreatment.aspx");

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
            
            else if (txt_price.Value == "")
            {
                MsgBox("ادخل الاجمالي ", this.Page, this);

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
                int? doc_id = null;
                string doc_n = null;
                

                    patient_history p = new patient_history
                    {
                        p_id = int.Parse(txt_code.Text),
                        p_name = patientlist.SelectedItem.ToString(),
                        price = float.Parse(txt_price.Value),
                        date = DateTime.Now,
                        service_id = -1,
                        service_name =txt_note.Value,
                        type = "علاج",
                       
                        check_out = false,
                        confirm_calc=true,
                       
                    };
                    db.patient_history.Add(p);
                    db.SaveChanges();
                var max_id = (from s in db.patient_history select s.id).Max();
                patient_history pp= db.patient_history.FirstOrDefault(a => a.id == max_id);

                if (ddl_type.SelectedValue.ToString() == "doc" && docList.Text != "")
                {
                    doc_id = int.Parse(docList.SelectedValue.ToString());
                    doc_n = docList.SelectedItem.ToString();

                    doctor_account da = new doctor_account
                    {
                        p_id = pp.p_id,
                        p_name = pp.p_name,
                        in_val = 0,
                        out_val = double.Parse(txt_price.Value),
                        date = DateTime.Now.Date,
                        doc_id = doc_id,
                        doc_name = doc_n,
                        title = "حساب ادويه",
                        type = "علاج",
                        p_historyID = pp.id

                    };
                    db.doctor_account.Add(da);
                    db.SaveChanges();
                    p.doc_id = doc_id;
                    p.doc_name = doc_n;

                   // p.doc_acc = true;
                    db.SaveChanges();
                }
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
                Response.Redirect("AddTreatment.aspx");
            }
        }
        protected void ddl_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_type.Text != "")
            {

                if (ddl_type.SelectedValue.ToString() == "doc")
                {
                    docdiv.Visible = true;
                    if (db.doctor.Any())
                    {
                        var a = (from s in db.doctor select s).ToList();
                        docList.DataTextField = "name";
                        docList.DataValueField = "id";
                        docList.DataSource = a;

                        docList.DataBind();
                        docList.Items.Insert(0, string.Empty);
                    }
                }
                else
                {
                    docdiv.Visible = false;

                }
            }
        }

    }
}