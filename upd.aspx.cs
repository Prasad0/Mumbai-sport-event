using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class upd : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["email"] == null)
            {
                Response.Redirect("org.aspx");
            }
            loadData();
            lblwelcome.Visible = true;
            lblwelcome.Text = "Welcome " + Convert.ToString(Session["comp"]);
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
            cmd = new SqlCommand("SELECT [org_id],[comp] ,[addc] ,[landline] ,[email]  FROM [reg].[dbo].[reg_orga] WHERE email=@email", conn);
            cmd.Parameters.AddWithValue("@email", Session["email"]);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lbId.Text = Convert.ToString(dr["org_id"]);
                cname.Text = Convert.ToString(dr["comp"]);
                txtaddr.Text = Convert.ToString(dr["addc"]);
                txtnum.Text = Convert.ToString(dr["landline"]);
                txtem.Text = Convert.ToString(dr["email"]);
            }
            conn.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    private void up()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            cmd = new SqlCommand("UPDATE reg_orga SET comp=@comp ,addc=@addc ,landline=@landline ,email=@email WHERE email=@email", conn);
            cmd.Parameters.AddWithValue("@org_id", Convert.ToInt32(lbId.Text.Trim()));
            cmd.Parameters.AddWithValue("@comp", cname.Text.Trim());
            cmd.Parameters.AddWithValue("@addc",txtaddr.Text.Trim());
            cmd.Parameters.AddWithValue("@landline", txtnum.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtem.Text.Trim());

            int i = cmd.ExecuteNonQuery();
            conn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }
 
    }
    protected void btnsub_Click(object sender, EventArgs e)
    {
        up();
        Response.Redirect("myacc.aspx");
    }
}