using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public class BLLCategory:ConnectionString
{
    private int _Cat_ID;
    private string _Type;
    private float _Rate;
    private string _Description;

    #region GETER/SETTER
    public int Cat_ID
    {
        get { return _Cat_ID; }
        set { _Cat_ID = value; }
    }
    public string Type
    {
        get { return _Type; }
        set { _Type = value; }
    }
    public float Rate
    {
        get { return _Rate; }
        set { _Rate = value; }
    }
    public string Description
    {
        get { return _Description; }
        set { _Description = value; }
    }
    #endregion
    DALCategory dalCat = null;
    public BLLCategory()
	{
        dalCat = new DALCategory(connectionString);
	}
    public int Add()
    {
        return dalCat.Add(this);
    }
    public int Update()
    {
        return dalCat.Update(this);
    }
    public int Delete()
    {
        return dalCat.Delete(this);
    }
    public DataSet Get()
    {
        return dalCat.Get(this);
    }
}
