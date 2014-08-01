using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


public class BLLEmployee : ConnectionString
{

    private string _EmpId;
    private int _CentralID;
    private int _Role_ID;
    private string _Name;
    private string _Email;
    private string _Address;
    private string _Phone;

    private string _DOB;
    private string _Qualification;


    private DALEmployee dalObj = null;
    public BLLEmployee()
    {
        dalObj = new DALEmployee(connectionString);
    }

    #region GETER/SETTER
    public String EmpID
    {
        get { return _EmpId; }
        set { _EmpId = value; }
    }
    public int CentralID
    {
        get { return _CentralID; }
        set { _CentralID = value; }
    }
    public int Role_ID
    {
        get { return _Role_ID; }
        set { _Role_ID = value; }
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
    public string DOB
    {
        get { return _DOB; }
        set { _DOB = value; }
    }
    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string Qualification
    {
        get { return _Qualification; }
        set { _Qualification = value; }
    }

    #endregion

    public int New()
    {
        return dalObj.Add(this);
    }
    public int Update()
    {
        return dalObj.Update(this);
    }
    public int Delete()
    {
        return dalObj.Delete(this);
    }
    public DataSet GetById() 
    {
        return dalObj.getById(this);
    }
    public DataSet Search()
    {
        return dalObj.Search(this);
    }
    public int ChangePassword(String pass)
    {
        return dalObj.ChangePassword(this, pass);
    }
    public String CheckLogin(String email, String pass)
    {
        return dalObj.CheckLogin(email, pass);
    }
    public bool CheckDupEmail()
    {
        return dalObj.CheckDupEmail(this);
    }
}
