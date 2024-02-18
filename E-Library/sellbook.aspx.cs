using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;


namespace E_Library
{
    public partial class sellbook : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //go button Click event
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            getNameById();
        }
        //add button Click event
        protected void Button1_Click(object sender, EventArgs e)
        {
            addbook();
        }
      


        //user defined functions

        void getNameById()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT full_name From member_master_tbl WHERE member_id ='" + TextBox7.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox12.Text = dt.Rows[0]["full_name"].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Member ID.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void addbook()
        {
            try
            {
                string genres = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    genres = genres + ListBox1.Items[i] + ",";
                }
                // genres = Adventure,Self Help,
                genres = genres.Remove(genres.Length - 1);


                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;

                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                //(member_id, seller_name, book_name,genre,language,author_name,publisher_name,publish_date,book_condition,book_ratings,pages,book_description,o_price,s_price,book_img_link,p_contact,p_upis)
                    

                SqlCommand cmd = new SqlCommand("INSERT INTO sell_book VALUES(@member_id,@seller_name," +
                    "@book_name,@genre,@language,@author_name,@publisher_name,@publish_date," +
                    "@book_condition,@book_ratings,@pages,@book_description,@o_price,@s_price," +
                    "@book_img_link,@p_contact,@p_upis)", con);

                cmd.Parameters.AddWithValue("@member_id", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@seller_name", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@book_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@genre", genres);
                cmd.Parameters.AddWithValue("@language", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@author_name", TextBox13.Text.Trim());
                cmd.Parameters.AddWithValue("@publisher_name", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@publish_date", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@book_condition", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@book_ratings", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@pages", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@book_description", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@o_price", TextBox9.Text.ToString());
                cmd.Parameters.AddWithValue("@s_price", TextBox10.Text.ToString());
                cmd.Parameters.AddWithValue("@book_img_link", filepath);
                cmd.Parameters.AddWithValue("@p_contact", TextBox5.Text.ToString());
                cmd.Parameters.AddWithValue("@p_upis", TextBox6.Text.ToString());
                

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Book added successfully.');</script>");
                GridView1.DataBind();
            }

            
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}