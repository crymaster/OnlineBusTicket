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
            cmd.Parameters.Add("@Travels", rb.Travels);
            cmd.Parameters.Add("@DateStart", rb.DateStart);
            cmd.Parameters.Add("@MaxSeat", rb.MaxSeat);
            cmd.Parameters.Add("@Fake", rb.Fake);
            cmd.Parameters.Add("@Counter", rb.Counter);

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
            cmd.Parameters.Add("@Travels", rb.Travels);
            cmd.Parameters.Add("@DateStart", rb.DateStart);
            cmd.Parameters.Add("@MaxSeat", rb.MaxSeat);
            cmd.Parameters.Add("@Fake", rb.Fake);
            cmd.Parameters.Add("@Counter", rb.Counter);

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
}
