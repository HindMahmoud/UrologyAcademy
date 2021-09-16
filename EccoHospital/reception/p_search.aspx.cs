using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using EccoHospital.Models;

public partial class reception_p_search : System.Web.UI.Page
{
    EccoHospitalEntities db = new EccoHospitalEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
            {

                int x = int.Parse(Request.QueryString["editid"].ToString());

                patient f = db.patient.FirstOrDefault(a => a.id == x);
                p_name.Text = f.name.ToString();
                p_city.Text = f.city.ToString();
                p_gov.Text = f.government.ToString();
                ssi_st.Text = f.ssi.ToString();
                TextBox1.Text = f.phone.ToString();
                search.Text = "تعديل";

            }
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["print"])))
            {

                int x = int.Parse(Request.QueryString["print"].ToString());
                string d = @"select name,code from patient where id =" + x;
                string cr = "CReport/newpatientR.rpt";
                Session["query"] = d;
                Session["cr"] = cr;
                Response.Redirect("~/report.aspx");

            }
            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["remove"])))
            {
                danger_m.Visible = true;
                delbtn.Visible = true;
                cancel.Visible = true;

            }

        }

    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("p_search.aspx");

    }

    protected void delbtn_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["remove"])))
        {

            int x = int.Parse(Request.QueryString["remove"].ToString());

            //patient p = db.patient.FirstOrDefault(a => a.id == x);
            if (db.patient.Any(a => a.id == x))
            {
                patient p2 = db.patient.Where(a => a.id == x).FirstOrDefault();
                db.patient.Remove(p2);
                db.SaveChanges();
                message.Visible = true;
                danger_m.Visible = false;
            }


        }
    }
    protected void reload_Click(object sender, EventArgs e)
    {

        Response.Redirect("p_search.aspx");

    }

    protected void search_Click(object sender, EventArgs e)
    {
        string s = "";
        //string s1 = "";
        //string s2 = "";
        //string s3 = "";
        //if (ssi_st.Text !="")
        //{

        //    s += "ss.ssi="+ssi_st.Text;
        //}
        //if(p_city.Text!="")
        //{
        //    s1 = "p_city=" + p_city.Text;
        //}
        //if (p_gov.Text != "")
        //{
        //    s2 = "p_gov=" + p_gov.Text;
        //}
        //if (p_name.Text != "")
        //{
        //    s3 = "p_name="+p_name.Text;
        //}
        //else
        //{
        //    s += "";
        //}
        if (search.Text == "تعديل")
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
            {

                int x = int.Parse(Request.QueryString["editid"].ToString());

                patient f = db.patient.FirstOrDefault(a => a.id == x);
                f.name = p_name.Text;
                f.city = p_city.Text;
                f.government = p_gov.Text;
                f.phone = TextBox1.Text;
                f.ssi = ssi_st.Text;
                db.SaveChanges();
                message.Visible = true;

            }
        }
        else if (p_gov.Text != "" || p_city.Text != "" || p_name.Text != "" || ssi_st.Text != "" || TxtCode.Text != "")
        {
            Response.Redirect("p_search.aspx?ssi=" + ssi_st.Text + "&&name=" + p_name.Text + "&&govv=" + p_gov.Text + "&&city=" + p_city.Text + "&&mob=" + TextBox1.Text + "&&code=" + TxtCode.Text);

        }
        //  Response.Redirect("p_search.aspx?s="+s+"&&s1="+s1+"&&s2="+s2+"&&s3="+s3);
    }

    protected void TxtCode_TextChanged(object sender, EventArgs e)
    {
        if (db.Rel_patient.Any())
        {
            int dd = int.Parse(TxtCode.Text);
            var cr = (from d in db.Rel_patient where d.patient_id == dd select d).ToList();
            DDfriend.DataSource = cr;
            DDfriend.DataTextField = "name";
            DDfriend.DataValueField = "id";
            DDfriend.DataBind();

     //       DDfriend.Items.Insert(0, string.Empty);



        }
    }
}