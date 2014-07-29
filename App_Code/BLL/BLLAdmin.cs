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



public class BLLAdmin : ConnectionString
{
    private int _AdminID;
    private string _Email;
    private string _Name;


    private DALAdmin dalObj = null;
    public static void HasLogin(System.Web.SessionState.HttpSessionState Session, System.Web.HttpRequest Request, System.Web.HttpResponse Response)
    {
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("login.aspx");
        }
    }
    public BLLAdmin()
    {
        dalObj = new DALAdmin(connectionString);
    }

    #region GETER/SETTER
    public int AdminID
    {
        get { return _AdminID; }
        set { _AdminID = value; }
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
   

    #endregion

    public int ChangePassword(String pass)
    {
        return dalObj.ChangePassword(this, pass);
    }
    public int CheckLogin(String email, String pass)
    {
        return dalObj.CheckLogin(email, pass);
    }
    public DataSet GetAdminByID()
    {
        return dalObj.GetAdminByID(this);
    }
}
