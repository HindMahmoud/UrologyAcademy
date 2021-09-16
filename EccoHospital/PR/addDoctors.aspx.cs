using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;

public partial class PR_addDoctors : System.Web.UI.Page
{

    EccoHospitalEntities db = new EccoHospitalEntities();
   
    protected void Page_Load(object sender, EventArgs e)
    { var tt = (from i in db.service select i).ToList();
        foreach (var t in tt)
        {
            //Literal trtd1 = new Literal();
            //trtd1.Text = "<tr><td>";
           // Panel1.Controls.Add(trtd1);
            Label lbl = new Label();
            lbl.ID = "lbl" + t.id;
            lbl.Text = t.name;
           
            //lbl.CssClass = "form-control1";
            //Panel1.Controls.Add(lbl);
            //Literal td4 = new Literal();
            //td4.Text = "<br/>";
            //pnlTextBoxes.Controls.Add(td4);
            //Panel1.Controls.Add(td4);
           // Literal td2 = new Literal();
           // td2.Text = "</td>";
            
           //// Panel1.Controls.Add(td2);
           // Literal td3 = new Literal();
           // td3.Text = "<td>";
           // pnlTextBoxes.Controls.Add(td2);
            TextBox txtNewTextBox = new TextBox();
            txtNewTextBox.ID = "myTextBox_" + t.id;
            PlaceHolder d = new PlaceHolder();
            txtNewTextBox.Attributes["placeholder"] =t.name;
            txtNewTextBox.Width = 300;
            txtNewTextBox.CssClass = "form-control";
            pnlTextBoxes.Controls.Add(txtNewTextBox);
           

        }

        if (!IsPostBack)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.doctor f = db.doctor.FirstOrDefault(a => a.id == x);
                    txt_name.Text = f.name.ToString();
                    mob.Text = f.phone.ToString();
                    address.Text = f.address.ToString();
                var yu = (from i in db.doctor_services join s in db.service on i.serviceId equals s.id where i.doctorId == x select new { i ,s.id}).ToList();
                if (yu != null)
                {
                    foreach (var t in yu)
                    {
                        TextBox txt1 = (TextBox)pnlTextBoxes.FindControl("myTextBox_" + t.id);
                        txt1.Text = t.i.pricce.ToString();
                        
                    }
                }
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
    protected void reload_Click(object sender, EventArgs e)
    {

        Response.Redirect("addDoctors.aspx");

    }
  public void MsgBox(String ex, Page pg, Object obj)
    {
        string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
        Type cstype = obj.GetType();
        ClientScriptManager cs = pg.ClientScript;
        cs.RegisterClientScriptBlock(cstype, s, s.ToString());
    }


    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    formContent.Visible = true;
    //    message2.Visible = false;
    //}

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txt_name.Text == "")
        {
            MsgBox("ادخل الاسم", this.Page, this);
        }
       
       else{

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

                    EccoHospital.Models.doctor f = db.doctor.FirstOrDefault(a => a.id == x);
                    f.name = txt_name.Text;

                    f.phone = mob.Text;
                    f.address = address.Text;

                    db.SaveChanges();
                    // var serr = (from b in db.doctor_services join s in db.service on b.serviceId equals s.id where b.doctorId==x select new { b ,s.id}).ToList();
                    var serr = (from b in db.service select b).ToList();
                    if(serr!=null){
                        foreach (var t in serr)
                        {
                            var y = (from n in db.doctor_services where n.doctorId == f.id &&n.serviceId==t.id select n).FirstOrDefault();
                            if (y != null)
                            {
                                TextBox txt1 = (TextBox)pnlTextBoxes.FindControl("myTextBox_" + t.id);
                                if (txt1.Text == "") { txt1.Text = "0"; }
                                if (txt1 != null)
                                {
                                    y.pricce = double.Parse(txt1.Text);
                                    db.SaveChanges();
                                }
                            }
                            else {
                                TextBox txt1 = (TextBox)pnlTextBoxes.FindControl("myTextBox_" + t.id);
                                if (txt1.Text == "") { txt1.Text = "0"; }
                                doctor_services ser = new doctor_services
                                {
                                    doctorId = f.id,
                                    serviceId = t.id,
                                    pricce = double.Parse(txt1.Text),
                                };
                                db.doctor_services.Add(ser);
                                db.SaveChanges();
                        }
                        }
                    }
                    //if (serr != null)
                    //{
                    //    foreach (var t in serr)
                    //    {
                    //        TextBox txt1 = (TextBox)pnlTextBoxes.FindControl("myTextBox_" + t.id);
                    //        if (txt1 != null)
                    //        {
                    //            t.b.pricce = double.Parse(txt1.Text);
                    //            db.SaveChanges();
                    //        }
                    //    }
                    //}   
                    message.Visible = true;

                }

            }

            else
            {
                if (mob.Text != "")
                {
                    string phonee = mob.Text;
                    var mobiles = (from d in db.doctor where d.phone == phonee select d).ToList();

                    if (mobiles.Count != 0)
                    { Response.Write("<script>alert ('هذا الرقم موجود  من فضلك ادخل رقم اخر')</script>"); }
                    else
                    {

                        doctor p = new doctor
                        {
                            name = txt_name.Text,
                            phone = mob.Text,
                            address = address.Text,
                            user_name = uname,
                            user_id = uid
                        };
                        db.doctor.Add(p);
                        db.SaveChanges();
                        int maxx = (from v in db.doctor select v.id).Max();
                        
                        foreach (var t in db.service) {
                            TextBox txt1 = (TextBox)pnlTextBoxes.FindControl("myTextBox_"+t.id);
                            if (txt1.Text == "") { txt1.Text = "0"; }
                            doctor_services ser = new doctor_services
                            {
                                doctorId = maxx,
                                serviceId = t.id,
                                pricce =double.Parse( txt1.Text),
                            };
                            db.doctor_services.Add(ser);
                          
                        }
                        db.SaveChanges();

                        message.Visible = true;
                    }

                }
                else { Response.Write("<script>alert ('برجاء ادخال رقم التليفون')</script>"); }
            }
        }
}

    protected void delbtn_Click(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
        {

            int x = int.Parse(Request.QueryString["id"].ToString());

            doctor p = db.doctor.FirstOrDefault(a => a.id == x);
            var p2 = db.doctor_services.Where(a => a.doctorId == x).ToList();
            db.doctor_services.RemoveRange(p2);
            db.SaveChanges();

            db.doctor.Remove(p);
            db.SaveChanges();

            Response.Redirect("addDoctors.aspx");
        }

    }

    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("addDoctors.aspx");

    }

    protected void print_Click(object sender, EventArgs e)
    {

    }
}
