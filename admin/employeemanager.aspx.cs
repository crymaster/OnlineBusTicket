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
        //BLLAdmin.HasLogin(Session, Request, Response);
        if (!IsPostBack)
        {
            SearchEmp();
            //lblDOB.Text = DateTime.Now.ToShortDateString();
            LoadCentralSearch();
        }
    }
    private void LoadCentralSearch()
    {
        ddlCentralsSearch.DataSource = SqlStation;
        ddlCentralsSearch.DataTextField = "Cent_Name";
        ddlCentralsSearch.DataValueField = "CentralID";
        ddlCentralsSearch.DataBind();
        ddlCentralsSearch.Items.Insert(0, new ListItem("---Select----", "0"));
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
            
        }
    }
    private bool setObject_Emp()
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
        try
        {
            DateTime dt = Convert.ToDateTime(txtDOB.Text);
            if (DateTime.Compare(dt, new DateTime()) > 0)
            {
                // Check datetime must be before today
                BLLCommon.ShowError(Response, 16);
                txtDOB.Focus();
                return false;
            }
        }
        catch (Exception)
        {
            BLLCommon.ShowError(Response, 15);
            txtDOB.Focus();
            return false;
        }
        emp.DOB = txtDOB.Text;
        emp.Qualification = txtQualification.Text;
        return true;
    }
    protected void lbtnAddNew_Click1(object sender, EventArgs e)
    {
        lbMode.Text = "Add Employee";
        pInsert.Visible = true;
        txtEmpID.Text = "";
        txtEmpID.Visible = true;
        txtName.Text = "";
        txtEmail.Text = "";
        txtAddress.Text = "";
        txtPhone.Text = "";
        txtDOB.Text = "";
        txtQualification.Text = "";
    }
    protected void btnNewEmp_Click(object sender, EventArgs e)
    {
        setObject_Emp();
        if (txtEmpID.Text=="")
        {
            int i = emp.New();
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add Employee to complete!";
                BLLCommon.ShowResult(Response, "Add Employee", 1);
                if (!IsPostBack == false)
                {
                    gridViewDatabind();
                }
                pInsert.Visible = false;
            }
            else
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Add Employee to fail!";
                BLLCommon.ShowResult(Response, "Add Employee", 2);
            }
        }
        else
        {
            int i = emp.Update();
            if (i != -1)
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Update Employee to complete!";
                BLLCommon.ShowResult(Response, "Update Employee", 1);
                if (!IsPostBack == false)
                {
                    gridViewDatabind();
                }
                pInsert.Visible = false;
            }
            else
            {
                //lblInformation.Visible = true;
                //lblInformation.Text = "Update Employee to fail!";
                BLLCommon.ShowResult(Response, "Update Employee", 2);
            }
        }
    }
   
    private void GridView_Select()
    {
        btnDeleteEmp.Visible = true;
        pInsert.Visible = true;
        //txtEmpID.Enabled = false;
        emp.EmpID = GridView1.SelectedValue.ToString();
        ds = new DataSet();
        ds = emp.GetById();
        txtEmpID.Text = ds.Tables[0].Rows[0]["EmpId"].ToString();
        ddlCentralID.SelectedValue = ds.Tables[0].Rows[0]["CentralID"].ToString();
        txtName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
        txtPhone.Text = ds.Tables[0].Rows[0]["Phone"].ToString();
        txtDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
        txtQualification.Text = ds.Tables[0].Rows[0]["Qualification"].ToString();
    }
    protected void btnCloseNewEmp_Click(object sender, EventArgs e)
    {
        pInsert.Visible = false;
        //lblInformation.Visible = false;
    }
    private void SearchEmp()
    {
        gridViewDatabind();
    }
    
    protected void ddlRoleSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        hfSearch.Value = "6";
        SearchEmp();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtIDSearch.Text.Trim() != "")
        {
            emp.EmpID = txtIDSearch.Text;
        }
        else
        {
            emp.EmpID = "0";
        }
        emp.Name = txtNameSearch.Text;
        emp.CentralID = int.Parse(ddlCentralsSearch.SelectedValue);
        GridView1.DataSource = emp.Search();
        GridView1.DataBind();
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
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Bus to complete!";
            BLLCommon.ShowResult(Response, "Delete Employee", 1);
            if (!IsPostBack == false)
            {
                SearchEmp();
            }
            btnDeleteEmp.Visible = false;
            pInsert.Visible = false;
        }
        else
        {
            //lblInformation.Visible = true;
            //lblInformation.Text = "Delete Bus to fail!";
            BLLCommon.ShowResult(Response, "Delete Employee", 2);
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lbMode.Text = "Update Employee";
        //lblInformation.Text = "";
        ResetPasswordPanel.Visible = true;
        GridView_Select();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView_Select();
    }
    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        //lblInformation.Visible = true;
        emp.EmpID = txtEmpID.Text;
        int result=emp.ChangePassword("HNA");
        if (result != -1)
        {
            //lblInformation.Text = "Reset Pass complete!";
            BLLCommon.ShowResult(Response, "Reset Password", 1);
            pInsert.Visible = false;
        }
        else
        {
            BLLCommon.ShowResult(Response, "Reset Password", 2);
            //lblInformation.Text = "Reset Pass fail !";
        }

    }
}
