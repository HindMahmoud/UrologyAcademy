using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.Saavee
{
    public partial class rad_reserv : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (db.labb.Any())
                {
                    var cr = (from d in db.rad select d).ToList();
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
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }



            }




        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);

                if (db.rad_history.Any(a => a.id == p.details_id))
                    {
                    rad_history p2 = db.rad_history.Where(a => a.id == p.details_id).FirstOrDefault();

                    db.rad_history.Remove(p2);
                    db.SaveChanges();
                }
                if (db.savee.Any(a => a.type == "أشعه" && a.item_id == x))
                {
                    savee sss = db.savee.Where(a => a.type == "أشعه" && a.item_id == x).FirstOrDefault();
                    sss.del = true;
                    db.SaveChanges();
                }
                db.patient_history.Remove(p);


                db.SaveChanges();

               
                success_m.Visible = true;
            }

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("rad_reserv.aspx");

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
            else if (ddl_lab.SelectedValue == "")
            {
                MsgBox("ادخل اسم الأشعه", this.Page, this);

            }
            else if (txt_price.Value == "")
            {
                MsgBox("ادخل سعر الأشعه", this.Page, this);

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

                
                    rad_history lp = new rad_history
                    {
                        p_id = int.Parse(txt_code.Text),
                        p_name = patientlist.SelectedItem.ToString(),
                        price = float.Parse(txt_price.Value),
                        date = DateTime.Now,
                        rad_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                        rad_name = ddl_lab.SelectedItem.ToString(),
                        status = false,
                        del = false,
                        user_name = uname,
                        user_id = uid

                    };
                    db.rad_history.Add(lp);
                    db.SaveChanges();

                    var max_id = (from j in db.lab_history select j.id).Max();
                    patient_history p = new patient_history
                    {
                        p_id = int.Parse(txt_code.Text),
                        p_name = patientlist.SelectedItem.ToString(),
                        price = float.Parse(txt_price.Value),
                        date = DateTime.Now,
                        service_id = int.Parse(ddl_lab.SelectedValue.ToString()),
                        service_name = ddl_lab.SelectedItem.ToString(),
                        type = "أشعه",
                        details_id = max_id,
                        check_out = false
                    };
                    db.patient_history.Add(p);
                    db.SaveChanges();
                var max_id2 = (from j in db.patient_history select j.id).Max();

                savee s = new savee
                {
                    p_id = int.Parse(txt_code.Text),
                    title = ddl_lab.SelectedItem.ToString(),
                    in_value = double.Parse(txt_price.Value),
                    out_value = 0,
                    date = DateTime.Now,
                    type = "أشعه",
                    notes = "سداد  حساب  للمريض" + " " + patientlist.SelectedItem.ToString(),
                    del = false,
                    user_id = uid,
                    user_name = uname,
                    item_id = max_id2

                };
                db.savee.Add(s);
                db.SaveChanges();
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


        protected void txt_code_TextChanged(object sender, EventArgs e)
        {
            if (txt_code.Text != "")
            {

                int id = int.Parse(txt_code.Text);
                if (db.patient.Any(a => a.id == id))
                {

                    patient s = db.patient.FirstOrDefault(a => a.id == id);




                    patientlist.ClearSelection();
                    patientlist.Items.FindByValue(s.id.ToString()).Selected = true;

                    patientlist_SelectedIndexChanged(sender, e);
                }
            }



        }

        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (patientlist.Text != "")
            {
                int id = int.Parse(patientlist.SelectedValue.ToString());
                patient st = db.patient.FirstOrDefault(a => a.id == id);
                txt_code.Text = st.id.ToString();

                // Response.Redirect("dr_rad.aspx?p_id=" + id);


            }

        }

        protected void ddl_lab_TextChanged(object sender, EventArgs e)
        {
            int s = 0;
            if (ddl_lab.Text != null)
            {
                s = int.Parse(ddl_lab.SelectedValue.ToString());
                if (db.rad.Any(a => a.id == s))
                {
                    EccoHospital.Models.rad pt = db.rad.FirstOrDefault(a => a.id == s);
                    txt_price.Value = pt.price.ToString();
                    txt_price.Disabled = true;

                }

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (name1.Text != "")
            {
                patient p = new patient
                {
                    name = name1.Text,
                    age = age.Text,
                    phone = mob.Text,
                    nationalty = nationalty.Text,
                    address = address.Text,
                    government = gov.SelectedItem.ToString(),
                    type = type.Text,
                    city = city.Text,
                    job = job.Text,
                    social_state = social.SelectedItem.ToString(),
                    ssi = ssi_st.Text,
                    gender = gender.Text
                };
                db.patient.Add(p);
                db.SaveChanges();
                // message.Visible = true;
                Response.Redirect("rad_reserv.aspx");
            }
        }
    }
}