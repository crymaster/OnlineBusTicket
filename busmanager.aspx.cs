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

public partial class manager_busmanager : System.Web.UI.Page
{
    BLLBus bus_BLL = new BLLBus();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    DataView dv = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bus_BLL.BusID = "";
            if (hfStationCategories.Value == "1")
            {
                getByStation_Categories(1);
                hfStationCategories.Value = "1";
            }
            else if (hfStationCategories.Value == "2")
            {
                getByStation_Categories(2);
                hfStationCategories.Value = "2";
            }
            else if (hfStationCategories.Value == "3")
            {
                getByStation_Categories(3);
                hfStationCategories.Value = "3";
            }
            else
            {
                gridViewDatabind();
            }
        }
    }
    
    protected void lbtnAddNew_Click(object sender, EventArgs e)
    {
        pInsert.Visible = true;
        lblInformation.Text = "";
        lblInformation.Visible = false;
        txtBusID.Text = "";
        txtBusID.Enabled = true;
        txtBusName.Text = "";
        txtNumSeat.Text = "";
        txtNumberPlate.Text = "";
    }
    protected void btnSearchBusName_Click(object sender, EventArgs e)
    {
        getByStation_Categories(3);
        hfStationCategories.Value = "3";
    }
    protected void ddlStationSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        getByStation_Categories(1);
        hfStationCategories.Value = "1";
    }
    protected void ddlCategoriesSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        getByStation_Categories(2);
        hfStationCategories.Value = "2";
    }
    protected void btnAddBus_Click(object sender, EventArgs e)
    {
        setObj_Bus();
        if (txtBusID.Enabled)
        {
            int i = bus_BLL.Add_Bus();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add Bus to complete!";
                if (!IsPostBack == false)
                {
                    gridViewDatabind();
                }
                pInsert.Visible = false;
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add Bus to fail!";
            }
        }
        else
        {
            int i = bus_BLL.Update_Bus();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Update Bus to complete!";
                if (!IsPostBack == false)
                {
                    gridViewDatabind();
                }
                pInsert.Visible = false;
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Update Bus to fail!";
            }
        }
    }
    protected void btnCloseAddBus_Click(object sender, EventArgs e)
    {
        pInsert.Visible = false;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (bus_BLL == null)
        {
            bus_BLL = new BLLBus();
        }
        bus_BLL.BusID = GridView1.Rows[e.RowIndex].Cells[0].Text;
        int i = bus_BLL.Delete();
        if (i != -1)
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Bus to complete!";
            if (!IsPostBack == false)
            {
                gridViewDatabind();
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Bus to fail!";
        }
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        dv = new DataView();
        if (hfStationCategories.Value == "1")
        {
            bus_BLL.StationID = Convert.ToInt32(ddlStationSearch.SelectedValue.ToString());
            bus_BLL.Cat_ID = 0;
            ds = new DataSet();
            ds = bus_BLL.GetBy_StationID_Cat_ID();
            hfStationCategories.Value = "1";
        }
        else if (hfStationCategories.Value == "2")
        {
            getByStation_Categories(2);
            bus_BLL.StationID = 0;
            bus_BLL.Cat_ID = Convert.ToInt32(ddlCategoriesSearch.SelectedValue.ToString());
            ds = new DataSet();
            ds = bus_BLL.GetBy_StationID_Cat_ID();
            hfStationCategories.Value = "2";
        }
        else if (hfStationCategories.Value == "3")
        {
            getByStation_Categories(3);
            bus_BLL.StationID = 0;
            bus_BLL.Cat_ID = Convert.ToInt32(ddlCategoriesSearch.SelectedValue.ToString());
            ds = new DataSet();
            ds = bus_BLL.GetBy_StationID_Cat_ID();
            hfStationCategories.Value = "3";
        }
        else
        {
            ds = new DataSet();
            ds = bus_BLL.Search();
        }
        dt = ds.Tables[0];
        dv = dt.DefaultView;
        if (dv != null)
        {
            dv.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            GridView1.DataSource = dv;
            GridView1.DataBind();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (hfStationCategories.Value == "1")
        {
            getByStation_Categories(1);
            hfStationCategories.Value = "1";
        }
        else if (hfStationCategories.Value == "2")
        {
            getByStation_Categories(2);
            hfStationCategories.Value = "2";
        }
        else if (hfStationCategories.Value == "3")
        {
            getByStation_Categories(3);
            hfStationCategories.Value = "3";
        }
        else
        {
            gridViewDatabind();
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        if (hfStationCategories.Value == "1")
        {
            getByStation_Categories(1);
            hfStationCategories.Value = "1";
        }
        else if (hfStationCategories.Value == "2")
        {
            getByStation_Categories(2);
            hfStationCategories.Value = "2";
        }
        else if (hfStationCategories.Value == "3")
        {
            getByStation_Categories(3);
            hfStationCategories.Value = "3";
        }
        else
        {
            gridViewDatabind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bus_BLL = new BLLBus();
        bus_BLL.BusID = GridView1.SelectedValue.ToString();
        ds = new DataSet();
        ds = bus_BLL.getByID();
        txtBusID.Text = ds.Tables[0].Rows[0]["BusID"].ToString();
        txtBusID.Enabled = false;
        txtBusName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        txtNumSeat.Text = ds.Tables[0].Rows[0]["NumSeat"].ToString();
        txtNumberPlate.Text = ds.Tables[0].Rows[0]["NumberPlate"].ToString();
        ddlStationID.SelectedValue = ds.Tables[0].Rows[0]["StationID"].ToString();
        ddlCatelogies.SelectedValue = ds.Tables[0].Rows[0]["Cat_ID"].ToString();
        pInsert.Visible = true;
    }
    private void getByStation_Categories(int Station_Categories)
    {
        if (Station_Categories == 1)
        {
            bus_BLL.Name = "0";
            bus_BLL.StationID = Convert.ToInt32(ddlStationSearch.SelectedValue.ToString());
            bus_BLL.Cat_ID = 0;
            ds = new DataSet();
            ds = bus_BLL.GetBy_StationID_Cat_ID();
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (!IsPostBack == false)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    lblInformation.Visible = false;
                }
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Search Bus to fail!";
            }
        }
        else if (Station_Categories == 2)
        {
            bus_BLL.Name = "0";
            bus_BLL.StationID = 0;
            bus_BLL.Cat_ID = Convert.ToInt32(ddlCategoriesSearch.SelectedValue.ToString());
            ds = new DataSet();
            ds = bus_BLL.GetBy_StationID_Cat_ID();
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (!IsPostBack == false)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    lblInformation.Visible = true;
                }
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Search Bus to fail!";
            }
        }
        else
        {
            bus_BLL = new BLLBus();
            bus_BLL.Name = txtSearchBusName.Text.ToString();
            bus_BLL.StationID = 0;
            bus_BLL.Cat_ID = 0;
            ds = new DataSet();
            ds = bus_BLL.GetBy_StationID_Cat_ID();
            if (ds.Tables[0].Rows.Count > 0)
            {
                if (!IsPostBack == false)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                    lblInformation.Visible = false;
                }
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Search Bus to fail!";
            }
        }
    }
    private void gridViewDatabind()
    {
        if (ds == null)
        {
            ds = new DataSet();
        }
        ds = bus_BLL.Search();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    private void setObj_Bus()
    {
        if (bus_BLL == null)
        {
            bus_BLL = new BLLBus();
        }
        bus_BLL.BusID = txtBusID.Text;
        bus_BLL.Name = txtBusName.Text;
        bus_BLL.NumSeat = Convert.ToInt32(txtNumSeat.Text.ToString());
        bus_BLL.NumberPlate = txtNumberPlate.Text.ToString();
        bus_BLL.StationID = Convert.ToInt32(ddlStationID.SelectedValue.ToString());
        bus_BLL.Cat_ID = Convert.ToInt32(ddlCatelogies.SelectedValue.ToString());
    }
    private string ConvertSortDirectionToSql(SortDirection sortDirection)
    {
        string newSortDirection = String.Empty;

        switch (sortDirection)
        {
            case SortDirection.Ascending:
                newSortDirection = "ASC";
                break;

            case SortDirection.Descending:
                newSortDirection = "DESC";
                break;
        }

        return newSortDirection;
    }
}
