using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class newSell : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int ii = 0;

            if (db.invoice.Any())
            {
                var imid = (from s in db.invoice select s.id).Max();
                ii = imid + 1;
            }
            else
            {
                ii = 1;
            }
            if (!IsPostBack)
            {

                var st = (from a in db.medicin select a).ToList();
                if (st != null)
                {
                    name.DataSource = st;
                    name.DataValueField = "id";
                    name.DataTextField = "name";
                    name.DataBind();
                    name.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                }
                var dr = (from a in db.departments select a).ToList();
                if (dr != null)
                {
                    DropDownList1.DataSource = dr;
                    DropDownList1.DataValueField = "id";
                    DropDownList1.DataTextField = "name";
                    DropDownList1.DataBind();
                    DropDownList1.Items.Insert(0, new ListItem(String.Empty, String.Empty));

                }

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["delitem"])))
                {
                    int x = int.Parse(Request.QueryString["delitem"].ToString());
                    invoice_items it = db.invoice_items.FirstOrDefault(a => a.id == x);
                    db.invoice_items.Remove(it);
                    db.SaveChanges();
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edititem"])))
                {
                    int x = int.Parse(Request.QueryString["edititem"].ToString());
                    invoice_items it = db.invoice_items.FirstOrDefault(a => a.id == x);

                    name.SelectedValue = it.med_id.ToString();
                    qty.Text = it.quantity.ToString();
                   
                    Button1.Text = "تعديل";

                }
                else
                {
                    var items = db.invoice_items.Where(a => a.order_status == 0).ToList();
                    db.invoice_items.RemoveRange(items);
                    db.SaveChanges();
                }
                
            }


            invid.Text = (ii).ToString();

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
              
                else
                {
                    var numinv = 0;
                    int numinvoice = 0;
                    if (db.invoice_items.Any())
                    {
                        numinv = (from s in db.invoice_items select s.id).Max();
                        numinvoice = numinv + 1;
                    }
                    else
                    {
                        numinvoice = 1;
                    }
                    num.Text = numinv.ToString();

                    invoice_items im = new invoice_items
                    {
                        inv_id = int.Parse(invid.Text),
                        med_id = int.Parse(name.SelectedValue.ToString()),
                        name = name.SelectedItem.ToString(),
                        quantity = int.Parse(qty.Text),
                       
                        order_status = 0

                    };
                    db.invoice_items.Add(im);
                    db.SaveChanges();
                    name.Text = qty.Text = "";
                }
            }
            else
            {
                if (name.Text == "")
                { MsgBox("ادخل الصنف", this.Page, this); }
                else if (qty.Text == "")
                { MsgBox("ادخل الكميه ", this.Page, this); }
                //else if (price.Text == "")
                //{ MsgBox("ادخل السعر ", this.Page, this); }
                else
                {
                    
                    int x = int.Parse(Request.QueryString["edititem"].ToString());
                    invoice_items it = db.invoice_items.FirstOrDefault(a => a.id == x);

                    it.med_id = int.Parse(name.SelectedItem.Value.ToString());
                    it.quantity = int.Parse(qty.Text);
               

                    db.SaveChanges();
                    name.Text =  qty.Text = "";


                }
            }
        }

        protected void btn_addImport_Click(object sender, EventArgs e)
        {
            int imp_id = int.Parse(invid.Text);
            var sum = (from s in db.import_items where s.order_status == 0 && s.imp_id == imp_id select s.total_price).Sum();

            invoice i = new invoice
            {
                id = int.Parse(invid.Text),
                total = sum,
                date = DateTime.Now,
                total2=float.Parse(DropDownList1.SelectedItem.Value),
                user_id = int.Parse(Session["user_id"].ToString())
            };
            db.invoice.Add(i);
            db.SaveChanges();
            var v = db.invoice_items.Where(n => n.order_status == 0 && n.inv_id == imp_id).ToList();
            v.ForEach(a => a.order_status = 1);
            db.SaveChanges();

            foreach (var item in v)
            {
                int med_id = int.Parse(item.med_id.ToString());
                double quantity = double.Parse(item.quantity.ToString());

                var product = db.medicin.FirstOrDefault(a => a.id == med_id);
                product.quantity = product.quantity - quantity;
                //if (product.quantity <= 0)
                //{
                //    MsgBox("الكمية اقل من 0", this.Page, this);
                //}
                //else
                //{
                    db.SaveChanges();
                //}
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

            Response.Redirect("newSell.aspx");
        }
    
}
}