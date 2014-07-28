using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class admin_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminID"] == null && Session["AdminID"]== "")
            {
                Response.Redirect("login.aspx");
                linkLogout.Visible = false;
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session["AdminEmail"] = null;
        Session["AdminName"] = null;
        Session["AdminId"] = null;
        Response.Redirect("Login.aspx");
    }
}
