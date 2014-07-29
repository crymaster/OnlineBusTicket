using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class manager_MasterPage : System.Web.UI.MasterPage
{
    BLLAdmin admin=new BLLAdmin();
    protected void Page_Load(object sender, EventArgs e)
    {
        BLLAdmin.HasLogin(Session, Request, Response);
        if (!IsPostBack)
        {
            int ID = -1;
            try
            {
                ID = int.Parse(Session["AdminID"].ToString());
            }
            catch (Exception) { }
            if (ID == -1)
            {
                ClearSession();
                Response.Redirect("login.aspx");
            }
            try
            {
                admin.AdminID = ID;
                DataSet ds = admin.GetAdminByID();
                String AName = ds.Tables[0].Rows[0]["Name"].ToString();
                AdminNameLink.Text = AName;
            }
            catch (Exception)
            {
                ClearSession();
                Response.Redirect("login.aspx");
            }
        }
    }
    protected void LogoutLink_Click(object sender, EventArgs e)
    {
        ClearSession();
        Response.Redirect("Login.aspx");
    }
    private void ClearSession()
    {
        Session["AdminEmail"] = null;
        Session["AdminId"] = null;
        Request.Cookies.Clear();
    }
}
