using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Saavee
{
    public partial class returnReserv : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                if (db.patient.Any())
                {
                    var rep = (from s in db.patient  join d in db.patient_history on s.id equals d.p_id join clin in db.clinic_reception on d.details_id equals clin.id  where d.confirm_calc==true select s).ToList();
                    patientlist.DataSource = rep;
                    patientlist.DataTextField = "name";
                    patientlist.DataValueField = "id";
                    patientlist.DataBind();
                    patientlist.Items.Insert(0, "");

                }

                DateTime dt = DateTime.Now.Date;
                int f = (int)dt.DayOfWeek;
               
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());
                    patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
                    txt_code.Text = p.p_id.ToString();
                    patientlist.SelectedValue = p.p_id.ToString();
                    patientlist.Text = p.p_name.ToString();
                    txt_price.Value = p.price.ToString();
                    

                }



            }


        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("returnReserv.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);

                if (db.clinic_reception.Any(a => a.id == p.details_id))
                {
                    clinic_reception p2 = db.clinic_reception.Where(a => a.id == p.details_id).FirstOrDefault();
                    db.clinic_reception.Remove(p2);
                    db.SaveChanges();
                }



                if (db.savee.Any(a => a.type == "عيادات" && a.item_id == x))
                {
                    savee sss = db.savee.Where(a => a.type == "عيادات" && a.item_id == x).FirstOrDefault();
                    sss.del = true;
                    db.SaveChanges();
                }
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
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());
                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);
                clinic_reception pp = db.clinic_reception.FirstOrDefault(d => d.id == p.details_id);
                p.hos_value = null;
                p.doc_value = null;
                p.del = true;
                db.SaveChanges();
                pp.note = "مرتجع عيادات خارجية لحساب المريض " + p.p_name;
                db.SaveChanges();
                string uname = "";
                int id = 0;
                if (Session["user"] != null)
                {
                    uname = Session["user"].ToString();
                    id = int.Parse(Session["user_id"].ToString());
                }
                var ty = (from o in db.savee where o.item_id == pp.id select o).FirstOrDefault();
                int? ticketId = 0;
                if (ty != null)
                {
                    ticketId = ty.ticketId;
                }
                savee ss = new savee
                {
                    //title = pp.clinic_name,
                    in_value = 0,
                    out_value = float.Parse(txt_price.Value),
                    date = DateTime.Now.Date,
                    item_id = p.id,
                    p_id = p.p_id,
                    type = p.type,
                    notes = "مرتجع عيادات خارجية لحساب المريض " + p.p_name,
                    user_id = id,
                    user_name = uname,
                    del=false,
                    ticketId = ticketId

                };
                db.savee.Add(ss);
                db.SaveChanges();
                txt_code.Text = patientlist.Text = txt_price.Value = "";

            }
            else if (!String.IsNullOrEmpty(txt_code.Text) && !String.IsNullOrEmpty(txt_price.Value) && !String.IsNullOrEmpty(patientlist.Text))
            {
                int x = int.Parse(txt_code.Text);
                 var g = (from s in db.patient join d in db.patient_history on s.id equals d.p_id where s.id == x && d.confirm_calc == true select  d).FirstOrDefault();
                   patient_history p = db.patient_history.FirstOrDefault(a => a.id == g.id);
                clinic_reception pp = db.clinic_reception.FirstOrDefault(d => d.id == p.details_id);
                p.hos_value = null;
                p.doc_value = null;
                p.del = true;
                db.SaveChanges();
                pp.note = "مرتجع عيادات خارجية لحساب المريض " + p.p_name;
                db.SaveChanges();
                string uname = "";
                int id = 0;
                if (Session["user"] != null)
                {
                    uname = Session["user"].ToString();
                    id = int.Parse(Session["user_id"].ToString());
                }
                var ty = (from o in db.savee where o.item_id == pp.id select o).FirstOrDefault();
                int? ticketId = 0;
                if (ty != null)
                {
                    ticketId = ty.ticketId;
                }
                savee ss = new savee
                {
                   // title = pp.clinic_name,
                    in_value = 0,
                    out_value = float.Parse(txt_price.Value),
                    date = DateTime.Now.Date,
                    item_id = p.id,
                    p_id = p.p_id,
                    type = p.type,
                    notes = "مرتجع عيادات خارجية لحساب المريض " + p.p_name,
                    user_id = id,
                    user_name = uname,
                    del=false,
                    ticketId = ticketId

                };
                db.savee.Add(ss);
                db.SaveChanges();
                txt_code.Text = patientlist.Text = txt_price.Value = "";
            }


            }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("returnReserv.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now.Date;
            DateTime dt2 = dt.AddDays(1);


            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
            {
                dt = Convert.ToDateTime(Request.QueryString["date1"]);

                dt2 = Convert.ToDateTime(Request.QueryString["date2"]);
            }
            string aa = dt.ToString("yyyy-MM-dd HH:mm:ss.fff");
            string bb = dt2.ToString("yyyy-MM-dd HH:mm:ss.fff");
            string q = @"select * from clinic_reception it  where datenow >= '" + aa + "' and datenow <= '" + bb + "' ORDER  BY clinic_id  ";
            string cr = "CReport/ClinicRecR.rpt";
            Session["query"] = q;
            Session["cr"] = cr;


            Response.Redirect("~/report.aspx");
        }

        protected void txt_code_TextChanged(object sender, EventArgs e)
        {
            if (txt_code.Text != "")
            {
                patientlist.Text = "";
                txt_price.Value = "";
                int id = int.Parse(txt_code.Text);
                if (db.patient.Any(a => a.id == id))
                {var g = (from s in db.patient join d in db.patient_history on s.id equals d.p_id  where s.id == id&&d.confirm_calc==true select new { s, d.price}).FirstOrDefault();
                    if (g != null)
                    {
                        patientlist.ClearSelection();
                        patientlist.Items.FindByValue(g.s.id.ToString()).Selected = true;
                        patientlist_SelectedIndexChanged(sender, e);
                        txt_price.Value = g.price.ToString();
                    }
                    else { patientlist.Text = "";
                        txt_price.Value = "";
                    }
                }
            }

        }

        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (patientlist.Text != "")
            {
                int id = int.Parse(patientlist.SelectedValue.ToString());
                // patient s = (from m in db.patient where m.id == id select m).FirstOrDefault();
                var rep = (from s in db.patient   join d in db.patient_history on s.id equals d.p_id  where s.id==id&&d.confirm_calc==true select new { s ,d.price}).FirstOrDefault();
                if (rep != null)
                {
                    txt_code.Text = rep.s.id.ToString();
                    txt_price.Value = rep.price.ToString();
                }
               
            }
        }
    }
}