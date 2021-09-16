using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;


namespace EccoHospital.PR
{
    public partial class addRoom : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                {

                    int x = int.Parse(Request.QueryString["edit"].ToString());

                    EccoHospital.Models.room f = db.room.FirstOrDefault(a => a.id == x);
                    txt_name.Value = f.name.ToString();
                    txt_floor.Value = f.floor.ToString();
                    txt_price.Value = f.price.ToString();
                    if (f.type != null)
                        drp_type.SelectedValue = f.type.ToString();





                    btn.Text = "تعديل";

                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {
                    Div2.Visible = true;
                    delbtn.Visible = true;
                    cancel.Visible = true;
                }
                else if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["r_id"])))
                {
                    int x = int.Parse(Request.QueryString["r_id"].ToString());

                    EccoHospital.Models.room f = db.room.FirstOrDefault(a => a.id == x);
                    f.flag = false;


                    db.SaveChanges();

                }


            }




        }

        protected void delbtn_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
            {

                int x = int.Parse(Request.QueryString["id"].ToString());

                room p = db.room.FirstOrDefault(a => a.id == x);
               

                db.room.Remove(p);
                db.SaveChanges();
                success_m.Visible = true;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("addRoom.aspx");

        }

        protected void print_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {


            if (txt_name.Value == "")
            {
                MsgBox("ادخل اسم الغرفه", this.Page, this);
            }
            if (txt_floor.Value == "")
            {
                MsgBox("ادخل  الطابق", this.Page, this);

            }
            if (txt_price.Value == "")
            {
                MsgBox("ادخل   السعر", this.Page, this);

            }

            if (drp_type.Text == "")
            {
                MsgBox("ادخل   نوع الغرفه", this.Page, this);

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

                if (btn.Text == "تعديل")
                {

                    if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["edit"])))
                    {

                        int x = int.Parse(Request.QueryString["edit"].ToString());

                        EccoHospital.Models.room f = db.room.FirstOrDefault(a => a.id == x);
                        f.name = txt_name.Value;
                        f.floor = txt_floor.Value;
                        f.price =double.Parse( txt_price.Value);
                        f.type = drp_type.SelectedItem.ToString();


                        db.SaveChanges();
                        success_m.Visible = true;

                    }

                }

                else
                {

                    room p = new room
                    {
                        name = txt_name.Value,
                      
                        floor = txt_floor.Value,
                        price = double.Parse(txt_price.Value),

                        type = drp_type.SelectedItem.ToString(),
                        datenow=DateTime.Now,
                        del=false,
                        flag=false,
                        user_id=uid,
                        user_name=uname

                    };
                    db.room.Add(p);
                    db.SaveChanges();
                    success_m.Visible = true;
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