using System;
using System.Data;
using System.Data.SqlClient;
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
/// Summary description for BLLRouter
/// </summary>
public class BLLRouters : ConnectionString
{
    private string _RouterID;
    private int _StartingPlace;
    private int _Destination;
    private string _StartingTiming;
    private string _DestinationTiming;
    private int _Distance;

    #region GETER/SETTER
    public string RouterID
    {
        get { return _RouterID; }
        set { _RouterID = value; }
    }
    public int StartingPlace
    {
        get { return _StartingPlace; }
        set { _StartingPlace = value; }
    }
    public int Destination
    {
        get { return _Destination; }
        set { _Destination = value; }
    }
    public string StartingTiming
    {
        get { return _StartingTiming; }
        set { _StartingTiming = value; }
    }
    public string DestinationTiming
    {
        get { return _DestinationTiming; }
        set { _DestinationTiming = value; }
    }
    public int Distance
    {
        get { return _Distance; }
        set { _Distance = value; }
    }
    #endregion

    DALRouters dalRouters = null;

    public BLLRouters()
    {
        dalRouters = new DALRouters(connectionString);
    }

    public int Add()
    {
        return dalRouters.Add(this);
    }
    public int Update()
    {
        return dalRouters.Update(this);
    }
    public int Delete()
    {
        return dalRouters.Delete(this);
    }
    public DataSet Get()
    {
        return dalRouters.Get(this);
    }
    public bool CheckDupStartDes()
    {
        return dalRouters.CheckDupStartDes(this);
    }
}
