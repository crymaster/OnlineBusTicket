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

            cmd.Parameters.Add("@CentralID", emp.CentralID);
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
        cmd.CommandText = "GetEmployees";
        if(emp.EmpID==null)
            cmd.Parameters.Add("@EmpId", 0);
        else
            cmd.Parameters.Add("@EmpId", emp.EmpID);
        if (emp.EmpID == null)
            cmd.Parameters.Add("@Name", "");
        else 
            cmd.Parameters.Add("@Name", emp.Name);
        cmd.Parameters.Add("@CentralID", emp.CentralID);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "Employees");

        return ds;
    }
    public int ChangePassword(BLLEmployee emp, String NewPass)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("ChangeEmployeePassword", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@EmpId", emp.EmpID);
            cmd.Parameters.Add("@Password", SHA1Password(NewPass));

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
    
    public String CheckLogin(String Email, String Pass)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("CheckEmployeeLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Email", Email);
            cmd.Parameters.Add("@Password", Pass);

            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                String id = reader.GetSchemaTable().Rows[0][0].ToString();
                con.Close();
                return id;
            }

        }
        catch (Exception)
        {
            return null;
        }
        return null;
    }
    private String SHA1Password(String password)
    {
        return password;
    }
}
