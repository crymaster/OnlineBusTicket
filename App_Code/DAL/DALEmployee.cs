using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public class DALEmployee
{
    private SqlConnection con = null;
	public DALEmployee(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}
    public int Add(BLLEmployee emp)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("AddEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@EmpId", emp.EmpID);
            cmd.Parameters.Add("@CentralID", emp.CentralID);
            cmd.Parameters.Add("@Role_ID", emp.Role_ID);
            cmd.Parameters.Add("@Name", emp.Name);
            cmd.Parameters.Add("@Email", emp.Email);
            cmd.Parameters.Add("@Address", emp.Address);
            cmd.Parameters.Add("@Phone", emp.Phone);
            cmd.Parameters.Add("@DOB", emp.DOB);
            cmd.Parameters.Add("@Qualification", emp.Qualification);
            

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

    public int Update(BLLEmployee emp)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@EmpId", emp.EmpID);
            cmd.Parameters.Add("@CentralID", emp.CentralID);
            cmd.Parameters.Add("@Role_ID", emp.Role_ID);
            cmd.Parameters.Add("@Name", emp.Name);
            cmd.Parameters.Add("@Email", emp.Email);
            cmd.Parameters.Add("@Address", emp.Address);
            cmd.Parameters.Add("@Phone", emp.Phone);
            cmd.Parameters.Add("@DOB", emp.DOB);
            cmd.Parameters.Add("@Qualification", emp.Qualification);

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

    public int Delete(BLLEmployee emp)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("DeleteEmployee", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@EmpID", emp.EmpID);
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

    public DataSet getById(BLLEmployee emp)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetEmployeesById";
        cmd.Parameters.Add("@EmpId", emp.EmpID);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Employees");

        return ds;
    }

    public DataSet Search(BLLEmployee emp)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SearchEmployees";
        cmd.Parameters.Add("@Name", emp.Name);
        cmd.Parameters.Add("@Email", emp.Email);
        cmd.Parameters.Add("@Address", emp.Address);
        cmd.Parameters.Add("@Qualification", emp.Qualification);
        cmd.Parameters.Add("@CentralID", emp.CentralID);
        cmd.Parameters.Add("@RoleID", emp.Role_ID);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Employees");

        return ds;
    }
    //public string UpdateEmployee(BLLEmployee cus)
    //{
    //    string msg = "OK;";

    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("UpdateEmployee", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@E_Id", cus.E_Id);
    //        cmd.Parameters.Add("@E_Password", cus.E_Password);
    //        con.Open();
    //        int i = cmd.ExecuteNonQuery();
    //        con.Close();
    //        msg += " " + i.ToString() + " record(s) effected.";
    //    }
    //    catch (Exception ex)
    //    {
    //        msg = ex.Message;
    //    }
    //    return msg;
    //}
    //public DataSet SearchE()
    //{
    //    SqlConnection con = new SqlConnection("data source=.;database=aspnetdb;uid=sa;pwd=12345");
    //    con.Open();
    //    string sql = "Select E_Id,E_Role_Id,E_Name,E_Password,E_Email,E_Address,E_Phone,E_Location,E_Qualification,E_Age from Employees ";

    //    SqlDataAdapter da = new SqlDataAdapter(sql, con);

    //    DataSet ds = new DataSet();

    //    da.Fill(ds, "Employee");

    //    return ds;
    //}
    //public DataSet EProfile(string UserID)
    //{
    //    //SqlConnection con = new SqlConnection("data source=.;database=OnlineBusTicket;uid=sa;pwd=12345");
    //    con.Open();
    //    string sql = "Select * from Employees where Employees.E_Id= '" + UserID + "'";

    //    SqlDataAdapter da = new SqlDataAdapter(sql, con);

    //    DataSet ds = new DataSet();

    //    da.Fill(ds, "Employee");

    //    return ds;
    //}
    //public DataSet SearchID()
    //{
    //    SqlConnection con = new SqlConnection("data source=.;database=aspnetdb;uid=sa;pwd=12345");
    //    con.Open();
    //    string sql = "Select E_Id from Employees";

    //    SqlDataAdapter da = new SqlDataAdapter(sql, con);

    //    DataSet ds = new DataSet();

    //    da.Fill(ds, "Employee");

    //    return ds;
    //}
    //public string Search(BLLEmployee cus)
    //{
    //    string msg = "OK;";

    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("Search", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@E_Column", cus.E_Column);
    //        cmd.Parameters.Add("@E_Value", cus.E_Value);
    //        con.Open();
    //        int i = cmd.ExecuteNonQuery();
    //        con.Close();
    //        msg += " " + i.ToString() + " record(s) effected.";
    //    }
    //    catch (Exception ex)
    //    {
    //        msg = ex.Message;
    //    }
    //    return msg;
    //}
    //public DataSet SearchAE(string id,string text)
    //{
    //    SqlConnection con = new SqlConnection("data source=.;database=aspnetdb;uid=sa;pwd=12345");
    //    con.Open();
    //    string sql = "Select * from Employees where" + id + "= '" + text + "'";

    //    SqlDataAdapter da = new SqlDataAdapter(sql, con);

    //    DataSet ds = new DataSet();

    //    da.Fill(ds, "Employee");

    //    return ds;
    //}
}
