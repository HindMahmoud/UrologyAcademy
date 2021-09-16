using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EccoHospital.Models;
     
namespace EccoHospital.Saavee
{
    public partial class TransferConfirm : System.Web.UI.Page
    { EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Convert.ToString(Request.QueryString["id"])))
                {

                    int x = int.Parse(Request.QueryString["id"].ToString());

                    transfer p = db.transfer.FirstOrDefault(a => a.id == x);
                    p.flag = 1;
                    db.SaveChanges();
                    string uname = "";
                    int id = 0;
                    if (Session["user"] != null)
                    {
                        uname = Session["user"].ToString();
                        id = int.Parse(Session["user_id"].ToString());
                    }
              
                    savee transSavee = new savee
                    {
                        title=p.type,
                        in_value=p.amount,
                        
                        out_value=0,
                        date=DateTime.Now.Date,
                        notes="تحويل مبلغ من "+p.type,
                        del=false,
                        user_id=id,
                        user_name=uname
                    };
                   
                    db.savee.Add(transSavee);
                    db.SaveChanges();
                    Response.Redirect("TransferConfirm.aspx");

                }
            }
        }
    }
}