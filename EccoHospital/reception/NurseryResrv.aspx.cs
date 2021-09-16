using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.reception
{
    public partial class NurseryResrv : System.Web.UI.Page
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

                    if (db.room.Any())
                    {
                        var cr = (from d in db.room where d.flag == false && d.type == "حضانه" select d).ToList();
                        ddl_room.DataSource = cr;
                        ddl_room.DataTextField = "name";
                        ddl_room.DataValueField = "id";
                        ddl_room.DataBind();
                        ddl_room.Items.Insert(0, string.Empty);

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
                Response.Redirect("NurseryResrv.aspx");

            }

            protected void delbtn_Click(object sender, EventArgs e)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {

                    int x = int.Parse(Request.QueryString["id"].ToString());

                    patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
                    room_history p2 = db.room_history.Where(a => a.id == p.details_id).FirstOrDefault();

                    room rr = db.room.FirstOrDefault(a => a.id == p2.room_id);
                    rr.flag = false;
                    db.SaveChanges();

                    db.patient_history.Remove(p);


                    db.SaveChanges();

                    db.room_history.Remove(p2);
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
                else if (ddl_room.SelectedValue == "")
                {
                    MsgBox("ادخل رقم الحضان ", this.Page, this);

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






                    room_history lp = new room_history
                    {
                        ticketId = int.Parse(txt_code.Text),
                        p_id = int.Parse(patientlist.SelectedValue.ToString()),

                        p_name = patientlist.SelectedItem.ToString(),
                        price = float.Parse(txt_price.Value),
                        date = DateTime.Now.Date,
                        room_id = int.Parse(ddl_room.SelectedValue.ToString()),
                        room_name = ddl_room.SelectedItem.ToString(),
                        status = false,
                        del = false,
                        user_name = uname,
                        user_id = uid,
                        check_out = false,
                        type = "حضانه",
                        from_date = Convert.ToDateTime(fromdt.Text),
                        date_now = DateTime.Now,
                        notes = txt_notes.Value




                    };
                    db.room_history.Add(lp);
                    db.SaveChanges();

                    var max_id = (from j in db.room_history select j.id).Max();
                    patient_history p = new patient_history
                    {
                        ///ticketId = int.Parse(txt_code.Text),
                        p_id = int.Parse(patientlist.SelectedValue.ToString()),

                        p_name = patientlist.SelectedItem.ToString(),
                        price = float.Parse(txt_price.Value),
                        date = DateTime.Now,
                        service_id = int.Parse(ddl_room.SelectedValue.ToString()),
                        service_name = ddl_room.SelectedItem.ToString(),
                        type = "حضانه",
                        details_id = max_id,
                        check_out = false,
                        confirm_calc=false,
                        //doc_acc=false,
                        user_name = uname,
                        user_id = uid
                    };
                    db.patient_history.Add(p);
                    db.SaveChanges();

                    int rid = int.Parse(ddl_room.SelectedValue.ToString());
                    room rr = db.room.FirstOrDefault(a => a.id == rid);
                    rr.flag = true;
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




        protected void ddl_room_SelectedIndexChanged(object sender, EventArgs e)
            {
                int s = 0;
                if (ddl_room.Text != null)
                {
                    s = int.Parse(ddl_room.SelectedValue.ToString());
                    if (db.room.Any(a => a.id == s))
                    {
                        room pt = db.room.FirstOrDefault(a => a.id == s);
                        txt_price.Value = pt.price.ToString();
                        txt_price.Disabled = true;

                    }

                }
            }

            protected void btnSearch_Click(object sender, EventArgs e)
            {
                if (from1.Text != "" && to1.Text != "")
                {
                    Response.Redirect("NurseryResrv.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
                }
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

                Response.Redirect("NurseryResrv.aspx");
            }
        }
    }

    }
