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
using System.Collections.Generic;

/// <summary>
/// Summary description for clsBLL
/// </summary>
public class BLLCustomer:ConnectionString
{
    private String _Name;
    private bool _Gender;
    private String _Email;
    private String _Address;
    private String _Phone;
    private DateTime _DOB;
    private DateTime _DateCreated;
    private int _TimesBooking;
    private String _CustomerID;
    private String _RegistedBy;

    private DALCustomer dalCust = null;

    public BLLCustomer()
    {
        dalCust = new DALCustomer(connectionString);
    }

    #region GETER/SETTER
    public String Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
    public bool Gender
    {
        get { return _Gender; }
        set { _Gender = value; }
    }
    public String Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public String Address
    {
        get { return _Address; }
        set { _Address = value; }
    }
    public String Phone
    {
        get { return _Phone; }
        set { _Phone = value; }
    }
    public DateTime DOB
    {
        get { return _DOB; }
        set { _DOB = value; }
    }
    public DateTime DateCreated
    {
        get { return _DateCreated; }
        set { _DateCreated = value; }
    }
    public int TimesBooking
    {
        get { return _TimesBooking; }
        set { _TimesBooking = value; }
    }
    public String CustomerID
    {
        get { return _CustomerID; }
        set { _CustomerID = value; }
    }
    public String RegistedBy
    {
        get { return _RegistedBy; }
        set { _RegistedBy = value; }
    }
    #endregion

    public string AddCustomer()
    {
        return dalCust.Add(this);
    }
    public string UpdateCustomer()
    {
        return dalCust.UpdateCustomer(this);
    }
    public string DeleteCustomer()
    {
        return dalCust.DeleteCustomer(this);
    }
    public List<string> GetListRegistedBy()
    {
        return dalCust.GetListRegistedBy();
    }
    public DataTable GetCustByRegistedBy(string reg)
    {
        return dalCust.GetCustByRegistedBy(reg);
    }
    public string GetCustIDByRegistedBy(string reg)
    {
        return dalCust.GetCustIDByRegistedBy(reg);
    }
    public int UpdateTimesBooking(int times, string user)
    {
        return dalCust.UpdateTimesBooking(times, user);
    }
}

