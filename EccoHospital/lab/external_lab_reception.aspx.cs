using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.lab
{
    public partial class external_lab_reception : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                if (db.doctor.Any())
                {
                    var ddl = (from t in db.doctor select t).ToList();
                    ddldoctors.DataSource = ddl;
                    ddldoctors.DataTextField = "name";
                    ddldoctors.DataValueField = "id";
                    ddldoctors.DataBind();
                    ddldoctors.Items.Insert(0, "");

                }
                if (db.labb.Any())
                {
                    var cr = (from d in db.labb select d).ToList();
                    ddl_lab.DataSource = cr;
                    ddl_lab.DataTextField = "name";
                    ddl_lab.DataValueField = "id";
                    ddl_lab.DataBind();
                    ddl_lab.Items.Insert(0, string.Empty);
                }

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
                    lab_history l = db.lab_history.FirstOrDefault(n=>n.lab_id==f.service_id&&n.p_id==f.p_id); 
                    patientlist.SelectedValue = f.p_id.ToString();
                    ddl_lab.SelectedValue = f.service_id.ToString();
                    txt_code.Text = f.p_id.ToString();
                    priceDis.Value = f.price.ToString();
                    txt_price.Value= l.price.ToString();
                    docName.Value = l.docNmae.ToString();
                    discount.Text = l.discount.ToString();
                    ddldoctors.SelectedValue = f.doc_id.ToString();
                    //tx.Text = f.ticketId.ToString();
                    btn.Text = "تعديل";


                }
                if (!String.IsNullOrEmpty(Request.QueryString["p_id"]) && !String.IsNullOrEmpty(Request.QueryString["p_idedit"]))
                {

                    int x = int.Parse(Request.QueryString["p_idedit"].ToString());

                    EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.details_id == x && a.type == "تحاليل");
                    lab_history l = db.lab_history.FirstOrDefault(n => n.id == f.details_id && n.id == x);
                    // patientlist.SelectedValue = f.p_id.ToString();
                    ddl_lab.SelectedValue = f.service_id.ToString();
                    txt_code.Text = f.p_id.ToString();
                    priceDis.Value = f.price.ToString();
                    txt_price.Value = l.price.ToString();
                    docName.Value = l.docNmae.ToString();
                    discount.Text = l.discount.ToString();
                    ddldoctors.SelectedValue = f.doc_id.ToString();
                    btn.Text = "تعديل";


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
            Response.Redirect("external_lab_reception.aspx");

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
                danger_m.Visible = false;
            }
        }

        protected void print_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {

            if (!String.IsNullOrEmpty(Request.QueryString["p_id"]))
            {
                int pp_id = int.Parse(Request.QueryString["p_id"].ToString());
                string p_namee = (from m in db.patient where m.id == pp_id select m.name).FirstOrDefault();

                if (ddl_lab.SelectedValue == "")
                {
                    MsgBox("ادخل اسم التحليل", this.Page, this);

                }

                if (txt_price.Value == "")
                {
                    MsgBox("ادخل سعر التحليل", this.Page, this);

                }
                if (ddldoctors.SelectedValue == "")
                {
                    MsgBox("اختر الطبيب ", this.Page, this);

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

                    if (btn.Text == "تعديل")
                    {

                        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_idedit"])))
                        {

                            int x = int.Parse(Request.QueryString["p_idedit"].ToString());

                            EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.details_id == x && a.type == "تحاليل");
                            // f.p_id = int.Parse(txt_code.Text);
                            // f.p_name = patientlist.SelectedItem.ToString();
                            f.price = float.Parse(priceDis.Value);
                            f.doc_id = int.Parse(ddldoctors.SelectedValue);
                            f.doc_name = ddldoctors.SelectedItem.ToString();
                            db.SaveChanges();
                            int detial_id = int.Parse(f.details_id.ToString());
                            EccoHospital.Models.lab_history ff = db.lab_history.FirstOrDefault(a => a.id == detial_id);
                            ff.price = double.Parse(txt_price.Value.ToString());
                            ff.docNmae = docName.Value.ToString();
                            ff.discount = float.Parse(discount.Text);
                            ff.lab_name = ddl_lab.SelectedItem.ToString();
                            ff.lab_id = int.Parse(ddl_lab.SelectedValue.ToString());

                            db.SaveChanges();

                            success_m.Visible = true;

                        }

                    }

                    else
                    {

                        int p_id = int.Parse(Request.QueryString["p_id"].ToString());
                        
                        float finalPrice = float.Parse(txt_price.Value) - float.Parse(discount.Text);

                        lab_history lp = new lab_history
                        {

                            p_id = int.Parse(Request.QueryString["p_id"]),
                            p_name = p_namee,
                            price = float.Parse(txt_price.Value),
                            date = DateTime.Now,
                            lab_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                            lab_name = ddl_lab.SelectedItem.ToString(),
                            status = false,
                            del = false,
                            user_name = uname,
                            user_id = uid,
                            docNmae = docName.Value.ToString(),
                            discount = float.Parse(discount.Text),

                         };
                        db.lab_history.Add(lp);
                        db.SaveChanges();

                        var max_id = (from j in db.lab_history select j.id).Max();
                        int iddoctors = int.Parse(ddldoctors.SelectedValue);
                        //var Fdocval = (from f in db.doctor where f.id == iddoctors select f.T_perc).First();
                      
                        //double docprice = (finalPrice/ 100) * double.Parse(Fdocval.ToString());
                        //double hostval = docprice - double.Parse(Fdocval.ToString());
                        patient_history p = new patient_history
                        {

                            p_id = int.Parse(Request.QueryString["p_id"]),
                            p_name = p_namee,
                            price = finalPrice,
                            date = DateTime.Now,
                            service_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                            service_name = ddl_lab.SelectedItem.ToString(),
                            type = "تحاليل",
                            details_id = max_id,
                            doc_id=iddoctors,
                            doc_name=ddldoctors.SelectedItem.ToString(),
                            check_out = false,
                            //doc_value= docprice,
                            user_id = uid,
                            user_name = Session["user"].ToString(),
                            serTypee="تحاليل",
                           //hos_value= hostval


                        };
                        db.patient_history.Add(p);
                        db.SaveChanges();
                        success_m.Visible = true;
                    }

                }


            }
            else
            {
                if (txt_code.Text == "")
                {
                    MsgBox("ادخل كود المريض", this.Page, this);
                }
                if (patientlist.Text == "")
                {
                    MsgBox("ادخل اسم المريض", this.Page, this);
                }
                if (ddl_lab.SelectedValue == "")
                {
                    MsgBox("ادخل اسم التحليل", this.Page, this);

                }
                 if (priceDis.Value == "")
                {
                    MsgBox("ادخل السعر ", this.Page, this);

                }
                if (ddldoctors.SelectedValue == "")
                {
                    MsgBox("اختر الطبيب ", this.Page, this);

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
                   int iddoctors = int.Parse(ddldoctors.SelectedValue);
                    var Fdocval = (from f in db.doctor where f.id == iddoctors select f.T_perc).First();

                    if (btn.Text == "تعديل")
                    {

                        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                        {

                            int x = int.Parse(Request.QueryString["edit"].ToString());

                            EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.id == x);
                            f.p_id = int.Parse(txt_code.Text);
                            f.p_name = patientlist.SelectedItem.ToString();
                            f.price = float.Parse(priceDis.Value);
                            f.service_id = int.Parse(ddl_lab.SelectedValue.ToString());
                            f.doc_id = iddoctors;
                            f.doc_name = ddldoctors.SelectedItem.ToString();
                            f.doc_value = Fdocval;
                            f.service_name= ddl_lab.SelectedItem.ToString();
                            db.SaveChanges();
                            int detial_id = int.Parse(f.details_id.ToString());
                            EccoHospital.Models.lab_history ff = db.lab_history.FirstOrDefault(a => a.id == detial_id);
                            ff.lab_name = ddl_lab.SelectedItem.ToString();
                            ff.lab_id = int.Parse(ddl_lab.SelectedValue.ToString());
                            ff.p_id = int.Parse(txt_code.Text);
                            ff.p_name = patientlist.SelectedItem.ToString();
                            ff.price = float.Parse(txt_price.Value);
                            ff.docNmae = docName.Value.ToString();
                            ff.discount = float.Parse(discount.Text);
                            // ff.ticketId = int.Parse(tx.Text);
                            db.SaveChanges();

                            success_m.Visible = true;

                        }

                    }

                    else
                    {
                        int p_id = int.Parse(patientlist.SelectedValue.ToString());
                        int? t_id = null;
                        

                        float finalPrice = float.Parse(txt_price.Value) - float.Parse(discount.Text);

                        lab_history lp = new lab_history
                        {
                          
                            p_id = int.Parse(patientlist.SelectedValue.ToString()),
                            p_name = patientlist.SelectedItem.ToString(),
                            price = float.Parse(txt_price.Value),
                            date = DateTime.Now,
                            lab_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                            lab_name = ddl_lab.SelectedItem.ToString(),
                            status = false,
                            del = false,
                            user_name = uname,
                            user_id = uid,
                            docNmae = docName.Value.ToString(),
                            discount = float.Parse(discount.Text)

                        };
                        db.lab_history.Add(lp);
                        db.SaveChanges();

                        var max_id = (from j in db.lab_history select j.id).Max();
                        //double docprice = (finalPrice / 100) * double.Parse(Fdocval.ToString());
                        //double hostval = docprice - double.Parse(Fdocval.ToString());
                         patient_history p = new patient_history
                        {

                            p_id = int.Parse(patientlist.SelectedValue.ToString()),
                            p_name = patientlist.SelectedItem.ToString(),
                            price = finalPrice,
                            date = DateTime.Now,
                            service_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                            service_name = ddl_lab.SelectedItem.ToString(),
                            type = "تحاليل",
                            details_id = max_id,
                            check_out = false,
                             user_id = uid,
                             user_name = Session["user"].ToString(),
                            doc_id = int.Parse(ddldoctors.SelectedValue.ToString()),
                            doc_name = ddldoctors.SelectedItem.ToString(),
                            confirm_calc = false,
                          //,doc_value=docprice,
                            serTypee="تحاليل"
                            ,
                             
                             //hos_value = hostval

                        };
                        db.patient_history.Add(p);
                        db.SaveChanges();
                        success_m.Visible = true;
                    }



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



        protected void ddl_lab_TextChanged(object sender, EventArgs e)
        {
            int s = 0;
            if (ddl_lab.Text != null)
            {
                s = int.Parse(ddl_lab.SelectedValue.ToString());
                if (db.labb.Any(a => a.id == s))
                {
                    labb pt = db.labb.FirstOrDefault(a => a.id == s);
                    txt_price.Value = pt.price.ToString();
                    txt_price.Disabled = true;
                    priceDis.Value = txt_price.Value.ToString();

                }

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

                //Response.Redirect("SurgeryResrv.aspx");
            }
        }
        protected void txt_code_TextChanged(object sender, EventArgs e)
        {
            if (txt_code.Text != "")
            {

                int id = int.Parse(txt_code.Text);
                if (db.patient.Any(a => a.id == id ))
                {
         

                    patient s = db.patient.FirstOrDefault(a => a.id == id);
                    if (s != null)
                    {
                        patientlist.ClearSelection();
                        patientlist.Items.FindByValue(s.id.ToString()).Selected = true;

                        patientlist_SelectedIndexChanged(sender, e);
                    }
                }
              
               
            }
        }


        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (patientlist.Text != "")
            {
                int id = int.Parse(patientlist.SelectedValue.ToString());

                patient st = db.patient.FirstOrDefault(a => a.id == id );
                if (st != null)
                {
                    txt_code.Text = st.id.ToString();
                   
                }
               
                // Response.Redirect("dr_rad.aspx?p_id=" + id);


            }

        }



        protected void discount_TextChanged(object sender, EventArgs e)
        {
            if (discount.Text != "" && txt_price.Value != "")
            {
                float a = float.Parse(txt_price.Value);
                float b = float.Parse(discount.Text);
                float d = (a- b);
                priceDis.Value = d.ToString();

            }

        }
    }
}