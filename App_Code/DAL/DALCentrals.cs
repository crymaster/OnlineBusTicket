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
/// Summary description for DALCentrals
/// </summary>
public class DALCentrals:ConnectionString
{
    private SqlConnection con = null;
    public DALCentrals(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}

    public int Add(BLLCentrals cent)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("AddCentrals", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Cent_Name", cent.Cent_Name);
            cmd.Parameters.Add("@Address", cent.Address);
            cmd.Parameters.Add("@Director", cent.Director);
            cmd.Parameters.Add("@Phone", cent.Phone);

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
    public int Update(BLLCentrals cent)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateCentrals", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CentralID", cent.CentralID);
            cmd.Parameters.Add("@Cent_Name", cent.Cent_Name);
            cmd.Parameters.Add("@Address", cent.Address);
            cmd.Parameters.Add("@Director", cent.Director);
            cmd.Parameters.Add("@Phone", cent.Phone);

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

    public DataSet getCentral(BLLCentrals cent)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetCentral";
        cmd.Parameters.Add("@CentralID", cent.CentralID);
        if(cent.Cent_Name !=null)
            cmd.Parameters.Add("@Cent_Name", cent.Cent_Name);
        else
            cmd.Parameters.Add("@Cent_Name", "");
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Centrals");

        return ds;
    }

    public int Delete(BLLCentrals cent)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("DeleteCentrals", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@CentralID", cent.CentralID);

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
    public bool CheckDupName(BLLCentrals cent)
    {
        try
        {
            SqlCommand cmd = null;
            string CommanText = "SELECT COUNT(*) as total FROM Centrals WHERE ";
            if (cent.CentralID == 0)
            {
                CommanText += "Cent_Name = @Cent_Name";
                cmd = new SqlCommand(CommanText);
                cmd.Parameters.Add("@Cent_Name", cent.Cent_Name);
            }
            else
            {
                CommanText += "Cent_Name = @Cent_Name AND CentralID != @CentralID";
                cmd = new SqlCommand(CommanText);
                cmd.Parameters.Add("@Cent_Name", cent.Cent_Name);
                cmd.Parameters.Add("@CentralID", cent.CentralID);
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
