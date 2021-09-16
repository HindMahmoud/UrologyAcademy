using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Accountant
{
    public partial class NurseryCalc : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                {
                    int x = int.Parse(Request.QueryString["print"].ToString());

                    patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
                    room_history p2 = db.room_history.Where(a => a.id == p.details_id).FirstOrDefault();

                    int xx = int.Parse(p2.id.ToString());
                    string q = @"select r.p_name,h.price,r.ticketId,h.user_name,r.[type] as nam,h.[service_name],h.doc_value,h.doc_name as doctorname ,h.price,r.room_name,r.total_val,r.reminder_val,r.insurance_val,ticket.doc_name,
h.time_no,h.time_price,r.from_date,r.to_date from[dbo].[room_history] as r
join patient_history as h on r.ticketId=h.ticketId join ticket on h.ticketId=ticket.code where h.type !=N'عمليات' and h.type !=N'عنايه' and h.type!=N'حضانه' and

h.ticketId="+ p2.ticketId + " ";

string cr = "CReport/7Dan.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;


                    Response.Redirect("~/report.aspx");
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {
                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
                    room_history p2 = db.room_history.Where(a => a.id == p.details_id).FirstOrDefault();

                Response.Redirect("RoomsTicket.aspx?n="+"حضانه"+"&&t_id="+p2.ticketId);


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
            Response.Redirect("NurseryCalc.aspx");

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


                Response.Redirect("NurseryCalc.aspx");
            }
        }

        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("NurseryCalc.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }
        }
    }
}