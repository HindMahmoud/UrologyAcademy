using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;


namespace EccoHospital.Saavee
{
    public partial class save : System.Web.UI.Page
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



            }


        }

        protected void btn_Click(object sender, EventArgs e)
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


            if (txt_code.Text == "")
            {
                MsgBox("ادخل كود التذكره", this.Page, this);
            }

            savee s = new savee
            {
                p_id = int.Parse(patientlist.SelectedValue.ToString()),
                title = "سداد مبلغ تأمين للمريض" + " " + patientlist.SelectedItem.ToString(),
                in_value = double.Parse(txt_value.Value),
                out_value=0,
                date=Convert.ToDateTime(datetxt.Text.ToString()),
                type= "تأمين",
                notes=txt_notes.Text,
                del = false,
                user_id=uid,
                user_name=uname,
                ticketId=int.Parse(txt_code.Text),

            };
            db.savee.Add(s);
            db.SaveChanges();
            int ticktidd = int.Parse(txt_code.Text);
           
             if (db.room_history.Any(a => a.ticketId == ticktidd))
                {
                room_history sh = db.room_history.FirstOrDefault(a => a.ticketId == ticktidd);
                if (sh.insurance_val == null)
                {
                    sh.insurance_val = double.Parse(txt_value.Value);

                }
                else
                {
                    sh.insurance_val = sh.insurance_val + double.Parse(txt_value.Value);

                }
                
                db.SaveChanges();
            }


            success_m.Visible = true;

        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
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
                    if (db.savee.Any(a => a.ticketId == st.code && a.type == "تأمين"))
                    {
                        var tictpay = db.savee.Where(a => a.ticketId == st.code && a.type == "تأمين").ToList();
                        txt_old.Value = tictpay.Sum(a => a.in_value).ToString();
                    }
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

    }
}