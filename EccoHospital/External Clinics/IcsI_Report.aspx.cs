using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class IcsI_Report : System.Web.UI.Page
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
                icsi_report f = db.icsi_report.FirstOrDefault(a => a.id == x);
                db.icsi_report.Remove(f);
                db.SaveChanges();
                Response.Redirect("IcsI_Report.aspx?id=" + xx);

            }
            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
            {
                int x = int.Parse(Request.QueryString["editid"].ToString());
                icsi_report f = db.icsi_report.FirstOrDefault(a => a.id == x);
                proto.Text = f.protocol.ToString();
                drug.Text = f.drugs.ToString();
                period_ovarian.Text = f.period.ToString();
                comm.Text = f.comment.ToString();
                hcg.TextMode =TextBoxMode.SingleLine;
                hcg.Text = f.hcg.ToString();
                coc_h.Text = f.coc.ToString();
                PR_h.Text = f.pr.ToString();
                NP_h.Text = f.np.ToString();
                Immotile_h.Text = f.immotile.ToString();
                ovmd.TextMode = TextBoxMode.SingleLine;
                ovmd.Text = f.ovm.ToString();
                coc_O.Text = f.coc2.ToString();
                m2_O.Text = f.m2.ToString();

                m1_O.Text = f.m1.ToString();
                gv_O.Text = f.gv.ToString();
                EZ_O.Text = f.ez.ToString();
                Injected_O.Text = f.injected.ToString();
                emDt.TextMode = TextBoxMode.SingleLine;
                emDt.Text = Convert.ToDateTime(f.embryoT.ToString()).ToString("yyy-MM-dd HH:mm tt");
                emYs.Text = f.embryoS.ToString();




                btn_add.Text = "edit";
            }

            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
            {
                int x = int.Parse(Request.QueryString["print"].ToString());
                string q = @"select * from icsi_report ic join patient p on ic.pat_id=p.id where ic.id=" + x + "";
                string cr = "External Clinics/IcsiR.rpt";
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
                icsi_report f = db.icsi_report.FirstOrDefault(a => a.id == y);
                f.protocol = proto.Text;
                f.drugs = drug.Text;
                f.period = period_ovarian.Text;
                f.comment = comm.Text;
                f.hcg = hcg.Text;
                f.coc = coc_h.Text;
                f.pr = PR_h.Text;
                f.np = NP_h.Text;
                f.immotile = Immotile_h.Text;
                f.ovm = ovmd.Text;
                f.coc2 = coc_O.Text;
                f.m2 = m2_O.Text;
                f.m1 = m1_O.Text;
                f.gv = gv_O.Text;
                f.ez = EZ_O.Text;
                f.injected = Injected_O.Text;

                
                f.embryoT = emDt.Text;
                f.embryoS = emYs.Text;

                db.SaveChanges();
            }
            else
            {
                icsi_report hy = new icsi_report
                {
                   protocol = proto.Text,
                drugs = drug.Text,
                period = period_ovarian.Text,
                comment = comm.Text,
                hcg = hcg.Text,
                coc = coc_h.Text,
                pr = PR_h.Text,
                np = NP_h.Text,
                immotile = Immotile_h.Text,
                ovm = ovmd.Text,
                coc2 = coc_O.Text,
                m2 = m2_O.Text,
                m1 = m1_O.Text,
                gv = gv_O.Text,
                ez = EZ_O.Text,
                injected = Injected_O.Text,


                embryoT = emDt.Text,
                embryoS = emYs.Text,

                pat_id = x,
                    date = DateTime.Now.Date
                };
                db.icsi_report.Add(hy);
                db.SaveChanges();
            }


            Response.Redirect("IcsI_Report.aspx?id=" + x);
        }
        else { MsgBox("خطا", this.Page, this); }
    }
}