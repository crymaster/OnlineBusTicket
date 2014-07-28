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

public partial class ViewListBus : System.Web.UI.UserControl
{
    BLLBus bus_BLL = new BLLBus();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    DataView dv = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ds = bus_BLL.Search();
            BusGV.DataSource = ds;
            BusGV.DataBind();
            LoadCategorySearch();
            LoadCentralSearch();
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnSearchBus_Click(object sender, EventArgs e)
    {
        LoadGridView();
    }
    private void LoadCentralSearch()
    {
        ddlCentralSearch.DataSource = SqlCentral;
        ddlCentralSearch.DataTextField = "Cent_Name";
        ddlCentralSearch.DataValueField = "CentralID";
        ddlCentralSearch.DataBind();
        ddlCentralSearch.Items.Insert(0, new ListItem("---Select---", "0"));
    }
    private void LoadCategorySearch()
    {
        ddlCategoriesSearch.DataSource = SqlCategories;
        ddlCategoriesSearch.DataTextField = "Type";
        ddlCategoriesSearch.DataValueField = "Cat_ID";
        ddlCategoriesSearch.DataBind();
        ddlCategoriesSearch.Items.Insert(0, new ListItem("---Select---", "0"));
    }
    private void LoadGridView()
    {
        bus_BLL.BusID = txtIDSearch.Text;
        bus_BLL.Name = txtNameSearch.Text;
        bus_BLL.NumberPlate = txtNumberPlateSearch.Text;
        bus_BLL.StationID = int.Parse(ddlCentralSearch.SelectedValue);
        bus_BLL.Cat_ID = int.Parse(ddlCategoriesSearch.SelectedValue);
        BusGV.DataSource = bus_BLL.Get();
        BusGV.DataBind();
    }
}
