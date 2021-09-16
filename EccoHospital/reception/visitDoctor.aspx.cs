using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using EccoHospital.Models;

public partial class reception_visitDoctor : System.Web.UI.Page
{
    EccoHospitalEntities db = new EccoHospitalEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["c"])))
        //    {
        //        int m = int.Parse(Request.QueryString["c"]);

        //        var aa2 = (from r in db.patient where r.code == m select r).FirstOrDefault();
        //        pName.Text = aa2.name.ToString();
              
        //        txt_code.Text = m.ToString();


        //    }
        //    var aa = (from r in db.doctor select r).ToList();
        //    doc.DataTextField = "name";
        //    doc.DataValueField = "id";
        //    doc.DataSource = aa;

        //    doc.DataBind();

        //    doc.Items.Insert(0, new ListItem(String.Empty, String.Empty));

        //}
    }


    protected void txt_code_TextChanged(object sender, EventArgs e)
    {
        if (txt_code.Text != "")
        {
            var cc = txt_code.Text;
            Response.Redirect("visitDoctor.aspx?c=" + cc);
        }

    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{

    //    string n = "", u = "";
    //    if (Session["user"] != null && Session["name"] != null)
    //    {
    //        n = Session["name"].ToString();
    //        u = Session["user"].ToString();

    //    }
    //    int user_id = (from s in db.users where s.user_name == u select s.id).FirstOrDefault();


    //    if (doc.Text != "" && pName.Text != "" && price.Text != "")
    //    {
    //        int se = int.Parse(doc.SelectedValue.ToString());
    //        var ss = (from s in db.doctor where s.id == se select s.visit_price).FirstOrDefault();

    //        patient_history st = new patient_history

    //        {

    //            p_name = pName.Text,
    //            p_code =int.Parse(txt_code.Text),

    //            doc_id = int.Parse(se.ToString()),
    //            doc_name=doc.SelectedItem.ToString(),
    //            price = float.Parse(price.Text),
    //            type="visit",
    //            date = DateTime.Now,
    //            dateNow=DateTime.Now,
    //            user_id=user_id,
    //            user_name=n,
    //            del=false

                
               




    //        };
    //        db.patient_history.Add(st);
    //        db.SaveChanges();

    //        // formContent.Visible = false;
    //        success_m.Visible = true;

    //    }
       
    //    //else
    //    //{

    //    //    int x = int.Parse(Request.QueryString["edit"].ToString());
    //    //    patient f = db.patient.FirstOrDefault(a => a.id == x);

    //    //    string n = "";
    //    //    if (Session["name"] != null)
    //    //    {
    //    //        n = Session["name"].ToString();
    //    //    }
    //    //    int user_id = (from s in db.users where s.name == n select s.id).FirstOrDefault();




    //    //    db.SaveChanges();
    //    //   // formContent.Visible = false;
    //    //    success_m.Visible = true;

    //    //}


    //}

    protected void reload_Click(object sender, EventArgs e)
    {
        if (txt_code.Text != "")
        {
            var cc = txt_code.Text;
            Response.Redirect("visitDoctor.aspx?c=" + cc);
        }
    }

    protected void doc_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (doc.Text != "")
        {
            int d =int.Parse(doc.SelectedValue.ToString());
            var aa4 = (from r in db.doctor where r.id == d select r).FirstOrDefault();
            if (aa4 != null)
            {
                //price.Text = aa4.visit_price.ToString();
            }
            else
            {
                price.Text = "0";
            }
        }

    }
}