using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class orgdetails : System.Web.UI.Page
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

            loadAllCustomer();
        }
    }

    private void loadAllCustomer()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "select org_id,comp,landline,email,addc from reg_orga";
            SqlCommand cmd = new SqlCommand(query, conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            rptorg.DataSource = ds.Tables[0];
            rptorg.DataBind();
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
        int orgid = Convert.ToInt32(arguments[0]);
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "DELETE FROM  [reg].[dbo].[reg_orga] WHERE org_id=@org_id";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@org_id", orgid);
            cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            loadAllCustomer();
        }
        catch (Exception ex)
        {
        }
    }
}
