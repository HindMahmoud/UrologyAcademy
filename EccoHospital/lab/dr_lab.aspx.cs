using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
using System.IO;

namespace EccoHospital.lab
{
    public partial class dr_lab : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (db.patient.Any())
                {
                    var a = (from s in db.patient join ss in db.patient_history on s.id equals ss.p_id join n in db.lab_history on ss.details_id equals n.id select s).Distinct().ToList();

                    pats.DataSource = a;
                    pats.DataTextField = "name";
                    pats.DataValueField = "id";
                    pats.DataBind();
                    pats.Items.Insert(0, "");
                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
                {

                    int x = int.Parse(Request.QueryString["p_id"].ToString());
                    EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.p_id == x);
                    //txt_patient.Value = f.p_name.ToString();
                    // pats.SelectedItem.Value = x.ToString();
                   // pats.ClearSelection();
                    pats.Items.FindByValue(f.p_id.ToString()).Selected = true;


                }



            }

        }

        protected void delbtn_Click(object sender, EventArgs e)
        {

        }

        protected void cancel_Click(object sender, EventArgs e)
        {

        }

        protected void print_Click(object sender, EventArgs e)
        {

        }


        protected void btn_add_Click(object sender, EventArgs e)
        {
            int p_i = int.Parse(Request.QueryString["p_id"].ToString());
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edittxt"])))
            {
                if (txt_result.Text == "")
                {
                    MsgBox("ادخل نتيجه التحليل", this.Page, this);
                    
                }
                else {
                    int x = int.Parse(Request.QueryString["edittxt"].ToString());
                    EccoHospital.Models.lab_history f = db.lab_history.FirstOrDefault(a => a.id == x);
                    f.lab_result = txt_result.Text;
                    f.status = true;
                    db.SaveChanges();
                    MsgBox("تم الاضافة", this.Page, this);
                    txt_result.Text = "";
                    Response.Redirect("dr_lab.aspx?p_id=" + p_i);

                }
            }
            else
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());
                     EccoHospital.Models.lab_history f = db.lab_history.FirstOrDefault(a => a.id == x);
                    f.date = DateTime.Now;
                    f.p_name = pats.SelectedItem.Text;
                   db.SaveChanges();
                    int max_id = (from g in db.lab_history where g.id==x select g.id).FirstOrDefault();
                    
                    if (FileUpload1.HasFiles)
                    {

                        foreach (HttpPostedFile postedFile1 in FileUpload1.PostedFiles)
                        {
                            Random generator = new Random();
                            int r = generator.Next(100000000, 1000000000);
                            string fileName = "";
                            string ex = "";
                            string type = "";

                            ex = Path.GetExtension(postedFile1.FileName);

                            if (ex == ".jpg" || ex == ".Jpg" || ex == ".JPG" || ex == ".JPEG" || ex == ".jpeg" || ex == ".Jpeg" || ex == ".PNG" || ex == ".png" || ex == ".GIF" || ex == ".gif")
                            {
                                type = "img";
                            }
                            else
                            {
                                type = "file";
                            }

                            fileName = Path.GetFileName(max_id + "-" + r.ToString() + ex/*FileUpload1.PostedFile.FileName*/);
                            postedFile1.SaveAs(Server.MapPath("~/upload/") + fileName);

                            image im = new image
                            {
                                service_id = max_id,
                                user_id = int.Parse(Session["user_id"].ToString()),
                                img = max_id + "-" + r.ToString() + ex,
                                type = type,
                                typeLab="تحاليل"

                            };
                            db.image.Add(im);
                            db.SaveChanges();
                        }
                    }
                    db.SaveChanges();
                    MsgBox("تم الأضافه  ", this.Page, this);
                    Response.Redirect("dr_lab.aspx?p_id="+p_i);
                }
            }
        }


        protected void pats_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (pats.Text != "")
            {
                int patId = int.Parse(pats.SelectedValue.ToString());
                Response.Redirect("dr_lab.aspx?p_id=" + patId);

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
}