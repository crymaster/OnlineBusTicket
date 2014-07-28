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

public partial class CustomerView : System.Web.UI.UserControl
{
    BLLCustomer cus_BLL = new BLLCustomer();
    DataSet ds=new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cus_BLL.CustomerID = "";
            cus_BLL.Name = "";
            ds = cus_BLL.Get();
            CusGV.DataSource = ds;
            CusGV.DataBind();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
