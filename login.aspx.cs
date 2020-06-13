using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;


public partial class login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "690881080076-aoetkfp8l1aelvehkpgopgkr8q369ubd.apps.googleusercontent.com";
        GoogleConnect.ClientSecret = "yWbM4T-n0iozw-zUplwPrSmz";
        GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];
        
        if (!string.IsNullOrEmpty(Request.QueryString["code"]))
        {
            string code = Request.QueryString["code"];
            string json = GoogleConnect.Fetch("me", code);
            GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
            //lblId.Text = profile.Id;
            //lblName.Text = profile.DisplayName;
            //lblEmail.Text = profile.Emails.Find(email => email.Type == "account").Value;
            //lblGender.Text = profile.Gender;
            //lblType.Text = profile.ObjectType;
            //ProfileImage.ImageUrl = profile.Image.Url;
            //pnlProfile.Visible = true;
            //btnLogin.Enabled = false;
           try
            {
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                }
                string checkuser = "select count(*) from [reg].[dbo].[reg_users] where uemail='" + profile.Emails.Find(email => email.Type == "account").Value.ToString() + "'";
                cmd = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1)
                {
                    conn.Close();
                    Session["uemail"] = Convert.ToString(profile.Emails.Find(email => email.Type == "account").Value);
                    Response.Redirect("uprofile.aspx");
                }
                else
                {
                    if (conn.State != ConnectionState.Open)
                    {
                        conn.Open();
                    }
                    cmd = new SqlCommand("INSERT INTO [reg].[dbo].[reg_users] (fname,uemail) VALUES (@fname,@uemail)", conn);
                    cmd.Parameters.AddWithValue("@fname", profile.DisplayName.ToString());
                    cmd.Parameters.AddWithValue("@uemail", profile.Emails.Find(email => email.Type == "account").Value.ToString());
                    //cmd.Parameters.AddWithValue("@photo",profile.Image.Url.ToString());
                    int i = cmd.ExecuteNonQuery();
                    conn.Close();
                    Session["uemail"] = Convert.ToString(profile.Emails.Find(email => email.Type == "account").Value);
                    Response.Redirect("uprofile.aspx");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        if (Request.QueryString["error"] == "access_denied")
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('Access denied.')", true);
        }
    }
    public void verifyuser()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            string query = "select uid,uemail,pass,fname from [dbo].[reg_users] where uemail=@uemail and pass=@pass";
            cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@uemail", ename.Text.ToString());
            cmd.Parameters.AddWithValue("@pass", pass.Text.ToString());
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            var user = da.Fill(ds);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                if (user > 0)
                {
                    while (dr.Read())
                        {
                            Session["uid"] = Convert.ToString(dr["uid"]);
                            Session["uemail"] = Convert.ToString(dr["uemail"]);
                            Session["fname"] = Convert.ToString(dr["fname"]);
                            Response.Redirect("home.aspx");
                        }
                }
            }
            else
            {
                Label1.Text = "Login Fail";
                Label1.Visible = true;
            }
            conn.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void Btn_Click(object sender, EventArgs e)
    {
        verifyuser();
       
    }
    protected void btnGoogle_Click(object sender, EventArgs e)
    {
        GoogleConnect.Authorize("profile", "email");
    }
    public class GoogleProfile
    {
        public string Id { get; set; }
        public string DisplayName { get; set; }
        public Image Image { get; set; }
        public List<Email> Emails { get; set; }
        public string Gender { get; set; }
        public string ObjectType { get; set; }
    }

    public class Email
    {
        public string Value { get; set; }
        public string Type { get; set; }
    }

    public class Image
    {
        public string Url { get; set; }
    }
}