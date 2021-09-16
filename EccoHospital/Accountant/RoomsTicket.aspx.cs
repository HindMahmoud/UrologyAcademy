using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class RoomsTicket : System.Web.UI.Page
    {
        EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
        static string n = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            n = Request.QueryString["n"].ToString();

            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
                {
                    int x = int.Parse(Request.QueryString["t_id"].ToString());

                    if (db.treatment.Any(a => a.ticket_id == x))
                    {
                        var summ = (from s in db.treatment where s.ticket_id == x select s).ToList();
                        txtmed.Text = summ.Sum(a => a.total_price).ToString();
                    }
                    else
                    {
                        txtmed.Text = "0";
                    }


                    
                    //if (db.service.Any())
                    //{
                    //    var cr = (from d in db.service where d.dep_name == n select d).ToList();
                    //    ddl_lab.DataSource = cr;
                    //    ddl_lab.DataTextField = "name";
                    //    ddl_lab.DataValueField = "id";
                    //    ddl_lab.DataBind();
                    //    ddl_lab.Items.Insert(0, string.Empty);
                    //}
                    if (db.doctor.Any())
                    {
                        var a = (from s in db.doctor select s).ToList();
                        ddl_doc.DataTextField = "name";
                        ddl_doc.DataValueField = "id";
                        ddl_doc.DataSource = a;

                        ddl_doc.DataBind();
                        ddl_doc.Items.Insert(0, string.Empty);
                    }


                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {
                        int id = int.Parse(Request.QueryString["edit"].ToString());
                        EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.id == id);
                        ddl_lab.SelectedValue = f.service_id.ToString();
                        ddl_lab_TextChanged(sender, e);
                        //if (f.time_no != null)
                        //    txt_time.Text = f.time_no.ToString();
                        //if (f.time_price != null)
                        //    txt_price.Text = f.time_price.ToString();
                        if (f.doc_id != null)
                            ddl_doc.SelectedValue = f.doc_id.ToString();
                        if (f.doc_value != null)
                            txt_per.Text = f.doc_value.ToString();
                        btn.Text = "تعديل";


                    }
                    else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                    {
                        int id = int.Parse(Request.QueryString["id"].ToString());
                        Div2.Visible = true;
                        delbtn.Visible = true;
                        cancel.Visible = true;

                    }


                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (txt_price.Text != "")
            {
                int x = int.Parse(Request.QueryString["t_id"].ToString());

                ticket t = db.ticket.FirstOrDefault(a => a.code == x);
                int? d_id = null;
                string dn = null;
                if (ddl_doc.Text != "")
                {
                    d_id = int.Parse(ddl_doc.SelectedValue.ToString());
                    dn = ddl_doc.SelectedItem.ToString();

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


                if (btn.Text == "تعديل")
                {

                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {

                        int id = int.Parse(Request.QueryString["edit"].ToString());

                        EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.id == id);
                        f.service_id = int.Parse(ddl_lab.SelectedValue.ToString());
                        f.service_name = ddl_lab.SelectedItem.ToString();
                        //f.time_price = double.Parse(txt_price.Text);
                        //f.time_no = int.Parse(txt_time.Text);
                        f.price = double.Parse(txt_price.Text) * int.Parse(txt_time.Text);
                        if (ddl_doc.Text != "")
                        {
                            f.doc_value = double.Parse(txt_per.Text);
                            f.doc_id = int.Parse(ddl_doc.SelectedValue.ToString());
                            f.doc_name = ddl_doc.SelectedItem.ToString();

                        }
                        else
                        {
                            f.doc_name = null;
                            f.doc_id = null;
                            f.doc_value = null;
                        }
                        db.SaveChanges();



                    }

                }

                else
                {

                    patient_history p = new patient_history
                    {

                       // ticketId = x,
                        p_id = t.patient_id,
                        p_name = t.patient_name,
                        //time_price = double.Parse(txt_price.Text),
                        //time_no = int.Parse(txt_time.Text),
                        price = double.Parse(txt_price.Text) * int.Parse(txt_time.Text),
                        date = DateTime.Now,
                        service_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                        service_name = ddl_lab.SelectedItem.ToString(),
                        type = "خدمات",
                        details_id = null,
                        check_out = false,
                        user_id = uid,
                        user_name = uname
                    };
                    db.patient_history.Add(p);
                    db.SaveChanges();



                }
                Response.Redirect("RoomsTicket.aspx?n="+n+"&&t_id=" + x);
            }

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            int x = int.Parse(Request.QueryString["t_id"].ToString());

            Response.Redirect("RoomsTicket.aspx?t_id=" + x);
        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int id = int.Parse(Request.QueryString["id"].ToString());


                patient_history p = db.patient_history.FirstOrDefault(a => a.id == id);

                db.patient_history.Remove(p);


                db.SaveChanges();
                int x = int.Parse(Request.QueryString["t_id"].ToString());

                Response.Redirect("RoomsTicket.aspx?n=" + n + "&&t_id=" + x);
            }
        }
        protected void ddl_lab_TextChanged(object sender, EventArgs e)
        {
            int s = 0;
            if (ddl_lab.Text != "")
            {
                s = int.Parse(ddl_lab.SelectedValue.ToString());
                if (db.service.Any(a => a.id == s))
                {
                    service pt = db.service.FirstOrDefault(a => a.id == s);
                    txt_price.Text = pt.price.ToString();
                    //                  txt_price.Disabled = true;
                    //
                }

            }
        }






        protected void btnsave_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
            {
                int x = int.Parse(Request.QueryString["t_id"].ToString());
                ticket t = db.ticket.FirstOrDefault(a => a.code == x);
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


                if (txtmed.Text != "0")
                {
                    var summ = (from s in db.treatment where s.ticket_id == x select s).ToList();
                    var total = summ.Sum(a => a.total_price).ToString();
                    patient_history p = new patient_history
                    {

                        //ticketId = x,
                        p_id = t.patient_id,
                        p_name = t.patient_name,
                        //time_price = double.Parse(total),
                        //time_no = 1,
                        price = double.Parse(total),
                        date = DateTime.Now,
                        service_id = -3,
                        service_name = "اجمالي علاج",
                        type = "علاج",
                        details_id = null,
                        check_out = false,
                        user_id = uid,
                        user_name = uname
                    };
                    db.patient_history.Add(p);
                    db.SaveChanges();

                    Response.Redirect("RoomsTicket.aspx?t_id=" + x);
                }



            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
            {
                int x = int.Parse(Request.QueryString["t_id"].ToString());
                ticket t = db.ticket.FirstOrDefault(a => a.code == x);
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


                room_history sh = db.room_history.FirstOrDefault(a => a.ticketId == x);
                var ticketlist = (from s in db.patient_history
                                  where  (s.type != "عمليات" && s.type != "حضانه" && s.type != "عنايه")
                                  select s).ToList();

                foreach (var item in ticketlist)
                {

                    if (item.doc_id != null && item.doc_value != null)
                    {
                        int docid = int.Parse(item.doc_id.ToString());

                        doctor_account da = new doctor_account
                        {

                            in_val = double.Parse(item.doc_value.ToString()),
                            out_val = 0,
                            date = DateTime.Now,
                            doc_id = x,
                            doc_name = item.doc_name.ToString(),
                            title = item.service_name.ToString(),
                            type = "auto",
                            notes = "تذكره رقم#" + x

                        };
                        db.doctor_account.Add(da);
                        db.SaveChanges();


                    }

                    item.check_out = true;
                    db.SaveChanges();

                }

                sh.total = ticketlist.Sum(a => a.price);
                sh.reminder_val = ticketlist.Sum(a => a.price) - sh.reminder_val;
                db.SaveChanges();
                string q = @"select r.p_name,h.price,r.ticketId,h.user_name,r.[type] as nam,h.[service_name],h.doc_value,h.doc_name as doctorname ,h.price,r.room_name,r.total_val,r.reminder_val,r.insurance_val,ticket.doc_name,
h.time_no,h.time_price,r.from_date,r.to_date from[dbo].[room_history] as r
join patient_history as h on r.ticketId=h.ticketId join ticket on h.ticketId=ticket.code where h.type !=N'عمليات' and h.type !=N'عنايه' and h.type!=N'حضانه' and

h.ticketId=" + x + " ";

                string cr = "CReport/7Dan.rpt";
                Session["query"] = q;
                Session["cr"] = cr;


                Response.Redirect("~/report.aspx");


            }
        }







    }
}