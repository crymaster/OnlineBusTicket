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
using System.Xml;

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
        XmlDocument loResource = new XmlDocument();
        loResource.Load(Server.MapPath("~/App_GlobalResources/Resource.resx"));

        XmlNode price = loResource.SelectSingleNode("root/data[@name='Price']/value");
        XmlNode kid1 = loResource.SelectSingleNode("root/data[@name='Kid1']/value");
        XmlNode kid2 = loResource.SelectSingleNode("root/data[@name='Kid2']/value");
        XmlNode elder = loResource.SelectSingleNode("root/data[@name='Elder']/value");
        XmlNode dkid1 = loResource.SelectSingleNode("root/data[@name='DayKid1']/value");
        XmlNode dkid2 = loResource.SelectSingleNode("root/data[@name='DayKid2']/value");
        XmlNode delder = loResource.SelectSingleNode("root/data[@name='DayElder']/value");
        XmlNode cancel0 = loResource.SelectSingleNode("root/data[@name='Cancel0']/value");
        XmlNode cancel1 = loResource.SelectSingleNode("root/data[@name='Cancel1']/value");
        XmlNode cancel2 = loResource.SelectSingleNode("root/data[@name='Cancel2']/value");
        XmlNode dcancel0 = loResource.SelectSingleNode("root/data[@name='DayCancel0']/value");
        XmlNode dcancel1 = loResource.SelectSingleNode("root/data[@name='DayCancel1']/value");
        XmlNode dcancel2 = loResource.SelectSingleNode("root/data[@name='DayCancel2']/value");
        if (price != null)
        {
            price.InnerText = txtPrice.Text;
        }

        if (kid1 != null)
        {
            kid1.InnerText = txtPKid1.Text;
        }

        if (kid2 != null)
        {
            kid2.InnerText = txtPKid2.Text;
        }

        if (elder != null)
        {
            elder.InnerText = txtPElder.Text;
        }

        if (dkid1 != null)
        {
            dkid1.InnerText = txtDKid1.Text;
        }

        if (dkid2 != null)
        {
            dkid2.InnerText = txtDKid2.Text;
        }

        if (delder != null)
        {
            delder.InnerText = txtDElder.Text;
        }

        if (cancel0 != null)
        {
            cancel0.InnerText = txtPCan1.Text;
        }

        if (cancel1 != null)
        {
            cancel1.InnerText = txtPCan2.Text;
        }

        if (cancel2 != null)
        {
            cancel2.InnerText = txtPCan3.Text;
        }

        if (dcancel0 != null)
        {
            dcancel0.InnerText = txtDCan1.Text;
        }

        if (dcancel1 != null)
        {
            dcancel1.InnerText = txtDCan2.Text;
        }

        if (dcancel2 != null)
        {
            dcancel2.InnerText = txtDCan3.Text;
        }

        loResource.Save(Server.MapPath("~/App_GlobalResources/Resource.resx"));
    }
}
