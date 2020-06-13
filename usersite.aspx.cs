using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class usersite : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }

            loduser();
        }
    }
    public void loduser()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "select uid,fname ,lname,uemail,address from reg_users order by fname";
            SqlCommand cmd = new SqlCommand(query, conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            Repeater1.DataSource = ds.Tables[0];
            Repeater1.DataBind();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
        catch (Exception ex)
        {

        }
    }
    protected void imgDelete_Click(object sender, ImageClickEventArgs e)
    {

        string[] arguments = (((ImageButton)sender).CommandArgument).ToString().Split(',');
        int uid = Convert.ToInt32(arguments[0]);
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "DELETE FROM  [reg].[dbo].[reg_users] WHERE uid=@uid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@uid", uid);
            cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            loduser();
        }
        catch (Exception ex)
        {
        }
    }
 }