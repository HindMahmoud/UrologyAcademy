using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class RoomCalcu : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (db.doctor.Any())
                {
                    var a = (from s in db.doctor select s).ToList();
                    ddldoc.DataTextField = "name";
                    ddldoc.DataValueField = "id";
                    ddldoc.DataSource = a;

                    ddldoc.DataBind();
                    ddldoc.Items.Insert(0, string.Empty);


                    ddldoc2.DataTextField = "name";
                    ddldoc2.DataValueField = "id";
                    ddldoc2.DataSource = a;

                    ddldoc2.DataBind();
                    ddldoc2.Items.Insert(0, string.Empty);
                }

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {
                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
                    room_history p2 = db.room_history.Where(a => a.id == p.details_id).FirstOrDefault();

                    txt_price.Text = p2.price.ToString();

                    DateTime now = DateTime.Now;
                    DateTime fromdt = Convert.ToDateTime(p2.from_date.ToString());
                    var hours = (now - fromdt).TotalHours;
                    var days = (now - fromdt).TotalDays;

                    int xxx = (int)hours / 24;
                    txt_days.Text = xxx.ToString();
                    double h = Math.Round(days - xxx, 4);
                    double h2 = Math.Round((hours % 24), 4);

                    txt_hours.Text = (h2).ToString();
                    double t = double.Parse((days * p2.price).ToString());
                    txt_total.Text = Math.Round(t, 2).ToString();
                    txt_total_TextChanged(sender, e);
                    if (p.confirm_calc == true)
                    {
                        
                        if (p2.dev_val != null)
                            txt_device.Text = p2.dev_val.ToString();
                        if (p2.enter_val != null)
                            txt_enter.Text = p2.enter_val.ToString();
                        if (p2.total != null)
                            txt_total.Text = p2.total.ToString();
                        if (p2.total_val != null)
                            txt_totalval.Text = p2.total_val.ToString();
                    }
                    if (db.doctor_account.Any(a => a.p_historyID == x && a.type == "حساب أقامه"))
                    {
                        doctor_account f = db.doctor_account.Where(a => a.p_historyID == x && a.type == "حساب أقامه").FirstOrDefault();
                        ddl_type.SelectedValue = "doc";
                        ddl_type_SelectedIndexChanged(sender, e);
                        docList.SelectedValue = f.doc_id.ToString();

                    }

                    if (db.doctor_account.Any(a => a.p_historyID == x && a.type == "ادخال أقامه"))
                    {
                        doctor_account f = db.doctor_account.Where(a => a.p_historyID == x && a.type == "ادخال أقامه").FirstOrDefault();
                        txt_enter.Text = f.in_val.ToString();
                        ddldoc2.SelectedValue = f.doc_id.ToString();



                    }
                    if (db.doctor_account.Any(a => a.p_historyID == x && a.type == "تحويل أقامه"))
                    {
                        doctor_account f = db.doctor_account.Where(a => a.p_historyID == x && a.type == "تحويل أقامه").FirstOrDefault();
                        txt_percent.Text = f.in_val.ToString();
                        ddldoc.SelectedValue = f.doc_id.ToString();

                    }


                    txt_total_TextChanged(sender, e);


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
            Response.Redirect("RoomCalcu.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);


                if (db.room_history.Any(a => a.id == p.details_id))
                {
                    room_history p2 = db.room_history.Where(a => a.id == p.details_id).FirstOrDefault();

                    db.room_history.Remove(p2);
                    db.SaveChanges();
                }
                if (db.doctor_account.Any(a => a.p_historyID == p.id))
                {
                    var d = db.doctor_account.Where(a => a.p_historyID == p.id).ToList();

                    db.doctor_account.RemoveRange(d);
                    db.SaveChanges();
                }

                db.patient_history.Remove(p);


                db.SaveChanges();


                Response.Redirect("RoomCalcu.aspx");
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
            {
                int x = int.Parse(Request.QueryString["edit"].ToString());

                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
                room_history p2 = db.room_history.Where(a => a.id == p.details_id).FirstOrDefault();

                int? doc_id = null;
                string doc_n = null;
                if (ddl_type.SelectedValue.ToString() == "doc" && docList.Text != "")
                {
                    doc_id = int.Parse(docList.SelectedValue.ToString());
                    doc_n = docList.SelectedItem.ToString();

                    if (db.doctor_account.Any(a => a.p_historyID == x && a.type == "حساب أقامه"))
                    {
                        doctor_account f = db.doctor_account.Where(a => a.p_historyID == x && a.type == "حساب أقامه").FirstOrDefault();
                        f.doc_id = doc_id;
                        f.doc_name = doc_n;
                        f.out_val = double.Parse(txt_totalval.Text);
                        db.SaveChanges();
                    }
                    else
                    {
                        doctor_account da = new doctor_account
                        {
                            p_id = p.p_id,
                            p_name = p.p_name,
                            in_val = 0,
                            out_val = double.Parse(txt_totalval.Text),
                            date = DateTime.Now.Date,
                            doc_id = doc_id,
                            doc_name = doc_n,
                            title = "حساب أقامه",
                            type = "أقامه",
                            p_historyID = p.id

                        };
                        db.doctor_account.Add(da);
                        db.SaveChanges();
                    }

                    p.doc_id = doc_id;
                    p.doc_name = doc_n;

                   // p.doc_acc = true;
                    db.SaveChanges();
                }

                p2.dev_val = double.Parse(txt_device.Text);
                p2.enter_val = double.Parse(txt_enter.Text);
                p2.total = double.Parse(txt_total.Text);
                p2.total_val = double.Parse(txt_totalval.Text);
                p2.to_date = DateTime.Now;

                db.SaveChanges();
                p.price = double.Parse(txt_totalval.Text);
               
                p.confirm_calc = true;

                db.SaveChanges();
                room rm = db.room.FirstOrDefault(a => a.id == p2.room_id);

                rm.flag = false;
                db.SaveChanges();

                ////////////////////////////////////////////////////////////////////////////
                if (ddldoc2.Text != "")
                {
                    int doc_id2 = int.Parse(ddldoc2.SelectedValue.ToString());
                    string doc_n2 = ddldoc2.SelectedItem.ToString();
                    if (db.doctor_account.Any(a => a.p_historyID == x && a.type == "ادخال أقامه"))
                    {
                        doctor_account f = db.doctor_account.Where(a => a.p_historyID == x && a.type == "ادخال أقامه").FirstOrDefault();
                        f.doc_id = doc_id2;
                        f.doc_name = doc_n2;
                        f.in_val = double.Parse(txt_enter.Text);
                        db.SaveChanges();
                    }
                    else
                    {
                        doctor_account da = new doctor_account
                        {
                            p_id = p.p_id,
                            p_name = p.p_name,
                            in_val = double.Parse(txt_enter.Text),
                            out_val = 0,
                            date = DateTime.Now.Date,
                            doc_id = doc_id2,
                            doc_name = doc_n2,
                            title = "ادخال أقامه",
                            type = "ادخال أقامه",
                            p_historyID = p.id

                        };
                        db.doctor_account.Add(da);
                        db.SaveChanges();
                    }
                }
                //////////////////////////////////////////////////////////////////////////////////////////////

                if (ddldoc.Text != "")
                {
                    int doc_id1 = int.Parse(ddldoc.SelectedValue.ToString());
                    string doc_n1 = ddldoc.SelectedItem.ToString();
                    if (db.doctor_account.Any(a => a.p_historyID == x && a.type == "تحويل أقامه"))
                    {
                        doctor_account f = db.doctor_account.Where(a => a.p_historyID == x && a.type == "تحويل أقامه").FirstOrDefault();
                        f.doc_id = doc_id1;
                        f.doc_name = doc_n1;
                        f.in_val = double.Parse(txt_percent.Text);
                        db.SaveChanges();
                    }
                    else
                    {
                        doctor_account da = new doctor_account
                        {
                            p_id = p.p_id,
                            p_name = p.p_name,
                            in_val = double.Parse(txt_percent.Text),
                            out_val = 0,
                            date = DateTime.Now.Date,
                            doc_id = doc_id1,
                            doc_name = doc_n1,
                            title = "تحويل أقامه",
                            type = "تحويل أقامه",
                            p_historyID = p.id

                        };
                        db.doctor_account.Add(da);
                        db.SaveChanges();
                    }
                }





                Response.Redirect("RoomCalcu.aspx");


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

        protected void txt_total_TextChanged(object sender, EventArgs e)
        {
            if (txt_total.Text != "" && txt_enter.Text != "" && txt_device.Text != "")
            {
                double x = double.Parse(txt_total.Text);
                double y = double.Parse(txt_enter.Text);
                double z = double.Parse(txt_device.Text);
                txt_totalval.Text = (x + y + z).ToString();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("RoomCalcu.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }
        }
    }
}