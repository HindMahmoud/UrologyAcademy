using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.stock
{
    public partial class addstock : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (db.category.Any())
                {
                    var a = (from s in db.category select s).ToList();

                    ddlcat.DataSource = a;
                    ddlcat.DataTextField = "name";
                    ddlcat.DataValueField = "id";
                    ddlcat.DataBind();
                    ddlcat.Items.Insert(0, "");


                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    stocks f = db.stocks.FirstOrDefault(a => a.id == x);

                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "حذف من قائمه مخزن الاجهزه" + " " + f.name.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();
                    db.stocks.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("addstock.aspx");

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    stocks f = db.stocks.FirstOrDefault(a => a.id == x);
                    name.Text = f.name.ToString();
                    ddlcat.SelectedValue = f.cat_id.ToString();
                    aler.Text = f.alert_qty.ToString();
                    dist.Text = f.dest_time.ToString();
                    Button1.Text = "تعديل";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "تعديل")
            {
                if (name.Text == "")
                { MsgBox("ادخل الصنف", this.Page, this); }

                else if (aler.Text == "")
                { MsgBox("ادخل كميه التنبيه", this.Page, this); }
                else if (ddlcat.Text == "")
                { MsgBox("ادخل التصنيف", this.Page, this); }
                else
                {

                    int t = int.Parse(Request.QueryString["editid"].ToString());
                    stocks f = db.stocks.FirstOrDefault(a => a.id == t);
                    f.name = name.Text;
                    f.cat_id = int.Parse(ddlcat.SelectedValue.ToString());
                    f.cate_name = ddlcat.SelectedItem.ToString();
                    f.alert_qty = double.Parse(aler.Text);
                    f.dest_time = double.Parse(dist.Text);
                    db.SaveChanges();
                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "تعديل بيانات صنف" + " " + f.name.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();
                    Response.Redirect("addstock.aspx");

                }
            }
            else
            {
                if (name.Text == "")
                { MsgBox("ادخل الصنف ", this.Page, this); }

                else if (aler.Text == "")
                { MsgBox("ادخل كميه التنبيه", this.Page, this); }
                else if (ddlcat.Text == "")
                { MsgBox("ادخل التصنيف", this.Page, this); }

                else
                {


                    stocks s = new stocks
                    {
                        name = name.Text,

                        alert_qty = double.Parse(aler.Text),
                        dest_time = double.Parse(dist.Text),
                        quantity = 0,
                        cat_id = int.Parse(ddlcat.SelectedValue.ToString()),
                        cate_name = ddlcat.SelectedItem.ToString()
                    };
                    db.stocks.Add(s);
                    db.SaveChanges();
                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "اضافه صنف لقائمه المخزن" + " " + name.Text,
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();
                    Response.Redirect("addstock.aspx");

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