using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

public partial class login : System.Web.UI.Page
{
    static EccoHospitalEntities ecco = new EccoHospitalEntities();
    protected void Page_Load(object sender, EventArgs e)
    { 
        Session.Clear();
        if (!IsPostBack)
        {
            if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
            {
                TextBox1.Text = Request.Cookies["UserName"].Value;
                TextBox2.Attributes["value"] = Request.Cookies["Password"].Value;
            }

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["off"])))
            {
                Session["user"] = null;
                Session["UserName"] = null;
                Session["Password"] = null;

                Response.Redirect("login.aspx");
            }



        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //DateTime today = DateTime.Now;
        //DateTime day30 = new DateTime(30, 5, 2018);
        //if (today <= day30)
        //{
        if (TextBox1.Text == "")
        {
            MsgBox("ادخل اسم المستخدم !", this.Page, this);
        }
        else if (TextBox2.Text == "")
        {
            MsgBox("ادخل الرقم السري !", this.Page, this);
        }

        else
        {
            if (ecco.user.Any(a => a.user_name == TextBox1.Text)/*|| ecco.pr.Any(a => a.user_name == TextBox1.Text)*/)
            {
                var f = (from ss in ecco.user where ss.user_name == TextBox1.Text select ss.password).FirstOrDefault();
                //  var ff = (from ss in ecco.pr where ss.user_name == TextBox1.Text select ss.password).FirstOrDefault();
                string x, xx;
                if (f == null)
                {
                    x = "";
                }
                else
                {
                    x = f.ToString();
                }

                //if (ff == null)
                //{
                //    xx = "";
                //}
                //else
                //{
                //    xx = ff.ToString();
                //}
                EccoHospitalEntities db = new EccoHospitalEntities();


                if (x == TextBox2.Text/* || xx == TextBox2.Text*/)
                {
                    Session["user"] = TextBox1.Text;
                    user u = ecco.user.FirstOrDefault(r => r.user_name == TextBox1.Text);
                    Session["role"] = u.priv;
                    Session["user_id"] = u.id.ToString();
                    Session["user"] = u.user_name;
                    Session["name"] = u.name;
                    
                    Session["ClinicName"] = u.clinic_name;
                    Session["clinicid"] = u.clinic_id;
                    //edu_year z = db.edu_year.FirstOrDefault(a => a.fl == true);
                    //var zz = z.name.ToString();
                    //Session["yeare"] = zz;


                    if (u.priv == null)
                    {
                        Response.Redirect("login.aspx");


                    }

                    else if (u.priv.ToString() == "Admin")
                    {
                        Response.Redirect("/index.aspx");

                    }
                    else if (u.priv.ToString() == "PR")
                    {
                        Response.Redirect("/PR/index.aspx");

                    }
                    else if (u.priv.ToString() == "Lab")
                    {
                        Response.Redirect("/lab/index.aspx");

                    }
                    else if (u.priv.ToString() == "Rad")
                    {
                        Response.Redirect("/rad/index.aspx");

                    }
                    else if (u.priv.ToString() == "Accountant")
                    {
                        Response.Redirect("/Accountant/index.aspx");

                    }
                    else if (u.priv.ToString() == "Financial Manager")
                    {
                        Response.Redirect("/Accountant/index.aspx");

                    }
                    else if (u.priv.ToString() == "Pharmacy")
                    {
                        Response.Redirect("/Pharmacy/index.aspx");

                    }
                    else if (u.priv.ToString() == "Reception")
                    {
                        Response.Redirect("/reception/index.aspx");

                    }
                    //else if (u.priv.ToString() == "Save")
                    //{
                    //    Response.Redirect("/saavee/index.aspx");

                    //}
                    else if (u.priv.ToString() == "stock")
                    {
                        Response.Redirect("/stock/addmed.aspx");

                    }
                    else if (u.priv.ToString() == "External Clinics")
                    {
                        Response.Redirect("/External Clinics/index.aspx");

                    }
                    else if (u.priv.ToString() == "Nursery")
                    {
                        Response.Redirect("/Nursery/indexNurs.aspx");

                    }
                    else if (u.priv.ToString() == "Blood")
                    {
                        Response.Redirect("/BloodBank/index.aspx");

                    }

                    //else Reception
                    //    Response.Redirect("login.aspx");

                }
                else { MsgBox("الرقم السري غير صحيح !", this.Page, this); }
            }
            else { MsgBox("اسم المستخدم غير صحيح !", this.Page, this); }

        }
        //if (CheckBox1.Checked)
        //{
        //    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
        //    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
        //}
        //else
        //{
        //    Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
        //    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

        //}
        //Response.Cookies["UserName"].Value = TextBox1.Text.Trim();
        //Response.Cookies["Password"].Value = TextBox2.Text.Trim();
        //}
        //else
        //{
        //    MsgBox("licence expired", this.Page, this);
        //}

    }
    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }

   
}