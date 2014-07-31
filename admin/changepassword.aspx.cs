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
using System.Data.SqlClient;

public partial class manager_changepasword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //BLLAdmin.HasLogin(Session, Request, Response);
    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        BLLAdmin admin = new BLLAdmin();
        if(txtNew.Text != txtReNew.Text)
        {
            BLLCommon.ShowError(Response, 12);
            return;
        }
        if(txtNew.Text.IndexOf(' ') >0)
        {
            BLLCommon.ShowError(Response, 13);
            return;
        }
        if (txtNew.Text.Length <= 8)
        {
            BLLCommon.ShowError(Response, 14);
            return;
        }
        int result = admin.CheckLogin(Session["AdminEmail"].ToString(), txtCurrent.Text);
        if (result ==-1)
        {
            BLLCommon.ShowError(Response, 11);
        }
        else
        {
            admin.AdminID = int.Parse(Session["AdminID"].ToString());
            int i = admin.ChangePassword(txtNew.Text);
            if (i != -1)
            {
                ChangePanel.Visible = false;
                ResultPanel.Visible = true;
            }
            else
            {
                BLLCommon.ShowResult(Response, "Change Password", 2);
            }

        }
       

    }
   
}
