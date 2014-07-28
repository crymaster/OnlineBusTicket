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

public partial class manager_locationmaanger : System.Web.UI.Page
{
    BLLLocation location = new BLLLocation();
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
        if (location == null)
        {
            location = new BLLLocation();
        }
        int locationID = -1;
        try
        {

            location.LocationID = int.Parse(txtLocationID.Text);
        }
        catch (Exception ex) { }
        location.Name = txtName.Text;
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
        lblInformation.Visible = false;
        pInsert.Visible = true;
        txtLocationID.Visible = false;
    }
    protected void btnAddBus_Click(object sender, EventArgs e)
    {
        setobj_Location();
        if (!txtLocationID.Visible)
        {
            int i = location.Add();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add to complete";
                hfSearchKey.Value = "0";
                txtName.Text = "";
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
            int i = location.Update();
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
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Location to complete!";
            if (!IsPostBack == false)
            {
                hfSearchKey.Value = "0";
                GetGridView();
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Location to fail!";
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (location == null)
        {
            location = new BLLLocation();
        }
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
