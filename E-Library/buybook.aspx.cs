using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Library
{
    public partial class buybook : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void LinkButton1_click(object sender, EventArgs e)
        {
            getBookByID();
        }

        protected void Button1_click(object sender, EventArgs e)
        {
                if (Session["username"] == null)
                {
                    Response.Redirect("login.aspx");
                }

                Response.Redirect("addtocart.aspx?book_id="+ TextBox7.Text + "&o_price=" + TextBox9.Text + "&s_price=" + TextBox10.Text);
        
        }

        //user defined functions
        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM sell_book WHERE book_id ='" + TextBox7.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox12.Text = dt.Rows[0]["book_name"].ToString();
                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString();
                    DropDownList2.SelectedValue = dt.Rows[0]["book_condition"].ToString();
                    DropDownList3.SelectedValue = dt.Rows[0]["book_ratings"].ToString();
                    TextBox1.Text = dt.Rows[0]["publisher_name"].ToString();
                    TextBox13.Text = dt.Rows[0]["author_name"].ToString();
                    TextBox4.Text = dt.Rows[0]["publish_date"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["pages"].ToString().Trim();
                    TextBox9.Text = dt.Rows[0]["o_price"].ToString().Trim();
                    TextBox10.Text = dt.Rows[0]["s_price"].ToString().Trim();
                    TextBox3.Text = dt.Rows[0]["book_description"].ToString();
                    

                    ListBox1.ClearSelection();
                    string[] genre = dt.Rows[0]["genre"].ToString().Trim().Split(',');
                    for (int i = 0; i < genre.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == genre[i])
                            {
                                ListBox1.Items[j].Selected = true;
                            }

                        }
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //void getNameById()
        //{
        //    try
        //    {
        //        SqlConnection con = new SqlConnection(strcon);
        //        if (con.State == ConnectionState.Closed)
        //        {
        //            con.Open();
        //        }
        //        SqlCommand cmd = new SqlCommand("SELECT book_name From sell_book WHERE book_id ='" + TextBox7.Text.Trim() + "'", con);
        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        if (dt.Rows.Count >= 1)
        //        {
        //            TextBox12.Text = dt.Rows[0]["book_name"].ToString();
        //        }
        //        else
        //        {
        //            Response.Write("<script>alert('Invalid Book ID.');</script>");
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write("<script>alert('" + ex.Message + "');</script>");
        //    }
        //}

      
    }
}