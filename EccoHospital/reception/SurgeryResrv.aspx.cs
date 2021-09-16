using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.reception
{
    public partial class SurgeryResrv : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                periodtxt.Text = "0";
                if (db.surgery_doctors.Any(s => s.surgery_type == "surgeon"))
                {
                    var cr = (from n in db.surgery_doctors where n.surgery_type == "surgeon" select n).ToList();
                    surgeonddl.DataSource = cr;
                    surgeonddl.DataTextField = "name";
                    surgeonddl.DataValueField = "id";
                    surgeonddl.DataBind();
                    surgeonddl.Items.Insert(0, string.Empty);
                }
                if (db.surgery_doctors.Any(s => s.surgery_type == "Nurse"))
                {
                    var cr = (from n in db.surgery_doctors  where n.surgery_type == "Nurse"  select n).ToList();
                    nurseryddl.DataSource = cr;
                    nurseryddl.DataTextField = "name";
                    nurseryddl.DataValueField = "id";
                    nurseryddl.DataBind();
                    nurseryddl.Items.Insert(0, string.Empty);
                }
                if (db.surgery_doctors.Any(s => s.surgery_type == "assistant"))
                {
                    var cr = (from n in db.surgery_doctors where n.surgery_type == "assistant" select n).ToList();
                    assddl.DataSource = cr;
                    assddl.DataTextField = "name";
                    assddl.DataValueField = "id";
                    assddl.DataBind();
                    assddl.Items.Insert(0, string.Empty);
                }
            }


        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["p_id"]))
            {
                string nameasstxt = nameAss.Text;
                string namenursetxt = nameNurs.Text, namesurgeontxt = name.Text;
                if (intro.SelectedValue == "")
                {
                    Response.Write("<script>alert('Choose Anaestuesia')</script>");
                }
               else if (RadioButtonList1.SelectedValue == "")
                {
                    Response.Write("<script>alert('Choose Type of surgery')</script>");
                }
                else if (datee.Text == "")
                {
                    Response.Write("<script>alert('Enter date ')</script>");
                }
                else if (surgeonddl.SelectedValue == ""&&name.Text=="")
                {
                    Response.Write("<script>alert('Enter name of surgeon ')</script>");
                }
                else if (assddl.SelectedValue == "" && nameAss.Text == "")
                {
                    Response.Write("<script>alert('Enter name of assistant ')</script>");
                }
                else if (nurseryddl.SelectedValue == "" && nameNurs.Text == "")
                {
                    Response.Write("<script>alert('Enter name of nurse ')</script>");
                }
                else {
                    int userid = 0;string uname = "";
                    if (Session["user_id"] != null&&Session["user"]!=null)
                    {
                        userid = int.Parse(Session["user_id"].ToString());
                        uname = Session["user"].ToString();
                    }
                    if (assddl.SelectedValue != "")
                    {
                        nameasstxt = assddl.SelectedItem.ToString();
                    }
                   
                    if (surgeonddl.SelectedValue != "")
                    {
                        namesurgeontxt = surgeonddl.SelectedItem.ToString();
                    }
                    if (nurseryddl.SelectedValue != "")
                    {
                        namenursetxt = nurseryddl.SelectedItem.ToString();
                    }
                    
                    bool ch1 = false, ch2 = false, ch3 = false, ch4 = false, ch5 = false, ch6 = false, ch7 = false, ch8 = false, ch9 = false, ch10 = false, ch12 = false, ch11 = false,ch13=false,ch14=false;
                    if (Krch.Checked)
                    {
                        ch1 = true;
                    }
                    if (Klch.Checked)
                    {
                        ch2 = true;
                    }
                    if (Urch.Checked) { ch3 = true; }
                    if (Ulch.Checked) { ch4 = true; }
                    if (Brch.Checked) { ch5 = true; }
                    if (Blch.Checked) { ch6 = true; }
                    if (Prch.Checked) { ch7 = true; }
                    if (Plch.Checked) { ch8 = true; }
                    if (Trch.Checked) { ch9 = true; }
                    if (tlch.Checked) { ch10 = true; }
                    if (Srch.Checked) { ch11 = true; }
                    if (Slch.Checked) { ch12 = true; }
                    if (Perch.Checked) { ch13 = true; }
                    if (Pelch.Checked) { ch14 = true; }
                    int p_idd = int.Parse(Request.QueryString["p_id"]);
                    var pname = (from y in db.patient where y.id == p_idd select y.name).FirstOrDefault();
                    Surgery_history s = new Surgery_history
                    {
                        p_id = p_idd,
                        p_name = pname,
                        Diagnosis = diagnosis.Text,
                        date = Convert.ToDateTime(datee.Text),
                        period = int.Parse(periodtxt.Text),
                        Anaestusia = intro.SelectedItem.Text,
                        TypeSurg=RadioButtonList1.SelectedItem.Text,
                        assistant_name=nameasstxt,
                        surgeon_name=namesurgeontxt,
                        Nursery_name=namenursetxt,
                        
                        otherSurg = sugnotes.Text,
                        user_id=userid,
                        user_name=uname,
                    };
                    db.Surgery_history.Add(s);
                    db.SaveChanges();
                    var maxsiteid = (from u in db.Surgery_history select u.id).Max();
                    sites ss = new sites{
                        surg_id=maxsiteid,
                        kindlyRt=ch1,
                        kindlylt=ch2,
                        UreterRt=ch3,
                        Ureterlt=ch4,
                        BlodderRt=ch5,
                        Blodderlt=ch6,
                        PeuileRt=ch7,
                        Peuilelt=ch8,
                        TestisRt=ch10,
                        Testislt=ch11,
                        scroumRt=ch11,
                        scroumLt=ch12,
                         peqRt = ch13,
                        preLt = ch14,
                    };
                    db.sites.Add(ss);
                    db.SaveChanges();
                    if (nameAss.Text != "")
                    {
                        var ifExists_assistant_name = (from n in db.surgery_doctors where n.surgery_type=="assistant" && n.name == nameAss.Text select n).FirstOrDefault();
                        if (ifExists_assistant_name ==null)
                        {
                            surgery_doctors d = new surgery_doctors
                            {name= nameAss.Text,surgery_type= "assistant" };
                            db.surgery_doctors.Add(d);db.SaveChanges();
                        }
                    }
                    if (nameNurs.Text != "")
                    {
                        var ifExists_nurse = (from n in db.surgery_doctors where n.surgery_type == "Nurse" && n.name == nameAss.Text select n).FirstOrDefault();
                        if (ifExists_nurse == null)
                        {
                            surgery_doctors d = new surgery_doctors
                            { name = nameNurs.Text, surgery_type = "Nurse" };
                            db.surgery_doctors.Add(d); db.SaveChanges();
                        }
                    }
                    if (name.Text != "")
                    {
                        var ifExists_name = (from n in db.surgery_doctors where n.surgery_type == "surgeon" && n.name == name.Text select n).FirstOrDefault();
                        if (ifExists_name == null)
                        {
                            surgery_doctors d = new surgery_doctors
                            { name = name.Text, surgery_type = "surgeon" };
                            db.surgery_doctors.Add(d); db.SaveChanges();
                        }
                    }
                    // Response.Write("<script>alert('surgery is recorded successfully')</script>");
                    Response.Redirect("investigation.aspx?surg_id="+maxsiteid);
                }
            }
        }
    }
}