using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class addStockDestroy : System.Web.UI.Page
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
                //if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                //{
                //    int x = int.Parse(Request.QueryString["editid"].ToString());
                //    DepStock f = db.DepStock.FirstOrDefault(a => a.id == x);
                //    f.

                //    stocks st = db.stocks.FirstOrDefault(a => a.id == f.prod_id);
                //    st.quantity = st.quantity + f.quantity;
                //    db.SaveChanges();
                    
                //    Response.Redirect("addStockDestroy.aspx");

                //}

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    DepStock f = db.DepStock.FirstOrDefault(a => a.id == x);

                    //int uid = int.Parse(Session["user_id"].ToString());
                    //var up = db.users.FirstOrDefault(a => a.id == uid);
                    //string uname = up.name;
                    //log_data lg = new log_data
                    //{
                    //    operation = "حذف من   الهالك" + " " + f.emp_name.ToString(),
                    //    user_id = uid,
                    //    user_name = uname,
                    //    date = DateTime.Now

                    //};
                    //db.log_data.Add(lg); db.SaveChanges();

                    stocks st = db.stocks.FirstOrDefault(a => a.id == f.prod_id);
                    st.quantity = st.quantity + f.quantity;
                    db.SaveChanges();

                    db.DepStock.Remove(f);
                    db.SaveChanges();
                    Response.Redirect("addStockDestroy.aspx");

                }

            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            if (ddlproduct.Text == "")
            { MsgBox("ادخل الصنف", this.Page, this); }


            else if (txtquantity.Text == "")
            { MsgBox("ادخل الكميه", this.Page, this); }
            else
            {


                int? depid = null;
                string depname = null;
                if (ddldep.Text != "")
                {
                    depid = int.Parse(ddldep.SelectedValue.ToString());
                    depname = ddldep.SelectedItem.ToString();
                }
                int item_id = int.Parse(ddlproduct.SelectedValue.ToString());

                stocks st = db.stocks.FirstOrDefault(a => a.id == item_id);
                if (ddldep.Text != "")
                {

                    if (db.DepStock.Any(a => a.prod_id == item_id && a.depid == depid))
                    {

                        stock_destroy s = new stock_destroy
                        {
                            prod_name = ddlproduct.SelectedItem.ToString(),
                            prod_id = int.Parse(ddlproduct.SelectedValue.ToString()),

                            dep_name = depname,
                            dep_id = depid,

                            qty = double.Parse(txtquantity.Text),
                            date = DateTime.Now,
                            source = "عهده"

                        };
                        db.stock_destroy.Add(s);
                        db.SaveChanges();

                        st.quantity = st.quantity - double.Parse(txtquantity.Text);
                        db.SaveChanges();
                        //int uid = int.Parse(Session["user_id"].ToString());
                        //var up = db.users.FirstOrDefault(a => a.id == uid);
                        //string uname = up.name;
                        //log_data lg = new log_data
                        //{
                        //    operation = "اضافه صنف  للهالك  " + " " + ddlproduct.SelectedItem.ToString(),
                        //    user_id = uid,
                        //    user_name = uname,
                        //    date = DateTime.Now

                        //};
                        //db.log_data.Add(lg); db.SaveChanges();


                    }
                    else
                    {

                    }

                }
                else
                {

                    stock_destroy s = new stock_destroy
                    {
                        prod_name = ddlproduct.SelectedItem.ToString(),
                        prod_id = int.Parse(ddlproduct.SelectedValue.ToString()),

                        dep_name = depname,
                        dep_id = depid,

                        qty = double.Parse(txtquantity.Text),
                        date = DateTime.Now,
                        source = "مخزن"

                    };
                    db.stock_destroy.Add(s);
                    db.SaveChanges();

                    st.quantity = st.quantity - double.Parse(txtquantity.Text);
                    db.SaveChanges();
                    //    int uid = int.Parse(Session["user_id"].ToString());
                    //    var up = db.users.FirstOrDefault(a => a.id == uid);
                    //    string uname = up.name;
                    //    log_data lg = new log_data
                    //    {
                    //        operation = "اضافه صنف  للهالك  " + " " + ddlproduct.SelectedItem.ToString(),
                    //        user_id = uid,
                    //        user_name = uname,
                    //        date = DateTime.Now

                    //    };
                    //    db.log_data.Add(lg); db.SaveChanges();

                }
                    Response.Redirect("addStockDestroy.aspx");


                

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