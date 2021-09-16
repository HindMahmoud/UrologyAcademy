using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Saavee
{
    public partial class patientPay : System.Web.UI.Page
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
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.id == x);
                    patientlist.SelectedValue = f.p_id.ToString();
                    // ddl_lab.SelectedValue = f.service_id.ToString();
                    txt_code.Text = f.p_id.ToString();
                    txt_total.Value = f.price.ToString();
                    btn.Text = "edit";
                    db.SaveChanges();

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                {

                    int x = int.Parse(Request.QueryString["print"].ToString());

                    string q = @"select * from savee s join patient p on s.p_id=p.id where s.id="+x+" ";
                    string cr = "CReport/patientPayR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;


                    Response.Redirect("~/report.aspx");

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
                lab_history p2 = db.lab_history.Where(a => a.id == p.details_id).FirstOrDefault();

                db.patient_history.Remove(p);


                db.SaveChanges();

                db.lab_history.Remove(p2);
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
            
            else if (txt_total.Value == "")
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

                savee s = new savee
                {
                    ticketId= int.Parse(txt_code.Text),
                    p_id = int.Parse(patientlist.SelectedValue.ToString()),
                    title = "  سداد تذكره # " + txt_code.Text+" " + patientlist.SelectedItem.ToString(),
                    in_value = double.Parse(txt_pay.Value),
                    out_value = 0,
                    date = DateTime.Now,
                    type = "سداد",
                    notes = "",
                    del = false,
                    user_id = uid,
                    user_name = uname

                };
                db.savee.Add(s);
                db.SaveChanges();
                int code = int.Parse(txt_code.Text);
                ticket tt = db.ticket.FirstOrDefault(a => a.code == code);
                tt.flag = false;
                db.SaveChanges();
                var lists = db.patient_history.Where(a =>  a.type != "عمليات" && a.type != "عنايه" && a.type != "حضانه" && a.check_out == false).ToList();
                if (lists != null)
                {
                    lists.ForEach(a => a.check_out = true);
                    lists.ForEach(a => a.confirm_calc = true);
                    db.SaveChanges();
                }
                    success_m.Visible = true;
                var max = (from f in db.savee select f.id).Max();

                string q = @"select * from savee s join patient p on s.p_id=p.id where s.id=" + max + " ";
                string cr = "CReport/patientPayR.rpt";
                Session["query"] = q;
                Session["cr"] = cr;


                Response.Redirect("~/report.aspx");






            }





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
                    if (db.savee.Any(a => a.ticketId == st.code))
                    {
                        var tictpay = db.savee.Where(a => a.ticketId == st.code ).ToList();
                        txt_payed.Value = tictpay.Sum(a => a.in_value).ToString();
                        Button1.Visible = true;

                        var lists = db.patient_history.Where(a =>  a.type != "عمليات"&& a.type != "عنايه"&& a.type != "حضانه" && a.check_out==false).ToList();
                        if (lists != null)
                        {
                            txt_total.Value = lists.Sum(a => a.price).ToString();
                            txt_pay.Value = lists.Sum(a => a.price).ToString();
                        }

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(patientlist.Text!="")
            {
                int x = int.Parse(txt_code.Text);
                Response.Redirect("patientDetails.aspx?id="+x);
            }
        }
    }
}