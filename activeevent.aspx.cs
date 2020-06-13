using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class activeevent : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["orgid"] == null)
        {
            Response.Redirect("org.aspx");
        }
        loadEvents();
    }

    private void loadEvents()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "select * from event where org_id = @org_id ";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@org_id", Session["orgid"]);
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

            throw ex;
        } 
    }
    
    protected void imgDelete_Click1(object sender, ImageClickEventArgs e)
    {
        string[] arguments = (((ImageButton)sender).CommandArgument).ToString().Split(',');
        int eid = Convert.ToInt32(arguments[0]);
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "DELETE FROM  [reg].[dbo].[event] WHERE eid=@eid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@eid", eid);
            cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            loadEvents();
        }
        catch (Exception ex)
        {
        }
    }
    protected void lnkbView_Click(object sender, EventArgs e)
    {
        string[] arguments = (((LinkButton)sender).CommandArgument).ToString().Split(',');
        int eid = Convert.ToInt32(arguments[0]);
        Response.Redirect("Participants.aspx?eid=" + eid);
    }
}
       