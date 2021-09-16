using EccoHospital.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EccoHospital.reception
{
    public partial class repoort : System.Web.UI.Page
    {
        EccoHospitalEntities db = new EccoHospitalEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (db.service.Any())
                {
                    var repo = (from s in db.service select s).ToList();

                    sservv.DataSource = repo;
                    sservv.DataTextField = "name";
                    sservv.DataValueField = "id";
                    sservv.DataBind();
                    sservv.Items.Insert(0, "");

                }
                if (db.labb.Any())
                {
                    var repo = (from s in db.labb select s).ToList();

                    labddl.DataSource = repo;
                    labddl.DataTextField = "name";
                    labddl.DataValueField = "id";
                    labddl.DataBind();
                    labddl.Items.Insert(0, "");

                }
                if (db.rad.Any())
                {
                    var repo = (from s in db.rad select s).ToList();

                    radddl.DataSource = repo;
                    radddl.DataTextField = "name";
                    radddl.DataValueField = "id";
                    radddl.DataBind();
                    radddl.Items.Insert(0, "");

                }
            }

        }

        protected void search_Click(object sender, EventArgs e)
        {
            if (sservv.SelectedItem.ToString() != "" && servfrom.Text == "" && servto.Text == "")
            {
                Response.Redirect("repoort.aspx?servname=" + sservv.SelectedItem.ToString());
            }
            else if (sservv.SelectedItem.ToString() != "" && servfrom.Text != "" && servto.Text != "")
            {
                Response.Redirect("repoort.aspx?servname=" + sservv.SelectedItem.ToString() + "&&servfrom=" + servfrom.Text + "&&servto=" + servto.Text);

            }
            else if (sservv.SelectedItem.ToString() == "" && servfrom.Text != "" && servto.Text != "")
            {
                Response.Redirect("repoort.aspx?servfrom=" + servfrom.Text + "&&servto=" + servto.Text);

            }
        }

        protected void labbtn_Click(object sender, EventArgs e)
        {
            if (labddl.SelectedValue != "" && fromlab.Text == "" && tolab.Text == "")
            {
                Response.Redirect("repoort.aspx?labtxt=" + labddl.SelectedItem);

            }
            else if (labddl.SelectedValue != "" && fromlab.Text != "" && tolab.Text != "")
            {
                Response.Redirect("repoort.aspx?labtxt=" + labddl.SelectedItem + "&&fromlab=" + fromlab.Text + "&&tolab=" + tolab.Text);

            }
            else if (labddl.SelectedValue == "" && fromlab.Text != "" && tolab.Text != "")
            {
                Response.Redirect("repoort.aspx?fromlab=" + fromlab.Text + "&&tolab=" + tolab.Text);

            }

        }

        protected void rad_Click(object sender, EventArgs e)
        {
            if (radddl.SelectedValue != "" && from.Text == "" && to.Text == "")
            {
                Response.Redirect("repoort.aspx?radtxt=" + radddl.SelectedItem.ToString());

            }
            else if (radddl.SelectedValue != "" && from.Text != "" && to.Text != "")
            {
                Response.Redirect("repoort.aspx?radtxt=" + radddl.SelectedItem.ToString() + "&&fromrad=" + from.Text + "&&torad=" + to.Text);

            }
            else if (radddl.SelectedValue == "" && from.Text != "" && to.Text != "")
            {
                Response.Redirect("repoort.aspx?fromrad=" + from.Text + "&&torad=" + to.Text);

            }
        }
    }
}