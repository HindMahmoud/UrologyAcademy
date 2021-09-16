using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using EccoHospital.Models;
using System.IO;

namespace EccoHospital
{
    public partial class solfa : System.Web.UI.Page
    {
       
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                //    var f = (from s in db.employee where s.del!=true select s).ToList();
                //    importerss.DataSource = f;
                //    importerss.DataTextField = "name";
                //    importerss.DataValueField = "id";
                //    importerss.DataBind();
                //    importerss.Items.Insert(0, new ListItem(String.Empty, String.Empty));
                //
            }

        }

        protected void labss_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }


        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
           

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if(txttotal.Text!="")

            {
                double x = double.Parse(txttotal.Text);
                //int lab_idd = int.Parse(labss.SelectedValue.ToString());
                int importer_idd = int.Parse(importerss.SelectedValue.ToString());



                loan b = new loan
                {
                   
                    emp_id=importer_idd,
                   
                    date=Convert.ToDateTime(date.Text),
                    notes=txttitle.Text,
                    value=x,
                    no_months=int.Parse(txtInstalNO.Text),
                    

                };
                db.loan.Add(b);
                db.SaveChanges();

                var max_id = (from ss in db.loan select ss.id).Max();
                
                if(txtInstalNO.Text!="0")
                {
                    int insN = int.Parse(txtInstalNO.Text);
                    DateTime dt = Convert.ToDateTime(date.Text);
                  
                    for (int i=1;i<=insN;i++)
                    {
                        DateTime instalDate = dt.AddMonths(i);
                        loan_installment ins = new loan_installment
                        {
                            loan_id=max_id,
                            emp_id=importer_idd,
                            payed=false,
                           
                            title="قسط رقم " +i,
                            value = Math.Round((x/insN),2),
                            date=instalDate
                        
                        };
                        db.loan_installment.Add(ins);
                        db.SaveChanges();
                    }


                }
                
                success_m.Visible = true;

            }
        }
    }
}