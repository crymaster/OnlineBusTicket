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

public partial class manager_ticketmanager : System.Web.UI.Page
{
    BLLTicket ticket_BLL = new BLLTicket();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void Load_List()
    {
        // Get 
        // ds = ticket_BLL.Get();
    }
    private bool Add()
    {

        /* 
         * Set bus info
        */
        int result = ticket_BLL.Add();
        return result > 0;
    }

    private bool UpdateAvailableSeats(string newSeats, int quantity, int RBID)
    {
        /* 
         * Set bus ID
        */
        int result = ticket_BLL.UpdateAvailableSeats( newSeats,  quantity,  RBID);
        return result > 0;
    }
    public DataSet GetByID(string ID)
    {
        ds = ticket_BLL.GetByID(ID);
        return ds;
    }
}
