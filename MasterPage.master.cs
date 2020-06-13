using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["uemail"] != null)
            {
                logoutmenu.Visible = true;
                div1.Visible = false;
                lbacc.Text = "Hi " + Session["fname"];
                //Session.Remove("username");
            }
            else
            {
                div1.Visible = true;
                logoutmenu.Visible = false;
                //Response.Redirect("Login.aspx");
            }
        }
    }
}
