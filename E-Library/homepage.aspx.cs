using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_Library
{
    public partial class homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
          //  Response.Write("<script>confirm('If you are not admin then you cannot Access this feature. If you are admin then Login at footer.'); location.href='adminlogin.aspx'</script>");
            Response.Redirect("adminlogin.aspx");

        }
    }
}