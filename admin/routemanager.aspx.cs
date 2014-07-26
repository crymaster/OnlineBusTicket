﻿using System;
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
        if (!IsPostBack)
        {
            hfSearchKey.Value = "0";
            GetGridView();
            LoadLocationList();
        }
    }

    private void LoadLocationList()
    {
        BLLLocation locations = new BLLLocation();
        locations.LocationID = 0;
        locations.Name = "0";
        DataSet ds=locations.Get();
        ddlDestination.DataTextField = "Name";
        ddlDestination.DataValueField = "LocationID";
        ddlDestination.DataSource = ds;
        ddlDestination.DataBind();
        ddlStartingPlace.DataTextField = "Name";
        ddlStartingPlace.DataValueField = "LocationID";
        ddlStartingPlace.DataSource = ds;
        ddlStartingPlace.DataBind();
    }
    private void setobj_Route()
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        routes.RouterID = txtRouteID.Text;
        routes.StartingPlace = Convert.ToInt32(ddlStartingPlace.SelectedValue.ToString());
        routes.Destination = Convert.ToInt32(ddlDestination.SelectedValue.ToString());
        setTime();
        routes.Distance = Convert.ToInt32(txtDistance.Text);
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
            lblInformation.Visible = true;
            lblInformation.Text = "Search fail";
        }
    }
    private bool setTime()
    {
        if (Convert.ToInt32(txtStartingTiming_hour.Text.ToString()) >= 0 && Convert.ToInt32(txtStartingTiming_hour.Text.ToString()) < 24)
        {
            if (Convert.ToInt32(txtStartingTiming_minute.Text.ToString()) >= 0 && Convert.ToInt32(txtStartingTiming_minute.Text.ToString()) < 60)
            {
                routes.StartingTiming = txtStartingTiming_hour.Text.ToString() + ":" + txtStartingTiming_minute.Text.ToString();
                lblInformation.Visible = false;

                if (Convert.ToInt32(txtDestinationTiming_hour.Text.ToString()) >= 0 && Convert.ToInt32(txtDestinationTiming_hour.Text.ToString()) < 24)
                {
                    if (Convert.ToInt32(txtDestinationTiming_minute.Text.ToString()) >= 0 && Convert.ToInt32(txtDestinationTiming_minute.Text.ToString()) < 60)
                    {
                        routes.DestinationTiming = txtDestinationTiming_hour.Text.ToString() + ":" + txtDestinationTiming_minute.Text.ToString();
                        lblInformation.Visible = false;
                    }
                    else
                    {
                        lblInformation.Visible = true;
                        lblInformation.Text = "Destination Timing Error";
                        return false;
                    }
                }
                else
                {
                    lblInformation.Visible = true;
                    lblInformation.Text = "Destination Timing Error";
                    return false;
                }
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Starting Timing Error";
                return false;
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Starting Timing Error";
            return false;
        }
        return true;
    }


    protected void lbtnAddNew_Click(object sender, EventArgs e)
    {
        lblInformation.Visible = false;
        pInsert.Visible = true;
    }
    protected void btnAddBus_Click(object sender, EventArgs e)
    {
        setobj_Route();
        if (txtRouteID.Enabled)
        {
            int i = routes.Add();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add to complete";
                hfSearchKey.Value = "0";
                GetGridView();
            }
            else
            {
                lblInformation.Visible = false;
                lblInformation.Text = "Add to fail";
            }
        }
        else
        {
            int i = routes.Update();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Update to complete";
            }
            else
            {
                lblInformation.Visible = false;
                lblInformation.Text = "Update to fail";
            }
        }
    }
    protected void btnCloseAddBus_Click(object sender, EventArgs e)
    {
        lblInformation.Visible = false;
        pInsert.Visible = false;
    }
    protected void btnSearchBusName_Click(object sender, EventArgs e)
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        routes.RouterID = "0";
        routes.StartingPlace = 0;
        routes.Destination = 0;
        ds = new DataSet();
        ds = routes.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            hfSearchKey.Value = "0";
            GetGridView();
        }
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
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Route to complete!";
            if (!IsPostBack == false)
            {
                hfSearchKey.Value = "0";
                GetGridView();
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Route to fail!";
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (routes == null)
        {
            routes = new BLLRouters();
        }
        pInsert.Visible = true;
        routes.RouterID = GridView1.SelectedValue.ToString();
        routes.StartingPlace = 0;
        routes.Destination = 0;
        ds = new DataSet();
        ds = routes.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtRouteID.Text = ds.Tables[0].Rows[0]["RouteID"].ToString();
            txtRouteID.Enabled = false;
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
            lblInformation.Visible = false;
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Search Fail";
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
            lblInformation.Visible = false;
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Search Fail";
        }
    }
    protected void ddlStartingPlace_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlDestination_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}