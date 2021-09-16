using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class additems : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int ii = 0;

            if (db.stadd.Any())
            {
                var imid = (from s in db.stadd select s.id).Max();
                ii = imid + 1;
            }
            else
            {
                ii = 1;
            }

            //var numinv = 0;
            //int numinvoice = 0;
            //num.Visible = true;
            //if (db.stadd_items.Any())
            //{
            //    numinv = (from s in db.stadd_items select s.id).Max();
            //    numinvoice = numinv + 1;
            //}
            //else
            //{
            //    numinvoice = 1;
            //}
            //impid.Text = numinvoice.ToString();
            if (!IsPostBack)
            {

                var st = (from a in db.stocks select a).ToList();
                if (st != null)
                {
                    name.DataSource = st;
                    name.DataValueField = "id";
                    name.DataTextField = "name";
                    name.DataBind();
                    name.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                }

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["delitem"])))
                {
                    int x = int.Parse(Request.QueryString["delitem"].ToString());
                    stadd_items it = db.stadd_items.FirstOrDefault(a => a.id == x);
                    db.stadd_items.Remove(it);
                    db.SaveChanges();
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edititem"])))
                {
                    int x = int.Parse(Request.QueryString["edititem"].ToString());
                    stadd_items it = db.stadd_items.FirstOrDefault(a => a.id == x);

                    name.SelectedValue = it.prod_id.ToString();
                    qty.Text = it.quantity.ToString();
                    price.Text = it.price.ToString();
                    Button1.Text = "تعديل";

                }
                //else
                //{
                //    var items = db.stadd_items.Where(a => a.status == 0).ToList();
                //    db.stadd_items.RemoveRange(items);
                //    db.SaveChanges();
                //}
            }
            impid.Text = (ii).ToString();

        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Button1.Text != "تعديل")
            {
                if (int.Parse(name.SelectedItem.Value) < 0)
                { MsgBox("اختار الصنف", this.Page, this); }
                else if (qty.Text == "")
                { MsgBox("ادخل الكميه ", this.Page, this); }
                else if (price.Text == "")
                { MsgBox("ادخل السعر ", this.Page, this); }
                else
                {
                    

                    double unitprice = double.Parse(price.Text);
                    double totalprice = unitprice * int.Parse(qty.Text);


                    stadd_items im = new stadd_items
                    {
                        inv_id = int.Parse(impid.Text),
                        prod_id = int.Parse(name.SelectedValue.ToString()),
                        prod_name = name.SelectedItem.ToString(),
                        quantity = double.Parse(qty.Text),
                        price = unitprice,
                        totalprice = totalprice,
                        status = 0,

                    };
                    db.stadd_items.Add(im);
                    db.SaveChanges();
                    name.Text = price.Text = qty.Text = "";
                }
            }
            else
            {
                if (name.Text == "")
                { MsgBox("ادخل الصنف", this.Page, this); }
                else if (qty.Text == "")
                { MsgBox("ادخل الكميه ", this.Page, this); }
                else if (price.Text == "")
                { MsgBox("ادخل السعر ", this.Page, this); }
                else
                {
                    double unitprice = double.Parse(price.Text);
                    double totalprice = unitprice * int.Parse(qty.Text);

                    int x = int.Parse(Request.QueryString["edititem"].ToString());
                    stadd_items it = db.stadd_items.FirstOrDefault(a => a.id == x);

                    it.prod_id = int.Parse(name.SelectedItem.Value.ToString());
                    it.quantity = double.Parse(qty.Text);
                    // it.min_quantity = double.Parse(qty.Text);
                    it.price = unitprice;
                    it.totalprice = totalprice;
                    it.inv_id = int.Parse(impid.Text.ToString());
                    db.SaveChanges();
                    name.Text = price.Text = qty.Text = "";
                    Response.Redirect("additems.aspx");

                }
            }

        }

        protected void btn_additemsinv_Click(object sender, EventArgs e)
        {
            int imp_id = int.Parse(impid.Text);
            var sum = (from s in db.stadd_items where s.status == 0 && s.inv_id == imp_id select s.totalprice).Sum();

            stadd i = new stadd
            {
                id = int.Parse(impid.Text),
                total = sum,
                date = DateTime.Now,
                user_id = int.Parse(Session["user_id"].ToString())
            };
            db.stadd.Add(i);
            db.SaveChanges();
            var v = db.stadd_items.Where(n => n.status == 0 && n.inv_id == imp_id).ToList();
            v.ForEach(a => a.status = 1);
            db.SaveChanges();

            foreach (var item in v)
            {
                int med_id = int.Parse(item.prod_id.ToString());
                double quantity = double.Parse(item.quantity.ToString());

                var product = db.stocks.FirstOrDefault(a => a.id == med_id);
                product.quantity = product.quantity + quantity;
                db.SaveChanges();
            }

            //payment pay = new payment
            //{
            //    date = DateTime.Now.Date,
            //    value = sum,
            //    name = " فاتوره شراء #" + imp_id
            //};
            //Mapper.addpayment(pay);
            //int uid = int.Parse(Session["user_id"].ToString());
            //var up = db.users.FirstOrDefault(a => a.id == uid);
            //string uname = up.name;
            //log_data lg = new log_data
            //{
            //    operation = "اضافه فاتوره شراء للادويه و المتلزمات" + " #" + imp_id.ToString(),
            //    user_id = uid,
            //    user_name = uname,
            //    date = DateTime.Now

            //};
            //Mapper.addLog_data(lg);

            Response.Redirect("additems.aspx");
        
    }
    }
}