using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;



public partial class reg : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    public void Registeruser()
    {

        try
        {
           
                string filename = null;
                if (fuImage.HasFile)
                {
                    try
                    {
                        filename = Path.GetFileName(fuImage.FileName);
                        uploadImage(filename);
                    }
                    catch
                    {

                   }
                }
                //openConnection(conn);
                if (conn.State != ConnectionState.Open)
                {
                    {
                    conn.Open();
                    }
                }
                    cmd = new SqlCommand("INSERT INTO [reg].[dbo].[reg_users] (fname,lname,address,gender,uemail,pass,photo) VALUES (@fname,@lname,@address,@gender,@uemail,@pass,@photo)", conn); ;
                    cmd.Parameters.AddWithValue("@fname", fname.Text.Trim());
                    cmd.Parameters.AddWithValue("@lname", lname.Text.Trim());
                    cmd.Parameters.AddWithValue("@address", add.Text.Trim());
                    cmd.Parameters.AddWithValue("@photo", filename);
                    string gender = string.Empty;
                    if (rbMale.Checked)
                    {
                        cmd.Parameters.AddWithValue("@gender", "M");
                    }
                    else if (rbFemale.Checked)
                    {
                        cmd.Parameters.AddWithValue("@gender", "F");
                    }
                    cmd.Parameters.AddWithValue("@uemail", eadd.Text.Trim());
                    cmd.Parameters.AddWithValue("@pass", password.Text.Trim());
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Failed.Visible = true;
                        div.Visible = false;
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
        fname.Text = String.Empty;
        lname.Text = String.Empty;
        add.Text = String.Empty;
        eadd.Text = String.Empty;
        password.Text = String.Empty;
    }

    protected void eadd_TextChanged(object sender, EventArgs e)
    {
        checkemail();
    }

    private void checkemail()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            string checkuser = "select count(*) from [dbo].[reg_users] where uemail='" + eadd.Text.Trim() + "'";
            cmd = new SqlCommand(checkuser, conn);
            string temp = (cmd.ExecuteScalar().ToString());
            conn.Close();
            if (temp == "1")
            {
                Label2.Text = "email is already registered";
                // HyperLink1.Visible = true;
                eadd.Focus();
            }
            else
            {
                Label2.Text = "";
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
  
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Registeruser();
        cleardetail();

       // Response.Redirect("~/home.aspx");
    }

    public void uploadImage(string filename)
    {
        fuImage.SaveAs(Server.MapPath("~/Images/userImages/") + filename);   
    }
}