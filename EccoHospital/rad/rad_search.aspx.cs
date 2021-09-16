using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.rad
{
    public partial class rad_search : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    int x = int.Parse(Request.QueryString["id"].ToString());
                    //danger_m.Visible = true;
                    //cancel.Visible = true;
                    //delbtn.Visible = true;
                }
            }
        }


        protected void show_Click(object sender, EventArgs e)
        {
            if (from1.Text != "" && to1.Text != "")
            {
                Response.Redirect("rad_search.aspx?date1=" + from1.Text + "&&date2=" + to1.Text);
            }
        }

        protected void btn_add_Click(object sender, EventArgs e)
        {
            int p_i = int.Parse(Request.QueryString["p_id"].ToString());

            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edittxt"])))
            {
                if (txt_result.Text == "")
                {
                    MsgBox("ادخل نتيجه الاشعه", this.Page, this);

                }
                else
                {
                    int x = int.Parse(Request.QueryString["edittxt"].ToString());
                    EccoHospital.Models.rad_history f = db.rad_history.FirstOrDefault(a => a.id == x);
                    f.rad_result = txt_result.Text;
                    f.status = true;
                    db.SaveChanges();
                    MsgBox("تم الاضافة", this.Page, this);
                    txt_result.Text = "";
                    Response.Redirect("rad_search.aspx?p_id=" + p_i);

                }
            }
            else
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());
                   
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
                    Response.Redirect("rad_search.aspx?p_id=" + p_i);
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

    }
}