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

        if (Session["Cancel"] != null)
        {
            System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert('Ticket Number " + Session["Cancel"] + " has been canceled')</SCRIPT>");
            Session["Cancel"] = null;
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
                    dateFrom = DateTime.ParseExact(txtFrom.Text.ToString(),"dd/MM/yyyy",null);
                }
                catch (Exception ex)
                {
                    dateFrom = DateTime.Today;
                }

                try
                {
                    if (txtTo.Text == "")
                    {
                        dateTo = dateFrom.AddDays(5);
                    }
                    dateTo = DateTime.ParseExact(txtTo.Text.ToString(), "dd/MM/yyyy", null).AddDays(1);
                    if (dateTo <= dateFrom)
                    {
                        dateTo = dateFrom.AddDays(5);
                    }

                }
                catch (Exception ex)
                {
                    dateTo = dateFrom.AddDays(5);
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
                            row["Refund"] = row["Price"];
                        }
                        else if (dayDiff == 1)
                        {
                            row["Refund"] = double.Parse(row["Price"].ToString()) * 0.85;
                        }
                        else if (dayDiff == 0)
                        {
                            row["Refund"] = double.Parse(row["Price"].ToString()) * 0.7;
                        }
                    }
                    else
                    {
                        row["Refund"] = "0";
                    }
                }


                if (GridView1.Columns.Count == 0)
                {
                    GridView1.DataKeyNames = new string[]{"TicketID"};

                    BoundField bfield = new BoundField();
                    bfield.DataField = dt1.Columns["TicketID"].ColumnName;
                    bfield.HeaderText = "TicketNo";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["CustomerID"].ColumnName;
                    bfield.HeaderText = "UID";
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
                    bfield.DataFormatString = "{0}$";
                    bfield.HeaderText = "Price";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["Refund"].ColumnName;
                    bfield.DataFormatString = "{0}$";
                    bfield.HeaderText = "Pos.Refund";
                    GridView1.Columns.Add(bfield);

                    ButtonField btfield = new ButtonField();
                    btfield.Text = "Cancel";
                    btfield.CommandName = "CancelTicket";
                    GridView1.Columns.Add(btfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["BookID"].ColumnName;
                    bfield.ItemStyle.CssClass = "hidden";
                    bfield.HeaderStyle.CssClass = "hidden";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["BDID"].ColumnName;
                    bfield.ItemStyle.CssClass = "hidden";
                    bfield.HeaderStyle.CssClass = "hidden";
                    GridView1.Columns.Add(bfield);

                    bfield = new BoundField();
                    bfield.DataField = dt1.Columns["RBID"].ColumnName;
                    bfield.ItemStyle.CssClass = "hidden";
                    bfield.HeaderStyle.CssClass = "hidden";
                    GridView1.Columns.Add(bfield);
                }

                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }
        }
        else
        {
            DataSet1TableAdapters.CustomerTicketTableAdapter adapt = new DataSet1TableAdapters.CustomerTicketTableAdapter();
            if (txtTicket.Text == "")
            {
                txtError.Text="Ticket No must not be empty";
                return;
            }
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
                        row["Refund"] = row["Price"];
                    }
                    else if (dayDiff == 1)
                    {
                        row["Refund"] = double.Parse(row["Price"].ToString()) * 0.85;
                    }
                    else if (dayDiff == 0)
                    {
                        row["Refund"] = double.Parse(row["Price"].ToString()) * 0.7;
                    }
                }
                else
                {
                    row["Refund"] = "0";
                }
            }


            if (GridView1.Columns.Count == 0)
            {
                GridView1.DataKeyNames = new string[] { "TicketID" };

                BoundField bfield = new BoundField();
                bfield.DataField = dt1.Columns["TicketID"].ColumnName;
                bfield.HeaderText = "TicketNo";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["CustomerID"].ColumnName;
                bfield.HeaderText = "UID";
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
                bfield.DataFormatString = "{0}$";
                bfield.HeaderText = "Price";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Refund"].ColumnName;
                bfield.DataFormatString = "{0}$";
                bfield.HeaderText = "Pos.Refund";
                GridView1.Columns.Add(bfield);

                ButtonField btfield = new ButtonField();
                btfield.Text = "Cancel";
                btfield.CommandName = "CancelTicket";
                GridView1.Columns.Add(btfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["BookID"].ColumnName;
                bfield.ItemStyle.CssClass = "hidden";
                bfield.HeaderStyle.CssClass = "hidden";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["BDID"].ColumnName;
                bfield.ItemStyle.CssClass = "hidden";
                bfield.HeaderStyle.CssClass = "hidden";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["RBID"].ColumnName;
                bfield.ItemStyle.CssClass = "hidden";
                bfield.HeaderStyle.CssClass = "hidden";
                GridView1.Columns.Add(bfield);
            }

            GridView1.DataSource = dt1;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int currentRow = int.Parse(e.CommandArgument.ToString());
        int ticketID = int.Parse(GridView1.DataKeys[currentRow].Values[0].ToString());
        string customerID = GridView1.Rows[currentRow].Cells[1].Text;
        int bookid = int.Parse(GridView1.Rows[currentRow].Cells[12].Text);
        int bdid = int.Parse(GridView1.Rows[currentRow].Cells[13].Text);
        string refundText = GridView1.Rows[currentRow].Cells[10].Text;
        float refund = float.Parse(refundText.Substring(0,refundText.IndexOf("$")));
        int rbid = int.Parse(GridView1.Rows[currentRow].Cells[14].Text);
        DateTime runningDate = DateTime.ParseExact(GridView1.Rows[currentRow].Cells[8].Text,"dd/MM/yyyy hh:mm:ss tt",null);
        if (runningDate<DateTime.Now)
        {
            System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert('Cannot cancel Ticket Number " + ticketID + "')</SCRIPT>");
        }
        else
        {
            DataSet1TableAdapters.BookingDetailsTableAdapter adapt = new DataSet1TableAdapters.BookingDetailsTableAdapter();
            adapt.UpdateQuery(true, bookid, ticketID, customerID);
            DataSet1TableAdapters.CanceledTicketsTableAdapter adapt1 = new DataSet1TableAdapters.CanceledTicketsTableAdapter();
            adapt1.InsertQuery(bdid, refund, DateTime.Now, "No reason");
            DataSet1TableAdapters.RouteBusTableAdapter adapt2 = new DataSet1TableAdapters.RouteBusTableAdapter();
            adapt2.UpdateQuery(-1,rbid);
            DataSet1TableAdapters.TicketsTableAdapter adapt3 = new DataSet1TableAdapters.TicketsTableAdapter();
            adapt3.UpdateQuery(false, ticketID);
            Session["Cancel"] = ticketID;
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Presume that the buttonField is at 1st cell
            LinkButton link = e.Row.Cells[11].Controls[0] as LinkButton;

            if (link != null)
            {
                link.Attributes.Add("onclick", "return ConfirmOnCancel();");
            }
        }
    }
}