using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public class DALBooking
{
    private SqlConnection con = null;
    public DALBooking(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}
    public int Add(BLLBooking booking)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("AddBooking", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CustomerID", booking.CustomerID);
            cmd.Parameters.Add("@EmpID", booking.EmpID);
            cmd.Parameters.Add("@BookingDate", booking.DateBooking);
            cmd.Parameters.Add("@IsCanceled", booking.IsCanceled);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        catch (Exception ex)
        {
            throw new DataException(ex.Message);
            return -1;
        }
    }
    public int AddBookingDetails(int _bid, int _tid, int _quantity, string _pos, float _fare)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("AddBD", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@bid", _bid);
            cmd.Parameters.Add("@tid", _tid);
            cmd.Parameters.Add("@quantity", _quantity);
            cmd.Parameters.Add("@pos", _pos);
            cmd.Parameters.Add("@fare", _fare);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        catch (Exception ex)
        {
            throw new DataException(ex.Message);
            return -1;
        }
    }
    public int GetLastedBookID()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("GetLastedBookID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            int BID = (int)cmd.ExecuteScalar();
            con.Close();
            return BID;
        }
        catch (Exception ex)
        {
            throw new DataException(ex.Message);
            return -1;
        }
    }
    public int CountCustIDFromBookings(string _custID)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("CountCusIDFromBookings", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@CusId", _custID);
            con.Open();
            int count = (int)cmd.ExecuteScalar();
            con.Close();
            return count;
        }
        catch (Exception ex)
        {
            throw new DataException(ex.Message);
            return -1;
        }
    }
}
