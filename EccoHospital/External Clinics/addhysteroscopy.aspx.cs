using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class addhysteroscopy : System.Web.UI.Page
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
                    hystroscopy f = db.hystroscopy.FirstOrDefault(a => a.id == x);
                    db.hystroscopy.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("addhysteroscopy.aspx?id=" + xx);

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    hystroscopy f = db.hystroscopy.FirstOrDefault(a => a.id == x);
                    clicn_diag.Text = f.clinic_diag.ToString();
                    intro.SelectedValue = f.intro.ToString();
                    ut_S.SelectedValue = f.uterin_sounding.ToString();
                    uterine_cavity.Text = f.uterin_cavity.ToString();
                    endo.Text = f.endometrium.ToString();
                    distmedial.SelectedValue = f.distention.ToString();
                    tubal.SelectedValue = f.tubal.ToString();
                    plan.Text = f.paln.ToString();
                    diagnosisi.Text = f.diag.ToString();
                    operat.Text = f.operative_notes.ToString();
                    btn_add.Text = "edit";
                }

                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                {
                    int x = int.Parse(Request.QueryString["print"].ToString());
                    string q = @"select * from hystroscopy h join patient p on h.pat_id=p.id where h.id=" + x + "";
                    string cr = "External Clinics/HysteroscopyR.rpt";
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

        protected void btn_add_Click(object sender, EventArgs e)
        {
            int x = 0;
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                x = int.Parse(Request.QueryString["id"].ToString());
                if (btn_add.Text == "edit")
                {
                    int y = int.Parse(Request.QueryString["editid"].ToString());
                    hystroscopy f = db.hystroscopy.FirstOrDefault(a => a.id == y);
                    f.clinic_diag = clicn_diag.Text;
                    f.uterin_sounding = ut_S.SelectedValue;
                    f.intro = intro.SelectedValue;
                    f.uterin_cavity = uterine_cavity.Text;
                    f.endometrium = endo.Text;
                    f.tubal = tubal.SelectedValue;
                    f.distention = distmedial.SelectedValue;
                    f.diag = diagnosisi.Text;
                    f.paln = plan.Text;
                    f.operative_notes = operat.Text;
                    db.SaveChanges();
                }
                else
                {
                    hystroscopy hy = new hystroscopy
                    {
                        clinic_diag = clicn_diag.Text,
                        uterin_sounding = ut_S.SelectedValue,
                        intro = intro.SelectedValue,
                        uterin_cavity = uterine_cavity.Text,
                        endometrium = endo.Text,
                        tubal = tubal.SelectedValue,
                        distention = distmedial.SelectedValue,
                        diag = diagnosisi.Text,
                        paln = plan.Text,
                        operative_notes = operat.Text,
                        pat_id = x,
                        date = DateTime.Now.Date
                    };
                    // Mapper.addhyst(hy);
                    db.hystroscopy.Add(hy);
                    db.SaveChanges();
                    
                }


                Response.Redirect("addhysteroscopy.aspx?id=" + x);
            }
            else { MsgBox("خطا", this.Page, this); }
        }
    }
}