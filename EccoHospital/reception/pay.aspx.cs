using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using EccoHospital.Models;

public partial class reception_pay : System.Web.UI.Page
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
         
        //}
    }


    protected void txt_code_TextChanged(object sender, EventArgs e)
    {
        if (txt_code.Text != "")
        {
            var cc = txt_code.Text;
            Response.Redirect("pay.aspx?c=" + cc);
        }

    }

  
    protected void reload_Click(object sender, EventArgs e)
    {
        if (txt_code.Text != "")
        {
            var cc = txt_code.Text;
            Response.Redirect("pay.aspx?c=" + cc);
        }
    }

   
}