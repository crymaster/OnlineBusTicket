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

public class DALCategory
{
    private SqlConnection con = null;
	public DALCategory(string connectionString)
    {
        con = new SqlConnection(connectionString);
    }
    public int Add(BLLCategory cat)
    {
      try
        {
            SqlCommand cmd = new SqlCommand("AddCategory", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Type", cat.Type);
            cmd.Parameters.Add("@Description", cat.Description);
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
    public int Update(BLLCategory cat)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("UpdateCategory", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Cat_ID", cat.Cat_ID);
            cmd.Parameters.Add("@Type", cat.Type);
            cmd.Parameters.Add("@Description", cat.Description);
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
    public int Delete(BLLCategory cat)
    {
        try
        {
            SqlCommand cmd = new SqlCommand("DeleteCategory", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@Cat_ID", cat.Cat_ID);
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
    public DataSet Get(BLLCategory cat)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "GetCategories";
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add("@Cat_ID", cat.Cat_ID);
        cmd.Parameters.Add("@Type", cat.Type);
      

        cmd.Connection = con;

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataSet ds = new DataSet();

        da.Fill(ds, "categories");

        return ds;
    }

}
