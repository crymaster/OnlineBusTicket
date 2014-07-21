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
/// Summary description for BLLCentrals
/// </summary>
public class BLLCentrals:ConnectionString
{
    private int _CentralID;
    private string _Cent_Name;
    private string _Address;
    private string _Director;
    private string _Phone;

    #region GETER/SETTER
    public int CentralID
    {
        get { return _CentralID; }
        set { _CentralID = value; }
    }
    public string Cent_Name
    {
        get { return _Cent_Name; }
        set { _Cent_Name = value; }
    }
    public string Address
    {
        get { return _Address; }
        set { _Address = value; }
    }
    public string Director
    {
        get { return _Director; }
        set { _Director = value; }
    }
    public string Phone
    {
        get { return _Phone; }
        set { _Phone = value; }
    }

    #endregion

    DALCentrals dalCent = null;
	public BLLCentrals()
	{
        dalCent = new DALCentrals(connectionString);
	}

    public int Add()
    {
        return dalCent.Add(this);
    }
    public int Update()
    {
        return dalCent.Update(this);
    }
    public DataSet Get()
    {
        return dalCent.getCentral(this);
    }
    public int Delete()
    {
        return dalCent.Delete(this);
    }
}
