using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class addmed : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    medicin f = db.medicin.FirstOrDefault(a => a.id == x);

                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    db.medicin.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("addmed.aspx");

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    medicin f = db.medicin.FirstOrDefault(a => a.id == x);
                    name.Text = f.name.ToString();
                    price.Text = f.price.ToString();
                    code.Text = f.code.ToString();
                    aler.Text = f.alert_qty.ToString();
                    alert_date.Text = f.alert_ex_date.ToString();


                    Button1.Text = "تعديل";


                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "تعديل")
            {
                if (name.Text == "")
                { MsgBox("ادخل الدواء", this.Page, this); }
                else if (price.Text == "")
                { MsgBox("ادخل السعر", this.Page, this); }
                else if (aler.Text == "")
                { MsgBox("ادخل كيمه التنبيه", this.Page, this); }
                else if (code.Text == "")
                { MsgBox("ادخل كود الصنف", this.Page, this); }
                else if (alert_date.Text == "")
                { MsgBox("ادخل تبيه الصلاحيه", this.Page, this); }
                else
                {

                    int t = int.Parse(Request.QueryString["editid"].ToString());
                    medicin f = db.medicin.FirstOrDefault(a => a.id == t);
                    f.name = name.Text;
                    f.price = double.Parse(price.Text);
                    f.alert_qty = double.Parse(aler.Text);
                    f.alert_ex_date = int.Parse(alert_date.Text);

                    f.code = code.Text;
                    db.SaveChanges();
                    Response.Redirect("addmed.aspx");

                }
            }
            else
            {
                if (name.Text == "")
                { MsgBox("ادخل الدواء", this.Page, this); }
                else if (price.Text == "")
                { MsgBox("ادخل السعر", this.Page, this); }
                else if (aler.Text == "")
                { MsgBox("ادخل كيمه التنبيه", this.Page, this); }
                else if (code.Text == "")
                { MsgBox("ادخل كود الصنف", this.Page, this); }

                else if (alert_date.Text == "")
                { MsgBox("ادخل تبيه الصلاحيه", this.Page, this); }

                else
                {

                    if (db.medicin.Any(a => a.code == code.Text))
                    {
                        MsgBox("هذا الكود مدخل مسبقا", this.Page, this);
                    }
                    else
                    {
                        medicin s = new medicin
                        {
                            name = name.Text,
                            price = double.Parse(price.Text),
                            code = code.Text,
                            alert_qty = double.Parse(aler.Text),
                            alert_ex_date = int.Parse(alert_date.Text),
                            quantity = 0
                        };
                        db.medicin.Add(s);
                        db.SaveChanges();
                        Response.Redirect("addmed.aspx");
                    }
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
      

    }
}