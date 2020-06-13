using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class adminlogin : System.Web.UI.Page
{
     SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
    try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            string query = "SELECT [aid],[Fname],[Lname],[username],[passwords] FROM [dbo].[Admin] where username=@username and passwords=@passwords";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@passwords", txtPassword.Text);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (txtUsername.Text == dr["username"].ToString() && txtPassword.Text == dr["passwords"].ToString())
                    {

                        Session["username"] = dr["username"].ToString();
                        Session["Name"] = dr["Fname"].ToString();
                        Response.Redirect("addcategory.aspx");

                    }
                    else
                    {
                        string display = "Invalid Username or Password";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                    }
                }
            }
            else
            {
                string display = "Invalid Username or Password";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
            conn.Close();

        }
        catch (Exception ex)
        {

            throw;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ClearDetails();
    }

    private void ClearDetails()
    {
        txtUsername.Text = string.Empty;
        txtPassword.Text = string.Empty;
    }
}