using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SearchTour : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
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

            DataSet1TableAdapters.CategoriesTableAdapter adapt2 = new DataSet1TableAdapters.CategoriesTableAdapter();
            dt = adapt2.GetAll();
            ddBus.DataSource = dt;
            ddBus.DataTextField = "Type";
            ddBus.DataValueField = "Cat_ID";
            ddBus.DataBind();
            ListItem item = new ListItem("All");
            item.Value = "0";
            ddBus.Items.Add(item);
        }
        else
        {
            if (ddStart.SelectedValue.ToString().Equals(ddDest.SelectedValue.ToString()))
            {
                txtError.Text = "Start and Destination must not be the same";
            }
            else
            {
                txtError.Text = "";
                DateTime tomorrow = DateTime.Today.AddDays(1);
                DateTime dateFrom = DateTime.Today;
                DateTime dateTo = tomorrow;
                try
                {
                    dateFrom = DateTime.Parse(txtDateFrom.Text.ToString());
                    if (DateTime.Now > dateFrom)
                    {
                        //dateFrom = DateTime.Today;
                    }
                }
                catch (Exception ex)
                {
                    dateFrom = DateTime.Today;
                }

                try
                {
                    if (txtDateTo.Text == "")
                    {
                        dateTo = tomorrow;
                    }
                    dateTo = DateTime.Parse(txtDateTo.Text.ToString());
                    if (dateTo <= dateFrom)
                    {
                        dateTo = tomorrow;
                    }

                }
                catch (Exception ex)
                {
                    dateTo = tomorrow;
                }
                DataSet1TableAdapters.TourTableAdapter adapt3 = new DataSet1TableAdapters.TourTableAdapter();
                DataTable dt1 = adapt3.GetTourInfo(int.Parse(ddStart.SelectedValue.ToString()),int.Parse(ddDest.SelectedValue.ToString()),dateFrom,dateTo);

                dt1.Columns.Add(new DataColumn("KidPrice"));
                
                for (int i = 0 ; i<dt1.Rows.Count; i++)
                {
                    DataRow row = dt1.Rows[i];
                    if (ddBus.SelectedValue.ToString() != "0" && !row["Cat_ID"].ToString().Equals(ddBus.SelectedValue.ToString()))
                    {
                        dt1.Rows.Remove(row);
                        i--;
                    }
                    else
                    {
                        row["KidPrice"] = float.Parse(row["Price"].ToString()) * 0.75;
                    }
                }   

                if (GridView1.Columns.Count == 0)
                {
                        BoundField bfield = new BoundField();
                        bfield.DataField = dt1.Columns["BusID"].ColumnName;
                        bfield.HeaderText = "BusNo";
                        GridView1.Columns.Add(bfield);

                        bfield = new BoundField();
                        bfield.DataField = dt1.Columns["Name"].ColumnName;
                        bfield.HeaderText = "Start";
                        GridView1.Columns.Add(bfield);

                        bfield = new BoundField();
                        bfield.DataField = dt1.Columns["Name1"].ColumnName;
                        bfield.HeaderText = "Destination";
                        GridView1.Columns.Add(bfield);

                        bfield = new BoundField();
                        bfield.DataField = dt1.Columns["DateStart"].ColumnName;
                        bfield.HeaderText = "Date-Time";
                        GridView1.Columns.Add(bfield);

                        bfield = new BoundField();
                        bfield.DataField = dt1.Columns["Type"].ColumnName;
                        bfield.HeaderText = "Bus Type";
                        GridView1.Columns.Add(bfield);

                        bfield = new BoundField();
                        bfield.DataField = dt1.Columns["AvailableSeat"].ColumnName;
                        bfield.HeaderText = "Avai.Seat";
                        GridView1.Columns.Add(bfield);

                        bfield = new BoundField();
                        bfield.DataField = dt1.Columns["Price"].ColumnName;
                        bfield.HeaderText = "Adult Price";
                        GridView1.Columns.Add(bfield);

                        bfield = new BoundField();
                        bfield.DataField = dt1.Columns["KidPrice"].ColumnName;
                        bfield.HeaderText = "Kid Price";
                        GridView1.Columns.Add(bfield);

                        HyperLinkField hlfield = new HyperLinkField();
                        hlfield.Text = "Book";
                        hlfield.DataNavigateUrlFormatString = "Book.aspx?rbid={0}";
                        hlfield.DataNavigateUrlFields = new string[]{"RBID"};
                        GridView1.Columns.Add(hlfield);
                        
                }
                
                GridView1.DataSource = dt1;
                GridView1.DataBind();
            }
        }
    }

 }
    