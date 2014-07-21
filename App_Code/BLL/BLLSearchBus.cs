using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


/// <summary>
/// Summary description for BLLSearchBus
/// </summary>
public class BLLSearchBus:ConnectionString
{
    private int _StartPlace;
    private int _Destination;
    private DateTime _Starting;
    private DALSearchBus dalObj;
    #region GETER/SETTER
    public int StartPlace
    {
        get { return _StartPlace; }
        set { _StartPlace = value; }
    }
    public int Destination
    {
        get { return _Destination; }
        set { _Destination = value; }
    }
    public DateTime Starting
    {
        get { return _Starting; }
        set { _Starting = value; }
    }
    #endregion
	public BLLSearchBus()
	{
        dalObj = new DALSearchBus(connectionString);
	}
    public DataSet Search()
    {
        return dalObj.Search(this);
    }
    
    public DataRow GetRowChoosen(int key)
    {
        return dalObj.GetRowChoosen(Search(), key);
    }
    public string GetAvailableSeats(int _RBID)
    {
        return dalObj.getSeats(_RBID);
    }
    public int countSearch(DataSet ds)
    {
        return dalObj.CountSearch(Search());
    }
      
    
}
