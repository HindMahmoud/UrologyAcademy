using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital.PR
{
    public partial class lab : System.Web.UI.Page

    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.labb f = db.labb.FirstOrDefault(a => a.id == x);
                    txt_name.Value = f.name.ToString();
                    txt_price.Value = f.price.ToString();



                    btn.Text = "تعديل";

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (txt_name.Value == "")
            {
                MsgBox("ادخل الاسم", this.Page, this);
            }
           else if (txt_price.Value == "")
            {
                MsgBox("ادخل السعر", this.Page, this);

            }
            else
            {
                string uname = "";
                int uid = 0;

                if (Session["user"] == null)
                {
                }
                else
                {
                    uid = int.Parse(Session["user_id"].ToString());
                    uname = Session["user"].ToString();

                }

                if (btn.Text == "تعديل")
                {

                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {

                        int x = int.Parse(Request.QueryString["edit"].ToString());

                        EccoHospital.Models.labb f = db.labb.FirstOrDefault(a => a.id == x);
                        f.name = txt_name.Value;
                        f.price = float.Parse(txt_price.Value);

                        db.SaveChanges();
                        success_m.Visible = true;

                    }

                }

                else
                {

                    labb p = new labb
                    {
                        name = txt_name.Value,
                        price = float.Parse(txt_price.Value),
                        user_id=uid,
                        user_name=uname,
                        del=false,
                        date_now=DateTime.Now
                    };
                    db.labb.Add(p);
                    db.SaveChanges();
                    success_m.Visible = true;
                }



            }
            }

        protected void print_Click(object sender, EventArgs e)
        {

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("lab.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                labb p = db.labb.FirstOrDefault(a => a.id == x);
                labb p2 = db.labb.Where(a => a.id == x).FirstOrDefault();

                db.labb.Remove(p);
                db.SaveChanges();
                success_m.Visible = true;
            }
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