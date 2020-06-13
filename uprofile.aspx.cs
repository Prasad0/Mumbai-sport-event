using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class uprofile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        {
             if (Session["uemail"] == null)
             {
                Response.Redirect("reg.aspx");
             }
             else
            {
                loadData();
            }
        }
    }
    private void loadData()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }

            cmd = new SqlCommand("SELECT [uid],[fname],[lname],[address],[gender],[pnum],[uemail],[pass],[photo],[state],[about],[uage] FROM [reg].[dbo].[reg_users] WHERE uemail=@uemail", conn);
            cmd.Parameters.AddWithValue("@uemail", Session["uemail"]);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblId.Text = Convert.ToString(dr["uid"]);
                lblfname.Text  = Convert.ToString(dr["fname"]);
                lbllname.Text = Convert.ToString(dr["lname"]);
                if (Convert.ToString(dr["gender"]) == "M")
                {
                    lblgender.Text = "Male";
                    ViewState["gend"] = Convert.ToString(dr["gender"]);
                }
                else if (Convert.ToString(dr["gender"]) == "F")
                {
                    lblgender.Text = "Female";
                    ViewState["gend"] = Convert.ToString(dr["gender"]);
                }
                lblemail.Text = Convert.ToString(dr["uemail"]);
                lblnum.Text = Convert.ToString(dr["pnum"]);
                lblstate.Text=Convert.ToString(dr["state"]);
                lbladd.Text = Convert.ToString(dr["address"]);
                lbldesc.Text = Convert.ToString(dr["about"]);
                Session["uage"] = Convert.ToString(dr["uage"]);
                if (Convert.ToString(dr["uage"]) != "")
                {
                    int age = 0;
                    age = DateTime.Now.Year - Convert.ToDateTime(dr["uage"]).Year;
                    if (DateTime.Now.DayOfYear < Convert.ToDateTime(dr["uage"]).DayOfYear)
                        age = age - 1;
                    lblage.Text = Convert.ToString(age);
                }
                if (Convert.ToString(dr["photo"]) != "")
                {
                    ImageButton1.ImageUrl = "~/Images/userImages/" + Convert.ToString(dr["photo"]);
                }
                else
                { }
            }
            conn.Close();
        }
        catch (Exception ex)
        {

            throw ex;
         }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        profileView.Visible = false;
        btnUpdatePwd.Visible = false;
        editImage.Visible = true;
    }

    protected void btnedit_Click(object sender, EventArgs e)
    {
        Response.Redirect("updateprofile.aspx?uid="+lblId.Text.ToString());
    }
    protected void btnCancelImage_Click(object sender, EventArgs e)
    {
        profileView.Visible = true;
        btnUpdatePwd.Visible = true;
        editImage.Visible = false;
    }
    protected void btnUpdateImage_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = null;
            string extension = null;
            if (fuphoto.HasFile)
            {
                try
                {
                    filename = lblId.Text.Trim();
                    extension = Path.GetExtension(fuphoto.PostedFile.FileName);
                    uploadImage(filename, extension);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            cmd = new SqlCommand("UPDATE reg_users SET photo = @photo WHERE uid=@uid", conn);
            cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(lblId.Text.Trim()));
            cmd.Parameters.AddWithValue("@photo", filename + extension);
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            loadData();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    private void uploadImage(string filename, string extension)
    {
        fuphoto.SaveAs(Server.MapPath("~/Images/userImages/") + filename + extension);
        //if image not working comment and uncomment below line also try clearing cookies and caches Or try Shift+refresh
        // ImageButton1.ImageUrl= "~/images/profileimage/" + filename + extension;
    }

}
