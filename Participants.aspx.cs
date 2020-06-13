using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Participants : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        load1();
    }

    private void load1()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "  select fname,uemail,photo from reg_users inner join eventbook on eventbook.uid = reg_users.uid where eventbook.eid = @eid;";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@eid",Request.QueryString["eid"]);
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
}