using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class team : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void regteam()
    {
        try
        {
             string filename = null;
                if (fimg.HasFile)
                {
                    try
                    {
                        filename = Path.GetFileName(fimg.FileName);
                        uploads(filename);
                    }
                    catch
                    {

                    }
                  }
                if (conn.State != ConnectionState.Open)
                {
                    {
                        conn.Open();
                    }
                    cmd = new SqlCommand("insert into [dbo].[team]([tname],[tphoto],[mem1],[mem2],[mem3],[mem4],[mem5],[mem6],[mem7],[mem8],[mem9],[mem10]) values (@tname,@tphoto,@mem1,@mem2,@mem3,@mem4,@mem5,@mem6,@mem7,@mem8,@mem9,@mem10,)", conn);
                    cmd.Parameters.AddWithValue("@tname", tname.Text.Trim());
                    cmd.Parameters.AddWithValue("@tphoto", filename);
                    cmd.Parameters.AddWithValue("@mem1",m1.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem2",m2.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem3",m3.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem4", m4.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem5", m5.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem6", m6.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem7", m7.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem8", m8.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem9", m9.Text.Trim());
                    cmd.Parameters.AddWithValue("@mem10", m10.Text.Trim());
                    int i = cmd.ExecuteNonQuery();
                }
                else
                {

                }
                conn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        regteam();
    }
     public void uploads(string filename)
    {
        fimg.SaveAs(Server.MapPath("~/Images/userImages/") + filename);   
    }
}