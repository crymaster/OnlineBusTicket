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

public partial class manager_routebusmanager : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    BLLRouteBus rb = new BLLRouteBus();
    protected void Page_Load(object sender, EventArgs e)
    {
        //BLLAdmin.HasLogin(Session, Request, Response);
        if (!IsPostBack)
        {
            GetGridView();
            InitSearchField();
        }
    }
    private void InitSearchField()
    {
        ddlStartingPlaceSearch.DataSource = SqlLocation;
        ddlStartingPlaceSearch.DataTextField = "Name";
        ddlStartingPlaceSearch.DataValueField = "LocationID";
        ddlStartingPlaceSearch.DataBind();
        ddlStartingPlaceSearch.Items.Insert(0, new ListItem("--Select--", "0"));

        ddlDestinationSearch.DataSource = SqlLocation;
        ddlDestinationSearch.DataTextField = "Name";
        ddlDestinationSearch.DataValueField = "LocationID";
        ddlDestinationSearch.DataBind();
        ddlDestinationSearch.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    private void GetGridView()
    {
        if (rb == null)
        {
            rb = new BLLRouteBus();
        }
        ds = new DataSet();
        ds = rb.Get();

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Search fail";
        }
    }
    protected void lbtnAddNew_Click(object sender, EventArgs e)
    {
        pInsert.Visible = true;
        lblInformation.Visible = false;
    }
    protected void btnCloseAddRouteBus_Click(object sender, EventArgs e)
    {
        pInsert.Visible = false;
        lblInformation.Visible = false;
    }
    private void setObj_RouteBus()
    {
        if (rb == null)
        {
            rb = new BLLRouteBus();
        }
        rb.BusID = ddlBus.SelectedValue.ToString();
        rb.RouteID = ddlRoute.SelectedValue.ToString();
        //rb.Price =float.Parse(txtPrice.Text.ToString()); ;
        rb.DateStart = txtDateStart.Text;
    }
    protected void btnAddRouteBus_Click(object sender, EventArgs e)
    {
        setObj_RouteBus();
        int i = rb.Add();
        if (i != -1)
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Add to complete!";
            pInsert.Visible = false;
            if (!IsPostBack == false)
            {
                GetGridView();
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Add to fail!";
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (rb == null)
        {
            rb = new BLLRouteBus();
        }
        rb.RBID = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[0].Text.ToString());
        int i = rb.Delete();
        if (i != -1)
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Route Bus to complete!";
            if (!IsPostBack == false)
            {
                GetGridView();
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Route Bus to fail!";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        rb = new BLLRouteBus();
        rb.RBID = Convert.ToInt32(GridView1.SelectedValue.ToString());
        ds = new DataSet();
        ds = rb.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            pInsert.Visible = true;
            hf.Value = ds.Tables[0].Rows[0]["RBID"].ToString();
            ddlBus.SelectedValue = ds.Tables[0].Rows[0]["BusID"].ToString();
            ddlRoute.SelectedValue = ds.Tables[0].Rows[0]["RouteID"].ToString();
            //txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
            txtDateStart.Text = ds.Tables[0].Rows[0]["DateStart"].ToString();

        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadSearchResult();
    }
    private void LoadSearchResult()
    {
        try
        {
            rb.RBID = int.Parse(txtIDSearch.Text);
        }
        catch (Exception)
        {
            rb.RBID = 0;
        }
        rb.BusID = txtBusIDSearch.Text;
        String BusName = txtBusNameSearch.Text;
        rb.RouteID = txtRouteIDSearch.Text;
        int StartID = int.Parse(ddlStartingPlaceSearch.SelectedValue);
        int DesID = int.Parse(ddlDestinationSearch.SelectedValue);
        String DateAbove = txtDateAboveSearch.Text;
        String DateBelow = txtDateBelowSearch.Text;

        GridView1.DataSource = rb.Search(BusName, StartID, DesID, DateAbove, DateBelow);
        GridView1.DataBind();
    }
    
}
