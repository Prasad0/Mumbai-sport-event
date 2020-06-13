using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BookedEvents : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"]==null)
        {
            Response.Redirect("login.aspx");
        }
        LoadEvents();
    }

    private void LoadEvents()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "  select * from eventbook inner join event on event.eid=eventbook.eid where uid=@uid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@uid",Session["uid"]);
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
    
protected void imgDelete_Click(object sender, ImageClickEventArgs e)
       {
        string[] arguments = (((ImageButton)sender).CommandArgument).ToString().Split(',');
        int bkid = Convert.ToInt32(arguments[0]);
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "DELETE FROM  [reg].[dbo].[eventbook] WHERE bkid=@bkid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@bkid", bkid);
            cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            LoadEvents();
        }
        catch (Exception ex)
        {
        }
}
           
}