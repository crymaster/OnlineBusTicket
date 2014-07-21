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

public partial class manager_routebusmanager : System.Web.UI.Page
{
    BLLRouteBus routebus_BLL = new BLLRouteBus();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void Load_List()
    {
        // Get 
        ds = routebus_BLL.Get();
    }
    private bool Add()
    {

        /* 
         * Set bus info
        */
        int result = routebus_BLL.Add();
        return result > 0;
    }
    private bool Update()
    {
        /* 
         * Update bus info
        */
        int result = routebus_BLL.Update();
        return result > 0;
    }
    private bool Delete()
    {
        /* 
         * Set bus ID
        */
        int result = routebus_BLL.Delete();
        return result > 0;
    }
}
