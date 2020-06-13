using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class devents : System.Web.UI.Page
{
    string query2 = "select @@Identity";
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    int compid,eid;
    protected void Page_Load(object sender, EventArgs e)
    {
        //filldll();
        loadCompanyName();
    }
    private void filldll()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("SELECT cid,ctype FROM category",conn);
            SqlDataReader dr = cmd.ExecuteReader();

            ddl1.Items.Clear();
            ListItem list = null;
            list = new ListItem();
            list.Text = "Select";
            list.Value = "";
            ddl1.Items.Add(list);
            while (dr.Read())
            {
                list = new ListItem();
                list.Value = dr["cid"].ToString();
                list.Text = dr["ctype"].ToString();
                ddl1.Items.Add(list);
            }
            conn.Close();
        }
        catch (Exception ex)
        {
            
            throw ex;
        }
    }
    private void loadCompanyName()
    {

        txtOrganizedBy.Text = Convert.ToString(Session["comp"]);
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            cmd = new SqlCommand("select org_id from [dbo].[reg_orga] where comp = @comp;", conn);
            //string query = "select org_id from [dbo].[reg_orga] where comp = @comp;";
            cmd.Parameters.AddWithValue("@comp", Convert.ToString(Session["comp"]));
            //cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            // int i =  cmd.ExecuteNonQuery();
            while (dr.Read())
            {
                compid = Convert.ToInt32(dr["org_id"]);
            }
            dr.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }

    public void detail()
    {
        try
        {
            string file = null;
            if (eimage.HasFile)
            {
                try
                {
                    file = Path.GetFileName(eimage.FileName);
                    upload(file);

                }
                catch
                {

                }
            }

            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            cmd = new SqlCommand("INSERT INTO [dbo].[event] ([ename] ,[estartdate] ,[eenddate] ,[location] ,[description] ,[ephoto] ,[org_id],[cid],[price]) VALUES (@ename,@estartdate,@eenddate,@location,@description,@ephoto,@orgid,@cid,@price)", conn);
            cmd.Parameters.AddWithValue("@cid", Convert.ToInt32(ddl1.SelectedValue));
            cmd.Parameters.AddWithValue("@ename", enames.Text.Trim());
            cmd.Parameters.AddWithValue("@estartdate", Convert.ToDateTime(estart.Text));
            cmd.Parameters.AddWithValue("@eenddate", Convert.ToDateTime( eend.Text));
            cmd.Parameters.AddWithValue("@location", venu.Text.Trim());
            cmd.Parameters.AddWithValue("@description", Description.Text.Trim());
            cmd.Parameters.AddWithValue("@orgid", compid);
            cmd.Parameters.AddWithValue("@ephoto", file);
            cmd.Parameters.AddWithValue("@price",txtprice.Text.Trim());
            int i = cmd.ExecuteNonQuery();
            cmd.CommandText = query2;
            eid = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            conn.Close();
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        detail();
        Response.Redirect("activeevent.aspx");

    }
    public void upload(string file)
    {
        eimage.SaveAs(Server.MapPath("~/Images/event/") + file);
    }
}