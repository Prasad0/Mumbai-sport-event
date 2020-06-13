using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class orgl : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void Registerorg()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            cmd = new SqlCommand("insert into [dbo].[reg_orga](comp,addc,landline,email,password) values (@comp,@addc,@landline,@email,@password)", conn);
            cmd.Parameters.AddWithValue("@comp", cname.Text.Trim());
            cmd.Parameters.AddWithValue("@addc", addc.Text.Trim());
            cmd.Parameters.AddWithValue("@landline",lnum.Text.Trim());
            cmd.Parameters.AddWithValue("@email", oeid.Text.Trim());
            cmd.Parameters.AddWithValue("@password", pass.Text.Trim());
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Failed.Visible = true;
            }
            conn.Close();
            clears();

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void clears()
    {
        cname.Text = String.Empty;
        addc.Text = String.Empty;
       lnum.Text = String.Empty;
        oeid.Text = String.Empty;
        pass.Text = String.Empty;
    }
   
    protected void btn1_Click(object sender, EventArgs e)
    {
        Registerorg();
    }
}