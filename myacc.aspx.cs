using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myacc : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        {
            if (Session["email"] == null)
            {
                Response.Redirect("org.aspx");
            }
            else
            {
                loadD();
            }
        }

    }
    public void loadD()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }

            cmd = new SqlCommand("SELECT [org_id],[comp],[addc],[landline],[email],[logo] FROM [reg].[dbo].[reg_orga] WHERE email=@email", conn);
            cmd.Parameters.AddWithValue("@email", Session["email"]);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblId.Text = Convert.ToString(dr["org_id"]);
                lbname.Text = Convert.ToString(dr["comp"]);
                lbadd.Text=Convert.ToString(dr["addc"]);
                lbnum.Text=Convert.ToString(dr["landline"]);
                lbemail.Text = Convert.ToString(dr["email"]);
                if (Convert.ToString(dr["logo"]) != "")
                {
                    ImageBtn.ImageUrl = "~/Images/userImages/" + Convert.ToString(dr["logo"]);
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
        editlogo.Visible = true;
        btedit.Visible = false;
        profileViews.Visible = false;
    }
    protected void btCancelImage_Click(object sender, EventArgs e)
    {
        profileViews.Visible = true;
        editlogo.Visible = false;
        btedit.Visible = true;
    }
    protected void btUpdateImage_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = null;
            string extension = null;
            if (flogo.HasFile)
            {
                try
                {
                    filename = lblId.Text.Trim();
                    extension = Path.GetExtension(flogo.PostedFile.FileName);
                    uploadIm(filename, extension);
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
            cmd = new SqlCommand("UPDATE reg_orga SET logo = @logo WHERE org_id=@org_id", conn);
            cmd.Parameters.AddWithValue("@org_id", Convert.ToInt32(lblId.Text.Trim()));
            cmd.Parameters.AddWithValue("@logo", filename + extension);
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            loadD();

        }
        catch (Exception ex)
        {
            
            throw ex;
        }
    }
    private void uploadIm(string filename, string extension)
    {
        flogo.SaveAs(Server.MapPath("~/Images/userImages/") + filename + extension);
    }
    protected void btedit_Click(object sender, EventArgs e)
    {
        Response.Redirect("upd.aspx");
    }
}