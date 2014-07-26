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

public partial class manager_categorymanager : System.Web.UI.Page
{
    BLLCategory category = new BLLCategory();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    DataView dv = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hfSearchKey.Value = "0";
            GetGridView();
        }
    }
    private void setobj_Location()
    {
        if (category == null)
        {
            category = new BLLCategory();
        }
        int Cat_ID = -1;
        try
        {

            category.Cat_ID = int.Parse(txtID.Text);
        }
        catch (Exception ex) {
            category.Cat_ID = Cat_ID;
        }
        category.Type = txtName.Text;
        category.Description = txtDesc.Text;
    }
    private void GetGridView()
    {
        if (category == null)
        {
            category = new BLLCategory();
        }
        category.Cat_ID = 0;
        category.Type = txtNameSearch.Text;
        ds = new DataSet();
        ds = category.Get();

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
        lblInformation.Visible = false;
        pInsert.Visible = true;
        txtID.Enabled = false;
    }
    protected void btnAddBus_Click(object sender, EventArgs e)
    {
        setobj_Location();
        if (txtID.Text =="")
        {
            int i = category.Add();
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
            int i = category.Update();
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
        if (category == null)
        {
            category = new BLLCategory();
        }
        category.Cat_ID = 0;
        category.Type = txtName.Text;
        ds = new DataSet();
        ds = category.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            hfSearchKey.Value = "0";
            GetGridView();
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (category == null)
        {
            category = new BLLCategory();
        }
        category.Cat_ID = int.Parse(GridView1.Rows[e.RowIndex].Cells[0].Text);
        int i = category.Delete();
        if (i != -1)
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Category to complete!";
            if (!IsPostBack == false)
            {
                hfSearchKey.Value = "0";
                GetGridView();
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Category to fail!";
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (category == null)
        {
            category = new BLLCategory();
        }
        pInsert.Visible = true;
        category.Cat_ID = int.Parse(GridView1.SelectedValue.ToString());
        category.Type = "";
        ds = new DataSet();
        ds = category.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtID.Text = ds.Tables[0].Rows[0]["Cat_ID"].ToString();
            txtID.Enabled = false;
            txtName.Text = ds.Tables[0].Rows[0]["Type"].ToString();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetGridView();
    }
}