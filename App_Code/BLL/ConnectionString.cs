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

/// <summary>
/// Summary description for ConnectionString
/// </summary>
public class ConnectionString
{
    public string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["OnlineBusTicketConnectionString"].ConnectionString;
}
