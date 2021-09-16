using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

namespace EccoHospital
{
    public partial class FingerPrintDetails : System.Web.UI.Page
    {
       EccoHospital.Models.EccoHospitalEntities db = new EccoHospital.Models.EccoHospitalEntities();
        private object perNum;
        private string id;
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
               


                //var aa = (from s in db.employee where s.del!=true  select s).ToList();
                //emp.DataTextField = "name";
                //emp.DataValueField = "id";
                //emp.DataSource = aa;

                //emp.DataBind();
                //emp.Items.Insert(0, string.Empty);
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["del"])))
                {
                    int x = int.Parse(Request.QueryString["del"].ToString());
                    var f = db.monthdetails.Where(a => a.id == x ).ToList();

                    delbtn.Visible = true;
                    cancel.Visible = true;
                    danger_m.Visible = true;

                }
            }
        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("FingerPrintDetails.aspx");

        }
        protected void delbtn_Click(object sender, EventArgs e)
        {

            int x = int.Parse(Request.QueryString["del"].ToString());
            var f = db.monthdetails.Where(a => a.id == x ).FirstOrDefault();

            db.monthdetails.Remove(f);

            db.SaveChanges();


            Response.Redirect("FingerPrintDetails.aspx");
        }
        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
        //protected void print_Click(object sender, EventArgs e)
        //{

        //    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])) )
        //    {
        //        DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

        //        DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);





        //        string q = @"select  name ,ssi,address , phone,SUM(money) as total  from customers it  join project_cust v on it.id = v.customer_id  where it.del = 'False' and v.del = 'False' and it.date >= '" + d1 + "' and it.date <= '" + d2 + "' group by it.name,it.ssi,it.phone,it.address ";

        //        string cr = "system/proj/customerAllRPT.rpt";
        //        Session["query"] = q;

        //        Session["cr"] = cr;


        //        Response.Redirect("proj_Report.aspx");

        //    }
        //    else
        //    {



        //        MsgBox("ادخل التاريخ من فضلك", this.Page, this);

        //    }
        //}



        protected void show_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && demo2.Text != "")
            {

                if(emp.Text!="")
                {
                    int x = int.Parse(emp.SelectedValue.ToString());
                Response.Redirect("FingerPrintDetails.aspx?date1=" + from1.Text + "&&date2=" + demo2.Text+"&&emp_id="+x);
                }
                else
                Response.Redirect("FingerPrintDetails.aspx?date1=" + from1.Text + "&&date2=" + demo2.Text);
            }
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["emp_id"])))
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

                int x = int.Parse(Request.QueryString["emp_id"].ToString());
                //employee emp = db.employee.FirstOrDefault(a => a.id == x);
                //int dep = int.Parse(emp.dep_id.ToString());
                //
                //payementList pp = db.payementList.FirstOrDefault(a => a.name == emp.dep_name);
                //if(pp!=null)
                //{
                //    Acc_save s = new Acc_save
                //    {

                //        title = "صرف راتب ل "+" "+emp.name.ToString(),
                //        out_value = double.Parse(txt_sal.Text),
                //        in_value = 0,
                //        date = DateTime.Now,
                //        type = "رواتب",
                //        notes = "",
                //        del = false,
                //        user_id = uid,
                //        user_name = uname,
                //        paylist_id = int.Parse(pp.id.ToString())

                //    };
                //    db.Acc_save.Add(s);
                //    db.SaveChanges();
                }


            }
            }


        //protected void print2_Click(object sender, EventArgs e)
        //{

        //        DateTime ds = DateTime.Now;
        //        DateTime d1 = ds.AddDays(3);

        //        string aa1 = ds.ToString("yyyy-MM-dd HH:mm:ss.fff");
        //        string aa2 = d1.ToString("yyyy-MM-dd HH:mm:ss.fff");

        //    if (from1.Text != "" && demo2.Text != "")
        //    {
        //        DateTime dt = Convert.ToDateTime(from1.Text);
        //        DateTime dt2 = Convert.ToDateTime(demo2.Text);

        //        string aa = dt.ToString("yyyy-MM-dd HH:mm:ss.fff");
        //        string bb = dt2.ToString("yyyy-MM-dd HH:mm:ss.fff");




        //        string q = @"select  name ,ssi,address , phone,SUM(money) as total  from customers it  join project_cust v on it.id = v.customer_id  where it.del = 'False' and v.del = 'False' and it.date >= '" + aa + "' and it.date <= '" + bb + "' and v.isPay1 = 'لا' group by it.name,it.ssi,it.phone,it.address ";
        //        string cr = "system/proj/customerAllRPT.rpt";
        //        Session["query"] = q;

        //        Session["cr"] = cr;


        //        Response.Redirect("proj_Report.aspx");


        //    }

        //    }




        //protected void p_Click(object sender, EventArgs e)
        //{
        //    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date1"])) && !String.IsNullOrEmpty(Convert.ToString(Request.QueryString["date2"])))
        //    {
        //        DateTime d1 = Convert.ToDateTime(Request.QueryString["date1"]);

        //        DateTime d2 = Convert.ToDateTime(Request.QueryString["date2"]);


        //        Response.Redirect("print2.aspx?date1=" + d1 + "&&date2=" + d2);



        //    }

        //    else
        //    {



        //        MsgBox("ادخل التاريخ من فضلك", this.Page, this);

        //    }

        //}

    }
//}