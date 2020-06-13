using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class org : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void verify()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            string query = "select org_id,email,password,comp from [dbo].[reg_orga] where email=@email and password=@password";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@email", ename.Text.ToString());
            cmd.Parameters.AddWithValue("@password", pass.Text.ToString());
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            var user = da.Fill(ds);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                    while (dr.Read())
                    {
                        Session["email"] = Convert.ToString(dr["email"]);
                        Session["orgid"] = Convert.ToString(dr["org_id"]);
                        Session["comp"]= Convert.ToString(dr["comp"]);
                        Response.Redirect("activeevent.aspx");
                    }
            }
            else
            {
                string display = "Invalid Username or Password";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
                //Label1.Text = "Login Fail";
                //Label1.Visible = true;
            }
            conn.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    
    protected void Btn_Click1(object sender, EventArgs e)
    {
        verify();
    }
}