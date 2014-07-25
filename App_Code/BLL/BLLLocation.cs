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
/// Summary description for BLLLocation
/// </summary>
public class BLLLocation : ConnectionString
{
    private int _LocationID;
    private string _Name;

    #region GETER/SETTER
    public int LocationID
    {
        get { return _LocationID; }
        set { _LocationID = value; }
    }
     public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
   
    #endregion

     DALLocation dalLocation = null;

    public BLLLocation()
    {
        dalLocation = new DALLocation(connectionString);
    }

    public int Add()
    {
        return dalLocation.Add(this);
    }
    public int Update()
    {
        return dalLocation.Update(this);
    }
    public int Delete()
    {
        return dalLocation.Delete(this);
    }
    public DataSet Get()
    {
        return dalLocation.Get(this);
    }
   
}
