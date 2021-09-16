using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;


public partial class Medical_Report : System.Web.UI.Page
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
                medical_report f = db.medical_report.FirstOrDefault(a => a.id == x);
                db.medical_report.Remove(f);
                db.SaveChanges();
                Response.Redirect("Medical_Report.aspx?id=" + xx);

            }
            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
            {
                int x = int.Parse(Request.QueryString["editid"].ToString());
                medical_report f = db.medical_report.FirstOrDefault(a => a.id == x);
                title.Text = f.title.ToString();
                txt.Text = f.rep_content.ToString();
                add.Text = "edit";
            }

            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
            {
                int x = int.Parse(Request.QueryString["print"].ToString());
                string q = @"select * from medical_report h join patient p on h.pat_id=p.id where h.id=" + x + "";
                string cr = "External Clinics/medicalR.rpt";
                Session["query"] = q;

                Session["cr"] = cr;
                Response.Redirect("~/report.aspx");

            }
        }
    }

    protected void add_Click(object sender, EventArgs e)
    {
        int x = 0;
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
        {
            x = int.Parse(Request.QueryString["id"].ToString());
            if (add.Text == "edit")
            {
                int y = int.Parse(Request.QueryString["editid"].ToString());
                medical_report f = db.medical_report.FirstOrDefault(a => a.id == y);
                f.title = title.Text;
                f.rep_content = txt.Text;
                db.SaveChanges();
            }
            else {
                medical_report mr = new medical_report {
                    pat_id=x,
                    title=title.Text,
                    rep_content=txt.Text,
                    date=DateTime.Now.Date
                };
                //Mapper.add_rep(mr);
                db.medical_report.Add(mr);
                db.SaveChanges();
               
            }


            Response.Redirect("Medical_Report.aspx?id=" + x);
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