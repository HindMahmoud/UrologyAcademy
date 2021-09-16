using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class DepItems : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (db.stocks.Any())
                {
                    var a = (from s in db.stocks select s).ToList();

                    ddlproduct.DataSource = a;
                    ddlproduct.DataTextField = "name";
                    ddlproduct.DataValueField = "id";
                    ddlproduct.DataBind();
                    ddlproduct.Items.Insert(0, "");


                }

                if (db.departments.Any())
                {
                    var a = (from s in db.departments select s).ToList();

                    ddldep.DataSource = a;
                    ddldep.DataTextField = "name";
                    ddldep.DataValueField = "id";
                    ddldep.DataBind();
                    ddldep.Items.Insert(0, "");


                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    DepStock f = db.DepStock.FirstOrDefault(a => a.id == x);

                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "حذف من  عهده موظف" + " " + f.emp_name.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();
                    db.DepStock.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("DepItems.aspx");

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    DepStock f = db.DepStock.FirstOrDefault(a => a.id == x);
                    ddldep.SelectedValue = f.depid.ToString();
                    ddlproduct.SelectedValue = f.prod_id.ToString();
                    txtquantity.Text = f.quantity.ToString();
                    Button1.Text = "تعديل";


                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text == "تعديل")
            {
                if (ddlproduct.Text == "")
                { MsgBox("ادخل الصنف", this.Page, this); }

                else if (ddldep.Text == "")
                { MsgBox("ادخل  القسم", this.Page, this); }
                else if (txtquantity.Text == "")
                { MsgBox("ادخل الكميه", this.Page, this); }
                else
                {

                    int t = int.Parse(Request.QueryString["editid"].ToString());
                    DepStock f = db.DepStock.FirstOrDefault(a => a.id == t);
                    f.prod_name = ddlproduct.SelectedItem.ToString();
                    f.prod_id = int.Parse(ddlproduct.SelectedValue.ToString());

                    f.dep_name = ddldep.SelectedItem.ToString();
                    f.depid = int.Parse(ddldep.SelectedValue.ToString());

                    f.quantity = double.Parse(txtquantity.Text);

                    db.SaveChanges();
                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "تعديل بيانات عهده موظف" + " " + f.emp_name.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();
                    Response.Redirect("DepItems.aspx");

                }
            }
            else
            {
                if (ddlproduct.Text == "")
                { MsgBox("ادخل الصنف", this.Page, this); }

                else if (ddldep.Text == "")
                { MsgBox("ادخل  القسم", this.Page, this); }
                else if (txtquantity.Text == "")
                { MsgBox("ادخل الكميه", this.Page, this); }
                else
                {


                    DepStock s = new DepStock
                    {
                        prod_name = ddlproduct.SelectedItem.ToString(),
                        prod_id = int.Parse(ddlproduct.SelectedValue.ToString()),
                        dep_name = ddldep.SelectedItem.ToString(),
                        depid = int.Parse(ddldep.SelectedValue.ToString()),

                        quantity = double.Parse(txtquantity.Text),
                        date = DateTime.Now

                    };
                    db.DepStock.Add(s);
                    db.SaveChanges();
                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "اضافه صنف  لعهده موظف " + " " + ddlemp.SelectedItem.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();
                    Response.Redirect("DepItems.aspx");

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