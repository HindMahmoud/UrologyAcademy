using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.reception
{
    public partial class ServiceReception : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                if (db.service.Any())
                {
                    var cr = (from d in db.service select d).ToList();
                    ddl_lab.DataSource = cr;
                    ddl_lab.DataTextField = "name";
                    ddl_lab.DataValueField = "id";
                    ddl_lab.DataBind();
                    ddl_lab.Items.Insert(0, string.Empty);
                }

                if (db.patient.Any())
                {
                    var rep = (from s in db.patient select s).ToList();

                    patientlist.DataSource = rep;

                    patientlist.DataTextField = "name";
                    patientlist.DataValueField = "id";
                    patientlist.DataBind();
                    patientlist.Items.Insert(0, "");

                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.id == x);
                    patientlist.SelectedValue = f.p_id.ToString();
                    ddl_lab.SelectedValue = f.service_id.ToString();
                    txt_code.Text = f.p_id.ToString();
                    txt_price.Value = f.price.ToString();
                    btn.Text = "edit";
                    db.SaveChanges();

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }



            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ServiceReception.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
               
                db.patient_history.Remove(p);


                db.SaveChanges();

              
                success_m.Visible = true;
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
            else if (ddl_lab.SelectedValue == "")
            {
                MsgBox("ادخل اسم الخدمه", this.Page, this);

            }
            else if (txt_price.Value == "")
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




                if (btn.Text == "تعديل")
                {

                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {

                        int x = int.Parse(Request.QueryString["edit"].ToString());

                        EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.id == x);
                        f.p_id = int.Parse(txt_code.Text);
                        f.p_name = patientlist.SelectedItem.ToString();
                        f.price = float.Parse(txt_price.Value);

                        db.SaveChanges();
                        
                        success_m.Visible = true;

                    }

                }

                else
                {
                    
                    patient_history p = new patient_history
                    {
                        p_id = int.Parse(txt_code.Text),
                        p_name = patientlist.SelectedItem.ToString(),
                        price = float.Parse(txt_price.Value),
                        date = DateTime.Now,
                        service_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                        service_name = ddl_lab.SelectedItem.ToString(),
                        type = "خدمات",
                        details_id = null,
                        check_out = false
                    };
                    db.patient_history.Add(p);
                    db.SaveChanges();
                    success_m.Visible = true;
                }



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
            int s = 0;
            if (ddl_lab.Text != null)
            {
                s = int.Parse(ddl_lab.SelectedValue.ToString());
                if (db.labb.Any(a => a.id == s))
                {
                    service pt = db.service.FirstOrDefault(a => a.id == s);
                    txt_price.Value = pt.price.ToString();
                    txt_price.Disabled = true;

                }

            }
        }

        //protected void btnSave_Click(object sender, EventArgs e)
        //{
        //    if (namepata.Text != "")
        //    {
        //        patient p = new patient
        //        {
        //            name = namepata.Text,
        //            age = TextBox1.Text,
        //            phone = txtPhone.Text,
        //            nationalty = natPatient.Text,
        //            Mobile = mobiletxt.Text,
        //            ssi = natPatient.Text,
        //            city = m.Text,
        //            government = govv.Text,
        //        };
        //        db.patient.Add(p);
        //        db.SaveChanges();

        //        //Response.Redirect("ClinicResRec.aspx");
        //    }
        //}
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

    }
}