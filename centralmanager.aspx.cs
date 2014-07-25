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

public partial class manager_centralmanager : System.Web.UI.Page
{
    BLLCentrals centrals = new BLLCentrals();
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
    private void setObj_Central()
    {
        if (centrals == null)
        {
            centrals = new BLLCentrals();
        }
        centrals.Cent_Name = txtCent_Name.Text;
        centrals.Address = txtAddress.Text;
        centrals.Director = txtDirector.Text;
        centrals.Phone = txtPhone.Text;
    }
    protected void btnAddBus_Click(object sender, EventArgs e)
    {
        setObj_Central();
        if (txtCentralID.Enabled)
        {
            int i = centrals.Add();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add Centrals to complete!";
                if (!IsPostBack == false)
                {
                    GetGridView();
                }
                pInsert.Visible = false;
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add Centrals to fail!";
            }
        }
        else
        {
            centrals.CentralID = Convert.ToInt32(txtCentralID.Text.ToString());
            int i = centrals.Update();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Update Centrals to complete!";
                if (!IsPostBack == false)
                {
                    GetGridView();
                }
                pInsert.Visible = false;
                lblCentID.Visible = false;
                txtCentralID.Visible = false;
                txtCentralID.Enabled = true;
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Update Centrals to fail!";
            }
        }
    }
    protected void btnCloseAddBus_Click(object sender, EventArgs e)
    {
        pInsert.Visible = false;
    }
    protected void lbtnAddNew_Click(object sender, EventArgs e)
    {
        pInsert.Visible = true;
        txtCent_Name.Text = "";
        txtAddress.Text = "";
        txtDirector.Text = "";
        txtPhone.Text = "";
        lblInformation.Visible = false;
    }

    private void GetGridView()
    {
        if (centrals == null)
        {
            centrals = new BLLCentrals();
        }
        if (hfSearchKey.Value == "0")
        {
            centrals.CentralID = 0;
            centrals.Cent_Name = "0";
            centrals.Address = "0";
            centrals.Director = "0";
            ds = new DataSet();
            ds = centrals.Get();
        }
        else if (hfSearchKey.Value == "1")
        {
            centrals.CentralID = 0;
            centrals.Cent_Name = txtSearchCenrtralName.Text.ToString();
            centrals.Address = "0";
            centrals.Director = "0";
            ds = new DataSet();
            ds = centrals.Get();
        }
        else if (hfSearchKey.Value == "2")
        {
            centrals.CentralID = 0;
            centrals.Cent_Name = "0";
            centrals.Address = txtSearchCenrtralName.Text;
            centrals.Director = "0";
            ds = new DataSet();
            ds = centrals.Get();
        }
        else if (hfSearchKey.Value == "3")
        {
            centrals.CentralID = 0;
            centrals.Cent_Name = "0";
            centrals.Address = "0";
            centrals.Director = txtSearchCenrtralName.Text;
            ds = new DataSet();
            ds = centrals.Get();
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (centrals == null)
        {
            centrals = new BLLCentrals();
        }
        centrals.CentralID = Convert.ToInt32(GridView1.SelectedValue.ToString());
        centrals.Cent_Name = "0";
        centrals.Address = "0";
        centrals.Director = "0";
        centrals.Phone = "0";
        ds = new DataSet();
        ds = centrals.Get();
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblCentID.Visible = true;
            txtCentralID.Visible = true;
            txtCentralID.Enabled = false;
            txtCentralID.Text = ds.Tables[0].Rows[0]["CentralID"].ToString();
            txtCent_Name.Text = ds.Tables[0].Rows[0]["Cent_Name"].ToString();
            txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            txtDirector.Text = ds.Tables[0].Rows[0]["Director"].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
        }
        pInsert.Visible = true;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GetGridView();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (centrals == null)
        {
            centrals = new BLLCentrals();
        }
        centrals.CentralID = Convert.ToInt32(GridView1.Rows[e.RowIndex].Cells[0].Text.ToString());
        int i = centrals.Delete();
        if (i != -1)
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Bus to complete!";
            if (!IsPostBack == false)
            {
                GetGridView();
            }
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Bus to fail!";
        }
    }
    protected void btnSearchBusName_Click(object sender, EventArgs e)
    {
        lblInformation.Visible = false;
        if (RadioButtonList1.SelectedValue == "1")
        {
            hfSearchKey.Value = "1";
            GetGridView();
        }
        else if (RadioButtonList1.SelectedValue == "2")
        {
            hfSearchKey.Value = "2";
            GetGridView();
        }
        else if (RadioButtonList1.SelectedValue == "3")
        {
            hfSearchKey.Value = "3";
            GetGridView();
        }
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        GetGridView();
        dt = ds.Tables[0];
        dv = dt.DefaultView;
        if (dv != null)
        {
            dv.Sort = e.SortExpression + " " + ConvertSortDirectionToSql(e.SortDirection);

            GridView1.DataSource = dv;
            GridView1.DataBind();
        }
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
