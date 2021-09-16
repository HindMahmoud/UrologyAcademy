using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital.Accountant
{
    public partial class ClinicCalcu : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (db.doctor.Any())
                {
                    var a = (from s in db.doctor select s).ToList();
                    docList.DataTextField = "name";
                    docList.DataValueField = "id";
                    docList.DataSource = a;

                    docList.DataBind();
                    docList.Items.Insert(0, string.Empty);
                }

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
                {
                    
                    int doc_id = int.Parse(Request.QueryString["id"].ToString());
                    DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                    DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                    var x = (from p in db.patient_history

                             where p.doc_id == doc_id && (p.type == "مرور" || p.type == "عيادات") && p.date >= d1 && p.date < d2
                             && p.confirm_calc == false /*&& p.doc_acc == false*/
                             select p).ToList();

                    txt_total.Text = (x.Sum(a => a.price)).ToString();
                }

                }
        }

        protected void docList_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (docList.Text != ""&&txt_from.Text!=""&&txt_to.Text!="")
            {
                Response.Redirect("ClinicCalcu.aspx?id=" + docList.SelectedValue.ToString()+"&&date1="+txt_from.Text+"&&date2="+txt_to.Text);
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
            {

                int doc_id = int.Parse(Request.QueryString["id"].ToString());
                DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

                DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);
                EccoHospital.Models.doctor dd = db.doctor.FirstOrDefault(a => a.id == doc_id);

                var x = (from p in db.patient_history

                         where p.doc_id == doc_id && (p.type == "مرور" || p.type == "عيادات") && p.date >= d1 && p.date < d2
                         && p.confirm_calc == false 
                         select p).ToList();

                x.ForEach(a => a.confirm_calc = true);
                db.SaveChanges();
                //x.ForEach(a => a.doc_acc = true);
                //db.SaveChanges();
                doctor_account da = new doctor_account
                {
                   
                    in_val = double.Parse(txt_total.Text),
                    out_val = 0,
                    date = DateTime.Now.Date,
                    doc_id = doc_id,
                    doc_name = dd.name.ToString(),
                    title = "حساب عيادات و مرور",
                    type = "عيادات و مرور",
                    p_historyID = null

                };
                db.doctor_account.Add(da);
                db.SaveChanges();


                Response.Redirect("ClinicCalcu.aspx?id=" + Request.QueryString["id"].ToString() + "&&date1=" + Request.QueryString["date1"].ToString() + "&&date2=" + Request.QueryString["date2"].ToString());


            }

        }
    }
}