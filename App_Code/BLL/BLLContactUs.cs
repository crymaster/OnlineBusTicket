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

public class BLLContactUs:ConnectionString
{
    private int _FBID;
    private string _FullName;
    private string _Address;
    private string _Email;
    private string _Content;
    private string _Telephone;
    private string  _Title;
    private DateTime _DateCreated;

    private DALContactUs dalCts = null;
    public BLLContactUs()
    {
        dalCts = new DALContactUs(connectionString);
    }
    #region GETER/SETTER
    public int FPID
    {
        get { return _FBID; }
        set { _FBID = value; }
    }
    public string FullName
    {
        get { return _FullName; }
        set { _FullName = value; }
    }
    public string Address
    {
        get { return _Address; }
        set { _Address = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string Content
    {
        get { return _Content; }
        set { _Content = value; }
    }
    public string Telephone
    {
        get { return _Telephone; }
        set { _Telephone = value; }
    }
    public string Title
    {
        get { return _Title; }
        set { _Title = value; }
    }
    public DateTime DateCreated
    {
        get { return _DateCreated; }
        set { _DateCreated = value; }
    }
   
    #endregion
    public bool IsValidFields()
    {
       if (this.FullName.Equals(string.Empty) || this.Email.Equals(string.Empty) || this.Content.Equals(string.Empty))
            return false;
        else return true;
    }
    public int Add()
    {
        //if (IsValidFields())
            return dalCts.Add(this);
        //else
        //{
        //    throw new DataException("Require fields are empty.Try a again !");
        //    return -1;
        //}
    }

}
