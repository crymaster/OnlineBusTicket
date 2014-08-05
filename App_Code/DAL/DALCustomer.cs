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
using System.Collections.Generic;

/// <summary>
/// Summary description for clsDAL
/// </summary>
public class DALCustomer
{
    //
    // TODO: Add constructor logic here
    //
    private SqlConnection con = null;

    public DALCustomer(string connectionString)
    {
        con = new SqlConnection(connectionString);
    }
    public string Add(BLLCustomer cust)
    {
        string msg = "OK;";

        try
        {
            SqlCommand cmd = new SqlCommand("AddCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Name", cust.Name);
            cmd.Parameters.Add("@Gender", cust.Gender);
            cmd.Parameters.Add("@Email", cust.Email);
            cmd.Parameters.Add("@Address", cust.Address);
            cmd.Parameters.Add("@Phone", cust.Phone);
            cmd.Parameters.Add("@DOB", cust.DOB);
            cmd.Parameters.Add("@DateCreated", cust.DateCreated);
            cmd.Parameters.Add("@TimesBooking", cust.TimesBooking);
            cmd.Parameters.Add("@CustomerID", cust.CustomerID);
            cmd.Parameters.Add("@RegistedBy", cust.RegistedBy);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            msg += " " + i.ToString() + " record(s) effected.";
        }
        catch (Exception ex)
        {
            msg = ex.Message;
        }
        return msg;

    }
    public string UpdateCustomer(BLLCustomer cust)
    {
        string msg = "OK;";

        try
        {
            SqlCommand cmd = new SqlCommand("UpdateCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Name", cust.Name);
            cmd.Parameters.Add("@Gender", cust.Gender);
            cmd.Parameters.Add("@Email", cust.Email);
            cmd.Parameters.Add("@Address", cust.Address);
            cmd.Parameters.Add("@Phone", cust.Phone);
            cmd.Parameters.Add("@DOB", cust.DOB);
            cmd.Parameters.Add("@DateCreated", cust.DateCreated);
            cmd.Parameters.Add("@TimesBooking", cust.TimesBooking);
            cmd.Parameters.Add("@CustomerID", cust.CustomerID);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            msg += " " + i.ToString() + " record(s) effected.";
        }
        catch (Exception ex)
        {
            msg = ex.Message;
        }
        return msg;
    }
 
    public string DeleteCustomer(BLLCustomer cust)
    {
        string msg = "OK;";

        try
        {
            SqlCommand cmd = new SqlCommand("DeleteCustomer", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@CustomerID", cust.CustomerID);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            msg += " " + i.ToString() + " record(s) effected.";
        }
        catch (Exception ex)
        {
            msg = ex.Message;
        }
        return msg;
    }
    public List<string> GetListRegistedBy()
    {
        List<string> li = new List<string>();
        try
        {
            SqlCommand cmd = new SqlCommand("GetRegistedBy", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                li.Add((string)dr["RegistedBy"]);
            }
            con.Close();
        }
        catch (Exception e) { }
        return li;
    }
    public DataTable GetCustByRegistedBy(string reg)
    {
        DataTable dt = new DataTable();
        try
        {
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("GetCustByRegistedBy", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@reg", reg);
            con.Open();
            da.SelectCommand = cmd;
            da.Fill(dt);
            con.Close();
        }
        catch (Exception ex) { }
        return dt;
    }
    public string GetCustIDByRegistedBy(string reg)
    {
        string custID = "";
        try
        {
            SqlCommand cmd = new SqlCommand("GetCustIDByRegistedBy", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@reg", reg);
            con.Open();
            custID = (string)cmd.ExecuteScalar();
            con.Close();
        }
        catch (Exception e) { }
        return custID;
    }
    public int UpdateTimesBooking(int times,string user)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateTimesBooking", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Reg", user);
            cmd.Parameters.AddWithValue("@times", times);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return i;
        }
        catch (Exception e)
        {
            throw new DataException(e.Message);
            return -1;
        }
    }
    public DataSet Get(BLLCustomer cust)
    {
            SqlCommand cmd = new SqlCommand("GetCustomers", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (cust.CustomerID == null)
            {
                cust.CustomerID = "";
            }
            cmd.Parameters.AddWithValue("@CustomerID", cust.CustomerID);
            if (cust.Name == null)
            {
                cust.Name = "";
            }
            cmd.Parameters.AddWithValue("@Name", cust.Name);
            if (cust.Email == null)
            {
                cust.Email = "";
            }
            cmd.Parameters.AddWithValue("@Email", cust.Email);
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds, "Customers");

            return ds;
    }
}

