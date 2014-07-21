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


public class DALCheckFare
{
    private SqlConnection con=null;
    SqlDataAdapter da;
    DataSet ds;
    SqlCommand cmd;
    public DALCheckFare()
	{
        con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["OBTRSConnectionString"].ConnectionString);
	}
    public DataSet GetStartLocation()
    {
        cmd = new SqlCommand("GetStartLocation", con);
        da = new SqlDataAdapter(cmd);
        ds = new DataSet();
        da.Fill(ds, "Locations");
        return ds;
    }
}
