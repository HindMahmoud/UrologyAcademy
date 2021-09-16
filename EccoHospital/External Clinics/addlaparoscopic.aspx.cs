using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class addlaparoscopic : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["delid"])))
                {
                    int xx = int.Parse(Request.QueryString["id"].ToString());
                    int x = int.Parse(Request.QueryString["delid"].ToString());
                    laparoscopic f = db.laparoscopic.FirstOrDefault(a => a.id == x);
                    db.laparoscopic.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("addlaparoscopic.aspx?id=" + xx);

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    bool ch0 = false, ch1 = false, ch2 = false;



                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    laparoscopic f = db.laparoscopic.FirstOrDefault(a => a.id == x);
                    antesth.SelectedValue = f.anesthesia.ToString();
                    panorama.SelectedValue = f.panoramic.ToString();
                    bladder.SelectedValue = f.bladder.ToString();

                    if (f.uterus.ToString() != "")
                    {
                        ch0 = true;
                    }
                    if (f.uterus_abnormal.ToString() != "")
                    {
                        ch1 = true;
                    }
                    if (f.uterus_adhesion.ToString() != "")
                    {
                        ch2 = true;
                    }

                    uterus.Items[0].Selected = ch0;
                    uterus.Items[1].Selected = ch1;
                    uterus.Items[2].Selected = ch2;

                    lttubes.SelectedValue = f.LtTubes.ToString();
                    lttubesCO.Text = f.LtTubesComment.ToString();
                    rttubes.SelectedValue = f.RtTubes.ToString();
                    rttubesCO.Text = f.RtTubesComment.ToString();

                    ltovary.SelectedValue = f.LtOvary.ToString();
                    ltovaryCO.Text = f.LtOvaryComment.ToString();
                    rtovary.SelectedValue = f.RtOvary.ToString();
                    rtovaryCO.Text = f.RtOvaryComment.ToString();

                    ltovarain.SelectedValue = f.LtOvarainFossa.ToString();
                    ltovarainCO.Text = f.LtOvarainFossaComment.ToString();

                    rtovarain.SelectedValue = f.RtOvarainFossa.ToString();
                    rtovarainCO.Text = f.RtOvarainFossaComment.ToString();
                    uteroscaral.Text = f.uterosacral.ToString();
                    doglas.Text = f.douglas.ToString();
                    impress.Text = f.impression.ToString();
                    operative.Text = f.operative.ToString();

                    btn_add.Text = "edit";
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                {
                    int x = int.Parse(Request.QueryString["print"].ToString());
                    string q = @"select * from [dbo].[laparoscopic] lp join [dbo].[patient] p on lp.pat_id=p.id where lp.id=" + x + "";
                    string cr = "External Clinics/laparoscopicR.rpt";
                    Session["query"] = q;

                    Session["cr"] = cr;
                    Response.Redirect("~/report.aspx");

                }

            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            int x = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                x = int.Parse(Request.QueryString["id"].ToString());

                string utno = "", utab = "", utad = "";

                if (uterus.Items[0].Selected)
                {
                    utno = uterus.Items[0].Value;
                }
                if (uterus.Items[1].Selected)
                {
                    utab = uterus.Items[1].Value;
                }
                if (uterus.Items[2].Selected)
                {
                    utad = uterus.Items[2].Value;
                }

                if (btn_add.Text == "edit")
                {
                    int y = int.Parse(Request.QueryString["editid"].ToString());
                    laparoscopic f = db.laparoscopic.FirstOrDefault(a => a.id == y);
                    f.anesthesia = antesth.SelectedValue;
                    f.panoramic = panorama.SelectedValue;
                    f.bladder = bladder.SelectedValue;
                    f.uterus = utno;
                    f.uterus_abnormal = utab;
                    f.uterus_adhesion = utad;
                    f.LtTubes = lttubes.SelectedValue;
                    f.LtTubesComment = lttubesCO.Text;
                    f.RtTubes = rttubes.SelectedValue;
                    f.RtTubesComment = rttubesCO.Text;
                    f.LtOvary = ltovary.SelectedValue;
                    f.LtOvaryComment = ltovaryCO.Text;
                    f.RtOvary = rtovary.SelectedValue;
                    f.RtOvaryComment = rtovaryCO.Text;
                    f.LtOvarainFossa = ltovarain.SelectedValue;
                    f.LtOvarainFossaComment = ltovarainCO.Text;
                    f.RtOvarainFossa = rtovarain.Text;
                    f.RtOvarainFossaComment = rtovarainCO.Text;
                    f.uterosacral = uteroscaral.Text;
                    f.douglas = doglas.Text;
                    f.impression = impress.Text;
                    f.operative = operative.Text;

                    db.SaveChanges();


                }
                else
                {
                    laparoscopic hy = new laparoscopic
                    {
                        pat_id = x,
                        date = DateTime.Now.Date,
                        anesthesia = antesth.SelectedValue,
                        panoramic = panorama.SelectedValue,
                        bladder = bladder.SelectedValue,
                        uterus = utno,
                        uterus_abnormal = utab,
                        uterus_adhesion = utad,
                        LtTubes = lttubes.SelectedValue,
                        LtTubesComment = lttubesCO.Text,
                        RtTubes = rttubes.SelectedValue,
                        RtTubesComment = rttubesCO.Text,
                        LtOvary = ltovary.SelectedValue,
                        LtOvaryComment = ltovaryCO.Text,
                        RtOvary = rtovary.SelectedValue,
                        RtOvaryComment = rtovaryCO.Text,
                        LtOvarainFossa = ltovarain.SelectedValue,
                        LtOvarainFossaComment = ltovarainCO.Text,
                        RtOvarainFossa = rtovarain.Text,
                        RtOvarainFossaComment = rtovarainCO.Text,
                        uterosacral = uteroscaral.Text,
                        douglas = doglas.Text,
                        impression = impress.Text,
                        operative = operative.Text
                    };
                    // Mapper.addlaparos(hy);
                    db.laparoscopic.Add(hy);
                    db.SaveChanges();
                }
                Response.Redirect("addlaparoscopic.aspx?id=" + x);
            }
            else { MsgBox("خطا", this.Page, this); }
        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
    }
}