using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
public class BLLBooking:ConnectionString
{
    private int _BID;
    private string _CustID;
    private string _EmpID;
    private DateTime _DateBooking;
    private bool _IsCanceled;
    DALBooking dalObj;
    #region GETER/SETTER
    public int BID
    {
        get { return _BID; }
        set { _BID = value; }
    }
    public string CustomerID
    {
        get { return _CustID; }
        set { _CustID = value; }
    }
    public string EmpID
    {
        get { return _EmpID; }
        set { _EmpID = value; }
    }
    public DateTime DateBooking
    {
        get { return _DateBooking; }
        set { _DateBooking = value; }
    }
    public bool IsCanceled
    {
        get { return _IsCanceled; }
        set { _IsCanceled = value; }
    }
    #endregion
	public BLLBooking()
	{
        dalObj = new DALBooking(connectionString);
	}
    public int Add()
    {
        return dalObj.Add(this);
    }
    public int AddBookingDetails(int _bid, int _tid, int _quantity, string _pos, float _fare)
    {
        return dalObj.AddBookingDetails(_bid, _tid,  _quantity,  _pos,  _fare);
    }
    public int GetLastedBookID()
    {
        return dalObj.GetLastedBookID();
    }
    public int CountCustIDFromBookings(string CustomerID)
    {
        return dalObj.CountCustIDFromBookings(CustomerID);
    }
}
