using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Book : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["RBID"] == null)
            {
                Response.Redirect("index.aspx");
            }
            int rbid = 0;
            try
            {
                rbid = int.Parse(Request.QueryString["RBID"]);
            }
            catch (Exception ex)
            {
                Response.Redirect("index.aspx");
            }

            DataSet1TableAdapters.TourTableAdapter adapt = new DataSet1TableAdapters.TourTableAdapter();
            DataTable dt = adapt.GetTourInfoByRBID(rbid);
            

            if (dt.Rows.Count == 0 || ((DateTime)dt.Rows[0]["DateStart"]) < DateTime.Now)
            {
                Response.Redirect("index.aspx");
            }
            DataRow row = dt.Rows[0];
            lbStart.Text = row["Name"].ToString();
            lbDest.Text = row["Name1"].ToString();
            lbDistance.Text = row["Distance"].ToString() + "$";
            lbBusNo.Text = row["BusID"].ToString();
            lbType.Text = row["Type"].ToString();
            lbDate.Text = ((DateTime)row["DateStart"]).ToString("dd/MM/yyyy");
            lbTime.Text = ((DateTime)row["DateStart"]).ToString("HH:mm:ss tt");
            lbCapacity.Text = row["NumSeat"].ToString();
            lbAvaiSeat.Text = row["AvailableSeat"].ToString();
            ViewState["Price"] = double.Parse(row["Price"].ToString());
            lbAdult.Text = double.Parse(row["Price"].ToString()) + "$";
            lbElder.Text = (float.Parse(row["Price"].ToString()) * 0.7).ToString() + "$";
            lbKid.Text = (float.Parse(row["Price"].ToString()) * 0.5).ToString() + "$";

            int capacity = int.Parse(row["NumSeat"].ToString());
            DataSet1TableAdapters.SeatOnTourTableAdapter adapt1 = new DataSet1TableAdapters.SeatOnTourTableAdapter();
            dt = adapt1.GetSeatsOnTour(rbid);
            if (dt.Rows.Count > 0)
            {

                row = dt.Rows[0];
                bool flag;
                for (int i = 1; i <= capacity; i++)
                {
                    flag = true;
                    foreach (DataRow r in dt.Rows)
                    {
                        if (i == int.Parse(r["SeatNum"].ToString()))
                        {
                            flag = false;
                            break;
                        }
                    }
                    if (flag)
                    {
                        ListItem item = new ListItem();
                        item.Text = i.ToString();
                        item.Value = i.ToString();
                        ddSeat.Items.Add(item);
                    }
                }
            }
            else
            {

            }
        }
    }
    protected void txtID_TextChanged(object sender, EventArgs e)
    {
        DataSet1TableAdapters.CustomersTableAdapter adapt = new DataSet1TableAdapters.CustomersTableAdapter();
        DataTable dt = adapt.GetByCustomerID(txtID.Text);

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
            lbStatus.Text = "Old customer";
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
            DateTime dob = (DateTime)row["DOB"];
            TimeSpan diff = DateTime.Now - dob;
            int year = diff.Days / 365;
            calculatePrice(year);

            DataSet1TableAdapters.DataTable1TableAdapter adapt1 = new DataSet1TableAdapters.DataTable1TableAdapter();
            dt = adapt1.GetData(txtID.Text, int.Parse(Request.QueryString["RBID"].ToString()));
            if (dt.Rows.Count > 0)
            {
                ViewState["insert"] = false;
                lbStatus.Text = "This customer already booked this tour";
                btnBook.Enabled = false;
            }
            else
            {
                btnBook.Enabled = true;
            }
            ViewState["insert"] = false;
        }
        else
        {
            btnBook.Enabled = true;
            txtName.Enabled = true;
            txtPhone.Enabled = true;
            txtEmail.Enabled = true;
            txtDOB.Enabled = true;
            txtAddress.Enabled = true;
            rdMale.Enabled = true;
            rdFemale.Enabled = true;
            lbStatus.Text = "New customer";
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
            if ( bool.Parse(ViewState["insert"].ToString()) )
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

            DataSet1TableAdapters.BookingsTableAdapter adapt1 = new DataSet1TableAdapters.BookingsTableAdapter();
            int? bookid = 0;
            adapt1.AddBooking(txtID.Text, Session["userID"].ToString(), DateTime.Now, ref bookid);
            DataSet1TableAdapters.DataTable2TableAdapter adapt2 = new DataSet1TableAdapters.DataTable2TableAdapter();
            DataRow row = adapt2.GetTicketIDBySeatNumRBID(int.Parse(ddSeat.SelectedValue.ToString()), int.Parse(Request.QueryString["RBID"])).Rows[0];
            DataSet1TableAdapters.BookingDetailsTableAdapter adapt3 = new DataSet1TableAdapters.BookingDetailsTableAdapter();
            double price = double.Parse(lbPrice.Text.Substring(0, lbPrice.Text.IndexOf("$")));
            adapt3.InsertQuery(bookid, int.Parse(row["TicketID"].ToString()), price, false);
            DataSet1TableAdapters.RouteBusTableAdapter adapt4 = new DataSet1TableAdapters.RouteBusTableAdapter();
            int avaiSeat = int.Parse(lbAvaiSeat.Text) + 1;
            adapt4.UpdateAvailableSeat(avaiSeat,int.Parse(Request.QueryString["RBID"]));
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchTour.aspx");
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
    protected void txtDOB_TextChanged(object sender, EventArgs e)
    {
        if (txtDOB.Text == "")
        {
            lbDOB.Text = "Date of birth must not be empty";

        }
        else
        {
            lbDOB.Text = "";
            try
            {
                DateTime dob = DateTime.ParseExact(txtDOB.Text, "dd/MM/yyyy", null);
                lbDOB.Text = "";
                TimeSpan diff = DateTime.Now - dob;
                int year = diff.Days / 365;
                calculatePrice(year);
            }
            catch (Exception ex)
            {
                lbDOB.Text = "Incorrect date format (Ex:01/01/2001)";
            }
        }
    }

    void calculatePrice(int year)
    {
        double price = double.Parse(ViewState["Price"].ToString());
        if (year <= 5)
        {
            lbPrice.Text = 0 + "$";
        }
        else if (year > 5 && year < 12)
        {
            lbPrice.Text = price * 0.5 + "$";
        }
        else if (year > 50)
        {
            lbPrice.Text = price * 0.7 + "$";
        }
        else
        {
            lbPrice.Text = price + "$";
        }
    }
}