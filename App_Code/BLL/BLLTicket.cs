using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public class BLLTicket:ConnectionString
{
	private int _TicketID;
    private int _RBID;
    private int _SeatID;
    private string _Type;
    private int _PromotionID;

    DALTicket dalObj;
    #region GETER/SETTER
    public int TicketID
    {
        get { return _TicketID; }
        set { _TicketID = value; }
    }
    public int RBID
    {
        get { return _RBID; }
        set { _RBID = value; }
    }
    public int SeatID
    {
        get { return _SeatID; }
        set { _SeatID = value; }
    }
    public string Type
    {
        get { return _Type; }
        set { _Type = value; }
    }
    public int PromotionID
    {
        get { return _PromotionID; }
        set { _PromotionID = value; }
    }
    #endregion
	public BLLTicket()
	{
        dalObj = new DALTicket(connectionString);
	}
    public int Add()
    {
        return dalObj.Add(this);
    }
    public int GetSeatIDByRBID(int rbid)
    {
        return dalObj.GetSeatIDByRBID(rbid);
    }
    public int GetPromotionID(int age)
    {
        int PID=0;
        if (age < 10) PID = 1002; //reduce 50% cost
        if ((age >= 10) && (age <= 20)) PID = 1000;//reduce 30% cost
        else PID = 1001; //None reducing
        return PID;
    }
    public int GetLastedTicketID()
    {
        return dalObj.GetLastedTicketID();
    }
    public double GetPromotePercent(int _TID)
    {
        return dalObj.GetPromotePercent(_TID);
    }
    public int UpdateAvailableSeats(string _newSeats, int _quantity, int _RBID)
    {
        return dalObj.UpdateAvailableSeats(_newSeats, _quantity, _RBID);
    }
    public int UpdateCounterRBID(int _RBID)
    {
        return dalObj.UpdateCounterRBID(_RBID);
    }
    public DataSet GetByID(string ID)
    {
        return dalObj.GetByID(ID);
    }
}
