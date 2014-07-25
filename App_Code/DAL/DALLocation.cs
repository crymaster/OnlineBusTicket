using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for DALlocations
/// </summary>
public class DALLocation:ConnectionString
{
    private SqlConnection con = null;
    public DALLocation(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}
    public int Add(BLLLocation location)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("Addlocation", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Name", location.Name);
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

    public int Update(BLLLocation location)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@LocationID", location.LocationID);
            cmd.Parameters.Add("@Name", location.Name);

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

    public DataSet Get(BLLLocation location)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetLocations";
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@LocationID", location.LocationID);
        cmd.Parameters.Add("@Name", location.Name);

        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "locations");

        return ds;
    }
    

    public int Delete(BLLLocation location)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("DeleteLocation", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@LocationID", location.LocationID);
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
}
