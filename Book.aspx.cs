﻿using System;
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
            double kid = double.Parse(Resources.Resource.Kid2);
            double elder = double.Parse(Resources.Resource.Elder);

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
            lbElder.Text = (double.Parse(row["Price"].ToString()) * elder).ToString() + "$";
            lbKid.Text = (double.Parse(row["Price"].ToString()) * kid).ToString() + "$";

            DataSet1TableAdapters.UnbookedSeatTableAdapter adapt1 = new DataSet1TableAdapters.UnbookedSeatTableAdapter();
            dt = adapt1.GetUnbookedSeatOnTour(rbid);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow r in dt.Rows)
                {
                    ListItem item = new ListItem();
                    item.Text = r["SeatNum"].ToString();
                    item.Value = r["TicketID"].ToString();
                    ddSeat.Items.Add(item);
                }
            }
            if (Session["CustomerID"] != null)
            {
                lbID.Text = Session["CustomerID"].ToString();
                lbName.Text = Session["CustomerName"].ToString();
                lbDOB.Text = Session["CustomerDOB"].ToString();
                DateTime dob = DateTime.ParseExact(lbDOB.Text, "dd/MM/yyyy", null);
                TimeSpan diff = DateTime.Now - dob;
                int year = diff.Days / 365;
                double price = double.Parse(lbAdult.Text.Substring(0, lbAdult.Text.IndexOf("$")));
                if (year <= 5)
                {
                    lbPrice.Text = 0 + "$";
                }
                else if (year > 5 && year < 12)
                {
                    lbPrice.Text = price * kid + "$";
                }
                else if (year > 50)
                {
                    lbPrice.Text = price * elder + "$";
                }
                else
                {
                    lbPrice.Text = price + "$";
                }

                DataSet1TableAdapters.DataTable1TableAdapter adapt3 = new DataSet1TableAdapters.DataTable1TableAdapter();
                dt = adapt3.GetCustomerBookATour(lbID.Text, int.Parse(Request.QueryString["RBID"].ToString()));
                if (dt.Rows.Count > 0)
                {
                    lbStatus.Text = "This customer already booked this tour";
                    btnBook.Enabled = false;
                }
                else
                {
                    btnBook.Enabled = true;
                }
            }
        }
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        int bookid = int.Parse(Session["BookID"].ToString());
        DataSet1TableAdapters.BookingDetailsTableAdapter adapt3 = new DataSet1TableAdapters.BookingDetailsTableAdapter();
        double? price = double.Parse(lbPrice.Text.Substring(0, lbPrice.Text.IndexOf("$")));
        int ticketID = int.Parse(ddSeat.SelectedValue.ToString());
        adapt3.InsertQuery(bookid, ticketID, lbID.Text, price, false);
        DataSet1TableAdapters.RouteBusTableAdapter adapt4 = new DataSet1TableAdapters.RouteBusTableAdapter();
        adapt4.UpdateQuery(1, int.Parse(Request.QueryString["RBID"]));
        DataSet1TableAdapters.TicketsTableAdapter adapt = new DataSet1TableAdapters.TicketsTableAdapter();
        adapt.UpdateQuery(true, ticketID);
        Session["TicketID"] = ticketID;
        Response.Redirect("PrintTicket.aspx");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchTour.aspx");
    }
}