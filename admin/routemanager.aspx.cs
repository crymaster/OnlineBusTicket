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

public partial class manager_routemanager : System.Web.UI.Page
{
    BLLRouters routes = new BLLRouters();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    DataView dv = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        //BLLAdmin.HasLogin(Session, Request, Response);
        if (!IsPostBack)
        {
            hfSearchKey.Value = "0";
            GetGridView();
            LoadLocationList();
            
        }
    }

    private void LoadLocationList()
    {
        ddlStartingPlaceSearch.DataSource = SqlLocation;
        ddlStartingPlaceSearch.DataTextField = "Name";
        ddlStartingPlaceSearch.DataValueField = "LocationID";
        ddlStartingPlaceSearch.DataBind();
        ddlStartingPlaceSearch.Items.Insert(0, new ListItem("--Select--", "0"));
        ddlStartingPlaceSearch.SelectedIndex = 0;

        ddlDestinationSearch.DataTextField = "Name";
        ddlDestinationSearch.DataValueField = "LocationID";
        ddlDestinationSearch.DataSource = SqlLocation;
        ddlDestinationSearch.DataBind();
        ddlDestinationSearch.Items.Insert(0, new ListItem("--Select--", "0"));
        ddlDestinationSearch.SelectedIndex = 0;

    }
    private bool setobj_Route()
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        routes.RouterID = txtRouteID.Text;
        routes.StartingPlace = Convert.ToInt32(ddlStartingPlace.SelectedValue);
        routes.Destination = Convert.ToInt32(ddlDestination.SelectedValue);
        if (routes.StartingPlace == routes.Destination)
        {
            BLLCommon.ShowError(Response, 7);
            return false;
        }
        try
        {
            routes.Distance = Convert.ToInt32(txtDistance.Text);
            if (routes.Distance <= 0)
            {
                BLLCommon.ShowError(Response, 9);
                return false;
            }
        }
        catch (Exception)
        {
            BLLCommon.ShowError(Response, 8);
            return false;
        }
        return true;
    }
    private void GetGridView()
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        if (hfSearchKey.Value == "1")
        {
            routes.RouterID = "0";
            routes.StartingPlace = Convert.ToInt32(ddlStartingPlaceSearch.SelectedValue.ToString());
            routes.Destination = Convert.ToInt32(ddlDestinationSearch.SelectedValue.ToString());
            ds = new DataSet();
            ds = routes.Get();
        }
        else
        {
            routes.RouterID = "0";
            routes.StartingPlace = 0;
            routes.Destination = 0;
            ds = new DataSet();
            ds = routes.Get();
        }

        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Search fail";
        }
    }
   


    protected void lbtnAddNew_Click(object sender, EventArgs e)
    {
        lbMode.Text = "Add Route";
        //lblInformation.Visible = false;
        pInsert.Visible = true;
        txtDistance.Text = "";
        txtRouteID.Text = "";
        ddlStartingPlaceSearch.SelectedIndex = 0;
        ddlDestinationSearch.SelectedIndex = 0;
        GetGridView();
        
    }
    protected void btnAddBus_Click(object sender, EventArgs e)
    {
        if (!setobj_Route())
        {
            return;
        }
        if (txtRouteID.Text=="")
        {
            int i = routes.Add();
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add to complete";
                BLLCommon.ShowResult(Response, "Add Route", 1);
                hfSearchKey.Value = "0";
                GetGridView();
            }
            else
            {
                //lblInformation.Visible = false;
                //lblInformation.Text = "Add to fail";
                BLLCommon.ShowResult(Response, "Add Route", 2);
            }
        }
        else
        {
            int i = routes.Update();
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Update to complete";
                BLLCommon.ShowResult(Response, "Update Route", 1);
                GetGridView();
            }
            else
            {
                //lblInformation.Visible = false;
                //lblInformation.Text = "Update to fail";
                BLLCommon.ShowResult(Response, "Update Route", 2);
            }
        }
    }
    protected void btnCloseAddBus_Click(object sender, EventArgs e)
    {
        //lblInformation.Visible = false;
        pInsert.Visible = false;
    }
    protected void btnSearchBusName_Click(object sender, EventArgs e)
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }

        pInsert.Visible = false;
        //lblInformation.Visible = false;

        routes.RouterID = "0";
        routes.StartingPlace = int.Parse(ddlStartingPlaceSearch.SelectedValue);
        routes.Destination = int.Parse(ddlDestinationSearch.SelectedValue);
        ds = new DataSet();
        ds = routes.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            hfSearchKey.Value = "0";
            
        }
        else
        {
            //To Do something when DataBind empty
        }
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        routes.RouterID = GridView1.Rows[e.RowIndex].Cells[0].Text;
        int i = routes.Delete();
        if (i != -1)
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Route to complete!";
            BLLCommon.ShowResult(Response, "Delete Route", 1);
            if (!IsPostBack == false)
            {
                hfSearchKey.Value = "0";
                GetGridView();
            }
        }
        else
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Route to fail!";
            BLLCommon.ShowResult(Response, "Delete Route", 2);
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        lbMode.Text = "Update Route";
        pInsert.Visible = true;
        routes.RouterID = GridView1.SelectedValue.ToString();
        routes.StartingPlace = 0;
        routes.Destination = 0;
        ds = new DataSet();
        ds = routes.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtRouteID.Text = ds.Tables[0].Rows[0]["RouteID"].ToString();
            ddlStartingPlace.SelectedValue = ds.Tables[0].Rows[0]["StartingPlace"].ToString();
            ddlDestination.SelectedValue = ds.Tables[0].Rows[0]["Destination"].ToString();
            txtDistance.Text = ds.Tables[0].Rows[0]["Distance"].ToString();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetGridView();
    }
    protected void ddlStartingPlaceSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        routes.RouterID = "0";
        routes.StartingPlace = Convert.ToInt32(ddlStartingPlaceSearch.SelectedValue.ToString());
        routes.Destination = Convert.ToInt32(ddlDestinationSearch.SelectedValue.ToString());
        ds = new DataSet();
        ds = routes.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            hfSearchKey.Value = "1";
            GetGridView();
            //lblInformation.Visible = false;
        }
        else
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Search Fail";
        }
    }
    protected void ddlDestinationSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        routes.RouterID = "0";
        routes.StartingPlace = Convert.ToInt32(ddlStartingPlaceSearch.SelectedValue.ToString());
        routes.Destination = Convert.ToInt32(ddlDestinationSearch.SelectedValue.ToString());
        ds = new DataSet();
        ds = routes.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            hfSearchKey.Value = "1";
            GetGridView();
            //lblInformation.Visible = false;
        }
        else
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Search Fail";
        }
    }
    protected void ddlStartingPlace_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlDestination_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
