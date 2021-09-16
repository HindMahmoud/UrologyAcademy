using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;


namespace EccoHospital.PR
{
    public partial class radd : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.rad f = db.rad.FirstOrDefault(a => a.id == x);
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
            if (txt_price.Value == "")
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

                        EccoHospital.Models.rad f = db.rad.FirstOrDefault(a => a.id == x);
                        f.name = txt_name.Value;
                        f.price = float.Parse(txt_price.Value);

                        db.SaveChanges();
                        success_m.Visible = true;

                    }

                }

                else
                {

                   EccoHospital.Models. rad p = new EccoHospital.Models. rad
                    {
                        name = txt_name.Value,
                        price = float.Parse(txt_price.Value),
                        user_name=uname,
                        user_id=uid,
                        del=false,
                        date_now=DateTime.Now
                    };
                    db.rad.Add(p);
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
            Response.Redirect("rad.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

               EccoHospital.Models. rad p = db.rad.FirstOrDefault(a => a.id == x);
             EccoHospital.Models.rad  p2 = db.rad.Where(a => a.id == x).FirstOrDefault();

                db.rad.Remove(p);
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