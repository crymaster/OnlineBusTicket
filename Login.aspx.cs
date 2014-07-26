using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userId"] == "")
        {
            Response.Redirect("index.aspx");
        }
        if (Request.Cookies["userEmail"] != null && Request.Cookies["userPassword"] != null)
        {
            txtEmail.Text = Request.Cookies["userEmail"].ToString();
            txtPassword.Text = Request.Cookies["userPassword"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet1TableAdapters.EmployeesTableAdapter adapt = new DataSet1TableAdapters.EmployeesTableAdapter();
        DataTable dt = adapt.Authenticate(txtEmail.Text, txtPassword.Text);
        if (dt.Rows.Count > 0)
        {
            Session["userEmail"] = txtEmail.Text;
            Session["userName"] = dt.Rows[0]["Name"].ToString();
            Session["userId"] = dt.Rows[0]["EmpId"];
            if (ckRemember.Checked)
            {
                HttpCookie ck = new HttpCookie("userEmail",txtEmail.Text);
                DateTime expire = DateTime.Now.AddMinutes(2);
                ck.Expires = expire;
                //ck["useremail"] = txtemail.text;
                //ck["userpassword"] = txtpassword.text;
                Request.Cookies.Add(ck);
                ck.Expires = expire;
                ck = new HttpCookie("userPassword", txtPassword.Text);
                Request.Cookies.Add(ck);
            }
            Response.Redirect("index.aspx");
        }
        else
        {
            txtError.Text = "Incorrect email or password";
        }
    }
}