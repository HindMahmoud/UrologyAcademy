using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Saavee
{
    public partial class saveCollection : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                //if (db.blood_bank.Any())
                //{
                //    var cr = (from d in db.blood_bank select d).ToList();
                //    ddlblood.DataSource = cr;
                //    ddlblood.DataTextField = "name";
                //    ddlblood.DataValueField = "id";
                //    ddlblood.DataBind();
                //    ddlblood.Items.Insert(0, string.Empty);
                //}
                //if (db.labb.Any())
                //{
                //    var cr = (from d in db.labb select d).ToList();
                //    ddl_lab.DataSource = cr;
                //    ddl_lab.DataTextField = "name";
                //    ddl_lab.DataValueField = "id";
                //    ddl_lab.DataBind();
                //    ddl_lab.Items.Insert(0, string.Empty);
                //}
                //if (db.rad.Any())
                //{
                //    var cr = (from d in db.rad select d).ToList();
                //    ddl_rad.DataSource = cr;
                //    ddl_rad.DataTextField = "name";
                //    ddl_rad.DataValueField = "id";
                //    ddl_rad.DataBind();
                //    ddl_rad.Items.Insert(0, string.Empty);
                //}
                //if (db.service.Any(a=>a.dep_name=="استقبال"))
                //{
                //    var cr = (from d in db.service where d.dep_name == "استقبال" select d).ToList();
                //    ddl_servic.DataSource = cr;
                //    ddl_servic.DataTextField = "name";
                //    ddl_servic.DataValueField = "id";
                //    ddl_servic.DataBind();
                //    ddl_servic.Items.Insert(0, string.Empty);
                //}

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
                {

                    int xx = int.Parse(Request.QueryString["t_id"].ToString());
                    ticket_out tt = db.ticket_out.FirstOrDefault(a => a.code == xx);
                    var p = db.patient_history.Where(a => a.p_id == tt.patient_id &&  a.check_out == false ).ToList();
                    totallbl.Text = p.Sum(A => A.price).ToString();
                    txt_dis.Text = "0";
                    txt_dis_TextChanged(sender, e);
                }



                }


        }

       

       
        /// <summary>
        
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btn_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
            {

                int x = int.Parse(Request.QueryString["t_id"].ToString());
                EccoHospital.Models.ticket_out pp = db.ticket_out.FirstOrDefault(a => a.code == x);
                int? p_id = null;
                string p_name = null;
                if(pp!=null)
                {
                    p_id = int.Parse(pp.patient_id.ToString());
                    p_name = pp.patient_name.ToString();
                }
                
                if ( ddl_servic.SelectedValue=="" && ddlblood.SelectedValue=="")
                {
                    MsgBox("ادخل اسم الخدمه", this.Page, this);

                }
               

                else
                {
                    int? serv_id = null;
                    string service_name = null;

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

                    //if (ddl_lab.SelectedValue != "")
                    //{
                    //    serv_id = int.Parse(ddl_lab.SelectedValue.ToString());
                    //    service_name = ddl_lab.SelectedItem.ToString();
                        
                    //    labb lab = db.labb.FirstOrDefault(a => a.id == serv_id);

                    //    lab_history lp = new lab_history
                    //    {
                    //        ticketId = x,
                    //        p_id = p_id,
                    //        p_name = p_name,
                    //        price = double.Parse(lab.price.ToString()),
                    //        date = DateTime.Now,
                    //        lab_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                    //        lab_name = ddl_lab.SelectedItem.ToString(),
                    //        status = false,
                    //        del = false,
                    //        user_name = uname,
                    //        user_id = uid,


                    //    };
                    //    db.lab_history.Add(lp);
                    //    db.SaveChanges();

                    //    var max_id = (from j in db.lab_history select j.id).Max();
                    //    patient_history p = new patient_history
                    //    {
                    //        ticketId=x,
                    //        p_id = p_id,
                    //        p_name = p_name,
                    //        price = double.Parse(lab.price.ToString()),

                    //        date = DateTime.Now,
                    //        service_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                    //        service_name = ddl_lab.SelectedItem.ToString(),
                    //        type = "تحاليل",
                    //        details_id = max_id,
                    //        check_out = false,
                    //        ticket_type="out"
                    //    };
                    //    db.patient_history.Add(p);
                    //    db.SaveChanges();

                    //}
                    //else if (ddl_rad.SelectedValue != "")
                    //{
                    //    serv_id = int.Parse(ddl_rad.SelectedValue.ToString());
                    //    service_name = ddl_rad.SelectedItem.ToString();



                      

                    //    var raddd = db.rad.FirstOrDefault(a => a.id == serv_id);

                    //    rad_history lp = new rad_history
                    //    {
                    //        ticketId = x,
                    //        p_id = p_id,
                    //        p_name = p_name,
                    //        price = double.Parse(raddd.price.ToString()),
                    //        date = DateTime.Now,
                    //        rad_id = serv_id,
                    //        rad_name = service_name,
                    //        status = false,
                    //        del = false,
                    //        user_name = uname,
                    //        user_id = uid,


                    //    };
                    //    db.rad_history.Add(lp);
                    //    db.SaveChanges();

                    //    var max_id = (from j in db.rad_history select j.id).Max();
                    //    patient_history p = new patient_history
                    //    {
                    //        ticketId = x,
                    //        p_id = p_id,
                    //        p_name = p_name,
                    //        price = double.Parse(raddd.price.ToString()),

                    //        date = DateTime.Now,
                    //        service_id = int.Parse(ddl_rad.SelectedValue.ToString()),
                    //        service_name = ddl_rad.SelectedItem.ToString(),
                    //        type = "أشعه",
                    //        details_id = max_id,
                    //        check_out = false,
                    //        ticket_type = "out"
                    //    };
                    //    db.patient_history.Add(p);
                    //    db.SaveChanges();




                    //}
                    if (ddl_servic.SelectedValue != "")
                    {
                        serv_id = int.Parse(ddl_servic.SelectedValue.ToString());
                        service_name = ddl_servic.SelectedItem.ToString();
                        service ser = db.service.FirstOrDefault(a => a.id == serv_id);
                        patient_history p = new patient_history
                        {
                            //ticketId = x,
                            p_id = p_id,
                            p_name = p_name,
                            price = double.Parse(ser.price.ToString()),

                            date = DateTime.Now,
                            service_id = serv_id,
                            service_name = service_name,
                            type = "خدمات",
                         
                            check_out = false,
                            //ticket_type = "out"
                        };
                        db.patient_history.Add(p);
                        db.SaveChanges();




                    }
                    //else if(ddlblood.SelectedValue != "")
                    //{
                    //    serv_id = int.Parse(ddlblood.SelectedValue.ToString());
                    //    service_name = ddlblood.SelectedItem.ToString();
                    //    blood_bank ser = db.blood_bank.FirstOrDefault(a => a.id == serv_id);
                    //    patient_history p = new patient_history
                    //    {
                    //        //ticketId = x,
                    //        p_id = p_id,
                    //        p_name = p_name,
                    //        price = double.Parse(ser.price.ToString()),

                    //        date = DateTime.Now,
                    //        service_id = serv_id,
                    //        service_name = service_name,
                    //        type = "بنك الدم",

                    //        check_out = false,
                    //        //ticket_type = "out"
                    //    };
                    //    db.patient_history.Add(p);
                    //    db.SaveChanges();

                    //}





                        var max_id2 = (from j in db.patient_history select j.id).Max();

                    //savee s = new savee
                    //{
                    //    p_id = int.Parse(txt_code.Text),
                    //    title = ddl_lab.SelectedItem.ToString(),
                    //    in_value = double.Parse(txt_price.Value),
                    //    out_value = 0,
                    //    date = DateTime.Now,
                    //    type = "تحاليل",
                    //    notes = "سداد  حساب  للمريض" + " " + patientlist.SelectedItem.ToString(),
                    //    del = false,
                    //    user_id = uid,
                    //    user_name = uname,
                    //    item_id = max_id2

                    //};
                    //db.savee.Add(s);
                    //db.SaveChanges();

                    //var max = (from f in db.savee select f.id).Max();

                    //string q = @"select * from savee s join patient p on s.p_id=p.id where s.id=" + max + " ";
                    //string cr = "CReport/patientPayR.rpt";
                    //Session["query"] = q;
                    //Session["cr"] = cr;


                    Response.Redirect("saveCollection.aspx?t_id="+x);
                   


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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["t_id"])))
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
                int x = int.Parse(Request.QueryString["t_id"].ToString());
                ticket_out tt = db.ticket_out.FirstOrDefault(a => a.code == x);

                EccoHospital.Models.patient pp = db.patient.FirstOrDefault(a => a.id == tt.patient_id);
                int? p_id = null;
                string p_name = null;
                if (pp != null)
                {
                    p_id = int.Parse(pp.id.ToString());
                    p_name = pp.name.ToString();
                }

                var px = db.patient_history.Where(a => a.p_id == p_id &&  a.check_out == false ).ToList();

                string title = "";
                foreach(var item in px)
                {
                    if(px.Last()==item)
                    {
                        title += item.service_name.ToString();
                    }
                    else
                    {
                        title += item.service_name.ToString() + " , ";

                    }
                }
               int t= px.Max(c => c.id);
                savee s = new savee
                {
                    ticketId=x,
                    p_id = p_id,
                    title =title,
                    in_value = double.Parse(txt_total2.Text),
                    out_value = 0,
                    date = DateTime.Now,
                    type = "خارجي",
                    notes = "سداد  حساب   للمريض" + " " +p_name,
                    del = false,
                    user_id = uid,
                    user_name = uname,
                    item_id = t,
                    disc=double.Parse(txt_dis.Text)

                };
                db.savee.Add(s);
                db.SaveChanges();
                tt.flag = false;
                db.SaveChanges();
                var ppp = db.patient_history.Where(a => a.p_id == p_id &&  a.check_out == false ).ToList();
                
                ppp.ForEach(a => a.check_out = true);
                db.SaveChanges();
                ppp.ForEach(a => a.confirm_calc = true);
                ppp.ForEach(a => a.hos_value = s.in_value / 2);
                ppp.ForEach(a => a.doc_value = s.in_value / 2);
                db.SaveChanges();
                var max = (from f in db.savee select f.id).Max();

                string q = @"select p.ticketId,p.p_name,p.date,p.type,p.service_name,p.price,s.id,s.user_name,s.in_value,s.balance,s.disc from patient_history p join savee s
on p.p_id=s.p_id

 where  s.id=" + max + " and p.ticketId=" + x+ " and p.ticket_type='out'  ";
                string cr = "CReport/outerR.rpt";
                Session["query"] = q;
                Session["cr"] = cr;
              // Server.Transfer("~/report.aspx");
                Response.Redirect("~/report.aspx");
              
            }
        }

        protected void txt_dis_TextChanged(object sender, EventArgs e)
        {
            if(totallbl.Text!=""&& txt_dis.Text!="")
            {
                double a = double.Parse(txt_dis.Text);
                double b = double.Parse(totallbl.Text);

                //double z = (b-a);
                double zz = b - a;
                txt_total2.Text = zz.ToString();
            }
        }
    }
}