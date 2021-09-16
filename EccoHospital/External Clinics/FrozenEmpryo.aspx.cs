using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.External_Clinics
{
    public partial class FrozenEmpryo : System.Web.UI.Page
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
                    frozen_embryo f = db.frozen_embryo.FirstOrDefault(a => a.id == x);
                    db.frozen_embryo.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("FrozenEmpryo.aspx?id=" + xx);

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    frozen_embryo f = db.frozen_embryo.FirstOrDefault(a => a.id == x);
                    if (f.date != null)
                    {
                        DateTime d = Convert.ToDateTime(f.date.ToString());
                        m.Text = d.Month.ToString();
                        y.Text = d.Year.ToString();

                        date.TextMode = TextBoxMode.SingleLine;
                        date11.TextMode = TextBoxMode.SingleLine;
                        date22.TextMode = TextBoxMode.SingleLine;
                        date33.TextMode = TextBoxMode.SingleLine;
                        pregdate.TextMode = TextBoxMode.SingleLine;


                        dd1.TextMode = TextBoxMode.SingleLine;
                        dd2.TextMode = TextBoxMode.SingleLine;
                        dd3.TextMode = TextBoxMode.SingleLine;
                        dd4.TextMode = TextBoxMode.SingleLine;
                        dd5.TextMode = TextBoxMode.SingleLine;
                        dd6.TextMode = TextBoxMode.SingleLine;
                        dd7.TextMode = TextBoxMode.SingleLine;
                        dd8.TextMode = TextBoxMode.SingleLine;
                        dd9.TextMode = TextBoxMode.SingleLine;
                        dd10.TextMode = TextBoxMode.SingleLine;
                        dd11.TextMode = TextBoxMode.SingleLine;
                        dd12.TextMode = TextBoxMode.SingleLine;
                        dd13.TextMode = TextBoxMode.SingleLine;
                        dd14.TextMode = TextBoxMode.SingleLine;
                        dd15.TextMode = TextBoxMode.SingleLine;
                        dd16.TextMode = TextBoxMode.SingleLine;
                        dd17.TextMode = TextBoxMode.SingleLine;
                        dd18.TextMode = TextBoxMode.SingleLine;
                        dd19.TextMode = TextBoxMode.SingleLine;

                        dd20.TextMode = TextBoxMode.SingleLine;
                        dd21.TextMode = TextBoxMode.SingleLine;
                        dd22.TextMode = TextBoxMode.SingleLine;
                        ///////////////////////////////////////////////////
                        date.Text = Convert.ToDateTime(f.date.ToString()).ToShortDateString();
                        date.ReadOnly = true;
                        date11.Text = f.date1.ToString();
                        date22.Text = f.date2.ToString();
                        date33.Text = f.date3.ToString();
                        dd1.Text = f.d1.ToString();
                        dd2.Text = f.d2.ToString();
                        dd3.Text = f.d3.ToString();
                        dd4.Text = f.d4.ToString();
                        dd5.Text = f.d5.ToString();
                        dd6.Text = f.d6.ToString();
                        dd7.Text = f.d7.ToString();
                        dd8.Text = f.d8.ToString();
                        dd9.Text = f.d9.ToString();
                        dd10.Text = f.d10.ToString();
                        dd11.Text = f.d11.ToString();

                        dd12.Text = f.d12.ToString();
                        dd13.Text = f.d13.ToString();
                        dd14.Text = f.d14.ToString();
                        dd15.Text = f.d15.ToString();
                        dd16.Text = f.d16.ToString();
                        dd17.Text = f.d17.ToString();
                        dd18.Text = f.d18.ToString();
                        dd19.Text = f.d19.ToString();
                        dd20.Text = f.d20.ToString();
                        dd21.Text = f.d21.ToString();

                        dd22.Text = f.d22.ToString();

                        est1.Text = f.es1.ToString();
                        est2.Text = f.es2.ToString();
                        est3.Text = f.es3.ToString();

                        end1.Text = f.en1.ToString();
                        end2.Text = f.en2.ToString();
                        end3.Text = f.en3.ToString();
                        ini1.Text = f.in1.ToString();
                        ini2.Text = f.in2.ToString();
                        ini3.Text = f.in3.ToString();

                        preg.Text = f.preg.ToString();
                        pregdate.Text = f.preg_date.ToString();
                        comments.Text = f.comment.ToString();





                    }



                    btn_add.Text = "edit";
                }

                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
                {
                    int x = int.Parse(Request.QueryString["print"].ToString());
                    string q = @"select * from frozen_embryo f join patient p on f.pat_id=p.id where f.id=" + x + "";
                    string cr = "External Clinics/FrozenR.rpt";
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
                    frozen_embryo f = db.frozen_embryo.FirstOrDefault(a => a.id == y);
                    f.date1 = date11.Text;
                    f.date2 = date22.Text;
                    f.date3 = date33.Text;
                    f.en1 = end1.Text;
                    f.en2 = end2.Text;
                    f.en3 = end3.Text;
                    f.in1 = ini1.Text;
                    f.in2 = ini2.Text;
                    f.in3 = ini3.Text;
                    f.es1 = est1.Text;
                    f.es2 = est2.Text;
                    f.es3 = est3.Text;
                    f.preg = preg.Text;
                    f.preg_date = pregdate.Text;
                    f.comment = comments.Text;

                    f.d1 = dd1.Text;
                    f.d2 = dd2.Text;
                    f.d3 = dd3.Text;
                    f.d4 = dd4.Text;
                    f.d5 = dd5.Text;
                    f.d6 = dd6.Text;
                    f.d7 = dd7.Text;
                    f.d8 = dd8.Text;
                    f.d9 = dd9.Text;
                    f.d10 = dd10.Text;
                    f.d11 = dd11.Text;
                    f.d12 = dd12.Text;
                    f.d13 = dd13.Text;
                    f.d14 = dd14.Text;
                    f.d15 = dd15.Text;
                    f.d16 = dd16.Text;
                    f.d17 = dd17.Text;
                    f.d18 = dd18.Text;
                    f.d19 = dd19.Text;
                    f.d20 = dd20.Text;
                    f.d21 = dd21.Text;
                    f.d22 = dd22.Text;





                    db.SaveChanges();
                }
                else
                {
                    frozen_embryo hy = new frozen_embryo
                    {
                        date = Convert.ToDateTime(date.Text),
                        date1 = date11.Text,
                        date2 = date22.Text,
                        date3 = date33.Text,
                        en1 = end1.Text,
                        en2 = end2.Text,
                        en3 = end3.Text,
                        in1 = ini1.Text,
                        in2 = ini2.Text,
                        in3 = ini3.Text,
                        es1 = est1.Text,
                        es2 = est2.Text,
                        es3 = est3.Text,
                        preg = preg.Text,
                        preg_date = pregdate.Text,
                        comment = comments.Text,

                        d1 = dd1.Text,
                        d2 = dd2.Text,
                        d3 = dd3.Text,
                        d4 = dd4.Text,
                        d5 = dd5.Text,
                        d6 = dd6.Text,
                        d7 = dd7.Text,
                        d8 = dd8.Text,
                        d9 = dd9.Text,
                        d10 = dd10.Text,
                        d11 = dd11.Text,
                        d12 = dd12.Text,
                        d13 = dd13.Text,
                        d14 = dd14.Text,
                        d15 = dd15.Text,
                        d16 = dd16.Text,
                        d17 = dd17.Text,
                        d18 = dd18.Text,
                        d19 = dd19.Text,
                        d20 = dd20.Text,
                        d21 = dd21.Text,
                        d22 = dd22.Text,
                        pat_id = x

                    };
                    db.frozen_embryo.Add(hy);
                    db.SaveChanges();
                }


                Response.Redirect("FrozenEmpryo.aspx?id=" + x);
            }
            else { MsgBox("خطا", this.Page, this); }
        }

        protected void date_TextChanged(object sender, EventArgs e)
        {
            if (date.Text != "")
            {
                DateTime d = Convert.ToDateTime(date.Text);

                m.Text = d.Month.ToString();
                y.Text = d.Year.ToString();
                dd1.TextMode = TextBoxMode.SingleLine;
                dd2.TextMode = TextBoxMode.SingleLine;
                dd3.TextMode = TextBoxMode.SingleLine;
                dd4.TextMode = TextBoxMode.SingleLine;
                dd5.TextMode = TextBoxMode.SingleLine;
                dd6.TextMode = TextBoxMode.SingleLine;
                dd7.TextMode = TextBoxMode.SingleLine;
                dd8.TextMode = TextBoxMode.SingleLine;
                dd9.TextMode = TextBoxMode.SingleLine;
                dd10.TextMode = TextBoxMode.SingleLine;
                dd11.TextMode = TextBoxMode.SingleLine;
                dd12.TextMode = TextBoxMode.SingleLine;
                dd13.TextMode = TextBoxMode.SingleLine;
                dd14.TextMode = TextBoxMode.SingleLine;
                dd15.TextMode = TextBoxMode.SingleLine;
                dd16.TextMode = TextBoxMode.SingleLine;
                dd17.TextMode = TextBoxMode.SingleLine;
                dd18.TextMode = TextBoxMode.SingleLine;
                dd19.TextMode = TextBoxMode.SingleLine;

                dd20.TextMode = TextBoxMode.SingleLine;
                dd21.TextMode = TextBoxMode.SingleLine;
                dd22.TextMode = TextBoxMode.SingleLine;

                dd1.Text = d.ToShortDateString();
                dd2.Text = d.AddDays(1).ToShortDateString();
                dd3.Text = d.AddDays(2).ToShortDateString();
                dd4.Text = d.AddDays(3).ToShortDateString();
                dd5.Text = d.AddDays(4).ToShortDateString();
                dd6.Text = d.AddDays(5).ToShortDateString();
                dd7.Text = d.AddDays(6).ToShortDateString();
                dd8.Text = d.AddDays(7).ToShortDateString();
                dd9.Text = d.AddDays(8).ToShortDateString();
                dd10.Text = d.AddDays(9).ToShortDateString();
                dd11.Text = d.AddDays(10).ToShortDateString();
                dd12.Text = d.AddDays(11).ToShortDateString();
                dd13.Text = d.AddDays(12).ToShortDateString();
                dd14.Text = d.AddDays(13).ToShortDateString();
                dd15.Text = d.AddDays(14).ToShortDateString();
                dd16.Text = d.AddDays(15).ToShortDateString();
                dd17.Text = d.AddDays(16).ToShortDateString();
                dd18.Text = d.AddDays(17).ToShortDateString();
                dd19.Text = d.AddDays(18).ToShortDateString();
                dd20.Text = d.AddDays(19).ToShortDateString();
                dd21.Text = d.AddDays(20).ToShortDateString();
                dd22.Text = d.AddDays(21).ToShortDateString();




            }
        }
    }
}