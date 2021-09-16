using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;using EccoHospital.Models;
using EccoHospital.Models;
public partial class reception_MasterPage : System.Web.UI.MasterPage
{
    EccoHospitalEntities db = new EccoHospitalEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void btn2_Click(object sender, EventArgs e)
    {
        bool seen = true;
    }

    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //if (name1.Text != "")
    //{
    //    patient p = new patient
    //    {
    //        name = name1.Text,
    //        age = age.Text,
    //        phone = mob.Text,
    //        nationalty = nationalty.Text,
    //        address = address.Text,
    //        government = gov.SelectedItem.ToString(),
    //        type = type.Text,
    //        city = city.Text,
    //        job = job.Text,
    //        social_state = social.SelectedItem.ToString(),
    //        ssi = ssi_st.Text,
    //        gender = gender.Text
    //    };
    //    db.patient.Add(p);
    //    db.SaveChanges();
    //    // message.Visible = true;

    //}
    //}
}
