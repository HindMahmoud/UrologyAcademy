using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Accountant
{
    public partial class BankBalance : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void show_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());
                if (from1.Text != "" && to1.Text != "")
                {
                    Response.Redirect("BankBalance.aspx?id=" + x + "&&date1=" + from1.Text + "&&date2=" + to1.Text);
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
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
                int x = int.Parse(Request.QueryString["id"].ToString());
                if (txt_value.Text != "" && txt_value.Text != "0")
                {
                    double inn = 0, outt = 0;
                    if (ddltype.SelectedValue == "in")
                    {
                        inn = double.Parse(txt_value.Text);
                        outt = 0;
                    }
                    else
                    {
                        outt = double.Parse(txt_value.Text);
                        inn = 0;
                    }

                    bank d = db.bank.FirstOrDefault(a => a.id == x);
                    bank_balance da = new bank_balance
                    {

                        in_val = inn,
                        out_val = outt,
                        date = DateTime.Now,
                        bank_id = x,
                        bank_name = d.name.ToString(),
                         type= ddltype.SelectedItem.ToString(),
                        user_id = uid,
                        user_name = uname


                    };
                    db.bank_balance.Add(da);
                    db.SaveChanges();
                    var max = (from s in db.bank_balance select s.id).Max();
                    Acc_save ass = new Acc_save
                    {

                        in_value = inn,
                        out_value = outt,
                        date = DateTime.Now,
                        doc_id = x,

                        doc_acc_id = max,
                        title = ddltype.SelectedItem.ToString() + " " + d.name.ToString(),
                        type = "حساب بنك",
                        notes = txt_notes.Text,
                        del = false,
                        user_id = uid,
                        user_name = uname


                    };
                    db.Acc_save.Add(ass);
                    db.SaveChanges();





                    Response.Redirect("BankBalance.aspx?id=" + x);
                }
            }
        }
    }
}