using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Accountant
{
    public partial class DocBalance : System.Web.UI.Page
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
                    Response.Redirect("DocBalance.aspx?id="+x+"&&date1=" + from1.Text + "&&date2=" + to1.Text);
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

                    doctor d = db.doctor.FirstOrDefault(a => a.id == x);
                    doctor_account da = new doctor_account
                    {
                      
                        in_val = inn,
                        out_val =outt ,
                        date = DateTime.Now,
                        doc_id = x,
                        doc_name = d.name.ToString(),
                        title = ddltype.SelectedItem.ToString(),
                        type = "auto",
                        notes=txt_notes.Text
                       

                    };
                    db.doctor_account.Add(da);
                    db.SaveChanges();
                    var max = (from s in db.doctor_account select s.id).Max();
                    Acc_save ass = new Acc_save
                    {

                        in_value = inn,
                        out_value = outt,
                        date = DateTime.Now,
                        doc_id=x,
                        
                        doc_acc_id = max,
                        title = ddltype.SelectedItem.ToString() +" "+d.name.ToString(),
                        type = "حساب طبيب",
                        notes = txt_notes.Text,
                        del=false,
                        user_id=uid,
                        user_name=uname


                    };
                    db.Acc_save.Add(ass);
                    db.SaveChanges();





                    Response.Redirect("DocBalance.aspx?id=" + x);
                }
            }
        }
    }
}