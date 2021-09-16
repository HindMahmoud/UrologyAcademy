using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
namespace EccoHospital
{
    public partial class MonthNum : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if(db.laboratory.Any())
                //{
                //    var f = (from s in db.laboratory select s).ToList();
                //    labss.DataSource = f;
                //    labss.DataTextField = "name";
                //    labss.DataValueField = "id";
                //    labss.DataBind();

                //}

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                   month_days f = db.month_days.FirstOrDefault(a => a.id == x);
                    datetxt.TextMode = TextBoxMode.SingleLine;
                    datetxt.Text = f.date.ToString();
                    numtxt.Text = f.workDays.ToString();



                    // labss.SelectedValue=f.lab_id.ToString();



                    btn.Text = "تعديل";


                }

                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());

                    //var ff = db.car.Where(a => a.id == x).FirstOrDefault();


                    //db.car.Remove(ff);
                    //db.SaveChanges();


                    //Response.Redirect("AddCar.aspx");

                    danger_m.Visible = true;
                    cancel.Visible = true;
                    delbtn.Visible = true;
                }
            }
        }


        protected void reload_Click(object sender, EventArgs e)
        {
            Response.Redirect("MonthNum.aspx");


        }
        protected void btn_Click(object sender, EventArgs e)
        {

            // int lab_id = int.Parse(labss.SelectedValue.ToString());


            if (btn.Text != "تعديل")
            {


                month_days u = new month_days
                {
                    date = Convert.ToDateTime(datetxt.Text),
                workDays = int.Parse(numtxt.Text),


                //lab_id = lab_id,
                //lab_name = labss.SelectedItem.ToString()

            };
                db.month_days.Add(u);
                db.SaveChanges();
                // formContent.Visible = false;
                success_m.Visible = true;

            }
            else
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());
                month_days f = db.month_days.FirstOrDefault(a => a.id == x);

                f.date = Convert.ToDateTime( datetxt.Text);
                f.workDays = int.Parse(numtxt.Text);


                db.SaveChanges();

            }


            //            formContent.Visible = false;
            success_m.Visible = true;

            // MsgBox("Added successfully", this.Page, this);
        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MonthNum.aspx");

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());


                if (db.month_days.Any(a => a.id == x))
                {

                    var p = (from s in db.month_days where s.id == x select s).FirstOrDefault();
                    db.month_days.Remove(p);
                    db.SaveChanges();

                }
                Response.Redirect("MonthNum.aspx");

            }
        }
    }
}