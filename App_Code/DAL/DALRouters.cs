﻿using System;
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
/// Summary description for DALRouters
/// </summary>
public class DALRouters:ConnectionString
{
    private SqlConnection con = null;
    public DALRouters(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}
    public int Add(BLLRouters router)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("AddRoutes", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@StartingPlace", router.StartingPlace);
            cmd.Parameters.Add("@Destination", router.Destination);
            cmd.Parameters.Add("@Distance", router.Distance);

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

    public int Update(BLLRouters router)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateRoutes", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@RouteID", router.RouterID);
            cmd.Parameters.Add("@StartingPlace", router.StartingPlace);
            cmd.Parameters.Add("@Destination", router.Destination);
            cmd.Parameters.Add("@Distance", router.Distance);

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

    public DataSet Get(BLLRouters router)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetRoutes";
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@RouteID", router.RouterID);
        cmd.Parameters.Add("@StartingPlace", router.StartingPlace);
        cmd.Parameters.Add("@Destination", router.Destination);
        

        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Routes");

        return ds;
    }

    public int Delete(BLLRouters router)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("DeleteRoutes", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@RouteID", router.RouterID);

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
    public bool CheckDupStartDes(BLLRouters route)
    {
        try
        {
            SqlCommand cmd = null;
            string CommanText = " SELECT COUNT(*) FROM Routes "
			+ " WHERE Routes.StartingPlace=@StartingPlace "
            + " AND Routes.Destination=@Destination ";
            if (route.RouterID == null || route.RouterID == "" || route.RouterID == "0")
            {
                cmd = new SqlCommand(CommanText);
                cmd.Parameters.Add("@StartingPlace", route.StartingPlace);
                cmd.Parameters.Add("@Destination", route.Destination);
            }
            else
            {
                CommanText += " AND Routes.RouteID != @RouteID ";
                cmd = new SqlCommand(CommanText);
                cmd.Parameters.Add("@RouteID", route.RouterID);
                cmd.Parameters.Add("@StartingPlace", route.StartingPlace);
                cmd.Parameters.Add("@Destination", route.Destination);
            }
            con.Open();
            cmd.Connection = con;
            SqlDataReader rdr = cmd.ExecuteReader();

            while (rdr.Read())
            {
                int total = rdr.GetInt32(0);
                con.Close();
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
        finally
        {
            con.Close();
        }
        return false;
    }
}
