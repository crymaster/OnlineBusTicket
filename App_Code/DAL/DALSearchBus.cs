using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;


public class DALSearchBus
{
    private SqlConnection con = null;
    private int eff;
	public DALSearchBus(string connectionString)
	{
        con = new SqlConnection(connectionString);
        eff = 0;
	}
    public int GetEff()
    {
        return eff;
    }
    public DataSet Search(BLLSearchBus srb)
    {
        string msg = "";
        DataSet ds = new DataSet();
        try
        {
            SqlCommand cmd = new SqlCommand("SearchBus", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@StartPlace", srb.StartPlace);
            cmd.Parameters.Add("@Dest", srb.Destination);
            cmd.Parameters.Add("@StartTime", srb.Starting);
           
            con.Open();
            eff = cmd.ExecuteNonQuery();
            con.Close();
            msg += " " + eff.ToString() + " record(s) effected.";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);

        }
        catch (Exception)
        {
            // msg = ex.Message;
        }
        return ds;
    }
    public DataRow GetRowChoosen(DataSet ds, int key)
    {
        DataRow dr;
        int Pos=0, i=0;
        foreach (DataRow dr1 in ds.Tables[0].Rows)
        {
            if(dr1[6].Equals(key)) {Pos = i;break;}
            else i++;
        }

        dr = ds.Tables[0].Rows[Pos];
        return dr;
    }
    public string getSeats(int RBID)
    {
        string seats="";
        try
        {
            SqlCommand cmd = new SqlCommand("GetAvailableSeats", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@RBID", RBID);
            con.Open();
            seats = (string)cmd.ExecuteScalar();
            con.Close();
        }
        catch (Exception){}
        return seats;
    }

   //check searching return any data ?
    public int CountSearch(DataSet ds1)
    {
       return ds1.Tables[0].Rows.Count;
    }
}
