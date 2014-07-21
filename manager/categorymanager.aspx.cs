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

public partial class manager_categorymanager : System.Web.UI.Page
{
    BLLCategory category_BLL = new BLLCategory();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void Load_List()
    {
        // Get all
        
    }
    private bool Add()
    {

        /* 
         * Set bus info
        */
        int result = category_BLL.Add();
        return result > 0;
    }
}
