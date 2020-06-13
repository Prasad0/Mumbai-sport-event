using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class News : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    private void addnew()
    {
        try
        {

        if (conn.State != ConnectionState.Open)
                {
                    {
                    conn.Open();
                    }
                }
        cmd = new SqlCommand("INSERT INTO [reg].[dbo].[news] (org_id ,subject,content) VALUES (@org_id,@subject,@content)", conn); ;
            cmd.Parameters.AddWithValue("@org_id",Convert.ToInt32(Session["orgid"]));
            cmd.Parameters.AddWithValue("@subject", Txt1.Text.Trim());
           cmd.Parameters.AddWithValue("@content", TextBox1.Text.Trim());
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Failed.Visible = true;
                       
                    }
                conn.Close();
                cleardetail();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    private void cleardetail()
    {
        Txt1.Text = String.Empty;
        TextBox1.Text = String.Empty;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        addnew();
    }
}