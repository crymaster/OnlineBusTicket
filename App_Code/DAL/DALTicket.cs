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

public class DALTicket
{
    private SqlConnection con = null;
    public DALTicket(string connectionString)
	{
        con = new SqlConnection(connectionString);
    }
    public int Add(BLLTicket ticket)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("AddTicket", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@rbid", ticket.RBID);
            cmd.Parameters.Add("@SeatID", ticket.SeatID);
            cmd.Parameters.Add("@type", ticket.Type);
            cmd.Parameters.Add("@PromotionID", ticket.PromotionID);
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
    public int GetSeatIDByRBID(int _rbid)
    {
        int SeatID;
        try
        {
            SqlCommand cmd = new SqlCommand("GetSeatIDByRBID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@rbid", _rbid);
            con.Open();
            SeatID = (int)cmd.ExecuteScalar();
            con.Close();
            return SeatID;
        }
        catch (Exception e)
        {
            return -1;
        }
    }
    public int GetLastedTicketID()
    {
        try
        {
            SqlCommand cmd = new SqlCommand("GetLastedTicketID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            int TID = (int)cmd.ExecuteScalar();
            con.Close();
            return TID;
        }
        catch (Exception ex)
        {
            throw new DataException(ex.Message);
            return -1;
        }
    }
    public double GetPromotePercent(int _TID)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("CalPromotions", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@TicketID", _TID);
            con.Open();
            double TID = (double)cmd.ExecuteScalar();
            con.Close();
            return TID;
        }
        catch (Exception ex)
        {
            throw new DataException(ex.Message);
            return -1;
        }
    }
    public int UpdateAvailableSeats(string _newSeats, int _quantity,int _RBID)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateAvailableSeats", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@seat", _newSeats);
            cmd.Parameters.AddWithValue("@quantity", _quantity);
            cmd.Parameters.AddWithValue("@RBID", _RBID);
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
    public int UpdateCounterRBID(int _RBID)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateCounterRouteBus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@RBID", _RBID);
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
    public DataSet GetByID(string ID)
    {
        SqlDataAdapter da1;
        DataSet ds1;
        try
        {
            da1 = new SqlDataAdapter("GetTicketByID", con);
            da1.SelectCommand.CommandType = CommandType.StoredProcedure;
            da1.SelectCommand.Parameters.Add("@TicketID", ID);
            ds1 = new DataSet();
            da1.Fill(ds1, "Tickets");
            return ds1;
        }
        catch { return null; }
    }
}
