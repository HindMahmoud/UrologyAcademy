using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using EccoHospital.Models;

public partial class reception_p_profile : System.Web.UI.Page
{
    EccoHospitalEntities db = new EccoHospitalEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        //if (!IsPostBack)
        //{

        //    var aa = (from r in db.doctor select r).ToList();
        //    doctor.DataTextField = "name";
        //    doctor.DataValueField = "id";
        //    doctor.DataSource = aa;

        //    doctor.DataBind();

        //    doctor.Items.Insert(0, new ListItem(String.Empty, String.Empty));


        //    var aa2 = (from r in db.company select r).ToList();
        //    company.DataTextField = "name";
        //    company.DataValueField = "id";
        //    company.DataSource = aa2;

        //    company.DataBind();

        //    company.Items.Insert(0, new ListItem(String.Empty, String.Empty));

        //    var aa3 = (from r in db.doctor select r).ToList();
        //    redirected.DataTextField = "name";
        //    redirected.DataValueField = "id";
        //    redirected.DataSource = aa3;

        //    redirected.DataBind();

        //    redirected.Items.Insert(0, new ListItem(String.Empty, String.Empty));

        //    var aa4 = (from r in db.department select r).ToList();
        //    dep.DataTextField = "name";
        //    dep.DataValueField = "id";
        //    dep.DataSource = aa4;

        //    dep.DataBind();

        //    dep.Items.Insert(0, new ListItem(String.Empty, String.Empty));


        //    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
        //    {
        //        int x = int.Parse(Request.QueryString["edit"].ToString());
        //        string n = "", u = "";
        //        if (Session["user"] != null && Session["name"] != null)
        //        {
        //            n = Session["name"].ToString();
        //            u = Session["user"].ToString();

        //        }
        //        int user_id = (from s in db.users where s.user_name == u select s.id).FirstOrDefault();
        //        date1.TextMode = TextBoxMode.SingleLine;
        //        date2.TextMode = TextBoxMode.SingleLine;

        //        patient_profile f = db.patient_profile.FirstOrDefault(a => a.p_code == x);

        //        redirected.Text = f.doc_id.ToString();
        //        date1.Text = f.entry_date.ToString();
        //        var dd = f.exit_date;
        //        if(dd !=null)
        //        {
        //            date2.Text = dd.ToString();

        //        }
        //        else { date2.Text = ""; }
        //        dep.Text = f.dep_id.ToString();
        //        doctor.Text = f.doc_id.ToString();
        //        price.Text = f.insurance_money.ToString();
        //        notes.Text = f.notes.ToString();
        //        company.Text = f.company_id.ToString();
        //        name2.Text = f.r_name.ToString();
        //        relative.Text = f.r_degree.ToString();
        //        address2.Text = f.r_address.ToString();
        //        ssi2.Text = f.r_ssi.ToString();
        //        mob2.Text = f.r_phone.ToString();
        //        job2.Text = f.r_job.ToString();


        //        btnSave.Text = "تعديل";



        //    }
        //}

    }
    protected void reload_Click(object sender, EventArgs e)
    {

        Response.Redirect("p_profile.aspx");

    }
    //protected void btnSave_Click(object sender, EventArgs e)
    //{

    //    if (!string.IsNullOrEmpty(Convert.ToString(Request.QueryString["c"])))
    //    {



    //        int zz = int.Parse(Request.QueryString["c"].ToString());
    //        var nn = (from w in db.patient where w.code == zz select w.name).FirstOrDefault();
    //        if (btnSave.Text != "تعديل")
    //        {
    //            string n = "", u = "";
    //            if (Session["user"] != null && Session["name"] != null)
    //            {
    //                n = Session["name"].ToString();
    //                u = Session["user"].ToString();

    //            }
    //            int user_id = (from s in db.users where s.user_name == u select s.id).FirstOrDefault();




    //            patient_profile st = new patient_profile

    //            {


    //                doc_id = int.Parse(redirected.SelectedValue.ToString()),
    //                doc_name = doctor.SelectedItem.ToString(),

    //                entry_date = DateTime.Parse(date1.Text),
    //                exit_date = DateTime.Parse(date2.Text),
    //                dep_id = int.Parse(dep.SelectedValue.ToString()),
    //                dep_name = dep.SelectedItem.ToString(),

    //                p_code = zz,
    //                p_name=nn,
    //                insurance_money = float.Parse(price.Text),
    //                notes = notes.Text,
    //                company_id = int.Parse(company.SelectedValue.ToString()),
    //                company_name = company.SelectedItem.ToString(),
    //                r_name = name2.Text,
    //                r_degree = relative.Text,
    //                r_address = address2.Text,
    //                r_ssi = ssi2.Text,
    //                r_phone = mob2.Text,
    //                r_job = job2.Text,

    //                del = false,
    //                user_id = user_id
    //                ,
    //                user_name = n,
    //                dateNow = DateTime.Now





    //            };
    //            db.patient_profile.Add(st);
    //            db.SaveChanges();

    //            formContent.Visible = false;
    //            message.Visible = true;





    //        }
    //        else
    //        {

    //            int x = int.Parse(Request.QueryString["edit"].ToString());
    //            patient_profile f = db.patient_profile.FirstOrDefault(a => a.p_code == x);

    //            string n = "";
    //            if (Session["name"] != null)
    //            {
    //                n = Session["name"].ToString();
    //            }
    //            int user_id = (from s in db.users where s.user_name == n select s.id).FirstOrDefault();

    //            f.doc_id = int.Parse(redirected.SelectedValue.ToString());
    //            f.doc_name = doctor.SelectedItem.ToString();

    //            f.entry_date = DateTime.Parse(date1.Text);
    //            f.exit_date = DateTime.Parse(date2.Text);
    //            f.dep_id = int.Parse(dep.SelectedValue.ToString());
    //            f.dep_name = dep.SelectedItem.ToString();
    //            f.p_code = zz;
    //            f.p_name = nn;


    //            f.insurance_money = float.Parse(price.Text);
    //            f.notes = notes.Text;
    //            f.company_id = int.Parse(company.SelectedValue.ToString());
    //            f.company_name = company.SelectedItem.ToString();
    //            f.r_name = name2.Text;
    //            f.r_degree = relative.Text;
    //            f.r_address = address2.Text;
    //            f.r_ssi = ssi2.Text;
    //            f.r_phone = mob2.Text;
    //            f.r_job = job2.Text;


    //            f.user_id = user_id;

    //            f.user_name = n;



    //            db.SaveChanges();
    //            formContent.Visible = false;
    //            message.Visible = true;

    //        }



    //    }





    //}
    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }


  
}

