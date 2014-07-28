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

public partial class manager_employeemanager : System.Web.UI.Page
{
    BLLEmployee emp = new BLLEmployee();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    DataView dv = new DataView();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SearchEmp();
            lblDOB.Text = DateTime.Now.ToShortDateString();
        }
    }
    private void gridViewDatabind()
    {
        if (ds == null)
        {
            ds = new DataSet();
        }
        emp.EmpID = "";
        ds = emp.GetById();
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            ddlGridView.DataSource = ds;
            ddlGridView.DataTextField = "EmpId";
            ddlGridView.DataValueField = "EmpId";
            ddlGridView.DataBind();
        }
    }
    private void setObject_Emp()
    {
        if (emp == null)
        {
            emp = new BLLEmployee();
        }
        emp.EmpID = txtEmpID.Text;
        emp.CentralID = Convert.ToInt32(ddlCentralID.SelectedValue.ToString());

        emp.Name = txtName.Text;
        emp.Email = txtEmail.Text;
        emp.Address = txtAddress.Text;
        emp.Phone = txtPhone.Text;
        lblDOB.Text = DateTime.Now.ToShortDateString();
        emp.DOB = lblDOB.Text;
        emp.Qualification = txtQualification.Text;
    }
    protected void lbtnAddNew_Click1(object sender, EventArgs e)
    {
        pInsert.Visible = true;
        txtEmpID.Text = "";
        txtEmpID.Visible = true;
        txtName.Text = "";
        txtEmail.Text = "";
        txtAddress.Text = "";
        txtPhone.Text = "";
        lblDOB.Text = DateTime.Now.ToShortDateString();
        txtQualification.Text = "";
    }
    protected void btnNewEmp_Click(object sender, EventArgs e)
    {
        setObject_Emp();
        if (txtEmpID.Enabled)
        {
            int i = emp.New();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add Employee to complete!";
                if (!IsPostBack == false)
                {
                    gridViewDatabind();
                }
                pInsert.Visible = false;
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Add Employee to fail!";
            }
        }
        else
        {
            int i = emp.Update();
            if (i != -1)
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Update Employee to complete!";
                if (!IsPostBack == false)
                {
                    gridViewDatabind();
                }
                pInsert.Visible = false;
            }
            else
            {
                lblInformation.Visible = true;
                lblInformation.Text = "Update Employee to fail!";
            }
        }
    }
    protected void ddlGridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnDeleteEmp.Visible = true;
        pInsert.Visible = true;
        txtEmpID.Enabled = false;
        emp.EmpID = ddlGridView.SelectedValue.ToString();
        ds = new DataSet();
        ds = emp.GetById();
        txtEmpID.Text = ds.Tables[0].Rows[0]["EmpId"].ToString();
        ddlCentralID.SelectedValue = ds.Tables[0].Rows[0]["CentralID"].ToString();
        txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
        txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
        lblDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
        txtQualification.Text = ds.Tables[0].Rows[0]["Qualification"].ToString();
    }
    protected void btnCloseNewEmp_Click(object sender, EventArgs e)
    {
        pInsert.Visible = false;
        lblInformation.Visible = false;
    }
    private void SearchEmp()
    {
        if (hfSearch.Value == "0")
        {
            //Search All
            emp.Name = "0";
            emp.Email = "0";
            emp.Address = "0";
            emp.Qualification = "0";
            emp.CentralID = 0;

            ds = new DataSet();
            ds = emp.Search();
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
                lblInformation.Text = "Search Employee to fail!";
            }
        }
        else if (hfSearch.Value == "1")
        {
            //Search Name
            emp.Name = txtSearchEmp.Text;
            emp.Email = "0";
            emp.Address = "0";
            emp.Qualification = "0";
            emp.CentralID = 0;
            ds = new DataSet();
            ds = emp.Search();
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
                lblInformation.Text = "Search Employee to fail!";
            }
        }
        else if (hfSearch.Value == "2")
        {
            //Search Email
            emp.Name = "0";
            emp.Email = txtSearchEmp.Text;
            emp.Address = "0";
            emp.Qualification = "0";
            emp.CentralID = 0;
            ds = new DataSet();
            ds = emp.Search();
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
                lblInformation.Text = "Search Employee to fail!";
            }
        }
        else if (hfSearch.Value == "3")
        {
            //Search Address
            emp.Name = "0";
            emp.Email = "0";
            emp.Address = txtSearchEmp.Text;
            emp.Qualification = "0";
            emp.CentralID = 0;
            ds = new DataSet();
            ds = emp.Search();
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
                lblInformation.Text = "Search Employee to fail!";
            }
        }
        else if (hfSearch.Value == "4")
        {
            //Search Quafilication
            emp.Name = "0";
            emp.Email = "0";
            emp.Address = "0";
            emp.Qualification = txtSearchEmp.Text;
            emp.CentralID = 0;
            ds = new DataSet();
            ds = emp.Search();
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
                lblInformation.Text = "Search Employee to fail!";
            }
        }
        else if (hfSearch.Value == "5")
        {
            //Search Centrals
            emp.Name = "0";
            emp.Email = "0";
            emp.Address = "0";
            emp.Qualification = "0";
            emp.CentralID = Convert.ToInt32(ddlCentralsSearch.SelectedValue.ToString());
            ds = new DataSet();
            ds = emp.Search();
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
                lblInformation.Text = "Search Employee to fail!";
            }
        }
        else if (hfSearch.Value == "6")
        {
            //Search Role
            emp.Name = "0";
            emp.Email = "0";
            emp.Address = "0";
            emp.Qualification = "0";
            emp.CentralID = 0;

            ds = new DataSet();
            ds = emp.Search();
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
                lblInformation.Text = "Search Employee to fail!";
            }
        }
        else
        {
            gridViewDatabind();
        }
    }
    protected void ddlCentralsSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfSearch.Value = "5";
        SearchEmp();
    }
    protected void ddlRoleSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfSearch.Value = "6";
        SearchEmp();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "0")
        {
            hfSearch.Value = "0";
            SearchEmp();
        }
        else if (RadioButtonList1.SelectedValue == "1")
        {
            hfSearch.Value = "1";
            SearchEmp();
        }
        else if (RadioButtonList1.SelectedValue == "2")
        {
            hfSearch.Value = "2";
            SearchEmp();
        }
        else if (RadioButtonList1.SelectedValue == "3")
        {
            hfSearch.Value = "3";
            SearchEmp();
        }
        else if (RadioButtonList1.SelectedValue == "4")
        {
            hfSearch.Value = "4";
            SearchEmp();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        SearchEmp();
    }
    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        SearchEmp();
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
    protected void btnDeleteEmp_Click(object sender, EventArgs e)
    {
        if (emp == null)
        {
            emp = new BLLEmployee();
        }
        emp.EmpID = txtEmpID.Text;
        int i = emp.Delete();
        if (i != -1)
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Bus to complete!";
            if (!IsPostBack == false)
            {
                SearchEmp();
            }
            btnDeleteEmp.Visible = false;
            pInsert.Visible = false;
        }
        else
        {
            lblInformation.Visible = true;
            lblInformation.Text = "Delete Bus to fail!";
        }
    }
}
