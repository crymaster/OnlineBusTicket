using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SearchTicket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbName.Visible = false;
            lbStart.Visible = false;
            lbDest.Visible = false;
            lbFrom.Visible = false;
            lbTo.Visible = false;
            txtName.Visible = false;
            txtFrom.Visible = false;
            txtTo.Visible = false;
            ddStart.Visible = false;
            ddDest.Visible = false;
            DataSet1TableAdapters.LocationsTableAdapter adapt = new DataSet1TableAdapters.LocationsTableAdapter();
            DataTable dt = adapt.GetAll();

            ddStart.DataSource = dt;
            ddStart.DataValueField = "LocationID";
            ddStart.DataTextField = "Name";
            ddStart.DataBind();

            ddDest.DataSource = dt;
            ddDest.DataValueField = "LocationID";
            ddDest.DataTextField = "Name";
            ddDest.DataBind();
        }

    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton1.Checked == true)
        {
            lbName.Visible = false;
            lbStart.Visible = false;
            lbDest.Visible = false;
            lbFrom.Visible = false;
            lbTo.Visible = false;
            txtName.Visible = false;
            txtFrom.Visible = false;
            txtTo.Visible = false;
            ddStart.Visible = false;
            ddDest.Visible = false;
            txtTicket.Visible = true;
            lbTicket.Visible = true;
        }
    }
    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        if (RadioButton2.Checked == true)
        {
            lbName.Visible = true;
            lbStart.Visible = true;
            lbDest.Visible = true;
            lbFrom.Visible = true;
            lbTo.Visible = true;
            txtName.Visible = true;
            txtFrom.Visible = true;
            txtTo.Visible = true;
            ddStart.Visible = true;
            ddDest.Visible = true;
            txtTicket.Visible = false;
            lbTicket.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtError.Text = "";
        if (RadioButton2.Checked == true)
        {
            if (ddStart.SelectedValue.ToString().Equals(ddDest.SelectedValue.ToString()))
            {
                txtError.Text = "Start and Destination must not be the same";
            }
            else
            {

                DateTime dateFrom = DateTime.Today;
                DateTime dateTo = DateTime.Today.AddDays(1);
                try
                {
                    dateFrom = DateTime.Parse(txtFrom.Text.ToString());
                }
                catch (Exception ex)
                {
                    dateFrom = DateTime.Today;
                }

                try
                {
                    if (txtTo.Text == "")
                    {
                        dateTo = dateFrom.AddDays(1);
                    }
                    dateTo = DateTime.Parse(txtTo.Text.ToString()).AddDays(1);
                    if (dateTo <= dateFrom)
                    {
                        dateTo = dateFrom.AddDays(1);
                    }

                }
                catch (Exception ex)
                {
                    dateTo = dateFrom.AddDays(1);
                }

                int start = int.Parse(ddStart.SelectedValue.ToString());
                int dest = int.Parse(ddDest.SelectedValue.ToString());
                string name = txtName.Text + "%";
                DataSet1TableAdapters.CustomerTicketTableAdapter adapt = new DataSet1TableAdapters.CustomerTicketTableAdapter();
                DataTable dt1 = adapt.GetTicketInfoByOthers(name, start, dest, dateFrom, dateTo);
                if (dt1.Rows.Count == 0)
                {
                    txtError.Text = "No result is found";

                }

                dt1.Columns.Add(new DataColumn("Refund"));

                DateTime today = DateTime.Now;

                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    DataRow row = dt1.Rows[i];
                    DateTime startDate = DateTime.Parse(row["DateStart"].ToString());
                    if (startDate >= today)
                    {
                        TimeSpan diff = startDate - today;

                        int dayDiff = diff.Days;

                        if (dayDiff >= 2)
                        {
                            row["Refund"] = "100%";
                        }
                        else if (dayDiff == 1)
                        {
                            row["Refund"] = "85%";
                        }
                        else if (dayDiff == 0)
                        {
                            row["Refund"] = "70%";
                        }
                    }
                    else
                    {
                        row["Refund"] = "0%";
                    }
                }


                if (GridView1.Columns.Count == 0)
                {
                    BoundField bfield = new BoundField();
                    bfield.DataField = dt1.Columns["TicketID"].ColumnName;
                    bfield.HeaderText = "TicketNo";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["Name"].ColumnName;
                    bfield.HeaderText = "Customer Name";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["DOB"].ColumnName;
                    bfield.DataFormatString = "{0:dd/MM/yyyy}";
                    bfield.HeaderText = "DOB";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["BookingDate"].ColumnName;
                    bfield.DataFormatString = "{0:dd/MM/yyyy}";
                    bfield.HeaderText = "Booking Date";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["BusID"].ColumnName;
                    bfield.HeaderText = "BusNo";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["Name1"].ColumnName;
                    bfield.HeaderText = "Start";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["Name2"].ColumnName;
                    bfield.HeaderText = "Destination";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["DateStart"].ColumnName;
                    bfield.DataFormatString = "{0:dd/MM/yyyy hh:mm:ss tt}";
                    bfield.HeaderText = "Running Date-Time";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["Price"].ColumnName;
                    bfield.HeaderText = "Price";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["Refund"].ColumnName;
                    bfield.HeaderText = "Pos.Refund";
                    GridView1.Columns.Add(bfield);

                    HyperLinkField hlfield = new HyperLinkField();
                    hlfield.Text = "Cancel";
                    hlfield.DataNavigateUrlFormatString = "Cancel.aspx?ticketid={0}";
                    hlfield.DataNavigateUrlFields = new string[] { "TicketID" };
                    GridView1.Columns.Add(hlfield);

                    hlfield = new HyperLinkField();
                    hlfield.Text = "View";
                    hlfield.DataNavigateUrlFormatString = "ViewTicket.aspx?ticketid={0}";
                    hlfield.DataNavigateUrlFields = new string[] { "TicketID" };
                    GridView1.Columns.Add(hlfield);

                }

                GridView1.DataSource = dt1;
                GridView1.DataBind();


            }
        }
        else
        {
            DataSet1TableAdapters.CustomerTicketTableAdapter adapt = new DataSet1TableAdapters.CustomerTicketTableAdapter();
            int ticketNo = int.Parse(txtTicket.Text);
            DataTable dt1 = adapt.GetTicketInfo(ticketNo);

            if (dt1.Rows.Count == 0)
            {
                txtError.Text = "No result is found";
            }

            dt1.Columns.Add(new DataColumn("Refund"));

            DateTime today = DateTime.Now;

            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                DataRow row = dt1.Rows[i];
                DateTime startDate = DateTime.Parse(row["DateStart"].ToString());
                if (startDate >= today)
                {
                    TimeSpan diff = startDate - today;

                    int dayDiff = diff.Days;

                    if (dayDiff >= 2)
                    {
                        row["Refund"] = "100%";
                    }
                    else if (dayDiff == 1)
                    {
                        row["Refund"] = "85%";
                    }
                    else if (dayDiff == 0)
                    {
                        row["Refund"] = "70%";
                    }
                }
                else
                {
                    row["Refund"] = "0%";
                }
            }


            if (GridView1.Columns.Count == 0)
            {
                BoundField bfield = new BoundField();
                bfield.DataField = dt1.Columns["TicketID"].ColumnName;
                bfield.HeaderText = "TicketNo";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Name"].ColumnName;
                bfield.HeaderText = "Customer Name";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["DOB"].ColumnName;
                bfield.DataFormatString = "{0:dd/MM/yyyy}";
                bfield.HeaderText = "DOB";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["BookingDate"].ColumnName;
                bfield.DataFormatString = "{0:dd/MM/yyyy}";
                bfield.HeaderText = "Booking Date";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["BusID"].ColumnName;
                bfield.HeaderText = "BusNo";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Name1"].ColumnName;
                bfield.HeaderText = "Start";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Name2"].ColumnName;
                bfield.HeaderText = "Destination";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["DateStart"].ColumnName;
                bfield.DataFormatString = "{0:dd/MM/yyyy hh:mm:ss tt}";
                bfield.HeaderText = "Running Date-Time";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Price"].ColumnName;
                bfield.HeaderText = "Price";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Refund"].ColumnName;
                bfield.HeaderText = "Pos.Refund";
                GridView1.Columns.Add(bfield);

                HyperLinkField hlfield = new HyperLinkField();
                hlfield.Text = "Cancel";
                hlfield.DataNavigateUrlFormatString = "Cancel.aspx?ticketid={0}";
                hlfield.DataNavigateUrlFields = new string[] { "TicketID" };
                GridView1.Columns.Add(hlfield);

                hlfield = new HyperLinkField();
                hlfield.Text = "View";
                hlfield.DataNavigateUrlFormatString = "ViewTicket.aspx?ticketid={0}";
                hlfield.DataNavigateUrlFields = new string[] { "TicketID" };
                GridView1.Columns.Add(hlfield);

            }

            GridView1.DataSource = dt1;
            GridView1.DataBind();

        }
    }
}