using System;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;


public partial class PrintTicket : System.Web.UI.Page
{
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["TicketID"] != null)
        {
            int ticketID = int.Parse(Session["TicketID"].ToString());
            DataSet1TableAdapters.DataTable3TableAdapter adapt = new DataSet1TableAdapters.DataTable3TableAdapter();
            DataTable dt = adapt.GetInfoOnTicket(ticketID);
            if (dt.Rows.Count > 0)
            {
                lblTID.Text = dt.Rows[0]["TicketID"].ToString();
                lblBus.Text = dt.Rows[0]["BusID"].ToString();
                lblPassenger.Text = dt.Rows[0]["Name"].ToString();
                lblNP.Text = dt.Rows[0]["NumberPlate"].ToString();
                lblS.Text = dt.Rows[0]["Name1"].ToString();
                lblD.Text = dt.Rows[0]["Name2"].ToString();
                lblDate.Text = dt.Rows[0]["DateStart"].ToString();
                lblSeat.Text = dt.Rows[0]["SeatNum"].ToString();
            }
        }
        else
        {
            Response.Redirect("SearchTour.aspx");
        }
    }
    
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        Session["ctrl"] = Panel1;
        ClientScript.RegisterStartupScript(this.GetType(), "onclick", "<script language=javascript>window.open('Print.aspx','PrintMe','height=300px,width=300px,scrollbars=1');</script>");
        Response.Redirect("CurrentBooking.aspx");
    }
}
