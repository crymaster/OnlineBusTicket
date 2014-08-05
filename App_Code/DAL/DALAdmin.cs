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
using System.Security.Cryptography;
using System.Text;

public class DALAdmin
{
    private SqlConnection con = null;
    public DALAdmin(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}
    public DataSet GetAdminByID(BLLAdmin admin)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("GetAdminByID", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@AdminID", admin.AdminID);
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds, "Admins");
            con.Close();
            return ds;
        }
        catch (Exception)
        {
            return null;
        }
    }
    //public int Add(BLLAdmin emp)
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("AddEmployee", con);
    //        cmd.CommandType = CommandType.StoredProcedure;

    //        cmd.Parameters.Add("@CentralID", emp.CentralID);
    //        cmd.Parameters.Add("@Name", emp.Name);
    //        cmd.Parameters.Add("@Email", emp.Email);
    //        cmd.Parameters.Add("@Address", emp.Address);
    //        cmd.Parameters.Add("@Phone", emp.Phone);
    //        cmd.Parameters.Add("@DOB", emp.DOB);
    //        cmd.Parameters.Add("@Qualification", emp.Qualification);
            

    //        con.Open();
    //        int i = cmd.ExecuteNonQuery();
    //        con.Close();
    //        return i;
    //    }
    //    catch (Exception)
    //    {
    //        return -1;
    //    }
    //}

    //public int Update(BLLEmployee emp)
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("UpdateEmployee", con);
    //        cmd.CommandType = CommandType.StoredProcedure;

    //        cmd.Parameters.Add("@EmpId", emp.EmpID);
    //        cmd.Parameters.Add("@CentralID", emp.CentralID);
    //        cmd.Parameters.Add("@Name", emp.Name);
    //        cmd.Parameters.Add("@Email", emp.Email);
    //        cmd.Parameters.Add("@Address", emp.Address);
    //        cmd.Parameters.Add("@Phone", emp.Phone);
    //        cmd.Parameters.Add("@DOB", emp.DOB);
    //        cmd.Parameters.Add("@Qualification", emp.Qualification);

    //        con.Open();
    //        int i = cmd.ExecuteNonQuery();
    //        con.Close();
    //        return i;
    //    }
    //    catch (Exception)
    //    {
    //        return -1;
    //    }
    //}

    //public int Delete(BLLEmployee emp)
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand("DeleteEmployee", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@EmpID", emp.EmpID);
    //        con.Open();
    //        int i = cmd.ExecuteNonQuery();
    //        con.Close();
    //        return i;
    //    }
    //    catch (Exception)
    //    {
    //        return -1;
    //    }
    //}

    //public DataSet getById(BLLEmployee emp)
    //{
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandText = "GetAdminById";
    //    cmd.Parameters.Add("@AdminID", emp.EmpID);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Connection = con;

    //    SqlDataAdapter da = new SqlDataAdapter(cmd);

    //    DataSet ds = new DataSet();

    //    da.Fill(ds, "Admins");

    //    return ds;
    //}

    //public DataSet Search(BLLEmployee emp)
    //{
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandText = "GetEmployees";
    //    if(emp.EmpID==null)
    //        cmd.Parameters.Add("@EmpId", 0);
    //    else
    //        cmd.Parameters.Add("@EmpId", emp.EmpID);
    //    if (emp.EmpID == null)
    //        cmd.Parameters.Add("@Name", "");
    //    else 
    //        cmd.Parameters.Add("@Name", emp.Name);
    //    cmd.Parameters.Add("@CentralID", emp.CentralID);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Connection = con;

    //    SqlDataAdapter da = new SqlDataAdapter(cmd);

    //    DataSet ds = new DataSet();

    //    da.Fill(ds, "Employees");

    //    return ds;
    //}
    public int ChangePassword(BLLAdmin admin, String NewPass)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("ChangeAdminPassword", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@AdminID", admin.AdminID);
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
    
    public int CheckLogin(String Email, String Pass)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("CheckAdminLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Email", Email);
            cmd.Parameters.Add("@Password", SHA1Password(Pass));

            con.Open();
            //SqlDataReader reader = cmd.ExecuteReader();
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();

            da.Fill(ds, "Admins");
            String id = ds.Tables[0].Rows[0]["AdminID"].ToString();
            con.Close();
            return int.Parse(id);
            //if (reader.HasRows)
            //{
            //    String id = reader.GetSchemaTable().Rows[0]["AdminID"].ToString();
            //    con.Close();
            //    return int.Parse(id);
            //}

        }
        catch (Exception)
        {
            return -1;
        }
    }
    private String SHA1Password(String password)
    {
        SHA1Managed sha1 = new SHA1Managed();
        byte[] hash=sha1.ComputeHash(System.Text.Encoding.Default.GetBytes(password));
        string str = BLLCommon.HexStringFromBytes(hash);
        return str;
    }
   
}
