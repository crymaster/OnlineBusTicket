using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for BLLBus
/// </summary>
public class BLLBus:ConnectionString
{
    private string _BusID;
    private string _Name;
    private int _NumSeat;
    private string _NumberPlate;
    private int _StationID;
    private int _Cat_ID;

    #region GETER/SETTER
    public string BusID
    {
        get { return _BusID; }
        set { _BusID = value; }
    }
    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
    public int NumSeat
    {
        get { return _NumSeat; }
        set { _NumSeat = value; }
    }
    public string NumberPlate
    {
        get { return _NumberPlate; }
        set { _NumberPlate = value; }
    }
    public int StationID
    {
        get { return _StationID; }
        set { _StationID = value; }
    }
    public int Cat_ID
    {
        get { return _Cat_ID; }
        set { _Cat_ID = value; }
    }
    #endregion

    DALBus dalBus = null;

	public BLLBus()
	{
        dalBus = new DALBus(connectionString);
	}

    public int Add_Bus() 
    {
        if(this._NumSeat >= 30 && this._NumSeat <=60){
            return dalBus.Add(this);
        }else{
            return -1;
        }
    }
    public int Update_Bus()
    {
        return dalBus.Update(this);
    }

    public DataSet Search()
    {
        return dalBus.Search(this);
    }
    public int Delete()
    { 
        return dalBus.Delete(this);
    }

    public DataSet getByID()
    {
        return dalBus.GetByID(this);
    }
    public DataSet GetBy_StationID_Cat_ID()
    {
        return dalBus.GetBy_BusName_StationID_Cat_ID(this);
    }
    public DataSet Get()
    {
        return dalBus.Get(this);
    }
}
