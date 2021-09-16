using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.stock
{
    public partial class newToread : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int ii = 0;
            
            if (db.import.Any())
            {
                var imid = (from s in db.import select s.id).Max();
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

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["delitem"])))
                {
                    int x = int.Parse(Request.QueryString["delitem"].ToString());
                    import_items it = db.import_items.FirstOrDefault(a => a.id == x);
                    db.import_items.Remove(it);
                    db.SaveChanges();
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edititem"])))
                {
                    int x = int.Parse(Request.QueryString["edititem"].ToString());
                    import_items it = db.import_items.FirstOrDefault(a => a.id == x);

                    name.SelectedValue = it.med_id.ToString();
                    qty.Text = it.quatity.ToString();
                    price.Text = it.price.ToString();
                    Button1.Text = "تعديل";

                }
                //else
                //{
                //    var items = db.import_items.Where(a => a.order_status == 0).ToList();
                //    db.import_items.RemoveRange(items);
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
                {//int codevar= int.Parse(code.Text);
                   // var codes = (from i in db.import where i.id == codevar select i).ToList();
                   // if (codes.Count == 0)
                    //{
                        //var numinv = 0;
                        //int numinvoice = 0;

                        //if (db.import_items.Any())
                        //{
                        //    numinv = (from s in db.import select s.id).Max();
                        //    numinvoice = numinv + 1;
                        //}
                        //else
                        //{
                        //    numinvoice = 1;
                        //}
                       // num.Text = codes.ToString();// numinv.ToString();


                        double unitprice = double.Parse(price.Text);
                        double totalprice = unitprice * int.Parse(qty.Text);

                    int impidd=(from f in db.import select f.idnum).Max();
                        import_items im = new import_items
                        {
                            imp_id = int.Parse(impid.Text),
                            med_id = int.Parse(name.SelectedValue.ToString()),
                            name = name.SelectedItem.ToString(),
                            quatity = double.Parse(qty.Text),
                            price = unitprice,
                            total_price = totalprice,
                            order_status = 0,

                        };
                        db.import_items.Add(im);
                        db.SaveChanges();
                        name.Text = price.Text = qty.Text = "";
                   // }
                    //else { MsgBox("الكود موجود مسبقا!", this.Page, this); }
                }
               
            }
            else
            {
                if (name.Text=="" )
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
                    import_items it = db.import_items.FirstOrDefault(a => a.id == x);

                    it.med_id = int.Parse(name.SelectedItem.Value.ToString());
                    it.quatity = double.Parse(qty.Text);
                   // it.min_quantity = double.Parse(qty.Text);
                    it.price = unitprice;
                    it.total_price = totalprice;
                   
                    db.SaveChanges();
                    name.Text = price.Text =  qty.Text ="";
                    Response.Redirect("newToread.aspx");

                }
            }
        }

        protected void btn_addImport_Click(object sender, EventArgs e)
        {
           // int codevar = int.Parse(code.Text);
            int imp_id = int.Parse(impid.Text);
            var sum = (from s in db.import_items where s.order_status == 0 && s.imp_id == imp_id select s.total_price).Sum();
          
                import i = new import
                {
                    id=imp_id,
                    total = sum,
                    date = DateTime.Now,
                    user_id = int.Parse(Session["user_id"].ToString())
                };
                db.import.Add(i);
                db.SaveChanges();
                var v = db.import_items.Where(n => n.order_status == 0 && n.imp_id == imp_id).ToList();
                v.ForEach(a => a.order_status = 1);
                db.SaveChanges();

                foreach (var item in v)
                {
                    int med_id = int.Parse(item.med_id.ToString());
                    double quantity = double.Parse(item.quatity.ToString());

                    var product = db.medicin.FirstOrDefault(a => a.id == med_id);
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
           
           
            Response.Redirect("newToread.aspx");
        }
    }
}