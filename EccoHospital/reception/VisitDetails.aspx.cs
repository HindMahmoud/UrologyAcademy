using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class VisitDetails : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int x = 0;
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["del"])))
                {
                    x = int.Parse(Request.QueryString["del"].ToString());
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                  
                    //status.Text = f.status.ToString();
                    //notes.Text = f.notes.ToString();
                    //blood.Text = f.blood.ToString();
                    

                }
                if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
                {
                    int Recid = int.Parse(Request.QueryString["Recid"]);
                    var recvar = (from n in db.clinic_reception where n.id ==Recid select n).FirstOrDefault();
                    var examin = (from i in db.Exammination where i.Rec_id==Recid select i).FirstOrDefault();
                    if (examin != null)
                    {
                        Button2.Text = "Edit";
                        //if (db.patient_history.Any(s => s.check_out == true&&s.details_id==Recid))
                        //{
                        //    LinkButton1.Enabled = false;
                        //}
                        //etxt1.Text = examin.plus;
                        //etxt2.Text = examin.BR1;
                        //etxt3.Text = examin.BR2;
                        //etxt4.Text = examin.Temp;
                        //etxt5.Text = examin.Respiral;
                        //----eetxt
                        eetxt1.Text =examin.General;
                        eetxt2.Text = examin.Kiduey;
                        eetxt3.Text = examin.uerter;
                        eetxt4.Text = examin.Blodder;
                        eetxt5.Text = examin.oeuis;
                        eetxt6.Text = examin.Ureqra;
                        eetxt7.Text = examin.peruerum;
                        eetxt8.Text = examin.scrotcum;
                        eetxt9.Text = examin.uretiva;
                        eetxt10.Text = examin.P_R;
                        eetxt11.Text = examin.prostate;
                     
                    }
                    if (recvar.status==true)
                    {
                        Button1.Text = "Edit";
                        diag.Text =recvar.Diagnosis;
                        var uutsvar = (from u in db.UTS where u.Rec_id == Recid select u).FirstOrDefault();
                        var lutsvar = (from u in db.LUTS where u.rec_id == Recid select u).FirstOrDefault();
                        var congv = (from u in db.cong_Anthio where u.Rec_id == Recid select u).FirstOrDefault();
                        var postv = (from u in db.post_micturation where u.Rec_id == Recid select u).FirstOrDefault();
                        var otherr = (from u in db.others where u.Rec_id == Recid select u).FirstOrDefault();
                        var edd = (from u in db.ED where u.Rec_id == Recid select u).FirstOrDefault();
                        var emm = (from u in db.Emagercy where u.Rec_id == Recid select u).FirstOrDefault();
                        var vv = (from u in db.Voidues where u.Rec_id == Recid select u).FirstOrDefault();
                        if (uutsvar != null&&recvar.UUTS==true)
                        {compch1.Checked=true;
                           // UUTS.Visible = true;
                            //Page.ClientScript.RegisterStartupScript(this.GetType(), "uutsfun()", "uutsfun()", true);
                            bool? ch1 = uutsvar.Mass;
                            uch1.Checked = bool.Parse(ch1.Value.ToString());
                            uch2.Checked = bool.Parse(uutsvar.pain.Value.ToString());
                            uch3.Checked = bool.Parse(uutsvar.Heuiaturia.Value.ToString());
                            utxt.Text = uutsvar.txt;
                         }
                        if (lutsvar != null&&recvar.LUTS==true)
                        {
                            compch2.Checked = true;
                           // LUTS.Visible = true;
                             Luttxt.Text= lutsvar.txt ;
                            lch1.Checked = bool.Parse(lutsvar.Frequercy.Value.ToString());
                            lch2.Checked = bool.Parse(lutsvar.No_Cuturia.Value.ToString());

                            lch3.Checked = bool.Parse(lutsvar.Urgucy.Value.ToString());
                            //if (lutsvar.Lu_contineuce != null)
                            //{
                                lch4.Checked = bool.Parse(lutsvar.Lu_contineuce.Value.ToString());
                            // RadioButtonList1.Items.c lutsvar.Stress
                            if (lch4.Checked == true)
                            {
                                if (lutsvar.Stress == true) 
                                { RadioButtonList1.SelectedValue = "r1"; }
                               else if (lutsvar.Lugluge == true)
                                { RadioButtonList1.SelectedValue = "r2"; }
                                else 
                                { RadioButtonList1.SelectedValue = "r3"; }
                            }

                           // }
                        }
                        if (congv != null&&recvar.cong==true)
                        {
                            compch6.Checked = true;
                            //cong.Visible = true;
                            contxt.Text= congv.others  ;
                            conch1.Checked = bool.Parse(congv.UUT.Value.ToString());
                            conch2.Checked = bool.Parse(congv.LUT.Value.ToString());
                            conch3.Checked = bool.Parse(congv.Hypospodias.Value.ToString());
                            conch4.Checked = bool.Parse(congv.Epispadias.Value.ToString());
                            conch5.Checked = bool.Parse(congv.undescTesties.Value.ToString());
                           // conch6.Checked = bool.Parse(congv.others.Value.ToString());
                            
                        }
                        if (postv != null&&recvar.post_mi==true)
                        {
                            compch8.Checked = true;
                           // post.Visible = true;
                            posttxt.Text = postv.txt;
                            pch1.Checked = bool.Parse(postv.Feeling_uicomplete_En.Value.ToString());
                            pch2.Checked = bool.Parse(postv.post_micturation_drippliz.Value.ToString());
                        }
                        if (otherr != null&&recvar.others==true)
                        {
                            compch5.Checked = true;
                           // others.Visible = true;
                            otxt.Text = otherr.othertxt;
                            och1.Checked = bool.Parse(otherr.pain.Value.ToString());
                            och2.Checked = bool.Parse(otherr.Feuer.Value.ToString());
                            och3.Checked = bool.Parse(otherr.Uruil_change.Value.ToString());
                            och4.Checked = bool.Parse(otherr.Dischosage.Value.ToString());
                            och5.Checked = bool.Parse(otherr.Fistula.Value.ToString());
                            och6.Checked = bool.Parse(otherr.shinus.Value.ToString());
                            och7.Checked = bool.Parse(otherr.aual_pain.Value.ToString());
                           
                        }
                        if (edd != null&&recvar.ED==true)
                        {
                            compch3.Checked = true;
                            //ed.Visible = true;
                            Ertxt.Text = edd.EDISS;
                        }
                        if (emm != null&&recvar.Emergency==true)
                        {
                            compch4.Checked = true;
                            //em.Visible = true;
                            emtxt.Text = emm.other;
                            emch1.Checked = bool.Parse(emm.Ret.Value.ToString());
                            emch2.Checked = bool.Parse(emm.anuria.Value.ToString());
                            emch3.Checked = bool.Parse(emm.uiy_Hydronc.Value.ToString());
                            emch4.Checked = bool.Parse(emm.Ueeuia.Value.ToString());
                            emch5.Checked = bool.Parse(emm.pria_pism.Value.ToString());
                            emch6.Checked = bool.Parse(emm.Torsion.Value.ToString());
                            emch7.Checked = bool.Parse(emm.inFlection.Value.ToString());
                            emch8.Checked = bool.Parse(emm.Trauua.Value.ToString());

                        }
                        if (vv != null&&recvar.voidus==true)
                        {
                         compch7.Checked = true;
                           // v.Visible = true;
                            TextBox1.Text = vv.txt;
                            if(vv.stream==true)
                            {
                                vch1.Checked = true;
                                var y = (from n in db.Stream_options where n.StreamId == vv.id select n).FirstOrDefault();
                                vsch1.Checked = bool.Parse(y.slow.Value.ToString());
                                vsch3.Checked = bool.Parse(y.Splithlis.Value.ToString());
                                vsch4.Checked = bool.Parse(y.liten_mitteut.Value.ToString());
                            }
                            vch2.Checked = bool.Parse(vv.Hesitoucy.Value.ToString());
                            vch3.Checked = bool.Parse(vv.Strauius.Value.ToString());
                            vch4.Checked = bool.Parse(vv.Tesmul_drippluis.Value.ToString());

                        }

                    }
                }
            }
        }
        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["del"])))
            {
                int x = int.Parse(Request.QueryString["del"].ToString());
                patient_history f = db.patient_history.FirstOrDefault(a => a.id == x);
                clinic_reception ff = db.clinic_reception.FirstOrDefault(d=>d.id==f.details_id);
                db.patient_history.Remove(f);
                db.clinic_reception.Remove(ff);
                db.SaveChanges();
                Div2.Visible = false;
                Response.Redirect("patprofile.aspx?patid=" + f.p_id);
            }

       }

        protected void cancel_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
              int  x = int.Parse(Request.QueryString["id"].ToString());
                patient_history f = db.patient_history.FirstOrDefault(a => a.id == x);
                Response.Redirect("visitDetails.aspx?Recid=" + f.details_id + "&&patid=" + f.p_id) ;
            }

        }
      
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        protected void print_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());
                string q = @"select * from patient_history where id=" + x + "";
                string cr = "VisitR.rpt";
                Session["query"] = q;

                Session["cr"] = cr;
                Response.Redirect("report.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]) && !String.IsNullOrEmpty(Request.QueryString["patid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                int patid = int.Parse(Request.QueryString["patid"]);
                var patname = (from u in db.patient where u.id == patid select u.name).FirstOrDefault();
                var recobj= (from u in db.clinic_reception where u.id == recId select u).FirstOrDefault();
                bool ruch1 = false, ruch2 = false, ruch3 = false, rlch1 = false, rlch2 = false, rlch3 = false, rlch4 = false,
                    rvch1 = false, rvch2 = false, rvch3 = false,rvch4=false, rvsch1 = false, rvsch3 = false, rvsch4 = false, rpch1 = false, rpch2 = false,
                    roch1 = false, roch2 = false, roch3 = false, roch4 = false, roch5 = false, roch6 = false, roch7 = false, 
                    remch1 = false, remch2 = false, remch3 = false, remch4 = false, remch5 = false, remch6 = false, remch7 = false, remch8 = false
                    , congch1=false, congch2=false, congch3=false, congch4=false, congch5=false, congch6 = false;
                bool UUTSCH = false, LUTS = false, EDCH = false, EMCH = false, OTHERSCH = false, CONGCH = false;
                bool radios1=false,radios2=false,radio3=false;
                //uch

                
                if (uch1.Checked)
                { ruch1 = true; }
                if (uch2.Checked)
                { ruch2 = true; }
                if (uch3.Checked)
                { ruch3 = true; }
                //---------lch
                if (lch1.Checked)
                { rlch1 = true; }
                if (lch2.Checked)
                { rlch2 = true; }
                if (lch3.Checked)
                { rlch3 = true; }
                if (lch4.Checked)
                { rlch4 = true;
                    if (RadioButtonList1.SelectedValue != "")
                    {
                        if (RadioButtonList1.SelectedValue == "r1")
                        { radios1 = true; }
                        else if (RadioButtonList1.SelectedValue == "r2")
                        { radios2 = true; }
                        else
                        { radio3 = true; }
                    }

                }
                //-----vch
                if (vch1.Checked)
                { rvch1 = true; }
                if (vch2.Checked)
                { rvch2 = true; }
                if (vch3.Checked)
                { rvch3 = true; }
                if (vch4.Checked)
                { rvch4 = true; }
                if (vsch1.Checked)
                { rvsch1 = true; }
                if (vsch3.Checked)
                { rvsch3 = true; }
                if (vsch4.Checked)
                { rvsch4 = true; }
                //---------p
                if (pch1.Checked)
                { rpch1 = true; }
                if (pch2.Checked)
                { rpch2 = true; }
                //---------others
                if (och1.Checked)
                { roch1 = true; }
                if (och2.Checked)
                { roch2 = true; }
                if (och3.Checked)
                { roch3 = true; }
                if (och4.Checked)
                { roch4 = true; }
                if (och5.Checked)
                { roch5 = true; }
                if (och6.Checked)
                { roch6 = true; }
                if (och7.Checked)
                { roch7 = true; }
                //--------emerg
                if (emch1.Checked)
                { remch1 = true; }
                if (emch2.Checked)
                { remch2 = true; }
                if (emch3.Checked)
                { remch3 = true; }
                if (emch4.Checked)
                { remch4 = true; }
                if (emch5.Checked)
                { remch5 = true; }
                if (emch6.Checked)
                { remch6 = true; }
                if (emch7.Checked)
                { remch7 = true; }
                if (emch8.Checked)
                { remch8 = true; }
                //---------------cong
                if (conch1.Checked)
                { congch1 = true; }
                if (conch2.Checked)
                { congch2 = true; }
                if (conch3.Checked)
                { congch3 = true; }
                if (conch4.Checked)
                { congch4 = true; }
                if (conch5.Checked)
                { congch5 = true; }
                //if (conch6.Checked)
                //{ congch6 = true; }
                recobj.Diagnosis = diag.Text;
                recobj.status = true;
                db.SaveChanges();
                #region savechecked
                if (compch1.Checked)
                    {
                        recobj.UUTS = true;
                        db.SaveChanges();
                    var utsv = (from d in db.UTS where d.Rec_id == recobj.id select d).FirstOrDefault();
                    if (utsv == null)
                    {
                        UTS ty = new UTS
                        {
                            pat_id = patid,
                            Rec_id = recId,
                            pat_name = patname.ToString(),
                            txt = utxt.Text,
                            Mass = ruch1,
                            pain = ruch2,
                            Heuiaturia = ruch3
                        };
                        db.UTS.Add(ty);
                        db.SaveChanges();
                    }
                    else
                    {
                        
                            utsv.txt = utxt.Text;
                            utsv.Mass = ruch1;
                            utsv.pain = ruch2;
                            utsv.Heuiaturia = ruch3;
                            db.SaveChanges();
                       
                    }
                }
                    if (compch2.Checked)
                    {

                        recobj.LUTS = true;
                        db.SaveChanges();
                    var luts = (from d in db.LUTS where d.rec_id == recobj.id select d).FirstOrDefault();
                    if (luts == null)
                    {
                        LUTS ty = new LUTS
                        {
                            pat_id = patid,
                            rec_id = recId,
                            pat_name = patname.ToString(),
                            txt = Luttxt.Text,
                            Frequercy = rlch1,
                            No_Cuturia = rlch2,
                            Lu_contineuce = rlch4,

                            Urgucy = rlch3,
                            Stress = radios1,
                            Lugluge = radios2,
                            True = radio3

                        };
                        db.LUTS.Add(ty);
                        db.SaveChanges();
                    }
                    else {
                       
                            luts.txt = Luttxt.Text;
                            luts.Frequercy = rlch1;
                            luts.No_Cuturia = rlch2;
                            luts.Lu_contineuce = rlch4;

                            luts.Urgucy = rlch3;
                        if (rlch4 == true)
                        {
                            luts.Stress = radios1;
                            luts.Lugluge = radios2;
                            luts.True = radio3;
                        }
                       else
                        {
                            luts.Stress = false;
                            luts.Lugluge = false;
                            luts.True = false;
                        }
                        db.SaveChanges();
                        
                    }
                    }
                    if (compch3.Checked)
                    {
                        recobj.ED = true;
                        db.SaveChanges();
                    var edd = (from d in db.ED where d.Rec_id == recobj.id select d).FirstOrDefault();

                    if (edd==null)
                    {
                        ED ty = new ED
                        {
                            pat_id = patid,
                            Rec_id = recId,
                            pat_name = patname.ToString(),
                            EDISS = Ertxt.Text,


                        };
                        db.ED.Add(ty);
                        db.SaveChanges();
                    }
                    else
                    {
                       
                            edd.EDISS = Ertxt.Text;
                            db.SaveChanges();
                        
                    }

                }
                    if (compch4.Checked)
                    {
                        recobj.Emergency = true;
                        db.SaveChanges();
                    var emerv = (from d in db.Emagercy where d.Rec_id == recobj.id select d).FirstOrDefault();
                    if (emerv == null)
                    {
                        Emagercy ty = new Emagercy
                        {
                            pat_id = patid,
                            Rec_id = recId,
                            pat_name = patname.ToString(),
                            other = emtxt.Text,
                            Ret = remch1,
                            anuria = remch2,
                            uiy_Hydronc = remch3,

                            Ueeuia = remch4,
                            pria_pism = remch5,
                            Torsion = remch6,
                            inFlection = remch7,
                            Trauua = remch8,

                        };
                        db.Emagercy.Add(ty);
                        db.SaveChanges();
                    }
                    else
                    {
                       
                            emerv.other = utxt.Text;
                            emerv.Ret = remch1;
                            emerv.anuria = remch2;
                            emerv.uiy_Hydronc = remch3;
                            emerv.Ueeuia = remch4;
                            emerv.pria_pism = remch5;
                            emerv.Torsion = remch6;
                            emerv.inFlection = remch7;
                            emerv.Trauua = remch8;
                            db.SaveChanges();
                        
                    }

                }
                    if (compch5.Checked)
                    {
                        recobj.others = true;
                        db.SaveChanges();
                    var oo = (from d in db.others where d.Rec_id == recobj.id select d).FirstOrDefault();
                    if (oo==null)
                    {
                        others ty = new others
                        {
                            pat_id = patid,
                            Rec_id = recId,
                            pat_name = patname.ToString(),
                            pain = roch1,
                            Feuer = roch2,
                            Uruil_change = roch3,
                            Dischosage = roch4,
                            Fistula = roch5,
                            shinus = roch6,
                            aual_pain = roch7,
                            othertxt = otxt.Text

                        };
                        db.others.Add(ty);
                        db.SaveChanges();
                    }
                    else {
                       
                         oo.pain = roch1;
                        oo.Feuer = roch2;
                        oo.Uruil_change = roch3;
                        oo.Dischosage = roch4;
                        oo.Fistula = roch5;
                        oo.shinus = roch6;
                        oo.aual_pain = roch7;
                        oo.othertxt = otxt.Text;
                        db.SaveChanges();
                    }

                    //}
                }
                    if (compch6.Checked)
                    {
                        recobj.cong = true;
                        db.SaveChanges();
                    var c = (from d in db.cong_Anthio where d.Rec_id == recobj.id select d).FirstOrDefault();
                    if (c == null)
                    {
                        cong_Anthio ty = new cong_Anthio
                        {
                            pat_id = patid,
                            Rec_id = recId,
                            pat_name = patname.ToString(),
                            UUT = congch1,
                            LUT = congch2,
                            Hypospodias = congch3,
                            Epispadias = congch4,
                            undescTesties = congch5,
                            others = contxt.Text,

                        };
                        db.cong_Anthio.Add(ty);
                        db.SaveChanges();
                    }
                    else
                    {
                        
                            c.UUT = congch1;
                            c.LUT = congch2;
                            c.Hypospodias = congch3;
                            c.Epispadias = congch4;
                            c.undescTesties = congch5;
                            c.others = contxt.Text;
                            db.SaveChanges();
                       

                    }
                }
                    if (compch7.Checked)
                    {
                        // bool rvsch1 = false, rvsch2 = false, rvsch3 = false;
                        recobj.voidus = true;
                        db.SaveChanges();
                    var c = (from d in db.Voidues where d.Rec_id == recobj.id select d).FirstOrDefault();
                    if (c == null)
                    {
                      
                        Voidues ty = new Voidues
                        {
                            pat_id = patid,
                            Rec_id = recId,
                            pat_name = patname.ToString(),
                            stream = rvch1,
                            Hesitoucy = rvch2,
                            Strauius = rvch3,
                            Tesmul_drippluis = rvch4,
                            txt = TextBox1.Text

                        };
                        db.Voidues.Add(ty);
                        db.SaveChanges();
                        
                            int idmax = (from m in db.Voidues select m.id).Max();
                            Stream_options b = new Stream_options { slow = rvsch1, Splithlis = rvsch3, StreamId = idmax, liten_mitteut = rvsch4 }; db.Stream_options.Add(b); db.SaveChanges();
                        
                        }
                    else {
                       
                            c.stream = rvch1;
                            c.Hesitoucy = rvch2;
                            c.Strauius = rvch3;
                            c.Tesmul_drippluis = rvch4;
                            c.txt = TextBox1.Text;
                            db.SaveChanges();
                            if (rvch1 == true)
                            {
                                if (db.Stream_options.Any(r => r.StreamId == c.id))
                                {
                                    var st = (from i in db.Stream_options where i.StreamId == c.id select i).FirstOrDefault();
                                    st.slow = rvsch1;
                                    st.Splithlis = rvsch3;
                                    st.liten_mitteut = rvsch4;
                                    db.SaveChanges();
                                }
                                else
                                {
                                    Stream_options b = new Stream_options { slow = rvsch1, Splithlis = rvsch3, StreamId = c.id, liten_mitteut = rvsch4 }; db.Stream_options.Add(b); db.SaveChanges();

                                }
                            }
                      

                    }

                    }
                if (compch8.Checked)
                {
                    recobj.post_mi = true;
                    db.SaveChanges();
                    var d = (from i in db.post_micturation where i.Rec_id == recId select i).FirstOrDefault();
                    if (d == null)
                    {
                        post_micturation ty = new post_micturation
                        {
                            pat_id = patid,
                            Rec_id = recId,
                            Feeling_uicomplete_En = rpch1,
                            post_micturation_drippliz = rpch2,
                            txt = posttxt.Text

                        };
                        db.post_micturation.Add(ty);
                        db.SaveChanges();
                    }

                    else
                    {

                        d.Feeling_uicomplete_En = rpch1;
                        d.post_micturation_drippliz = rpch2;
                        d.txt = posttxt.Text;
                        db.SaveChanges();

                    }
                }
                #endregion
                
                
                Response.Redirect("VisitDetails.aspx?Recid="+ recId + "&&patid="+patid);
                
            }


        }

        protected void lch4_CheckedChanged(object sender, EventArgs e)
        {
            RadioButtonList1.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int recId = int.Parse(Request.QueryString["Recid"]);
            int patid = int.Parse(Request.QueryString["patid"]);
            var patname = (from u in db.patient where u.id == patid select u).FirstOrDefault();
            if (Button2.Text != "Edit")
            {
                Exammination exx = new Exammination
                {
                    Rec_id = recId,
                    pat_id = patid,
                    pat_name = patname.name.ToString(),
                    General = eetxt1.Text,
                    Kiduey = eetxt2.Text,
                    uerter = eetxt3.Text,
                    Blodder = eetxt4.Text,
                    oeuis = eetxt5.Text,
                    Ureqra = eetxt6.Text,
                    peruerum = eetxt7.Text,
                    scrotcum = eetxt8.Text,
                    uretiva = eetxt9.Text,
                    P_R = eetxt10.Text,
                    prostate = eetxt11.Text
                    ,
                    //plus = etxt1.Text,
                    //BR1 = etxt2.Text,
                    //BR2 = etxt3.Text,
                    //Temp = etxt4.Text,
                    //Respiral = etxt5.Text

                };
                db.Exammination.Add(exx);
                db.SaveChanges();
                Response.Redirect("VisitDetails.aspx?Recid=" + recId + "&&patid=" + patid);
            }
            else {
                var io = (from b in db.Exammination where b.Rec_id == recId select b).FirstOrDefault();
                //  io.plus= etxt1.Text;
                //io.BR1 = etxt2.Text  ;
                //io.BR2= etxt3.Text;
                //io.Temp= etxt4.Text  ;
                //io.Respiral= etxt5.Text  ;
                //----eetxt
                io.General= eetxt1.Text ;
                 io.Kiduey= eetxt2.Text;
                  io.uerter= eetxt3.Text;
                io.Blodder= eetxt4.Text ;
                io.oeuis= eetxt5.Text  ;
                io.Ureqra= eetxt6.Text ;
                io.peruerum = eetxt7.Text;
                io.scrotcum= eetxt8.Text ;
                io.uretiva= eetxt9.Text ;
                io.P_R= eetxt10.Text ;
                io.prostate= eetxt11.Text ;



            }
        }

        protected void compch3_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch3.Checked)
                    {
                        r.ED = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.ED = false;
                        db.SaveChanges();
                    }
                }
            }
        }

        protected void compch4_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch4.Checked)
                    {
                        r.Emergency = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.Emergency = false;
                        db.SaveChanges();
                    }
                }
            }
        }

        protected void compch5_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch5.Checked)
                    {
                        r.others = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.others = false;
                        db.SaveChanges();
                    }
                }
            }
        }

        protected void compch6_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch6.Checked)
                    {
                        r.cong = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.cong = false;
                        db.SaveChanges();
                    }
                }
            }
        }

        protected void compch7_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch7.Checked)
                    {
                        r.voidus = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.voidus = false;
                        db.SaveChanges();
                    }
                }
            }
        }

        protected void compch2_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch2.Checked)
                    {
                        r.LUTS = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.LUTS = false;
                        db.SaveChanges();
                    }
                }
            }

        }

        protected void compch1_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch1.Checked)
                    {
                        r.UUTS = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.UUTS = false;
                        db.SaveChanges();
                    }
                }
            }
        }

        protected void compch8_CheckedChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var r = (from m in db.clinic_reception where m.id == recId select m).FirstOrDefault();
                if (r.status == true)
                {
                    if (compch3.Checked)
                    {
                        r.ED = true;
                        db.SaveChanges();
                    }
                    else
                    {
                        r.ED = false;
                        db.SaveChanges();
                    }
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["Recid"]))
            {
                int recId = int.Parse(Request.QueryString["Recid"]);
                var recobj = (from u in db.clinic_reception where u.id == recId select u).FirstOrDefault();

               // recobj.status = true;
               // db.SaveChanges();
                Response.Redirect("outReport.aspx?clinicRec=" + recobj.id+"&p_id="+recobj.patient_id);
            }
        }
    }
}