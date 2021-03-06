﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            txtWelcome.Text = "Welcome, " + Session["userName"];
        }
        if (Session["BookID"] == null)
        {
            hlStart.Visible = true;
            hlCurrent.Visible = false;
        }
        else
        {
            hlStart.Visible = false;
            hlCurrent.Visible = true;
        }
    }
}
