using System;
using System.Data;
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DALRouteBus
/// </summary>
public class DALRouteBus:ConnectionString
{
    private SqlConnection con = null;
    public DALRouteBus(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}
    public int Add(BLLRouteBus rb)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("AddRouteBus", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@BusID", rb.BusID);
            cmd.Parameters.Add("@RouteID", rb.RouteID);
            cmd.Parameters.Add("@DateStart", rb.DateStart);
            //cmd.Parameters.Add("@Price", rb.Price);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        catch (Exception)
        {
            return -1;
        }
    }
    public int Update(BLLRouteBus rb)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateRouteBus", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@RBID", rb.RBID);
            cmd.Parameters.Add("@BusID", rb.BusID);
            cmd.Parameters.Add("@RouteID", rb.RouteID);
            cmd.Parameters.Add("@DateStart", rb.DateStart);
            cmd.Parameters.Add("@AvailableSeat", rb.AvailableSeat);
            //cmd.Parameters.Add("@Price", rb.Price);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        catch (Exception)
        {
            return -1;
        }
    }
    public int Delete(BLLRouteBus rb)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("DeleteRouteBus", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@RBID", rb.RBID);

            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        catch (Exception)
        {
            return -1;
        }
    }
    public DataSet Get(BLLRouteBus rb)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetRouteBus";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@RBID", rb.RBID);
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "RouteBus");

        return ds;
    }
    public DataSet Search(BLLRouteBus rb, String BusName, int StartID, int DesID, String DateAbove, String DateBelow)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SearchRouteBus";
        cmd.CommandType = CommandType.StoredProcedure;
        if (rb.RBID == 0)
            cmd.Parameters.Add("@RBID", "");
        else
            cmd.Parameters.Add("@RBID", rb.RBID+"");
        if (rb.RouteID == null)
            cmd.Parameters.Add("@RouteID", "");
        else
            cmd.Parameters.Add("@RouteID", rb.RouteID);
        if (rb.BusID == null)
            cmd.Parameters.Add("@BusID", "");
        else
            cmd.Parameters.Add("@BusID", rb.BusID);
        if (BusName == null)
            cmd.Parameters.Add("@BusName", "");
        else
            cmd.Parameters.Add("@BusName", BusName);

        cmd.Parameters.Add("@StartingPlace", StartID);

        cmd.Parameters.Add("@Destination", DesID);
        if (DateAbove == "")
            cmd.Parameters.Add("@DateAbove", "12/04/1990");
        else
            cmd.Parameters.Add("@DateAbove", DateAbove);
        if (DateBelow == "")
            cmd.Parameters.Add("@DateBelow", "12/04/2100");
        else
            cmd.Parameters.Add("@DateBelow", DateBelow);
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "RouteBus");

        return ds;
    }
    public bool CheckDupRouteBus(BLLRouteBus rb)
    {
        try
        {
            SqlCommand cmd = null;
            string CommanText = " SELECT COUNT(*) FROM RouteBus "
            + " WHERE RouteID=@RouteID "
            + " AND BusID=@BusID "
            +" AND DateStart=@DateStart ";
            if (rb.RBID == 0)
            {
                cmd = new SqlCommand(CommanText);
                cmd.Parameters.Add("@RouteID", rb.RouteID);
                cmd.Parameters.Add("@BusID", rb.BusID);
                cmd.Parameters.Add("@DateStart", rb.DateStart);
            }
            else
            {
                CommanText += " AND RBID != @RBID ";
                cmd = new SqlCommand(CommanText);
                cmd.Parameters.Add("@RouteID", rb.RouteID);
                cmd.Parameters.Add("@BusID", rb.BusID);
                cmd.Parameters.Add("@DateStart", rb.DateStart);
                cmd.Parameters.Add("@RBID", rb.RBID);
            }
            con.Open();
            cmd.Connection = con;
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                int total = rdr.GetInt32(0);
                if (total > 0)
                {
                    return true;
                }
                return false;
            }
        }
        catch (Exception)
        {
            return false;
        }
        return false;
    }
}
