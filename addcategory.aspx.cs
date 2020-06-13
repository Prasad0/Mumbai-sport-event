using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class addcategory : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["regConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("adminlogin.aspx");
            }

            loadAllCategory();
        }
    }

    private void loadAllCategory()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "SELECT [cid],[ctype],[ctag] FROM [dbo].[category]";
            SqlCommand cmd = new SqlCommand(query, conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            rptCategory.DataSource = ds.Tables[0];
            rptCategory.DataBind();
            conn.Close();


        }
        catch (Exception ex)
        {

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (btnSubmit.Text == "Submit")
        {
            AddCategoryInDB();
            clearDetails();
        }
        else
        {
            UpdateCategoryInDB();
            clearDetails();
        }
    }

    private void AddCategoryInDB()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }



            String query = "insert into [reg].[dbo].[category] ([ctype],[ctag],[AddedBy],[AddedOn]) values (@ctype,@ctag,@AddedBy,@AddedOn)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@ctype", txtCategoryName.Text.Trim());
            cmd.Parameters.AddWithValue("@ctag", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@AddedBy", Session["username"]);
            cmd.Parameters.AddWithValue("@AddedOn", DateTime.Now);


            int i = cmd.ExecuteNonQuery();

            conn.Close();
            clearDetails();
            loadAllCategory();
        }
        catch (Exception e)
        {

        }
    }

    private void UpdateCategoryInDB()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            Int32 cid = Convert.ToInt32(ViewState["cid"]);
            string query = "UPDATE [reg].[dbo].[Category] SET ctype=@ctype,ctag=@ctag,AddedBy=@AddedBy,AddedOn=@AddedOn,UpdateBy=@UpdateBy,UpdateOn=@UpdateOn where cid=@cid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.Parameters.AddWithValue("@ctype", txtCategoryName.Text.Trim());
            cmd.Parameters.AddWithValue("@ctag", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@AddedBy", Session["username"]);
            cmd.Parameters.AddWithValue("@AddedOn", DateTime.Now);
            cmd.Parameters.AddWithValue("@UpdateBy", Session["username"]);
            cmd.Parameters.AddWithValue("@UpdateOn", DateTime.Now);
            int isChange = cmd.ExecuteNonQuery();


            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

            clearDetails();
            loadAllCategory();
            btnSubmit.Text = "Submit";
        }
        catch (Exception ex)
        {
        }
    }

    private void clearDetails()
    {
        txtCategoryName.Text = String.Empty;
        TextBox1.Text = String.Empty;
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        clearDetails();
    }

    protected void imgEdit_Click(object sender, ImageClickEventArgs e)
    {
        string[] arguments = (((ImageButton)sender).CommandArgument).ToString().Split(',');
        int cid = Convert.ToInt32(arguments[0]);
        btnSubmit.Text = "Update";
        ViewState["cid"] = cid;
        FillBreedDetails(cid);
    }

    private void FillBreedDetails(int cid)
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            //Int32 cid = Convert.ToInt32(cid);
            string query = "SELECT [ctype],[ctag] FROM [reg].[dbo].[category] WHERE cid=@cid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@cid", cid);

            SqlDataReader dr;
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtCategoryName.Text = Convert.ToString(dr["ctype"]);
                TextBox1.Text = Convert.ToString(dr["ctag"]);


            }
            dr.Close();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }

        }
        catch (Exception ex)
        {

        }
    }

    protected void imgDelete_Click(object sender, ImageClickEventArgs e)
    {
        string[] arguments = (((ImageButton)sender).CommandArgument).ToString().Split(',');
        int cid = Convert.ToInt32(arguments[0]);

        ViewState["cid"] = cid;
        DeletePetCategory(cid);
        loadAllCategory();
    }

    private void DeletePetCategory(int cid)
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "DELETE FROM  [reg].[dbo].[category] WHERE cid=@cid";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@cid", cid);
            cmd.ExecuteNonQuery();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            loadAllCategory();
        }
        catch (Exception ex)
        {
        }
    }
}