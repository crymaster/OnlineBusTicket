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

    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        BLLEmployee bll_Emp = new BLLEmployee();
        String result = bll_Emp.CheckLogin(Session["userEmail"].ToString(), txtCurrent.Text);
        if (result == null)
        {
            Response.Write("Pass incorrect !");
        }
        else
        {
            bll_Emp.EmpID = Session["userId"].ToString();
            int i = bll_Emp.ChangePassword(txtNew.Text);
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
