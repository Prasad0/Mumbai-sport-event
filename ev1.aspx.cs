using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class ev1 : System.Web.UI.Page
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
            string query = "select event.eid,event.ephoto,event.ename,convert(varchar,estartdate,101)as estartdate from event;";
            SqlCommand cmd = new SqlCommand(query,conn);
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
    protected void lnkViewPet_Click(object sender, EventArgs e)
    {
        string[] arguments = (((LinkButton)sender).CommandArgument).ToString().Split(',');
        int eid = Convert.ToInt32(arguments[0]);
        Response.Redirect("viewevent.aspx?eid="+eid);
    }
}
