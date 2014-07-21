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

public class DALContactUs
{
    private SqlConnection con = null;
    public DALContactUs(string connectionString)
	{
        con = new SqlConnection(connectionString);
	}
    public int Add(BLLContactUs cts)
    {
      try
        {
            SqlCommand cmd = new SqlCommand("AddFeedback", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@FullName", cts.FullName);
            cmd.Parameters.Add("@Address", cts.Address);
            cmd.Parameters.Add("@Email", cts.Email);
            cmd.Parameters.Add("@Content", cts.Content);
            cmd.Parameters.Add("@Telephone", cts.Telephone);
            cmd.Parameters.Add("@Title", cts.Title);
            cmd.Parameters.Add("@DateCreated", DateTime.Now);
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
}
