using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class activate : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int x = 0;
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    x = int.Parse(Request.QueryString["id"].ToString());
                }

                patient p = db.patient.FirstOrDefault(a => a.id == x);
                if (db.activation.Any(a => a.patient_id == x))
                {

                    TextBox1.Visible = false;
                    date2.Visible = true;
                    date2.Enabled = false;
                   // date2.Text = p.activat_date;

                }
                if (db.inject.Any(a => a.patient_id == x))
                {
                    inject inn = db.inject.FirstOrDefault(a => a.patient_id == x);
                    if (inn.proced != null)
                    {
                        PROCED.SelectedValue = inn.proced.ToString();
                    }
                    if (inn.protocol != null)
                    {
                        if (inn.protocol.ToString() != "Short" && inn.protocol.ToString() != "Long")
                        {

                            other.Text = inn.protocol.ToString();
                        }
                        else { Protocol.SelectedValue = inn.protocol.ToString(); }
                    }
                    if (inn.HMG_name != null)
                    {
                        HMG.SelectedValue = inn.HMG_name.ToString();
                    }
                    if (inn.FSH_name != null)
                    {
                        FSH_name.SelectedValue = inn.FSH_name.ToString();
                    }
                    if (inn.agonist != null)
                    {
                        Agonist.SelectedValue = inn.agonist.ToString();
                    }
                    if (inn.antagonist != null)
                    {
                        Antagonist.SelectedValue = inn.antagonist.ToString();
                    }
                    if (inn.semen_source != null)
                    {
                        Semen_source.SelectedValue = inn.semen_source.ToString();
                    }
                    if (inn.Bmi != null)
                    {
                        Bmi.Text = inn.Bmi.ToString();
                    }
                    ///////////////////////////////////////////////////////////////////////
                    if (inn.Fsh != null)
                    {
                        FSH.Text = inn.Fsh.ToString();
                    }
                    if (inn.LH != null)
                    {
                        LH.Text = inn.LH.ToString();
                    }
                    if (inn.PRL != null)
                    {
                        PRL.Text = inn.PRL.ToString();
                    }

                    if (inn.TSH != null)
                    {
                        THS.Text = inn.TSH.ToString();
                    }

                    if (inn.AMH != null)
                    {
                        AMH.Text = inn.AMH.ToString();
                    }

                    if (inn.APHL != null)
                    {
                        APHL.SelectedValue = inn.APHL.ToString();
                    }
                    if (inn.ANA != null)
                    {
                        ANA.SelectedValue = inn.ANA.ToString();
                    }
                    if (inn.ATA != null)
                    {
                        ATA.SelectedValue = inn.ATA.ToString();
                    }

                    if (inn.Rubella != null)
                    {
                        Rubella.SelectedValue = inn.Rubella.ToString();
                    }
                    if (inn.HCV_HBV_AIDS != null)
                    {
                        HCV_HBV_AIDS.Text = inn.HCV_HBV_AIDS.ToString();
                    }
                    /////////////////////////////////////////////////////////////////
                    if (inn.ABO != null)
                    {
                        ABO.Text = inn.ABO.ToString();
                    }
                    if (inn.RH != null)
                    {
                        RH.Text = inn.RH.ToString();
                    }

                    if (inn.HB != null)
                    {
                        HB.Text = inn.HB.ToString();
                    }
                    if (inn.PC != null)
                    {
                        PC.Text = inn.PC.ToString();
                    }
                    if (inn.BT != null)
                    {
                        BT.Text = inn.BT.ToString();
                    }
                    if (inn.CT != null)
                    {
                        CT.Text = inn.CT.ToString();
                    }
                    if (inn.SGOT != null)
                    {
                        SGOT.Text = inn.SGOT.ToString();
                    }
                    if (inn.SGPT != null)
                    {
                        SGPT.Text = inn.SGPT.ToString();
                    }
                    if (inn.UREA != null)
                    {
                        Urea.Text = inn.UREA.ToString();
                    }
                    if (inn.CREATENIN != null)
                    {
                        Createnin.Text = inn.CREATENIN.ToString();
                    }
                    //////////////////////////////////////////////////////
                }
                int item = 0;
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["item"])))
                {
                    item = int.Parse(Request.QueryString["item"].ToString());
                    activation act = db.activation.FirstOrDefault(a => a.id == item && a.patient_id == x);
                    if (act.HMG != null)
                    {
                        HMG2.Text = act.HMG;
                    }
                    if (act.FSH != null)
                    {
                        FSH2.Text = act.FSH;
                    }
                    if (act.RT1 != null)
                    {
                        RT1.Text = act.RT1;
                    }
                    if (act.RT2 != null)
                    {
                        RT2.Text = act.RT2;
                    }
                    if (act.RT3 != null)
                    {
                        RT3.Text = act.RT3;
                    }
                    if (act.RT4 != null)
                    {
                        RT4.Text = act.RT4;
                    }
                    if (act.LT1 != null)
                    {
                        LT1.Text = act.LT1;
                    }
                    if (act.LT2 != null)
                    {
                        LT2.Text = act.LT2;
                    }
                    if (act.LT3 != null)
                    {
                        LT3.Text = act.LT3;
                    }
                    if (act.LT4 != null)
                    {
                        LT4.Text = act.LT4;
                    }
                    if (act.End_thickness != null)
                    {
                        EndThick.Text = act.End_thickness;
                    }
                    if (act.End_pattern != null)
                    {
                        EndPattern.Text = act.End_pattern;
                    }
                    if (act.E2 != null)
                    {
                        E2.Text = act.E2;
                    }
                }
            }
        }

        

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

            int x = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                x = int.Parse(Request.QueryString["id"].ToString());
            }
            if (TextBox1.Text != "")
            {
                DateTime d = Convert.ToDateTime(TextBox1.Text);
                string datee = d.Month.ToString() + "/" + d.Year.ToString();
                if (db.activation.Any(a => a.patient_id == x))
                {


                }
                else
                {
                    patient p = db.patient.FirstOrDefault(a => a.id == x);
                   
                    db.SaveChanges();

                    for (int i = 0; i < 19; i++)
                    {
                        DateTime d2 = d.AddDays(i);
                        string day = (i + 1).ToString();
                        activation v = new activation
                        {
                            patient_id = x,
                            date = d2,
                            day = day
                        };
                        // Mapper.add_patient_actibe(x, d2, day);
                        db.activation.Add(v);
                        db.SaveChanges();
                    }
                    Response.Redirect("activat.aspx?id=" + x);

                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int x = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                x = int.Parse(Request.QueryString["id"].ToString());

                string pro = "";
                if (other.Text != "")
                {

                    pro = other.Text;
                }
                else { pro = Protocol.SelectedValue.ToString(); }
                if (db.inject.Any(a => a.patient_id == x))
                {
                    inject inn = db.inject.FirstOrDefault(a => a.patient_id == x);
                    inn.proced = PROCED.SelectedValue.ToString();
                    inn.protocol = pro;
                    inn.HMG_name = HMG.SelectedValue.ToString();
                    inn.FSH_name = FSH_name.SelectedValue.ToString();
                    inn.agonist = Agonist.SelectedValue.ToString();
                    inn.antagonist = Antagonist.SelectedValue.ToString();
                    inn.semen_source = Semen_source.SelectedValue.ToString();
                    inn.Bmi = Bmi.Text;
                    inn.Fsh = FSH.Text;
                    inn.LH = LH.Text;
                    inn.PRL = PRL.Text;
                    inn.TSH = THS.Text;
                    inn.AMH = AMH.Text;
                    inn.APHL = APHL.SelectedValue.ToString();
                    inn.ANA = ANA.SelectedValue.ToString();
                    inn.ATA = ATA.SelectedValue.ToString();
                    inn.Rubella = Rubella.SelectedValue.ToString();
                    inn.HCV_HBV_AIDS = HCV_HBV_AIDS.Text;
                    inn.ABO = ABO.Text;
                    inn.RH = RH.Text;
                    inn.HB = HB.Text;
                    inn.PC = PC.Text;
                    inn.BT = BT.Text;
                    inn.CT = CT.Text;
                    inn.SGOT = SGOT.Text;
                    inn.SGPT = SGPT.Text;
                    inn.UREA = Urea.Text;
                    inn.CREATENIN = Createnin.Text;




                    db.SaveChanges();
                    Response.Redirect("activate.aspx?id=" + x);
                }
                else
                {
                    inject inn = new inject
                    {
                        patient_id = x,
                        proced = PROCED.SelectedValue.ToString(),
                        protocol = pro,
                        HMG_name = HMG.SelectedValue.ToString(),
                        FSH_name = FSH_name.SelectedValue.ToString(),
                        agonist = Agonist.SelectedValue.ToString(),
                        antagonist = Antagonist.SelectedValue.ToString(),
                        semen_source = Semen_source.SelectedValue.ToString(),
                        Bmi = Bmi.Text,
                        Fsh = FSH.Text,
                        LH = LH.Text,
                        PRL = PRL.Text,
                        TSH = THS.Text,
                        AMH = AMH.Text,
                        APHL = APHL.SelectedValue.ToString(),
                        ANA = ANA.SelectedValue.ToString(),
                        ATA = ATA.SelectedValue.ToString(),
                        Rubella = Rubella.SelectedValue.ToString(),
                        HCV_HBV_AIDS = HCV_HBV_AIDS.Text,
                        ABO = ABO.Text,
                        RH = RH.Text,
                        HB = HB.Text,
                        PC = PC.Text,
                        BT = BT.Text,
                        CT = CT.Text,
                        SGOT = SGOT.Text,
                        SGPT = SGPT.Text,
                        UREA = Urea.Text,
                        CREATENIN = Createnin.Text

                    };
                    //Mapper.addinject(inn);
                    db.inject.Add(inn);
                    db.SaveChanges();
                    Response.Redirect("activat.aspx?id=" + x);
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int x = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                x = int.Parse(Request.QueryString["id"].ToString());
            }
            int item = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["item"])))
            {
                item = int.Parse(Request.QueryString["item"].ToString());
                activation act = db.activation.FirstOrDefault(a => a.id == item && a.patient_id == x);
                act.HMG = HMG2.Text;
                act.FSH = FSH2.Text;
                act.RT1 = RT1.Text;
                act.RT2 = RT2.Text;
                act.RT3 = RT3.Text;
                act.RT4 = RT4.Text;
                act.LT1 = LT1.Text;
                act.LT2 = LT2.Text;
                act.LT3 = LT3.Text;
                act.LT4 = LT4.Text;
                act.End_pattern = EndPattern.Text;
                act.End_thickness = EndThick.Text;
                act.E2 = E2.Text;
                db.SaveChanges();
                Response.Redirect("activat.aspx?id=" + x);

            }
    }
        protected void print_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());
                string q = @"SELECT *
                    FROM activation ac join patient pat on pat.id=ac.patient_id where ac.patient_id=" + x + "";
                string cr = "External Clinics/activationR.rpt";
                Session["query"] = q;

                Session["cr"] = cr;
                Response.Redirect("~/report.aspx");
            }
        }
    }
}