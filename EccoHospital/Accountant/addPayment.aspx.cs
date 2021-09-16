using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Accountant
{
    public partial class addPayment : System.Web.UI.Page
    {

        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (db.payementList.Any())
                {
                    var rep = (from s in db.payementList select s).ToList();

                    ddlpay.DataSource = rep;

                    ddlpay.DataTextField = "name";
                    ddlpay.DataValueField = "id";
                    ddlpay.DataBind();
                    ddlpay.Items.Insert(0, "");

                }

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))


                {
                    int id = int.Parse(Request.QueryString["edit"].ToString());
                    Acc_save a = db.Acc_save.FirstOrDefault(w => w.id == id);


                    txt_byan.Value = a.title.ToString();
                    txt_value.Value = a.out_value.ToString();


                    txt_notes.Text = a.notes.ToString();

                    ddlpay.SelectedValue = a.paylist_id.ToString();

                    btn.Text = "تعديل";

                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
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





            if (txt_byan.Value == "")
            {
                MsgBox("ادخل  البيان", this.Page, this);
            }

            else if (txt_value.Value == "")
            {
                MsgBox("ادخل  القيمه", this.Page, this);
            }
            else if (ddlpay.Text == "")
            {
                MsgBox("ادخل  البند", this.Page, this);
            }
            else {

                if (btn.Text == "تعديل")
                {
                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))


                    {
                        int id = int.Parse(Request.QueryString["edit"].ToString());
                        Acc_save a = db.Acc_save.FirstOrDefault(w => w.id == id);
                        a.title = txt_byan.Value;
                        a.out_value = double.Parse(txt_value.Value);

                        a.notes = txt_notes.Text;

                        a.paylist_id = int.Parse(ddlpay.SelectedValue.ToString());
                        db.SaveChanges();


                    }
                    }
                else
                {

                    Acc_save s = new Acc_save
                    {

                        title = txt_byan.Value,
                        out_value = double.Parse(txt_value.Value),
                        in_value = 0,
                        date = DateTime.Now,
                        type = "مصروفات",
                        notes = txt_notes.Text,
                        del = false,
                        user_id = uid,
                        user_name = uname,
                        paylist_id = int.Parse(ddlpay.SelectedValue.ToString())

                    };
                    db.Acc_save.Add(s);
                    db.SaveChanges();
                }
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