using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.reception
{
    public partial class investigation : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        CheckBox mycheck = new CheckBox();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (db.device.Any())
                {
                    var cr = (from d in db.device select d).ToList();
                    dd.DataSource = cr;
                    dd.DataTextField = "name";
                    dd.DataValueField = "id";
                    dd.DataBind();
                }


                if (!string.IsNullOrEmpty(Request.QueryString["surg_id"]))
                {
                    int yy = int.Parse((Request.QueryString["surg_id"].ToString()));
                    var y = (from b in db.Surgery_history where b.id == yy select b).FirstOrDefault();
                    DateTime v = DateTime.Now;
                    // da.Value = TextBoxMode.SingleLine.ToString();
                    if (y != null)
                    {
                        dalbl.InnerText = y.date.ToString();
                    }
                    else dalbl.InnerText = v.ToString();
                }
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["surg_id"]))
            {

                int x = int.Parse(Request.QueryString["surg_id"]);
                Surgery_history sut = (from d in db.Surgery_history where d.id == x select d).FirstOrDefault();
                sut.trent = tret.Text;
                sut.previous_opeation = operations.Text;
                sut.operation_description = desctxt.Text;
                sut.Drauis = dratxt.Text;
                sut.Tubes = Tubestxt.Text;
                sut.cathers = cathertxt.Text;
                sut.stitches = stitxt.Text;
                sut.stuits = Stuitstxt.Text;
                sut.Dressuis = dresstxt.Text;
                sut.Prosthetic = proctxt.Text;
                sut.other_instruction = TextBox1.Text;
                sut.notes = TextBox1.Text;
                db.SaveChanges();


                #region foorLoopCh
                foreach (ListItem item in dd.Items)

                    if (item.Selected)
                    {
                        int idlab = int.Parse(item.Value);
                        double? priceLab = (from m in db.device where m.id == idlab select m.price).FirstOrDefault();
                        device_history dd = new device_history
                        {
                            surgery_id = x,
                            device_id = int.Parse(item.Value.ToString()),
                            device_name = item.Text.ToString(),
                            price = priceLab
                        };
                        db.device_history.Add(dd);
                        db.SaveChanges();
                    }

                #endregion

                Response.Redirect("patprofile.aspx?patid=" + sut.p_id);
            }
        }

        protected void dd_SelectedIndexChanged(object sender, EventArgs e)
        {

            int s = 0;

            double total = 0;
            foreach (ListItem item in dd.Items)
            {
                if (item.Selected)
                {
                    s = int.Parse(item.Value.ToString());
                    if (db.device.Any(a => a.id == s))
                    {
                        device pt = db.device.FirstOrDefault(a => a.id == s);
                        //txt_price.Value = pt.price.ToString()+",";
                        // txt_price.Disabled = true;
                        total = double.Parse(pt.price.Value.ToString()) + total;

                    }
                }
            }

            txt_price.Value = total.ToString();

        }
    } }