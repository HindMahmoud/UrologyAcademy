using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class addpatient : System.Web.UI.Page
{
    EccoHospitalEntities db = new EccoHospitalEntities();
    int next_id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Name.Attributes.Add("onkeyup", "myFunction()");
        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {
                int x = int.Parse(Request.QueryString["id"].ToString());
                patient f = db.patient.FirstOrDefault(a => a.id == x);
                db.patient.Remove(f);
                db.SaveChanges();
                Response.Redirect("addpatient.aspx");

            }


            else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
            {
                int x = int.Parse(Request.QueryString["editid"].ToString());
                patient f = db.patient.FirstOrDefault(a => a.id == x);
                // band b = db.band.FirstOrDefault(bb => bb.id == f.band_id);
                Name.Text = f.name.ToString();
                age.Text = f.age.ToString();
                if (f.address == null) { address.Text = ""; }
                else { address.Text = f.address.ToString(); }
                if (f.phone == null) { phone.Text = ""; }
                else { phone.Text = f.phone.ToString(); }
                if (f.husband == null) { husName.Text = ""; }
                else
                {
                    husName.Text = f.husband.ToString();
                }
              
                Button1.Text = "تعديل";
            }
        }


    }
    protected void add_Click(object sender, EventArgs e)
    {
        int ag;
        if (Name.Text == "")
        {
            MsgBox("ادخل اسم المريض !", this.Page, this);
        }

        else
        {
            bool ch0 = false, ch1 = false, ch2 = false, ch3 = false, ch4 = false, ch5 = false, ch6 = false, ch7 = false, ch8 = false, ch9 = false, ch10 = false, ch11 = false, ch12 = false;
            List<ListItem> check = CheckBoxList1.Items.Cast<ListItem>().Where(a => a.Selected).ToList();

            if (check.Count > 0)
            {
                foreach (var item in check)
                {

                    if (item == CheckBoxList1.Items[0])
                    {
                        ch0 = true;
                    }
                    else if (item == CheckBoxList1.Items[1])
                    {
                        ch1 = true;
                    }
                    else if (item == CheckBoxList1.Items[2])
                    {
                        ch2 = true;
                    }
                    else if (item == CheckBoxList1.Items[3])
                    {
                        ch3 = true;
                    }
                    else if (item == CheckBoxList1.Items[4])
                    {
                        ch4 = true;
                    }
                    else if (item == CheckBoxList1.Items[5])
                    {
                        ch5 = true;
                    }
                    else if (item == CheckBoxList1.Items[6])
                    {
                        ch6 = true;
                    }
                    else if (item == CheckBoxList1.Items[7])
                    {
                        ch7 = true;
                    }
                    else if (item == CheckBoxList1.Items[8])
                    {
                        ch8 = true;
                    }
                    else if (item == CheckBoxList1.Items[9])
                    {
                        ch9 = true;
                    }
                    else if (item == CheckBoxList1.Items[10])
                    {
                        ch10 = true;
                    }

                    else if (item == CheckBoxList2.Items[0])
                    {
                        ch11 = true;
                    }
                    else if (item == CheckBoxList2.Items[1])
                    {
                        ch12 = true;
                    }
                }
            }
////////////////////////////////////////////////////////////////////////////////


           
            if (Button1.Text != "تعديل")
            {
                //var q2 = (from a in db.patient
                //          select a.id).Max();
                //next_id = int.Parse(q2.ToString()) + 1;
                //code.Text = next_id.ToString();
                patient p = new patient
                {
                    name = Name.Text,
                    age = age.Text,
                    address = address.Text,
                    phone = phone.Text,
                    husband=husName.Text,
                   
                   
                };
                db.patient.Add(p);
                db.SaveChanges();
                Name.Text = age.Text = address.Text = code.Text = "";
            }
            else
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["editid"])))
                {
                    int x = int.Parse(Request.QueryString["editid"].ToString());
                    patient f = db.patient.FirstOrDefault(a => a.id == x);
                    f.name = Name.Text;
                    f.age = age.Text;
                    f.address = address.Text;
                    f.phone = phone.Text;

                    f.husband = husName.Text;
                   
                    db.SaveChanges();

                }
            }
            Response.Redirect("addpatient.aspx");
        }
    }
    public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }
}