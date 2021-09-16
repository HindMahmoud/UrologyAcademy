using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
using System.IO;

namespace EccoHospital.rad
{
    public partial class dr_rad : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (db.patient.Any())
                {
                    var a = (from s in db.patient join ss in db.patient_history on s.id equals ss.p_id join n in db.rad_history on ss.details_id equals n.id select s).Distinct().ToList();
                    patientlist.DataSource = a;
                    patientlist.DataTextField = "name";
                    patientlist.DataValueField = "id";
                    patientlist.DataBind();
                    patientlist.Items.Insert(0, "");

                }
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["p_id"])))
                {

                    int x = int.Parse(Request.QueryString["p_id"].ToString());
                    //patient p = db.patient.FirstOrDefault(a => a.id == x);

                    //txt_code.Text = p.id.ToString();
                    //patientlist.SelectedValue = p.id.ToString();

                    EccoHospital.Models.patient_history f = db.patient_history.FirstOrDefault(a => a.p_id == x);

                    patientlist.Items.FindByValue(f.p_id.ToString()).Selected = true;
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

        //protected void btn_add_Click(object sender, EventArgs e)
        //{

        //    if (txt_result.Text == "")
        //    {
        //        MsgBox("ادخل نتيجه الأشعه ", this.Page, this);
        //    }

        //    else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
        //    {

        //        int x = int.Parse(Request.QueryString["edit"].ToString());

        //        EccoHospital.Models.rad_history f = db.rad_history.FirstOrDefault(a => a.id == x);

        //        f.rad_result = txt_result.Text;
        //        f.status = true;
        //        db.SaveChanges();
        //        txt_result.Text = "";
        //        MsgBox("تم الأضافه  ", this.Page, this);


        //    }

        //}

        protected void btn_add_Click(object sender, EventArgs e)
        {
            int p_i = int.Parse(Request.QueryString["p_id"].ToString());
           // var tick = (from u in db.ticket where u.patient_id == p_i && u.flag == true select u.code).FirstOrDefault();

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edittxt"])))
            {
                if (txt_result.Text == "")
                {
                    MsgBox("ادخل نتيجه التحليل", this.Page, this);

                }
                else
                {
                    //int p_i = int.Parse(Request.QueryString["p_id"].ToString());
                    //int tick = (from u in db.ticket where u.patient_id == p_i && u.flag == true select u.id).FirstOrDefault();
                    int x = int.Parse(Request.QueryString["edittxt"].ToString());
                    EccoHospital.Models.rad_history f = db.rad_history.FirstOrDefault(a => a.id == x);
                    f.rad_result = txt_result.Text;
                    //f.ticketId = tick;
                    f.status = true;
                    db.SaveChanges();
                    MsgBox("تم الاضافة", this.Page, this);
                    txt_result.Text = "";
                    Response.Redirect("dr_rad.aspx?p_id=" + p_i);

                }
            }
            else
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());
                    EccoHospital.Models.rad_history f = db.rad_history.FirstOrDefault(a => a.id == x);
                    //f.ticketId = tick;
                    f.date = DateTime.Now;
                    f.p_name = patientlist.SelectedItem.Text;
                    // db.lab_history.Add(f);
                    db.SaveChanges();
                    int max_id = (from g in db.rad_history where g.id == x select g.id).FirstOrDefault();

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
                                typeLab = "اشعه" 

                            };
                            db.image.Add(im);
                            db.SaveChanges();
                        }
                    }
                    db.SaveChanges();
                    MsgBox("تم الأضافه  ", this.Page, this);
                    Response.Redirect("dr_rad.aspx?p_id=" + p_i);
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


        protected void patientlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (patientlist.Text != "")
            {
                int patId = int.Parse(patientlist.SelectedValue.ToString());
                Response.Redirect("dr_rad.aspx?p_id=" + patId);

            }
            //    int id = int.Parse(patientlist.SelectedValue.ToString());
            //    patient st = db.patient.FirstOrDefault(a => a.id == id);
            //    txt_code.Text = st.id.ToString();

            //    Response.Redirect("dr_rad.aspx?p_id=" + id);


            //}

        }
    }
}