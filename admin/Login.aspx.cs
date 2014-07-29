using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminID"] != null && Session["AdminID"].ToString() != "")
            {
                Response.Redirect("index.aspx");
            }
        }
       
        //if (Request.Cookies["AdminEmail"] != null && Request.Cookies["AdminPassword"] != null)
        //{
        //    txtEmail.Text = Request.Cookies["AdminEmail"].ToString();
        //    txtPassword.Text = Request.Cookies["AdminPassword"].ToString();
        //}
        //BLLAdmin.HasLogin(Session, Request, Response);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        BLLAdmin admin = new BLLAdmin();
        int ID = admin.CheckLogin(txtEmail.Text, txtPassword.Text);
        
        if (ID !=-1)
        {
            Session["AdminEmail"] = txtEmail.Text;
            Session["AdminID"] = ID;
            Response.Write("ID" + Session["AdminID"].ToString());
            Response.Redirect("busmanager.aspx");
            //if (ckRemember.Checked)
            //{
            //    HttpCookie ck = new HttpCookie("AdminEmail", txtEmail.Text);
            //    DateTime expire = DateTime.Now.AddMinutes(2);
            //    ck.Expires = expire;
            //    //ck["useremail"] = txtemail.text;
            //    //ck["userpassword"] = txtpassword.text;
            //    Request.Cookies.Add(ck);
            //    ck.Expires = expire;
            //    ck = new HttpCookie("AdminPassword", txtPassword.Text);
            //    Request.Cookies.Add(ck);
            //}
           
        }
        else
        {
            txtError.Text = "Incorrect email or password";
        }
    }
    
}