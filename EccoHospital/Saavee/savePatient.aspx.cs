using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Saavee
{
    public partial class savePatient : System.Web.UI.Page
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

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("savePatient.aspx");

        }

        
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (namepat.Text != "")
            {
                patient p = new patient
                {
                    name = namepat.Text,
                    age = TextBox1.Text,
                    phone = txtPhone.Text,
                    nationalty = natPatient.Text,
                    Mobile = mobiletxt.Text,
                    ssi = natPatient.Text,
                    city = m.Text,
                    government = govv.Text,
                };
                db.patient.Add(p);
                db.SaveChanges();

                //Response.Redirect("SurgeryResrv.aspx");
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



        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (patientlist.Text != "")
            {
                int id = int.Parse(patientlist.SelectedValue.ToString());
                patient st = db.patient.FirstOrDefault(a => a.id == id);
                txt_code.Text = st.id.ToString();
               // Button1.Visible = true;

                
                // Response.Redirect("dr_rad.aspx?p_id=" + id);


            }

        }


        protected void btn_enter_Click(object sender, EventArgs e)
        {
            if(patientlist.Text!="")
            {
                int p_id = int.Parse(patientlist.SelectedValue.ToString());
                int? t_id = null;

                if (db.ticket_out.Any(a=>a.patient_id==p_id &&a.code!=null && a.flag==true))
                {
                    ticket_out tt = db.ticket_out.FirstOrDefault(a => a.patient_id == p_id && a.flag == true);
                    t_id = int.Parse(tt.code.ToString());
                }else
                {


                    int code = 1;
                    if(db.ticket_out.Any())
                    {
                        var max_item = (from s in db.ticket_out select s.id).Max();
                        code = max_item + 1;
                    }

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


                    ticket_out tt = new ticket_out
                    {
                        patient_id = p_id,
                        patient_name = patientlist.SelectedItem.ToString(),
                        code = code,
                       
                        Date = DateTime.Now,
                        user_id = uid,
                        user_name = uname,
                        flag = true

                    };
                    db.ticket_out.Add(tt);
                    db.SaveChanges();
                    t_id = code;
                }
                Response.Redirect("saveCollection.aspx?t_id="+t_id);
            }
        }
    }
}