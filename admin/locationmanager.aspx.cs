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

public partial class manager_locationmaanger : System.Web.UI.Page
{
    BLLLocation location = new BLLLocation();
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
        }
    }
    private bool setobj_Location()
    {
        if (location == null)
        {
            location = new BLLLocation();
        }
        int locationID = 0;
        try
        {
            location.LocationID = int.Parse(txtLocationID.Text);
        }
        catch (Exception) { }
        location.Name = txtName.Text;
        if (location.CheckDupName())
        {
            BLLCommon.ShowError(Response, 19);
            return false;
        }
        return true;
    }
    private void GetGridView()
    {
        if (location == null)
        {
            location = new BLLLocation();
        }
        location.LocationID =0;
        location.Name = txtNameSearch.Text;
        ds = new DataSet();
        ds = location.Get();
       
        if (ds.Tables[0].Rows.Count > 0)
        {
            //say something
        }
            GridView1.DataSource = ds;
            GridView1.DataBind();
        
    }
   
    protected void lbtnAddNew_Click(object sender, EventArgs e)
    {
        txtLocationID.Text = "";
        lbMode.Text = "Add Location";
        txtName.Text = "";
        //lblInformation.Visible = false;
        pInsert.Visible = true;
        
    }
    protected void btnAddBus_Click(object sender, EventArgs e)
    {
        
        if (!setobj_Location())
        {
            return;
        }
        
        if (txtLocationID.Text=="")
        {
            int i = location.Add();
            //Response.Write(txtLocationID.Text + " - " + location.LocationID);
            //Response.Write(txtName.Text + " - " + location.Name);
            //Response.Write(i);
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add to complete"
                BLLCommon.ShowResult(Response, "Add Location", 1);
                hfSearchKey.Value = "0";
                txtName.Text = "";
                GetGridView();
            }
            else
            {
                //lblInformation.Visible = false;
                //lblInformation.Text = "Add to fail";
                BLLCommon.ShowResult(Response, "Add Location", 2);
            }
        }
        else
        {
            int i = location.Update();
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Update to complete";
                BLLCommon.ShowResult(Response, "Update Location", 1);
                GetGridView();
            }
            else
            {
                //lblInformation.Visible = false;
                //lblInformation.Text = "Update to fail";
                BLLCommon.ShowResult(Response, "Update Location", 2);
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
        if (location == null)
        {
            location = new BLLLocation();
        }
        location.LocationID = 0;
        location.Name = txtNameSearch.Text;
        ds = new DataSet();
        ds = location.Get();
        if (ds.Tables[0].Rows.Count < 1)
        {
            //Say something
        }
        hfSearchKey.Value = "0";
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (location == null)
        {
            location = new BLLLocation();
        }
        location.LocationID = int.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
        int i = location.Delete();
        if (i != -1)
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Location to complete!";
            BLLCommon.ShowResult(Response, "Delete Location", 1);
            GetGridView();
            if (!IsPostBack == false)
            {
                hfSearchKey.Value = "0";
                GetGridView();
            }
        }
        else
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Location to fail!";
            BLLCommon.ShowResult(Response, "Delete Location", 2);
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (location == null)
        {
            location = new BLLLocation();
        }
        lbMode.Text = "Update Location";
        //lblInformation.Text = "";
        pInsert.Visible = true;
        txtLocationID.Visible = true;
        location.LocationID = int.Parse(GridView1.SelectedValue.ToString());
        location.Name = "";
        ds = new DataSet();
        ds = location.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtLocationID.Text = ds.Tables[0].Rows[0]["LocationID"].ToString();
            txtLocationID.Enabled = false;
            txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetGridView();
    }
}
