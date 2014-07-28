using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BLLRouteBus
/// </summary>
public class BLLRouteBus:ConnectionString
{
    private int _RBID;
    private string _BusID;
    private string _RouteID;
    private string _DateStart;
    private int _AvailableSeat;
    private float _Price;

#region GETER/SETTER
    public int RBID
    {
        get {return _RBID; }
        set { _RBID = value; }
    }
    public string RouteID
    {
        get { return _RouteID; }
        set { _RouteID = value; }
    }
    public string BusID
    {
        get { return _BusID; }
        set { _BusID = value; }
    }
    public string DateStart
    {
        get { return _DateStart; }
        set { _DateStart = value; }
    }
    public int AvailableSeat
    {
        get { return _AvailableSeat; }
        set { _AvailableSeat = value; }
    }
    public float Price
    {
        get { return _Price; }
        set { _Price = value; }
    }
    #endregion

    DALRouteBus dalRouteBus = null;
	public BLLRouteBus()
	{
        dalRouteBus = new DALRouteBus(connectionString);
	}

    public int Add()
    {
        return dalRouteBus.Add(this);
    }
    public int Update()
    {
        return dalRouteBus.Update(this);
    }
    public int Delete()
    {
        return dalRouteBus.Delete(this);
    }
    public DataSet Get()
    {
        return dalRouteBus.Get(this);
    }
    public DataSet Search(String BusName, int start, int des, String DateAbove, String DateBelow)
    {
        return dalRouteBus.Search(this, BusName, start, des, DateAbove, DateBelow);
    }
}
