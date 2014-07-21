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

public partial class manager_bookingmanager : System.Web.UI.Page
{
    BLLBooking booking_BLL = new BLLBooking();
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
        int result = booking_BLL.Add();
        return result > 0;
    }
    private bool AddDetail(int bid, int tid, int quantity, string pos, float fare)
    {

        /* 
         * Set bus info
        */
        int result = booking_BLL.AddBookingDetails( bid,  tid,  quantity,  pos,  fare);
        return result > 0;
    }
   
}
