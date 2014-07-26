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
        if (!IsPostBack)
        {
            GetGridView();
        }
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
    protected void btnSearchBusName_Click(object sender, EventArgs e)
    {

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
        rb.Travels = txtTravels.Text.ToString();
        rb.MaxSeat = Convert.ToInt32(txtMaxSeat.Text.ToString());
        rb.Fake = Convert.ToInt32(txtFake.Text.ToString()); ;
        rb.Counter = Convert.ToInt32(txtCounter.Text.ToString());
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
            txtTravels.Text = ds.Tables[0].Rows[0]["Travels"].ToString();
            txtMaxSeat.Text = ds.Tables[0].Rows[0]["MaxSeat"].ToString();
            txtFake.Text = ds.Tables[0].Rows[0]["Fake"].ToString();
            txtDateStart.Text = ds.Tables[0].Rows[0]["DateStart"].ToString();
            txtCounter.Text = ds.Tables[0].Rows[0]["Counter"].ToString();

        }
    }
}
