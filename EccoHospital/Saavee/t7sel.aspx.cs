using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Saavee
{
    public partial class t7sel : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                DateTime dt = DateTime.Now.Date;
                int f = (int)dt.DayOfWeek;
                //if (db.clinic_time.Any(a=>a.day_num==f))
                //{


                //    var cr = (from d in db.clinic_time
                //              where d.day_num==f
                //              select d).ToList();
                //    ClinicList.DataSource = cr;
                //    ClinicList.DataTextField = "clinic_name";
                //    ClinicList.DataValueField = "clinic_id";
                //    ClinicList.DataBind();
                //    ClinicList.Items.Insert(0, string.Empty);
                //}

                //if (db.patient.Any())
                //{
                //    var rep = (from s in db.patient_history join i in db.clinic_reception on s.details_id equals i.id where s.confirm_calc == false && s.type == "عيادات" select s).ToList();
                //    patientlist.DataSource = rep;

                //    patientlist.DataTextField = "p_name";
                //    patientlist.DataValueField = "p_id";
                //    patientlist.DataBind();
                //    patientlist.Items.Insert(0, "");

                //}
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
            Response.Redirect("t7sel.aspx");

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

            if (txt_code.Text == "")
            {
                MsgBox("ادخل كود المريض", this.Page, this);
            }
            //else if (ClinicList.SelectedValue == "")
            //{
            //    MsgBox("ادخل اسم العياده", this.Page, this);

            //}
            //if (patientlist.SelectedValue == "")
            //{
            //    MsgBox("ادخل اسم المريض", this.Page, this);

            //}
            //else if (txt_price.Value == "")
            //{
            //    MsgBox("ادخل السعر ", this.Page, this);

            //}
            //else if (ReceptionType.SelectedItem.Text == "")
            //{
            //    MsgBox("ادخل الخدمة ", this.Page, this);

            //}
            else
            {
                //int patID;
                //int? ticketcod = 0;
                //if (int.Parse(patientlist.SelectedValue) > 0)
                //{
                //    patID = int.Parse(patientlist.SelectedValue);
                //    ticketcod = (from n in db.ticket join pat in db.patient on n.patient_id equals pat.id where n.flag == true && pat.id == patID select n.code).FirstOrDefault();
                //}

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
                int patid = int.Parse(txt_code.Text);
                if (db.clinic_reception.Any(p => p.patient_id == patid))
                {

                    clinic_reception r = db.clinic_reception.FirstOrDefault(a => a.patient_id == patid);

                    patient_history h = db.patient_history.FirstOrDefault(a => a.p_id == patid&& a.type == "عيادات");
                    h.confirm_calc = true;
                    
                    //r.user_name = uname;
                    //r.user_id = uid;
                    //h.user_name = uname;
                    //h.user_id = uid;
                    //h.type = ReceptionType.SelectedItem.ToString();
                    h.price = float.Parse(txt_price.Value);
                    db.SaveChanges();
                    //clinic_reception lp = new clinic_reception
                    //{
                    //    patient_id = int.Parse(patientlist.SelectedValue),
                    //    patient_name = patientlist.SelectedItem.ToString(),
                    //    price = float.Parse(txt_price.Value),
                    //    date = DateTime.Now.Date,
                    //    clinic_id = int.Parse(ClinicList.SelectedValue.ToString()),
                    //    clinic_name = ClinicList.SelectedItem.ToString(),
                    //    status = false,
                    //    check_out = false,
                    //    user_name = uname,
                    //    user_id = uid,
                    //    type = ReceptionType.SelectedItem.ToString(),
                    //    datenow = DateTime.Now,
                    //    doc_id = int.Parse(docList.SelectedValue.ToString()),

                    //    doctor_name = docList.SelectedItem.ToString(),
                    //    ticketId = int.Parse(txt_code.Text)


                    //    };
                    // db.clinic_reception.Add(lp);


                    var max_id = (from j in db.clinic_reception select j.id).Max();
                    //patient_history p = new patient_history
                    //{
                    //    p_id = int.Parse(txt_code.Text),
                    //    p_name = patientlist.SelectedItem.ToString(),
                    //    //price = double.Parse(txt_price.Value),
                    //    date = DateTime.Now,
                    //    service_id = int.Parse(ClinicList.SelectedValue.ToString()),
                    //    service_name = ClinicList.SelectedItem.ToString(),
                    //    type = "عيادات",
                    //    details_id = max_id,
                    //    check_out = true,
                    //    doc_acc=false,
                    //    confirm_calc=false,
                    //    user_name = uname,
                    //    user_id = uid,
                    //    doc_id = int.Parse(docList.SelectedValue.ToString()),

                    //    doc_name = docList.SelectedItem.ToString(),
                    //    doc_value=double.Parse(doc_txt.Text),
                    //    hos_value=double.Parse(hos_txt.Text),
                    //    ticketId= ticketcod
                    //};
                    //db.patient_history.Add(p);
                    //db.SaveChanges();

                    //success_m.Visible = true;
                   // string clinicname = r.clinic_name;
                    //int? c = 0;
                    //if (db.ticket.Any()) { var maxx = (from er in db.ticket select er.code).Max(); c = maxx + 1; }
                    //else { c = 1; }
                    //ticket t = new ticket
                    //{
                    //    patient_id = int.Parse(txt_code.Text),
                    //    patient_name = h.p_name,
                    //    Date = r.date,
                    //    code = c,
                    //    typeticket = "خارجي"
                    //};
                    //db.ticket.Add(t);
                    //db.SaveChanges();
                    //h.ticketId = c;
                    //r.ticketId = c;
                    var max_id2 = (from j in db.patient_history where j.p_id == h.p_id select j).FirstOrDefault();
                    //int cc = int.Parse(Convert.ToString(max_id2.ticketId));
                    savee s = new savee
                    {
                        p_id = int.Parse(txt_code.Text),
                       // title = clinicname,
                        in_value = double.Parse(txt_price.Value),
                        out_value = 0,
                        date = DateTime.Now,
                        type = "عيادات",
                        notes = r.type + " " + r.patient_name,
                        del = false,
                        user_id = uid,
                        user_name = uname,
                        item_id = max_id2.id,
                       // ticketId = c

                    };
                    db.savee.Add(s);
                    db.SaveChanges();
                    var max = (from f in db.savee select f.id).Max();
                    // int textcode = int.Parse(txt_code.Text);
                    string q = @"select s.id ,s.date,p.p_name,s.type,s.notes,s.in_value,s.title,s.user_name from savee s join patient_history p on s.p_id=p.p_id where p.confirm_calc='true' and  s.id=" + max + " ";
                    string cr = "CReport/patientPayR.rpt";
                    Session["query"] = q;
                    Session["cr"] = cr;


                    Response.Redirect("~/report.aspx");
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
                    lbl.Visible = false;
                    //ticket ss = db.ticket.FirstOrDefault(a => a.code == id);

                    var s = (from m in db.clinic_reception join h in db.patient_history on m.patient_id equals h.p_id where m.patient_id == id && h.confirm_calc == false && h.type == "عيادات" select new { h,m}).FirstOrDefault();
                    //join d in db.ticket on m.id equals d.patient_id where m.id == ss.patient_id && d.flag == true select m).FirstOrDefault();
                    if (s != null)
                    {
                        //patientlist.ClearSelection();
                        // patientlist.Items.FindByValue(s.id.ToString()).Selected = true;

                        // patientlist_SelectedIndexChanged(sender, e);
                       txt_price.Value= s.m.price.ToString();
                        txt_price_TextChanged(sender, e);
                    }
                    else { lbl.Text = "لايوجد مريض بهدا الرقم"; lbl.Visible = true; }
                   // txt_code.Text = "";
                    
                }
              
            }
        }

        protected void ddl_lab_TextChanged(object sender, EventArgs e)
        {

        }


        //protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        //{


        //    if (patientlist.Text != "")
        //    {
        //        int id = int.Parse(patientlist.SelectedValue.ToString());
        //        // ticket y = db.ticket.FirstOrDefault(a => a.flag == true && a.patient_id == id);
        //        patient s = (from m in db.patient join h in db.patient_history on m.id equals h.p_id where m.id == id && h.confirm_calc == false select m).FirstOrDefault();

        //        txt_code.Text = s.id.ToString();

        //        // Response.Redirect("dr_rad.aspx?p_id=" + id);


        //    }

        //}

        //protected void ReceptionType_TextChanged(object sender, EventArgs e)
        //{
        //    int s = 0;
        //    if (patientlist.SelectedValue != "")
        //    {
        //        int i = int.Parse(patientlist.SelectedValue);
        //        var c = (from r in db.patient_history join ci in db.clinic_reception on r.details_id equals ci.id where r.p_id == i select ci).FirstOrDefault();
        //        string clinicname = c.clinic_name;
        //        if (ReceptionType.Text != "" && clinicname != "")

        //        {
        //            //int xx = int.Parse(clinicname.SelectedValue.ToString());
        //            clinic cc = db.clinic.FirstOrDefault(a => a.id == c.clinic_id);
        //            if (ReceptionType.SelectedValue.ToString() == "كشف")
        //            {

        //                txt_price.Value = cc.price1.ToString();
        //            }
        //            else if (ReceptionType.SelectedValue.ToString() == "اعاده")
        //            {
        //                txt_price.Value = cc.price2.ToString();

        //            }
        //            else
        //            {
        //                txt_price.Value = cc.price3.ToString();

        //            }
        //            txt_price.Disabled = true;
        //            txt_price_TextChanged(sender, e);
        //        }
        //    }
        //}

        //protected void ClinicList_TextChanged(object sender, EventArgs e)
        //{
        //    if (ClinicList.Text != "")
        //    {
        //        // string langg = labb.SelectedItem.ToString();
        //        int st_id = int.Parse(ClinicList.SelectedValue.ToString());



        //        var a = (from s in db.doctor where s.clinic_id == st_id select s).ToList();
        //        docList.DataTextField = "name";
        //        docList.DataValueField = "id";
        //        docList.DataSource = a;

        //        docList.DataBind();
        //        docList.Items.Insert(0, string.Empty);

        //    }
        //}

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("t7sel.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
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
            string q = @"select * from clinic_reception it join patient_history on it.id=patient_history.details_id where patient_history.confirm_calc='true' and  datenow >= '" + aa + "' and datenow <= '" + bb + "'  ORDER  BY clinic_id  ";
            string cr = "CReport/ClinicRecR.rpt";
            Session["query"] = q;
            Session["cr"] = cr;


            Response.Redirect("~/report.aspx");
        }



        protected void txt_price_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != "" && doc_txt.Text != "" && hos_txt.Text != "")
            {
                double p = double.Parse(txt_price.Value);


                double tot = p;

                doc_txt.Text = (tot / 2).ToString();
                hos_txt.Text = (tot / 2).ToString();



            }
        }

        protected void hos_txt_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != "" && doc_txt.Text != "" && hos_txt.Text != "")
            {
                double d = double.Parse(doc_txt.Text);
                double h = double.Parse(hos_txt.Text);
                double t = double.Parse(txt_price.Value);

                doc_txt.Text = (t - h).ToString();
                //hos_txt.Text = (t - d).ToString();

            }

        }

        protected void doc_txt_TextChanged(object sender, EventArgs e)
        {
            if (txt_price.Value != "" && doc_txt.Text != "" && hos_txt.Text != "")
            {
                double d = double.Parse(doc_txt.Text);
                double h = double.Parse(hos_txt.Text);
                double t = double.Parse(txt_price.Value);

                // doc_txt.Text = (t - h).ToString();
                hos_txt.Text = (t - d).ToString();

            }
        }
    }
}