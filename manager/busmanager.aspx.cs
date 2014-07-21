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

public partial class manager_busmanager : System.Web.UI.Page
{
    BLLBus bus_BLL = new BLLBus();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void Load_List()
    {


    }
    private bool Add()
    {
        
        /* 
         * Set bus info
        */
        int result = bus_BLL.Add_Bus();
        return result > 0;
    }
    private bool Update()
    {
        /* 
         * Update bus info
        */
        int result = bus_BLL.Update_Bus();
        return result > 0;
    }
    private bool Delete()
    {
        /* 
         * Set bus ID
        */
        int result = bus_BLL.Update_Bus();
        return result > 0;
    }
    private void Search_CatID_CentralID()
    {
        /* 
        * Set CentralID, CatID
       */
        DataSet ds=bus_BLL.Search();
    }
    private void Search_BusID()
    {
        /* 
        * Set bus ID
       */
        ds = bus_BLL.getByID();
    }
    private void Search_BusName_Central_CatID()
    {
        /* 
        * Set bus Name, CentralID, CatID
       */
        ds = bus_BLL.GetBy_StationID_Cat_ID();
    }
}
