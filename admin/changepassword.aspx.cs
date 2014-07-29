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
        int result = admin.CheckLogin(Session["AdminEmail"].ToString(), txtCurrent.Text);
        if (result ==-1)
        {
            Response.Write("Pass incorrect !");
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
                Response.Write("Fail");
            }

        }
       

    }
   
}
