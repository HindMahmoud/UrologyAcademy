using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.saavee
{
    public partial class ClinicResrv : System.Web.UI.Page
    {

        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                DateTime dt = DateTime.Now.Date;
                int f = (int)dt.DayOfWeek;
                var cr = (from d in db.service select d).ToList();
                 ReceptionType.DataSource = cr;
                ReceptionType.DataTextField = "name";
                ReceptionType.DataValueField = "id";
                ReceptionType.DataBind();
                ReceptionType.Items.Insert(0, string.Empty);
               

                if (db.patient.Any())
                {
                    var rep = (from s in db.patient select s).ToList();
                    patientlist.DataSource = rep;

                    patientlist.DataTextField = "name";
                    patientlist.DataValueField = "id";
                    patientlist.DataBind();
                    patientlist.Items.Insert(0, "");

                }
                if (db.doctor.Any())
                {
                    var ddl = (from t in db.doctor select t).ToList();
                    ddldoctors.DataSource = ddl;
                    ddldoctors.DataTextField = "name";
                    ddldoctors.DataValueField = "id";
                    ddldoctors.DataBind();
                    ddldoctors.Items.Insert(0, "");

                }
               

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

            else if (patientlist.SelectedValue == "")
            {
                MsgBox("ادخل اسم المريض", this.Page, this);

            }
            else if (txt_price.Value == "")
            {
                MsgBox("ادخل السعر ", this.Page, this);

            }
            else if (ReceptionType.SelectedItem.Text == "")
            {
                MsgBox("ادخل الخدمة ", this.Page, this);

            }
           else if (datee.Text == "")
            {
                MsgBox("ادخل التاريخ ", this.Page, this);

            }
            else if (ddldoctors.Text == "")
            {
                MsgBox("اختر الطبيب ", this.Page, this);

            }

            else
            {
                int serperc = int.Parse(ReceptionType.SelectedValue.ToString());
                var servTypee = (from u in db.service where u.id == serperc select u.serType);

                int p_id = int.Parse(patientlist.SelectedValue.ToString());
                int? t_id = null;
                string uname = "";
                int uid = 0;
                if (Session["user"] == null)
                {
                    uname = "";
                }
                else
                {
                    uid = int.Parse(Session["user_id"].ToString());
                    uname = Session["user"].ToString();

                }
                if (db.ticket_out.Any(a => a.patient_id == p_id && a.code != null && a.flag == true))
                {
                    ticket_out tt = db.ticket_out.FirstOrDefault(a => a.patient_id == p_id && a.flag == true);
                    t_id = int.Parse(tt.code.ToString());
                }
                else
                {
                    int code = 1;
                    if (db.ticket_out.Any())
                    {
                        var max_item = (from sp in db.ticket_out select sp.id).Max();
                        code = max_item + 1;
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
                
                clinic_reception lp = new clinic_reception
                {
                    patient_id = int.Parse(patientlist.SelectedValue),
                    patient_name = patientlist.SelectedItem.ToString(),
                    price = float.Parse(txt_price.Value),
                    date = Convert.ToDateTime(datee.Text),
                    
                    status = false,
                    check_out = false,
                    user_name = uname,
                    user_id = uid,
                    type = ReceptionType.SelectedItem.ToString(),
                    datenow = Convert.ToDateTime(datee.Text.ToString()),
                    doc_id = int.Parse(ddldoctors.SelectedValue.ToString()),
                    doctor_name = ddldoctors.SelectedItem.ToString(),
                   
                    printFlag = false
                };
                db.clinic_reception.Add(lp);
                db.SaveChanges();
                var max_id = (from j in db.clinic_reception select j.id).Max();
                int servid = int.Parse(ReceptionType.SelectedValue);
                var typeservice = (from o in db.service where o.id == servid select o.serType).FirstOrDefault();
                patient_history p = new patient_history
                {
                    p_id = int.Parse(txt_code.Text),
                    p_name = patientlist.SelectedItem.ToString(),
                    price = double.Parse(txt_price.Value),
                    date = Convert.ToDateTime(datee.Text),
                    service_id = servid,
                    service_name = ReceptionType.SelectedItem.ToString(),
                    serTypee = typeservice,
                    type = "عيادات",
                    details_id = max_id,
                    check_out = true,
                    //doc_acc = false,
                    confirm_calc = true,
                    doc_id = int.Parse(ddldoctors.SelectedValue.ToString()),
                    doc_name = ddldoctors.SelectedItem.ToString(),
                    user_name = uname,
                    user_id = uid,

                    doc_value = double.Parse(doc_txt.Text),
                    hos_value = double.Parse(hos_txt.Text),
                    unit_val = double.Parse(unittxt.Text),
                    main_val = double.Parse(mainttxt.Text),
                };
                db.patient_history.Add(p);
                db.SaveChanges();
                var max_id2 = (from j in db.patient_history select j.id).Max();
                //int cc = int.Parse(Convert.ToString(max_id2.ticketId));
                savee s = new savee
                {
                    p_id = int.Parse(patientlist.SelectedValue),
                    //title = ClinicList.SelectedItem.Text,
                    in_value = double.Parse(txt_price.Value),
                    out_value = 0,
                    date = Convert.ToDateTime(datee.Text.ToString()),
                    type = "عيادات",
                    notes = ReceptionType.SelectedItem.ToString() + " " + patientlist.SelectedItem.ToString(),
                    del = false,
                    user_id = uid,
                    user_name = uname,
                    item_id = max_id2,
                   // ticketId = t_id

                };
                db.savee.Add(s);
                db.SaveChanges();
                var max = (from f in db.savee select f.id).Max();
               
                string d = @"select name,code,id from patient where code =" + p_id;
                string cr = "CReport/bar.rpt";
                Session["query"] = d;
                Session["cr"] = cr;
                Response.Redirect("~/report.aspx");
                //string q = @"select s.id ,s.date,p.p_name,p.service_name,p.serTypee,s.in_value,p.hos_value,p.doc_value,s.user_name from savee s join patient_history p on s.item_id=p.id where p.confirm_calc='true' and  s.id=" + max + " ";
                //string cr = "CReport/patientPayR.rpt";
                //Session["query"] = q;
                //Session["cr"] = cr;
                //Response.Redirect("~/report.aspx");
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

                    //ticket ss = db.ticket.FirstOrDefault(a => a.code == id);

                    patient s = (from m in db.patient where m.id == id select m).FirstOrDefault();
                    //join d in db.ticket on m.id equals d.patient_id where m.id == ss.patient_id && d.flag == true select m).FirstOrDefault();
                    if (s != null)
                    {
                        patientlist.ClearSelection();
                        patientlist.Items.FindByValue(s.id.ToString()).Selected = true;

                        patientlist_SelectedIndexChanged(sender, e);
                    }
                }
            }
        }

        protected void ddl_lab_TextChanged(object sender, EventArgs e)
        {

        }


        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (patientlist.Text != "")
            {
                int id = int.Parse(patientlist.SelectedValue.ToString());
                // ticket y = db.ticket.FirstOrDefault(a => a.flag == true && a.patient_id == id);
                patient s = (from m in db.patient where m.id == id select m).FirstOrDefault();

                txt_code.Text = s.id.ToString();

                // Response.Redirect("dr_rad.aspx?p_id=" + id);


            }

        }

        protected void ReceptionType_TextChanged(object sender, EventArgs e)
        {
            int s = 0;

            if (ReceptionType.SelectedValue.ToString() != "")

            {
                int xx = int.Parse(ReceptionType.SelectedValue.ToString());
                service cc = db.service.FirstOrDefault(a => a.id == xx);

                txt_price.Value = cc.price.ToString();
                txt_price.Disabled = true;
                txt_price_TextChanged(sender, e);
                mainttxt_TextChanged(sender, e);

            } //else if (ReceptionType.SelectedItem.Text == "عمليات")
           // {
           //     txt_price.Value = "0";

           //     hos_txt.Text = "";
           //     mainttxt.Text = "";
           //     unittxt.Text = "";
           //     doc_txt.Text="";
           //}

        }

        protected void ReceptionType_SelectedIndexChanged(object sender, EventArgs e)
        {
            int s = 0;

            if (ReceptionType.SelectedValue.ToString() != "" )
            {
                int xx = int.Parse(ReceptionType.SelectedValue.ToString());
                service cc = db.service.FirstOrDefault(a => a.id == xx);

                txt_price.Value = cc.price.ToString();
                txt_price.Disabled = true;
                
               
                txt_price_TextChanged(sender, e);
                mainttxt_TextChanged(sender, e);

            }
            //else if (ReceptionType.SelectedItem.Text == "عمليات")
            //{
            //    txt_price.Value = "0";
            //    hos_txt.Text = "";
            //    mainttxt.Text = "";
            //    unittxt.Text = "";
            //    doc_txt.Text = "";

            //}
            }

        protected void ddldoctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            int s = 0;

            if (txt_price.Value != ""&&ReceptionType.Text!=""&&ddldoctors.SelectedValue!=""&&mainttxt.Text!="")

            {
                ReceptionType_SelectedIndexChanged(sender, e);
                txt_price_TextChanged(sender, e);
                
                doc_txt_TextChanged(sender, e);

            }

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    DateTime dt = DateTime.Now.Date;
        //    DateTime dt2 = dt.AddDays(1);


        //    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
        //    {
        //        dt = Convert.ToDateTime(Request.QueryString["date1"]);

        //        dt2 = Convert.ToDateTime(Request.QueryString["date2"]);
        //    }
        //    string aa = dt.ToString("yyyy-MM-dd HH:mm:ss.fff");
        //    string bb = dt2.ToString("yyyy-MM-dd HH:mm:ss.fff");
        //    string q = @"select * from clinic_reception it join patient_history on it.id=patient_history.details_id where patient_history.confirm_calc='true' and  datenow >= '" + aa + "' and datenow <= '" + bb + "'  ORDER  BY clinic_id  ";
        //    string cr = "CReport/ClinicRecR.rpt";
        //    Session["query"] = q;
        //    Session["cr"] = cr;


        //    Response.Redirect("~/report.aspx");
        //}



        protected void txt_price_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != "" && doc_txt.Text != "" && hos_txt.Text != "")
            {
                if (ReceptionType.SelectedValue.ToString() != "")

                {
                    int xx = int.Parse(ReceptionType.SelectedValue.ToString());
                    service cc = db.service.FirstOrDefault(a => a.id == xx);
                    mainttxt_TextChanged(sender, e);
                    
                }
            }
        }


        protected void hos_txt_TextChanged(object sender, EventArgs e)
        {
        }

        protected void doc_txt_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != "" && mainttxt.Text != "" && ddldoctors.SelectedValue != "")
            {

                double t = double.Parse(txt_price.Value);
                double maint = double.Parse(mainttxt.Text);
                double hos = double.Parse(hos_txt.Text);
                double remain = t - (maint + hos);
                if (ReceptionType.SelectedValue.ToString() != "")
                {
                    int xx = int.Parse(ReceptionType.SelectedValue.ToString());
                    service cc = db.service.FirstOrDefault(a => a.id == xx);
                    int iddoctor = int.Parse(ddldoctors.SelectedValue.ToString());
                    var fpercdoc = (from o in db.doctor_services where o.serviceId == xx&&o.doctorId==iddoctor  select o).FirstOrDefault();
                    if (fpercdoc != null)
                    {
                        double unit = remain - double.Parse(fpercdoc.pricce.ToString());
                        doc_txt.Text = remain.ToString();
                        double dd = double.Parse(cc.price.ToString());
                        unittxt.Text = unit.ToString();//( dd- double.Parse(hos_txt.Text+mainttxt.Text+doc_txt.Text)).ToString();

                    }

                }
            }
        }
        protected void mainttxt_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != ""&&mainttxt.Text!=""&&ReceptionType.SelectedValue!="")
            {
                double price = double.Parse(txt_price.Value);
                int xx = int.Parse(ReceptionType.SelectedValue.ToString());
                service cc = db.service.Where(a => a.id == xx).FirstOrDefault();
                double r = .15;
                mainttxt.Text = ((r) * (cc.price)).ToString();
                double maintainceprice = double.Parse(mainttxt.Text);
                    double res = price - maintainceprice;
                double r1 = .3;
                double r2 = .2;
                if (cc.serType == "تشخيصي")
                {
                    hos_txt.Text = (r1 * res).ToString();
                }
                else { hos_txt.Text = (r2 * res).ToString(); }
            }
        }
    }
}