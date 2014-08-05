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
using System.Collections.Specialized;

public partial class rule : System.Web.UI.Page
{
    NameValueCollection ChildFee = (NameValueCollection)ConfigurationManager.GetSection("ChildFee");
    NameValueCollection ElderFee = (NameValueCollection)ConfigurationManager.GetSection("ElderFee");
    NameValueCollection Refuse = (NameValueCollection)ConfigurationManager.GetSection("Refuse");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            InitData();
        }
    }
    private void InitData()
    {
        lbPrice.Text = Resources.Resource.Price.ToString();

        lbPKid1.Text = Resources.Resource.Kid1.ToString();
        lbPKid2.Text = Resources.Resource.Kid2.ToString();
        lbPElder.Text = Resources.Resource.Elder.ToString();

        lbDKid1.Text = Resources.Resource.DayKid1.ToString();
        lbDKid2.Text = Resources.Resource.DayKid2.ToString();
        lbDElder.Text = Resources.Resource.DayElder.ToString();

        lbPCan1.Text = Resources.Resource.Cancel0.ToString();
        lbPCan2.Text = Resources.Resource.Cancel1.ToString();
        lbPCan3.Text = Resources.Resource.Cancel2.ToString();

        lbDCan1.Text = Resources.Resource.DayCancel0.ToString();
        lbDCan2.Text = Resources.Resource.DayCancel1.ToString();
        lbDCan3.Text = Resources.Resource.DayCancel2.ToString();

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        ViewPanel.Visible = false;
        LoadEditPanel();
        EditPanel.Visible = true;
    }
    private void LoadEditPanel()
    {
        txtPrice.Text = Resources.Resource.Price.ToString();

        txtPKid1.Text = Resources.Resource.Kid1.ToString();
        txtPKid2.Text = Resources.Resource.Kid2.ToString();
        txtPElder.Text = Resources.Resource.Elder.ToString();

        txtDKid1.Text = Resources.Resource.DayKid1.ToString();
        txtDKid2.Text = Resources.Resource.DayKid2.ToString();
        txtDElder.Text = Resources.Resource.DayElder.ToString();

        txtPCan1.Text = Resources.Resource.Cancel0.ToString();
        txtPCan2.Text = Resources.Resource.Cancel1.ToString();
        txtPCan3.Text = Resources.Resource.Cancel2.ToString();

        txtDCan1.Text = Resources.Resource.DayCancel0.ToString();
        txtDCan2.Text = Resources.Resource.DayCancel1.ToString();
        txtDCan3.Text = Resources.Resource.DayCancel2.ToString();
    }
   

    protected void btnClose_Click(object sender, EventArgs e)
    {
        ViewPanel.Visible = true;
        EditPanel.Visible = false;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        txtPrice.Text = Resources.Resource.Price.ToString();

        txtPKid1.Text = Resources.Resource.Kid1.ToString();
        txtPKid2.Text = Resources.Resource.Kid2.ToString();
        txtPElder.Text = Resources.Resource.Elder.ToString();

        txtDKid1.Text = Resources.Resource.DayKid1.ToString();
        txtDKid2.Text = Resources.Resource.DayKid2.ToString();
        txtDElder.Text = Resources.Resource.DayElder.ToString();

        txtPCan1.Text = Resources.Resource.Cancel0.ToString();
        txtPCan2.Text = Resources.Resource.Cancel1.ToString();
        txtPCan3.Text = Resources.Resource.Cancel2.ToString();

        txtDCan1.Text = Resources.Resource.DayCancel0.ToString();
        txtDCan2.Text = Resources.Resource.DayCancel1.ToString();
        txtDCan3.Text = Resources.Resource.DayCancel2.ToString();
    }
}
