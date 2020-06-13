using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Configuration;
using System.Net;
using System.Drawing;

public partial class forget : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        string username = string.Empty;
        string password = string.Empty;
        string constr = ConfigurationManager.ConnectionStrings["regConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT uemail,pass FROM [reg].[dbo].[reg_users] WHERE uemail = @uemail"))
            {
                cmd.Parameters.AddWithValue("@uemail", txtbx1.Text.Trim());
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    if (sdr.Read())
                    {
                        username = sdr["uemail"].ToString();
                        password = sdr["pass"].ToString();
                    }
                }
                con.Close();
            }
        }
        if (!string.IsNullOrEmpty(password))
        {
            MailMessage mm = new MailMessage("tandelprasad463@gmail.com", txtbx1.Text.Trim());
            mm.Subject = "Password Recovery";
            mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", username, password);
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "tandelprasad463@gmail.com";
            NetworkCred.Password = "new@mumbai123";
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
            lblMessage.ForeColor = Color.Green;
            lblMessage.Text = "Password has been sent to your email address.";
        }
        else
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "This email address does not match our records.";
        }

    }
}