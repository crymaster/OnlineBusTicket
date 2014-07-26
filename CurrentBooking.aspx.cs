using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CurrentBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BookID"] == null)
        {
            lbMessage.Text = "No booking information at the moment";
            hlMore.Visible = false;
            hlAnother.Visible = false;
            btnEnd.Visible = false;
            GridView1.Visible = false;
        }
        else
        {
            lbMessage.Text = "Currently booking for " + Session["CustomerName"].ToString();
            hlMore.Visible = true;
            hlAnother.Visible = true;
            btnEnd.Visible = true;
            GridView1.Visible = true;

            int bookid = int.Parse(Session["BookID"].ToString());
            DataSet1TableAdapters.BookingInfoTableAdapter adapt = new DataSet1TableAdapters.BookingInfoTableAdapter();
            DataTable dt1 = adapt.GetAllBookingInfo(bookid);
            if (dt1.Rows.Count > 0)
            {
                BoundField bfield = new BoundField();
                bfield.DataField = dt1.Columns["CustomerID"].ColumnName;
                bfield.HeaderText = "UID";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Name"].ColumnName;
                bfield.HeaderText = "Customer Name";
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
                bfield.HeaderText = "Running Date/Time";
                bfield.DataFormatString = "{0:dd/MM/yyyy hh:mm:ss tt}";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["BusID"].ColumnName;
                bfield.HeaderText = "Bus Number";
                GridView1.Columns.Add(bfield);

                bfield = new BoundField();
                bfield.DataField = dt1.Columns["Type"].ColumnName;
                bfield.HeaderText = "Bus Type";
                GridView1.Columns.Add(bfield);

                //bfield = new BoundField();
                //bfield.DataField = dt1.Columns["SeatNum"].ColumnName;
                //bfield.HeaderText = "Seat Number";
                //GridView1.Columns.Add(bfield);

                TemplateField tfield = new TemplateField();
                tfield.HeaderText = "Seat Number";
                tfield.ItemTemplate = new GridViewTemplate(ListItemType.Item, "SeatNum","lbSeat");
                tfield.FooterTemplate = new GridViewTemplate(ListItemType.Footer, "Total Price","lbtxtPrice");
                GridView1.Columns.Add(tfield);

                tfield = new TemplateField();
                tfield.HeaderText = "Price";
                tfield.ItemTemplate = new GridViewTemplate(ListItemType.Item, "Price","lbPrice");
                tfield.FooterTemplate = new GridViewTemplate(ListItemType.Footer, "","lbTotal");
                GridView1.Columns.Add(tfield);

                //bfield = new BoundField();
                //bfield.DataField = dt1.Columns["Price"].ColumnName;
                //bfield.DataFormatString = "{0}$";
                //bfield.HeaderText = "Price";
                //GridView1.Columns.Add(bfield);

                HyperLinkField hlfield = new HyperLinkField();
                hlfield.Text = "Book";
                hlfield.DataNavigateUrlFormatString = "Book.aspx?rbid={0}";
                hlfield.DataNavigateUrlFields = new string[] { "RBID" };
                GridView1.Columns.Add(hlfield);

                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }
        }
    }
    protected void btnEnd_Click(object sender, EventArgs e)
    {
        Session["BookID"] = null;
        Session["CustomerID"] = null;
        Session["CustomerName"] = null;
        Session["CustomerDOB"] = null;
        Response.Redirect("index.aspx");
    }

    public class GridViewTemplate : ITemplate
    {
        //A variable to hold the type of ListItemType.
        ListItemType _templateType;
        //A variable to hold the column name.
        string _columnName;
        string _lb;

        public GridViewTemplate(ListItemType type, string colname,string lb)
        {
            _lb = lb;
            //Stores the template type.
            _templateType = type;
            //Stores the column name.
            _columnName = colname;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            switch (_templateType)
            {
                case ListItemType.Item:
                    Label lbSeat = new Label();
                    lbSeat.ID = _lb;
                    lbSeat.DataBinding += new EventHandler(tb1_DataBinding);
                    container.Controls.Add(lbSeat);
                    break;
                case ListItemType.Footer:
                    Label lb = new Label();
                    lb.ID = _lb;
                    lb.Text = _columnName;
                    container.Controls.Add(lb);
                    break;
            }
        }

        void tb1_DataBinding(object sender, EventArgs e)
        {
            Label lbdata = (Label)sender;
            GridViewRow container = (GridViewRow)lbdata.NamingContainer;
            object dataValue = DataBinder.Eval(container.DataItem, _columnName);
            if (dataValue != DBNull.Value)
            {
                lbdata.Text = dataValue.ToString();
            }
        }
    }

    float total = 0;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbPrice = (Label)e.Row.FindControl("lbPrice");
            if (lbPrice != null)
            {
                //decimal price = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "UnitPrice")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "OrderQty"));
                total += float.Parse(lbPrice.Text);
            }
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotal = (Label)e.Row.FindControl("lbTotal");
            lblTotal.Text = total.ToString();
        }
    }
}