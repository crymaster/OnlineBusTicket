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
    float rate = 1;
    float distance = 0;
    float base_price = float.Parse(Resources.Resource.Price);
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
    private void InitDataField()
    {
        ddlBus.DataSource = SqlBus;
        ddlBus.DataTextField = "Name";
        ddlBus.DataValueField = "BusID";
        ddlBus.DataBind();

        ddlRoute.DataSource = SqlRoute;
        ddlRoute.DataTextField = "RouteName";
        ddlRoute.DataValueField = "RouteID";
        ddlRoute.DataBind();
    }

    private void GetGridView()
    {
        if (rb == null)
        {
            rb = new BLLRouteBus();
        }
        ds = new DataSet();
        ds = rb.Get();

        //if (ds.Tables[0].Rows.Count > 0)
        //{
            GridView1.DataSource = ds;
            GridView1.DataBind();
        //}
        //else
        //{
        //    //lblInformation.Visible = true;
        //    //lblInformation.Text = "Search fail";
        //}
    }
    protected void lbtnAddNew_Click(object sender, EventArgs e)
    {
        pInsert.Visible = true;
        lbMode.Text = "Add Route Bus";
        txtRBID.Text = "";
        txtDateStart.Text = "";
        txtPrice.Text = "";
        lbSeat.Text = "";
        InitDataField();
       // ddlBus.SelectedIndex = 0;
        initData();

        //lblInformation.Visible = false;
    }
    protected void btnCloseAddRouteBus_Click(object sender, EventArgs e)
    {
        pInsert.Visible = false;
        //lblInformation.Visible = false;
    }
    private bool setObj_RouteBus()
    {
        if (rb == null)
        {
            rb = new BLLRouteBus();
        }
        try
        {
            rb.RBID = int.Parse(txtRBID.Text);
        }
        catch (Exception)
        {
            rb.RBID = 0;
        }
        rb.BusID = ddlBus.SelectedValue.ToString();
        rb.RouteID = ddlRoute.SelectedValue.ToString();
        rb.DateStart = txtDateStart.Text;
        try
        {
            rb.Price = float.Parse(txtPrice.Text);
            if (rb.Price < -0)
            {
                BLLCommon.ShowError(Response, 26);
                return false;
            }
        }catch(Exception){
            BLLCommon.ShowError(Response, 26);
            return false;
        }
        if (rb.Price <= 0)
        {
            return false;
        }
        try
        {
            DateTime dt = Convert.ToDateTime(txtDateStart.Text);
            //Response.Write(dt);
            //Response.Write(DateTime.Now);
            //Response.Write(DateTime.Compare(dt, DateTime.Now));
            if (txtRBID.Text != "" && DateTime.Compare(dt, DateTime.Now) < 0)
            {
                // Check datetime must be after today
                BLLCommon.ShowError(Response, 6);
                txtDateStart.Focus();
                return false;
            }
        }
        catch (Exception)
        {
            BLLCommon.ShowError(Response, 5);
            return false;
        }
        if (rb.CheckDupRouteBus())
        {
            BLLCommon.ShowError(Response, 18);
            return false;
        }

        return true ;
    }
    protected void btnAddRouteBus_Click(object sender, EventArgs e)
    {
        initData();
        if (!setObj_RouteBus())
        {
            return;
        }
        if (rb.RBID == 0)
        {
            int i = rb.Add();
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add to complete!";
                BLLCommon.ShowResult(Response, "Add Route Bus", 1);
                pInsert.Visible = false;
                if (!IsPostBack == false)
                {
                    GetGridView();
                }
            }
            else
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add to fail!";
                BLLCommon.ShowResult(Response, "Add Route Bus", 2);
            }
        }
        else
        {
            int i = rb.Update();
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add to complete!";
                BLLCommon.ShowResult(Response, "Update Route Bus", 1);
                pInsert.Visible = true;
                if (!IsPostBack == false)
                {
                    GetGridView();
                }
            }
            else
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add to fail!";
                BLLCommon.ShowResult(Response, "Update Route Bus", 2);
            }
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
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Route Bus to complete!";
            BLLCommon.ShowResult(Response, "Delete Route Bus", 1);
            if (!IsPostBack == false)
            {
                GetGridView();
            }
        }
        else
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Route Bus to fail!";
            BLLCommon.ShowResult(Response, "Delete Route Bus", 2);
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
            try
            {
                DateTime dt = Convert.ToDateTime(ds.Tables[0].Rows[0]["DateStart"].ToString());
                //Response.Write(dt);
                //Response.Write(DateTime.Now);
                //Response.Write(DateTime.Compare(dt, DateTime.Now));
                if (DateTime.Compare(dt, DateTime.Now) < 0)
                {
                    // Check datetime must be after today
                    BLLCommon.ShowError(Response, 27);
                    return;
                }
            }
            catch (Exception)
            {
                return;
            }
            pInsert.Visible = true;
            hf.Value = ds.Tables[0].Rows[0]["RBID"].ToString();
            txtRBID.Text = ds.Tables[0].Rows[0]["RBID"].ToString();
            ddlBus.SelectedValue = ds.Tables[0].Rows[0]["BusID"].ToString();
            ddlRoute.SelectedValue = ds.Tables[0].Rows[0]["RouteID"].ToString();
            lbSeat.Text = ds.Tables[0].Rows[0]["AvailableSeat"].ToString();
            txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
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

    protected void ddlBus_SelectedIndexChanged(object sender, EventArgs e)
    {
        initData();
    }
    protected void ddlRoute_SelectedIndexChanged(object sender, EventArgs e)
    {
        initData();
    }
    private float CalPrice()
    {
        float totalPrice = -1;
        if (distance <= 0)
        {
            BLLCommon.ShowError(Response, 23);
            return -1;
        }
        if (base_price <= 0)
        {
            BLLCommon.ShowError(Response, 24);
            return -1;
        }
        if (rate <= 0)
        {
            BLLCommon.ShowError(Response, 25);
            return -1;
        }
        totalPrice = distance * base_price * rate;
        return totalPrice;
    }
    
    public void initData()
    {
        BLLBus bus = new BLLBus();
        BLLCategory cate = new BLLCategory();
        bus.BusID = ddlBus.SelectedValue.ToString();
        //Response.Write("ID: " + bus.BusID);
        //return;
        DataSet dsBus = bus.getByID();      
        int catID = int.Parse(dsBus.Tables[0].Rows[0]["Cat_ID"].ToString());

        lbSeat.Text = dsBus.Tables[0].Rows[0]["NumSeat"].ToString();

        cate.Cat_ID = catID;
        DataSet dsCate = cate.Get();
        rate = float.Parse(dsCate.Tables[0].Rows[0]["rate"].ToString());
        if (rate <= 0)
        {
            BLLCommon.ShowError(Response, 25);
        }

        BLLRouters route = new BLLRouters();
        route.RouterID = ddlRoute.SelectedValue.ToString();
        DataSet ds = route.Get();
        distance = int.Parse(ds.Tables[0].Rows[0]["distance"].ToString());
        if (distance <= 0)
        {
            BLLCommon.ShowError(Response, 23);
        }

        txtPrice.Text = CalPrice() + "";
        txtDateStart.Enabled=true;
    }

    protected void btnCloseAddRouteBus_Click1(object sender, EventArgs e)
    {
        pInsert.Visible = false;
    }
}
