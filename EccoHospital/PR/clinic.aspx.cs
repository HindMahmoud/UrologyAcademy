using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using EccoHospital.Models;

public partial class PR_clinic : System.Web.UI.Page
{
    EccoHospitalEntities db = new EccoHospitalEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
            {

                int x = int.Parse(Request.QueryString["edit"].ToString());

                EccoHospital.Models.clinic f = db.clinic.FirstOrDefault(a => a.id == x);
                name1.Text = f.name.ToString();
                KPrice.Text = f.price1.ToString();
                EPrice.Text = f.price2.ToString();
                estPrice.Text = f.price3.ToString();






                btnSave.Text = "تعديل";

            }
            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                Div2.Visible = true;
                delbtn.Visible = true;
                cancel.Visible = true;
            }


        }

    }




    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }

    protected void reload_Click(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (name1.Text == "")
        {
            MsgBox("ادخل اسم العياده", this.Page, this);
        }
        if (KPrice.Text=="")
        {
            MsgBox("ادخل سعر الكشف",this.Page,this);
        }
        if (EPrice.Text=="")
        {
            MsgBox("ادخل سعر الأعاده", this.Page, this);

        }
        if (estPrice.Text == "")
        {
            MsgBox("ادخل سعر الاستدعاء", this.Page, this);

        }
        else
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

            if (btnSave.Text == "تعديل")
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.clinic f = db.clinic.FirstOrDefault(a => a.id == x);
                    f.name = name1.Text;
                    f.price1 = float.Parse(KPrice.Text);
                    f.price2 = float.Parse(EPrice.Text);
                    f.price3 = float.Parse(estPrice.Text);


                    db.SaveChanges();
                    success_m.Visible = true;

                }
            }
            else
            {
                clinic p = new clinic
                {
                    name = name1.Text,
                    price1 = float.Parse(KPrice.Text),
                    price2 = float.Parse(EPrice.Text),
                    price3 = float.Parse(estPrice.Text),
                    del=false,
                    user_name=uname,
                    user_id=uid

                };
                db.clinic.Add(p);
                db.SaveChanges();
                success_m.Visible = true;
            }
        }
    }


    protected void delbtn_Click(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
        {

            int x = int.Parse(Request.QueryString["id"].ToString());

            clinic p = db.clinic.FirstOrDefault(a => a.id == x);
            clinic p2 = db.clinic.Where(a => a.id == x).FirstOrDefault();

            db.clinic.Remove(p);
            db.SaveChanges();
            success_m.Visible = true;
        }

    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("clinic.aspx");

    }

    protected void print_Click(object sender, EventArgs e)
    {

    }
}