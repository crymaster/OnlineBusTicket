using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class ViewListBus : System.Web.UI.UserControl
{
    BLLBus bus_BLL = new BLLBus();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    DataView dv = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        ds = bus_BLL.Search();
        BusGV.DataSource = ds;
        BusGV.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
