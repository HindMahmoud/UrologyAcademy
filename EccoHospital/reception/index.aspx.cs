using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using EccoHospital.Models;

public partial class reception_index : System.Web.UI.Page
{
    EccoHospitalEntities db = new EccoHospitalEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        codePat.Focus();
        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                Div2.Visible = true;
                delbtn.Visible = true;
                cancel.Visible = true;
            }
        }

    }

    protected void codePat_TextChanged(object sender, EventArgs e)

    {

        if (codePat.Text != "")
        {
            string id = codePat.Text;
            //string cleanAmount = id.Replace(".", string.Empty);
          //  string cleanAmount2 = id.Replace("ز", string.Empty);
            char[] spearator = { 'ز', ' ' };
            int count = 2;
            char[] spearatoren = { '.', ' ' };
            int counten = 2;
            String[] strlist = id.Split(spearator,
               count, StringSplitOptions.None);
            String[] strlisten = id.Split(spearatoren,
               counten, StringSplitOptions.None);
            string str = strlist[0];
            string stren = strlisten[0];
            //int f = Convert.ToInt32(id);
            if (strlist.Length >= 2)
            {
                if (db.patient.Any(w => w.code == str))
                {
                    // lbl1.Visible = false;
                    Response.Redirect("patprofile.aspx?patid=" + str);
                }
            }
            else {
                if (db.patient.Any(w => w.code == stren))
                {
                    // lbl1.Visible = false;
                    Response.Redirect("patprofile.aspx?patid=" + stren);
                }
            }
            // else { lbl1.Visible = true;lbl1.ForeColor = System.Drawing.Color.OrangeRed; }
        }
    }

    protected void delbtn_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
        {

            int x = int.Parse(Request.QueryString["id"].ToString());

            patient_history p = db.patient_history.FirstOrDefault(a => a.id == x);

            if (db.clinic_reception.Any(a => a.id == p.details_id))
            {
                clinic_reception p2 = db.clinic_reception.Where(a => a.id == p.details_id).FirstOrDefault();
                db.clinic_reception.Remove(p2);
                db.SaveChanges();
            }



            if (db.savee.Any(a => a.type == "عيادات" && a.item_id == x))
            {
                savee sss = db.savee.Where(a => a.type == "عيادات" && a.item_id == x).FirstOrDefault();
                sss.del = true;
                db.SaveChanges();
            }
            db.patient_history.Remove(p);


            db.SaveChanges();
            Div1.Visible = false;
            Div2.Visible = false;
            delbtn.Visible = false;
            cancel.Visible = false;
          
        }

    }
    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");

    }
}