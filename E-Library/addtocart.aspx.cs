using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace collegecanteenwebsite
{
    
    public partial class addtocart : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        public String member_id, book_id, book_img_link, book_name;
        int o_price, s_price;
        protected void Page_Load(object sender, EventArgs e)
        {
            book_id = Request.QueryString["book_id"];
            o_price = int.Parse(Request.QueryString["o_price"]);
            s_price = int.Parse(Request.QueryString["s_price"]);

            SqlConnection con = new SqlConnection(strcon);
            con.Open();

            SqlCommand cmd2 = new SqlCommand("select count(*) from Cart where member_id='"+Session["username"] +"' and book_id=" + book_id, con);
            int c = (int)cmd2.ExecuteScalar();
            SqlCommand cmd = new SqlCommand("select * from sell_book where book_id="+book_id, con);
            SqlDataReader sr = cmd.ExecuteReader();
            sr.Read();
            member_id = ""+Session["member_id"];
            book_img_link = "" + sr[15];
            book_name = "" + sr[3];
            int total = o_price - s_price;
            sr.Close();
            String query = "";
            if (c == 0)
            {
                query = "insert into Cart values('" + member_id + "'," + book_id + ",'" + book_name + "'," + o_price + "," + s_price + ",'" + book_img_link + "')";
            }
            else if(c>0)
            {
                //total = (c + o_price) * s_price;
                query = "update Cart set o_price = o_price + "+o_price+ " where member_id='" + Session["member_id"] + "' and book_id=" + book_id;
            }
            
            SqlCommand cmd1 = new SqlCommand(query, con);
            cmd1.ExecuteNonQuery();
            con.Close();
            Response.Redirect("addtocart.aspx");
        }
    }
}