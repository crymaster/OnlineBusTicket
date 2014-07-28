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
using System.Collections.Specialized;

public partial class rule : System.Web.UI.Page
{
    NameValueCollection ChildFee = (NameValueCollection)ConfigurationManager.GetSection("ChildFee");
    NameValueCollection ElderFee = (NameValueCollection)ConfigurationManager.GetSection("ElderFee");
    NameValueCollection Refuse = (NameValueCollection)ConfigurationManager.GetSection("Refuse");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //ChildFee =(NameValueCollection)ConfigurationManager.GetSection("ChildFee");
            //ElderFee = (NameValueCollection)ConfigurationManager.GetSection("ElderFee");
            //Refuse = (NameValueCollection)ConfigurationManager.GetSection("Refuse");


            FeeGV.DataSource = GetFeeData();
            FeeGV.DataBind();

            RefuseGV.DataSource = GetRefuseData();
            RefuseGV.DataBind();
        }
    }
    

    protected void FeeGV_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ViewPN.Visible = false;
        EditAgeFee.Visible = true;
        EditRefusePN.Visible = false;
        String selectValue = FeeGV.SelectedValue.ToString();

        if (selectValue == "Child")
        {

            String age = ChildFee.Get("below");
            String fee = ChildFee.Get("fee-percent");
            txtAge.Text = age;
            txtFee.Text = fee;
            lbAgeType.Text = "Child";
        }
        if (selectValue == "Elder")
        {
            String age = ElderFee.Get("above");
            String fee = ElderFee.Get("fee-percent");
            txtAge.Text = age;
            txtFee.Text = fee;
            lbAgeType.Text = "Elder";
        }
    }
    protected void RefuseGV_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ViewPN.Visible = false;
        EditAgeFee.Visible = false;
        EditRefusePN.Visible = true;

        String selectValue = RefuseGV.SelectedValue.ToString();
        String refuseValue = Refuse.Get(selectValue);
        txtRefuseDay.Text = selectValue;
        txtRefuse.Text = refuseValue;
    }
    protected void btnAgeSave_Click(object sender, EventArgs e)
    {

    }
    protected void btnUpdateRefuse_Click(object sender, EventArgs e)
    {
     
    }
    private void CancelClick()
    {
        ViewPN.Visible = true;
        EditAgeFee.Visible = false;
        EditRefusePN.Visible = false;
    }

    protected void btnCancelF_Click(object sender, EventArgs e)
    {
        CancelClick();
    }
    protected void btnCancelR_Click(object sender, EventArgs e)
    {
        CancelClick();
    }

    private DataSet GetFeeData()
    {
        DataSet ds = new DataSet();
        DataTable FeeTable = new DataTable();
        FeeTable.Columns.Add("Type");
        FeeTable.Columns.Add("Age");
        FeeTable.Columns.Add("Fee");



        FeeTable.Rows.Add("Child", ChildFee.Get("below"), ChildFee.Get("fee-percent"));
        FeeTable.Rows.Add("Elder", ElderFee.Get("above"), ElderFee.Get("fee-percent"));
        ds.Tables.Add(FeeTable);
        return ds;
    }
    private DataSet GetRefuseData()
    {
        DataSet ds = new DataSet();
        DataTable RefuseTable = new DataTable();
        RefuseTable.Columns.Add("Day");
        RefuseTable.Columns.Add("Refuse");

        foreach (String key in Refuse.Keys)
        {
            RefuseTable.Rows.Add(key, Refuse.Get(key));
        }
        ds.Tables.Add(RefuseTable);
        return ds;
    }
    
}
