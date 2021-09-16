using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.Saavee
{
    public partial class AddTicketSavee : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                funloadpatients();
                if (db.doctor.Any())
                {
                    var a = (from s in db.doctor select s).ToList();

                    doctos.DataSource = a;
                    doctos.DataTextField = "name";
                    doctos.DataValueField = "id";
                    doctos.DataBind();
                    doctos.Items.Insert(0, "");
                }

                if (db.company.Any())
                {
                    var a = (from s in db.company select s).ToList();

                    comps.DataSource = a;
                    comps.DataTextField = "name";
                    comps.DataValueField = "id";
                    comps.DataBind();
                    comps.Items.Insert(0, "");
                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {
                    int x = int.Parse(Request.QueryString["edit"].ToString());
                    var ticketvar = (from t in db.ticket where t.id == x select t).FirstOrDefault();
                    h3.InnerText = "تعديل بيانات تذكرة رقم " + ticketvar.code;
                    Patients.SelectedItem.Text = ticketvar.patient_name;
                    Patients.SelectedValue = ticketvar.patient_id.ToString();
                    type.Text = ticketvar.typeticket;
                    doctos.SelectedItem.Text = ticketvar.doc_name;
                    doctos.SelectedValue = ticketvar.doc_id.ToString();
                    if (ticketvar.Company_id == 0)
                    {
                        r2.Checked = true;
                    }
                    else
                    {
                        r1.Checked = true;
                        comps.Enabled = true;
                        var com = (from v in db.company where v.id == ticketvar.Company_id select v).FirstOrDefault();
                        comps.SelectedValue = com.id.ToString();
                        comps.SelectedItem.Text = com.name;
                    }
                    if (ticketvar.Rel_id != 0)
                    {
                        var relat = (from m in db.Rel_patient join ti in db.ticket on m.id equals ti.Rel_id where ti.Rel_id == ticketvar.Rel_id select m).FirstOrDefault();
                        Rel_name.Text = relat.name;
                        Rel_age.Text = relat.age.ToString();
                        Rel_num.Text = relat.Rel_num.ToString();
                        National_id.Text = relat.national_id.ToString();
                    }
                    saveTicket.Text = "تعديل";

                }


            }
        }

        protected void btnSavepatient_Click(object sender, EventArgs e)
        {

        }


        protected void saveTicket_Click(object sender, EventArgs e)
        {

            if (saveTicket.Text == "تعديل")
            {
                int x = int.Parse(Request.QueryString["edit"].ToString());
                var ti = (from m in db.ticket where m.id == x select m).FirstOrDefault();
                ti.patient_name = Patients.SelectedItem.Text;
                ti.patient_id = int.Parse(Patients.SelectedValue);
                ti.typeticket = type.SelectedItem.Text;
                ti.doc_id = int.Parse(doctos.SelectedValue);
                ti.doc_name = doctos.SelectedItem.Text;
                if (r1.Checked == true)
                {
                    ti.Company_id = int.Parse(comps.SelectedValue);
                }

                if (Rel_name.Text != "")
                {
                    if (ti.Rel_id == 0)
                    {
                        if (String.IsNullOrEmpty(age.Text) && String.IsNullOrEmpty(Rel_num.Text) && String.IsNullOrEmpty(National_id.Text) && String.IsNullOrEmpty(Rel_phone.Text))
                        {
                            Response.Write("<script>alert('برجاء ادخال باقي بيانات المرافق')</script>");
                            return;
                        }
                        else
                        {
                            Rel_patient relpatient = new Rel_patient
                            {
                                name = Rel_name.Text,
                                age = Rel_age.Text,
                                phone = Rel_phone.Text,
                                national_id = National_id.Text,
                                Rel_num = Rel_num.Text,
                                patient_id = ti.patient_id
                            };
                            db.Rel_patient.Add(relpatient);
                            db.SaveChanges();
                            int rel_id = (from d in db.Rel_patient select d.id).Max();
                            ti.Rel_id = rel_id;
                        }
                    }
                    else
                    {
                        var rel = (from r in db.Rel_patient join tin in db.ticket on r.id equals tin.Rel_id where tin.Rel_id == ti.Rel_id select r).FirstOrDefault();
                        rel.name = Rel_name.Text;
                        rel.age = Rel_age.Text;
                        rel.national_id = National_id.Text;
                        rel.Rel_num = Rel_num.Text;
                        ti.RelationType = Rel_num.Text;
                        db.SaveChanges();
                    }

                }
                db.SaveChanges();
                message.Visible = true;
            }
            else
            {
                Label1.Visible = false;
                //if (ticketname.Text == "")
                //{
                //    lblticket.Visible = true;
                //}

                //else
                //{
                //int codee = int.Parse(ticketname.Text);
                //if (db.ticket.Any(d => d.code == codee))
                //{
                //    MsgBox("الكود موجود مسبقا !", this.Page, this);
                //}

                if (Patients.SelectedValue.ToString() == "")
                {
                    LblPat.Visible = true;
                }

                else if (!(r1.Checked || r2.Checked))
                {
                    lbeltype.Visible = true;
                }

                else
                {

                    int pat_id = int.Parse(Patients.SelectedValue.ToString());
                    string pat_name = Convert.ToString(Patients.SelectedItem.ToString());
                    string typepat = type.SelectedItem.ToString();
                    int rel_id = 0;
                    int comp_id = 0;
                    int doc_id = 0;
                    string relationType = "";
                    string docName = "";
                    if (comps.Text != "")
                    {
                        comp_id = int.Parse(comps.SelectedValue.ToString());
                        relationType = "شركة";
                    }
                    else
                    {
                        relationType = "فردي";
                    }
                    if (doctos.Text != "")
                    {
                        doc_id = int.Parse(doctos.SelectedValue);
                        docName = doctos.SelectedItem.ToString();
                    }
                    if (Rel_name.Text != "")
                    {
                        Rel_patient relpatient = new Rel_patient
                        {
                            name = Rel_name.Text,
                            age = Rel_age.Text,
                            phone = Rel_phone.Text,
                            national_id = National_id.Text,
                            Rel_num = Rel_num.Text,
                            patient_id = pat_id
                        };
                        db.Rel_patient.Add(relpatient);
                        db.SaveChanges();
                        rel_id = (from d in db.Rel_patient select d.id).Max();
                    }
                    else { }
                    int? cc;
                    if (db.ticket.Any())
                    {
                        int? cd = (from b in db.ticket select b.code).Max();
                        cc = cd + 1;
                    }
                    else
                    {
                        cc = 1;
                    }

                    ticket ticket = new ticket
                    {
                        patient_id = pat_id,
                        patient_name = pat_name,
                        typeticket = typepat,
                        Date = DateTime.Now,
                        flag = true,
                        user_id = int.Parse(Session["user_id"].ToString()),
                        user_name = Session["user"].ToString(),
                        Rel_id = rel_id,
                        code = cc,
                        del = false,
                        Company_id = comp_id,
                        doc_id = doc_id,
                        doc_name = docName,
                        RelationType = Rel_num.Text

                    };
                    db.ticket.Add(ticket);
                    db.SaveChanges();
                    message.Visible = true;
                    //  Response.Redirect("addTicket.aspx");

                    //}
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

        protected void r1_CheckedChanged(object sender, EventArgs e)
        {
            if (r1.Checked == true)
            {
                comps.Enabled = true;
                Button2.Enabled = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PR/companies.aspx");
        }

        protected void btnSavepatient_Click1(object sender, EventArgs e)
        {
            if (namepat.Text != "")
            {
                patient p = new patient
                {
                    name = namepat.Text,
                    age = age.Text,

                    government = govv.Text,
                    ssi = natPatient.Text,
                    city = m.Text,
                    phone = txtPhone.Text,
                    Mobile=mobiletxt.Text


                };
                db.patient.Add(p);
                db.SaveChanges();
                namepat.Text = natPatient.Text = age.Text = govv.Text = m.Text = "";
                message.Visible = true;
                Label1.Visible = false;
                //Response.Redirect("addTicket.aspx");
            }
            else { Label1.Visible = true; LblPat.Visible = false; }
        }


        public void funloadpatients()
        {
            if (db.patient.Any())
            {
                var a = (from s in db.patient select s).ToList();

                Patients.DataSource = a;
                Patients.DataTextField = "name";
                Patients.DataValueField = "id";
                Patients.DataBind();
                Patients.Items.Insert(0, "");
            }

        }

        protected void Patients_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(Patients.SelectedValue) >= 0)
            {
                LblPat.Visible = false;
            }
        }
    }

}