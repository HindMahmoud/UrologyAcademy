using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.reception
{
    public partial class patprofile : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = int.Parse(Request.QueryString["patid"].ToString());
            
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["delRec"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }
            }
           
            if((db.past_History.Any(a => a.patient_id == id)) && (db.Family_history.Any(a => a.patientId == id)))
            {

                var pastHistory = (from s in db.past_History where s.patient_id == id select s).FirstOrDefault();
                var familyHistory = (from s in db.Family_history where s.patientId == id select s).FirstOrDefault();
                //var result = ((IEnumerable)familyHistory).Cast<object>().ToList();
                bool ch1 = false, ch2 = false, ch3 = false, ch4 = false, ch5 = false, ch6 = false, ch7 = false, ch8 = false, ch9 = false, ch10 = false;
                /*     All pastHistory CheckBoxes and other TextBox   */
                if (pastHistory.smorokus == true)
                { PPCh1.Checked = true; }
                if (pastHistory.stones==true)
                {
                    PPCh2.Checked = true;
                }
                if (pastHistory.operatient == true)
                { PPCh3.Checked = true; }
                if (pastHistory.Traunua == true)
                {
                    PPCh4.Checked = true;
                }
                if (pastHistory.TB == true)
                { PPCh5.Checked = true; }
                if (pastHistory.Diabetes == true)
                {
                    PPCh6.Checked = true;
                }
                if (pastHistory.Hypenteus == true)
                { PPCh7.Checked = true; }
                if (pastHistory.cancer == true)
                {
                    PPCh8.Checked = true;
                }
                if (pastHistory.Ischluic_ttt == true)
                {
                    PPch9.Checked = true;
                }
                if (pastHistory.Astiua == true)
                { PPch10.Checked = true; }
                if (pastHistory.candiac_Stuiet == true)
                {
                    PPch11.Checked = true;
                }
                #region v
                //PPCh1.Checked = bool.Parse(pastHistory.smorokus.ToString());  // Smookus
                //PPCh2.Checked = bool.Parse(pastHistory.stones.ToString());  // Stones
                //PPCh3.Checked = bool.Parse(pastHistory.operatient.ToString()); //Operations
                //PPCh4.Checked = bool.Parse(pastHistory.Traunua.ToString());  //Traunua
                //PPCh5.Checked = bool.Parse(pastHistory.TB.ToString()); //TB
                //PPCh6.Checked = bool.Parse(pastHistory.Diabetes.ToString());// Diabetes
                //PPCh7.Checked = bool.Parse(pastHistory.Hypenteus.ToString()); // Hypenteusion
                //PPCh8.Checked = bool.Parse(pastHistory.cancer.ToString()); //cancer
                //PPch9.Checked = bool.Parse(pastHistory.Ischluic_ttt.ToString()); //Ischluic_ttt
                //PPch10.Checked = bool.Parse(pastHistory.Astiua.ToString());  //Astiua
                //PPch11.Checked = bool.Parse(pastHistory.candiac_Stuiet.ToString()); //candiac_Stuiet
                #endregion
                posttxt.Text = pastHistory.others.ToString();

                /*     All familyHistory CheckBoxes  and other TextBox */
                if (familyHistory.Diabets==true)
                { FFch1.Checked = true; }
                if (familyHistory.Hypiteusini == true)
                { FFch2.Checked = true; }
                if (familyHistory.coucel==true)
                { FFch3.Checked = true; }
                if (familyHistory.coucer_prostat==true)
                { FFch4.Checked = true; }
                if (familyHistory.statues==true)
                { FFch5.Checked = true; }
                if (familyHistory.Medical_equal_diseases==true)
                { FFch6.Checked = true; }
               
                //FFch1.Checked = bool.Parse(familyHistory.Diabets.ToString());  // Diabetes
                //FFch2.Checked = bool.Parse(familyHistory.Hypiteusini.ToString());  // Hypeiteusini
                //FFch3.Checked = bool.Parse(familyHistory.coucel.ToString()); //coucer
                //FFch4.Checked = bool.Parse(familyHistory.coucer_prostat.ToString());  //coucer prosta
                //FFch5.Checked = bool.Parse(familyHistory.statues.ToString()); //stahttp://localhost:43620/reception/SurgeryResrv.aspx.designer.cstues
                //FFch6.Checked = bool.Parse(familyHistory.Medical_equal_diseases.ToString());// Medical_equal_diseases
                //Familytxt.Text = familyHistory.other.ToString();
                btnSave.Enabled = false;
                div11.Attributes.Add("class", "some-class");
                FFch1.Enabled = FFch2.Enabled = FFch3.Enabled = FFch4.Enabled = FFch5.Enabled = FFch6.Enabled = false;
                PPCh1.Enabled = PPCh2.Enabled = PPCh3.Enabled = PPCh4.Enabled = PPCh5.Enabled = PPCh6.Enabled = PPCh7.Enabled = PPCh8.Enabled = PPch9.Enabled = PPch10.Enabled = PPch11.Enabled = false;
               

               
            }
            var tpatient = (from n in db.patient where n.id == id select n).FirstOrDefault();
            if (tpatient != null&&tpatient.husband=="Done")
            {
                plusee.Text = tpatient.plus;
                preg.Text = tpatient.pregnancy;
                rep.Text = tpatient.Respiral;
                bp.Text = tpatient.BR1;
                bp2.Text = tpatient.BR2;
                diab.Text = tpatient.Diabetes;
                diactxt.Text = tpatient.diac;
                kg.Text = tpatient.weight;
                temptxt.Text = tpatient.Temp;
                asthmatxt.Text = tpatient.Asthma;
                hep.Text = tpatient.hepatitis;
                Button1.Visible = false;
            }
            if (!String.IsNullOrEmpty(Request.QueryString["removes"]))
            {
                int r = int.Parse(Request.QueryString["removes"]);
                Surgery_history t = (from n in db.Surgery_history where n.id == r select n).FirstOrDefault();
                int patid = int.Parse(t.p_id.ToString());
                db.Surgery_history.Remove(t);
                db.SaveChanges();
                Response.Redirect("patprofile.aspx?patid=" + patid);

            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["delRec"])))
            {  danger_m.Visible = false;
                Div2.Visible = false;
                Div1.Visible = false;
                int x = int.Parse(Request.QueryString["id"]);
                var patid = (from t in db.clinic_reception where t.id == x select t.patient_id).FirstOrDefault();
                Response.Redirect("patprofile.aspx?patid=" +patid);
            }
            
        }
        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["delRec"])))
            {

                int x = int.Parse(Request.QueryString["delRec"].ToString());

                clinic_reception p = db.clinic_reception.FirstOrDefault(a => a.id == x);
                patient_history p2 = db.patient_history.Where(a => a.details_id == p.id).FirstOrDefault();
                if (p != null)
                {
                    db.clinic_reception.Remove(p);
                    db.SaveChanges();
                }
                if (p2 != null)
                {
                    db.patient_history.Remove(p2);
                    db.SaveChanges();
                }

                danger_m.Visible = false;
                Div2.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int c= int.Parse(Request.QueryString["patid"].ToString());
            if (!(db.past_History.Any(a => a.patient_id == c)) && !(db.Family_history.Any(a => a.patientId == c)))
            { var name = (from b in db.patient where b.id == c select b.name).FirstOrDefault();
                bool Fch1 = false, Fch2 = false, Fch3 = false, Fch4 = false, Fch5 = false,
                    Fch6=false, Pch1 = false, Pch2 = false, Pch3 = false, Pch4 = false, Pch5 = false, Pch6 = false, 
                    Pch7 = false, Pch8 = false, Pch9=false,pch10=false,Pch11=false;
                //List<ListItem> check = CheckBox.DisabledCssClass.Cast<ListItem>().Where(a => a.Selected).ToList();
                
                if (FFch1.Checked)
                { Fch1 = true; }
                if (FFch2.Checked)
                { Fch2 = true; }
                if (FFch3.Checked)
                { Fch3 = true; }
                if (FFch4.Checked)
                { Fch4 = true; }
                if (FFch5.Checked)
                { Fch5 = true; }
                if (FFch6.Checked)
                { Fch6 = true; }
                if (PPCh1.Checked)
                { Pch1 = true; }
                if (PPCh2.Checked)
                { Pch2 = true; }
                if (PPCh3.Checked)
                { Pch3 = true; }
                if (PPCh4.Checked)
                { Pch4 = true; }
                if (PPCh5.Checked)
                { Pch5 = true; }
                if (PPCh6.Checked)
                { Pch6 = true; }
                if (PPCh7.Checked)
                { Pch7 = true; }
                if (PPCh8.Checked)
                { Pch8 = true; }
                if (PPch9.Checked)
                { Pch9 = true; }
                if (PPch10.Checked)
                { pch10 = true; }
                if (PPch11.Checked)
                { Pch11 = true; }

                past_History p = new past_History {
                    patient_id = c,
                    patient_name = name,
                    smorokus=Pch1,
                    stones=Pch2,
                    operatient=Pch3,
                    Traunua=Pch4,
                    TB=Pch5,
                    Diabetes=Pch6,
                    Hypenteus=Pch7,
                    cancer=Pch8,
                    Ischluic_ttt=Pch9,
                    Astiua=pch10,
                    candiac_Stuiet=Pch11,
                    others= posttxt.Text

                };
                db.past_History.Add(p);
                db.SaveChanges();
               // var maxx = (from o in db.past_History select o.id).Max();
               // var t = (from uu in db.past_History  where uu.id==maxx select uu).FirstOrDefault();
                //foreach (ListItem u in CheckBoxList1.Items)
                //{
                //    if (u.Selected)
                //    {
                //       u.Value  = true;
                //        db.SaveChanges();
                //    }
                //}

                Family_history Fp = new Family_history
                {
                    patientId = c,
                    patient_name = name,
                    Diabets=Fch1,
                    Hypiteusini=Fch2,
                    coucel=Fch3,
                    coucer_prostat=Fch4,
                    statues=Fch5,
                    Medical_equal_diseases=Fch6,
                    other=Familytxt.Text

                };
                db.Family_history.Add(Fp);
                db.SaveChanges();
                Response.Redirect("patprofile.aspx?patid=" + c);
                //var maxxx = (from o in db.Family_history select o.id).Max();
                //foreach (ListItem u in CheckBoxList2.Items)
                //{
                //    if (u.Selected)
                //    {
                //        u.Selected = true;
                //        db.SaveChanges();
                //    }
                //}

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["patid"]))
            {
                int pat = int.Parse(Request.QueryString["patid"]);
                var tpat = (from v in db.patient where v.id == pat select v).FirstOrDefault();
                tpat.Temp = temptxt.Text;
                tpat.plus = plusee.Text;
                tpat.weight = kg.Text;
                tpat.BR1 = bp.Text;
                tpat.BR2 = bp2.Text;
                tpat.Diabetes = diab.Text;
                tpat.diac = diactxt.Text;
                tpat.hepatitis = hep.Text;
                tpat.Asthma = asthmatxt.Text;
                tpat.pregnancy = preg.Text;
                tpat.Respiral = rep.Text;
                tpat.husband = "Done";
                db.SaveChanges();
               // Button1.Text = "Edit";
                Response.Redirect("patprofile.aspx?patid="+tpat.id);

            }
        }
    }
}