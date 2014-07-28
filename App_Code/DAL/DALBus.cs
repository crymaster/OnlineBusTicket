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
/// Summary description for DALBus
/// </summary>
public class DALBus:ConnectionString
{
    private SqlConnection con = null;
    public DALBus(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}

    public int Add(BLLBus bus) 
    {
        try
        {
            SqlCommand cmd = new SqlCommand("InsertBus", con);
            cmd.CommandType = CommandType.StoredProcedure;

            //cmd.Parameters.Add("@BusName", bus.Name);
            cmd.Parameters.Add("@BusNumSeat", bus.NumSeat);
            cmd.Parameters.Add("@BusNumberPlate", bus.NumberPlate);
            cmd.Parameters.Add("@StationID", bus.StationID);
            cmd.Parameters.Add("@Cat_ID", bus.Cat_ID);

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

    public int Update(BLLBus bus)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateBus", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@BusID", bus.BusID);
            //cmd.Parameters.Add("@BusName", bus.Name);
            cmd.Parameters.Add("@BusNumSeat", bus.NumSeat);
            cmd.Parameters.Add("@BusNumberPlate", bus.NumberPlate);
            cmd.Parameters.Add("@StationID", bus.StationID);
            cmd.Parameters.Add("@Cat_ID", bus.Cat_ID);

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

    public DataSet Search(BLLBus bus)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SearchBus_1";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Bus");

        return ds;
    }

    public DataSet GetByID(BLLBus bus)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetBusByBusID";
        cmd.Parameters.Add("@BusID", bus.BusID);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Bus");

        return ds;
    }

    public DataSet GetBy_BusName_StationID_Cat_ID(BLLBus bus)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetBusBy_Centrals_Categories";
        cmd.Parameters.Add("@BusName", bus.Name);
        cmd.Parameters.Add("@StationID", bus.StationID);
        cmd.Parameters.Add("@Cat_ID", bus.Cat_ID);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Bus");

        return ds;
    }

    public int Delete(BLLBus bus)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("DeleteBus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@BusID", bus.BusID);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        catch (Exception ex)
        {
            return -1;   
        }
    }
    public DataSet Get(BLLBus bus)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetBus";
        if(bus.BusID==null)
            cmd.Parameters.Add("@BusID", "");
        else
            cmd.Parameters.Add("@BusID", bus.BusID);
        cmd.Parameters.Add("@Name", bus.Name);
        cmd.Parameters.Add("@NumberPLate", bus.NumberPlate);
        cmd.Parameters.Add("@CentralID", bus.StationID);
        cmd.Parameters.Add("@Cat_ID", bus.Cat_ID);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Bus");

        return ds;
    }
}
