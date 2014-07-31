using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CustomerInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            
    }

    protected void txtID_TextChanged(object sender, EventArgs e)
    {
        DataSet1TableAdapters.CustomersTableAdapter adapt = new DataSet1TableAdapters.CustomersTableAdapter();
        DataTable dt = adapt.GetByCustomerID(txtID.Text);
        Response.Write("Row: "+dt.Rows.Count);
        if (dt.Rows.Count > 0)
        {
            DataRow row = dt.Rows[0];
            txtName.Enabled = false;
            txtPhone.Enabled = false;
            txtEmail.Enabled = false;
            txtDOB.Enabled = false;
            txtAddress.Enabled = false;
            rdMale.Enabled = false;
            rdFemale.Enabled = false;
            txtName.Text = row["Name"].ToString();
            txtAddress.Text = row["Address"].ToString();
            txtEmail.Text = row["Email"].ToString();
            txtPhone.Text = row["Phone"].ToString();
            txtDOB.Text = ((DateTime)row["DOB"]).ToString("dd/MM/yyyy");
            if (((bool)row["Gender"]))
            {
                rdMale.Checked = true;
            }
            else
            {
                rdFemale.Checked = true;
            }
            ViewState["insert"] = false;
        }
        else
        {   
            txtName.Enabled = true;
            txtPhone.Enabled = true;
            txtEmail.Enabled = true;
            txtDOB.Enabled = true;
            txtAddress.Enabled = true;
            rdMale.Enabled = true;
            rdFemale.Enabled = true;
            txtName.Text = "";
            txtAddress.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtDOB.Text = "";
            ViewState["insert"] = true;
        }
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        if (validate())
        {
            if (bool.Parse(ViewState["insert"].ToString()))
            {
                DataSet1TableAdapters.CustomersTableAdapter adapt = new DataSet1TableAdapters.CustomersTableAdapter();
                bool gender;
                if (rdMale.Checked)
                {
                    gender = true;
                }
                else
                {
                    gender = false;
                }
                DateTime dateCreated = DateTime.ParseExact(txtDOB.Text, "dd/MM/yyyy", null);
                adapt.InsertQuery(txtName.Text, gender, txtEmail.Text, txtAddress.Text, txtPhone.Text, dateCreated, DateTime.Now, txtID.Text);
            }
            if (Session["BookID"] == null)
            {
                DataSet1TableAdapters.BookingsTableAdapter adapt1 = new DataSet1TableAdapters.BookingsTableAdapter();
                int? bookid = 0;
                adapt1.AddBooking(Session["userID"].ToString(), DateTime.Now, ref bookid);
                Session["BookID"] = bookid;
            }
            Session["CustomerID"] = txtID.Text;
            Session["CustomerName"] = txtName.Text;
            Session["CustomerDOB"] = txtDOB.Text;
            Response.Redirect("SearchTour.aspx");
        }
    }

    bool validate()
    {
        bool retVal = true;
        if (txtID.Text == "")
        {
            lbStatus.Text = "ID must not be empty";
            retVal = false;
        }
        else
        {
            lbStatus.Text = "";
        }

        if (txtName.Text == "")
        {
            lbName.Text = "Name must not be empty";
            retVal = false;
        }
        else
        {
            lbName.Text = "";
        }

        if (txtDOB.Text == "")
        {
            lbDOB.Text = "Date of birth must not be empty";
            retVal = false;
        }
        else
        {
            lbDOB.Text = "";
            try
            {
                DateTime.ParseExact(txtDOB.Text, "dd/MM/yyyy", null);
                lbDOB.Text = "";
            }
            catch (Exception ex)
            {
                lbDOB.Text = "Incorrect date format (Ex:01/01/2001)";
                retVal = false;
            }
        }
        return retVal;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
}