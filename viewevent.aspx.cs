using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class viewevent : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(@"Data Source=SUHAS\SQLEXPRESS;Initial Catalog=reg;Integrated Security=True");
    SqlCommand cmd = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        lod();
    }
    private void lod()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            int str = Convert.ToInt32(Request.QueryString["eid"]);
            ViewState["eid"] = str;
            string query = "select eid,ephoto,ename,convert(varchar,estartdate,101)as estartdate,convert(varchar,eenddate,101)as eenddate,location,description,price from event where eid=" + str.ToString();
            SqlCommand cmd = new SqlCommand(query, conn);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            fevent.DataSource = ds.Tables[0];
            fevent.DataBind();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
        catch (Exception ex)
        {

            throw ex;
        }
    }
    protected void btnBook_Click(object sender, EventArgs e)
    {
        checkForPreviousEntry();
        
    }

    private void checkForPreviousEntry()
    {
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            string checkuser = "select count(*) from [dbo].[eventbook] where uid=@uid and eid=@eid";
            cmd = new SqlCommand(checkuser, conn);
            cmd.Parameters.AddWithValue("@uid", Session["uid"]);
            cmd.Parameters.AddWithValue("@eid", Request.QueryString["eid"]);
            string temp = (cmd.ExecuteScalar().ToString());
            conn.Close();
            if (temp == "1")
            {
                string display = "you have already booked this event";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);
            }
            else
            {
                int bookingid = bookevent();
                SendEmail1 s = new SendEmail1();
                string msg = Convert.ToString("<br />You have been booked for an event in our Web site <br/>Your Booking Reference ID: <b>" + DateTime.Now.Year + "" + DateTime.Now.Month + "" + DateTime.Now.Day + "AP" + Convert.ToString(bookingid) + "</b><br /><br />");
                s.sendEMail(Convert.ToString(Session["uemail"]), "Event", msg);
                Response.Redirect("BookedEvents.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
           // throw ex;
        }
    }

    private int bookevent()
    {
        int bookingid = 0;
        try
        {
            if (conn.State != ConnectionState.Open)
            {
                {
                    conn.Open();
                }
            }
            cmd = new SqlCommand("INSERT INTO [dbo].[eventbook] ([eid] ,[uid]) VALUES (@eid,@uid)", conn); ;
            cmd.Parameters.AddWithValue("@uid", Session["uid"]);
            cmd.Parameters.AddWithValue("@eid", Request.QueryString["eid"]);
            int i = cmd.ExecuteNonQuery();
            conn.Close();

        }
        catch (Exception ex)
        {
            throw ex;
        }
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "SELECT MAX(bkid)AS bkid FROM eventbook";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                bookingid = Convert.ToInt32(dr["bkid"]);
            }
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }
        catch (Exception ex)
        {

        }
        return bookingid;
    }
}