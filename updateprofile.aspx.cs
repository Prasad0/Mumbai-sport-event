using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class updateprofile : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["uemail"] == null)
            {
                Response.Redirect("login.aspx");
            }
            loadData();
            lblwelcome.Visible = true;
            lblwelcome.Text = "Welcome " + Convert.ToString(Session["fname"]);
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
            cmd = new SqlCommand("SELECT [uid],[fname],[lname],[address],[gender],[pnum],[pass],[photo],[state],[about],[uage] FROM [reg].[dbo].[reg_users] WHERE uemail=@uemail", conn);
            cmd.Parameters.AddWithValue("@uemail", Session["uemail"]);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblId.Text = Convert.ToString(dr["uid"]);
                tfname.Text = Convert.ToString(dr["fname"]);
                tlname.Text = Convert.ToString(dr["lname"]);
                txtaddr.Text = Convert.ToString(dr["address"]);
                txtnum.Text = Convert.ToString(dr["pnum"]);
                txtstate.Text = Convert.ToString(dr["state"]);
                txtdob.Text = Convert.ToString(dr["uage"]);
                txtabout.Text = Convert.ToString(dr["about"]);

            }
            conn.Close();
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    private void updates()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            //cmd = new SqlCommand("UPDATE reg_users SET fname='rajesh',lname='ghffhf',address='vhgjhgj',pnum='7896541265',state='hfhfd',about='jghdfhe',uage= '12-05-2006' WHERE uid=2", conn);
            cmd = new SqlCommand("UPDATE reg_users SET fname=@fname,lname=@lname,address=@address,pnum=@pnum,state=@state,about=@about,uage=@uage WHERE uid=@uid", conn);
            cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(lblId.Text.Trim()));
            cmd.Parameters.AddWithValue("@fname", tfname.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", tlname.Text.Trim());
            cmd.Parameters.AddWithValue("@pnum", txtnum.Text.Trim());
            cmd.Parameters.AddWithValue("@uage", txtdob.Text.Trim());
            cmd.Parameters.AddWithValue("@address", txtaddr.Text.Trim());
            cmd.Parameters.AddWithValue("@state", txtstate.SelectedValue);
            cmd.Parameters.AddWithValue("@about", txtabout.Text.Trim());
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
        updates();
        Response.Redirect("uprofile.aspx");
    }
}