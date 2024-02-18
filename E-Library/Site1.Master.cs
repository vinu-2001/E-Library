using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Library
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"] == null)
                {
                    LinkButton1.Visible = true; //user login linkbutton
                    LinkButton2.Visible = true; //signup linkbutton
                    LinkButton3.Visible = false; //log out linkbutton
                    LinkButton5.Visible = false; //Hello User linkbutton
                    LinkButton6.Visible = true; //admin login linkbutton
                    LinkButton7.Visible = false; //author management linkbutton
                    LinkButton8.Visible = false; //publisher management linkbutton
                    LinkButton9.Visible = false; //book inventory linkbutton
                    LinkButton10.Visible = false; //book issuing linkbutton
                    LinkButton11.Visible = false; //Member management linkbutton
                }
                else if (Session["role"].Equals("user"))
                {
                    LinkButton1.Visible = false; //user login linkbutton
                    LinkButton2.Visible = false; //signup linkbutton
                    LinkButton3.Visible = true; //log out linkbutton
                    LinkButton5.Visible = true; //Hello User linkbutton
                    LinkButton5.Text = "Hello " + Session["username"].ToString();
                    LinkButton6.Visible = true; //admin login linkbutton
                    LinkButton7.Visible = false; //author management linkbutton
                    LinkButton8.Visible = false; //publisher management linkbutton
                    LinkButton9.Visible = false; //book inventory linkbutton
                    LinkButton10.Visible = false; //book issuing linkbutton
                    LinkButton11.Visible = false; //Member management linkbutton
                }
                else if (Session["role"].Equals("admin"))
                {
                    LinkButton1.Visible = false; //user login linkbutton
                    LinkButton2.Visible = false; //signup linkbutton
                    LinkButton3.Visible = true; //log out linkbutton
                    LinkButton5.Visible = true; //Hello User linkbutton
                    LinkButton5.Text = "Hello Admin";
                    LinkButton6.Visible = false; //admin login linkbutton
                    LinkButton7.Visible = true; //author management linkbutton
                    LinkButton8.Visible = true; //publisher management linkbutton
                    LinkButton9.Visible = true; //book inventory linkbutton
                    LinkButton10.Visible = true; //book issuing linkbutton
                    LinkButton11.Visible = true; //Member management linkbutton
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminlogin.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminauthormanagement.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminpublishermanagement.aspx");
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookinventory.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminbookissuing.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminmembermanagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("userlogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewbook.aspx");
        }
        //LogOut Button
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            LinkButton1.Visible = true; //user login linkbutton
            LinkButton2.Visible = true; //signup linkbutton
            LinkButton3.Visible = false; //log out linkbutton
            LinkButton5.Visible = false; //Hello User linkbutton
            LinkButton6.Visible = true; //admin login linkbutton
            LinkButton7.Visible = false; //author management linkbutton
            LinkButton8.Visible = false; //publisher management linkbutton
            LinkButton9.Visible = false; //book inventory linkbutton
            LinkButton10.Visible = false; //book issuing linkbutton
            LinkButton11.Visible = false; //Member management linkbutto
            Response.Redirect("homepage.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("userprofile.aspx");
        }
    }
}