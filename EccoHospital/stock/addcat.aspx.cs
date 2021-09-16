using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class addcat : System.Web.UI.Page
    {
       EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    category f = db.category.FirstOrDefault(a => a.id == x);

                   // int uid = int.Parse(Session["user_id"].ToString());
                   // var up = db.user.FirstOrDefault(a => a.id == uid);
                   // string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "حذف تصنيف" + " " + f.name.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();

                    db.category.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("addCat.aspx");

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    category f = db.category.FirstOrDefault(a => a.id == x);
                    name.Text = f.name.ToString();
                    Button1.Text = "تعديل";


                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Button1.Text == "تعديل")
            {
                if (name.Text == "")
                { MsgBox("ادخل الاسم", this.Page, this); }

                else
                {
                    int t = int.Parse(Request.QueryString["editid"].ToString());
                    category f = db.category.FirstOrDefault(a => a.id == t);
                    f.name = name.Text;

                    db.SaveChanges();
                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "تعديل بيانات تصنيف" + " " + f.name.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();
                    Response.Redirect("addCat.aspx");
                }
            }
            else
            {
                if (name.Text == "")
                { MsgBox("ادخل الاسم", this.Page, this); }


                else
                {
                    //string n = Session["name"].ToString();
                   // int d = int.Parse(Session["user_id"].ToString());
                    category s = new category
                    {
                        name = name.Text,
                    };
                    db.category.Add(s);
                    db.SaveChanges();
                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "اضافه ف قائمه موظفين" + " " + name.Text,
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg);
                    //db.SaveChanges();
                    Response.Redirect("addCat.aspx");
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