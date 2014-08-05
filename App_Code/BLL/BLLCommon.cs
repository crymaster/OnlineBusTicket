using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;

/// <summary>
/// Summary description for BLLCommon
/// </summary>
public class BLLCommon
{
	public BLLCommon()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static void ShowError(HttpResponse response, int error)
    {
        if (error == 1)
        {
            Message(response, "Seat number must greater than 0");
        }
        else if (error == 2)
        {
            Message(response, "Having some errors ! Please try again !");
        }
        else if (error == 3)
        {
            Message(response, "Rate must be a real number");
        }
        else if (error == 4)
        {
            Message(response, "Rate must be greater than 0");
        }
        else if (error == 5)
        {
            Message(response, "Date is not match. Must be dd/mm/yyyy");
        }
        else if (error == 6)
        {
            Message(response, "Date start must after today");
        }
        else if (error == 7)
        {
            Message(response, "Start Place must be difference destination");
        }
        else if (error == 8)
        {
            Message(response, "Distance must be a number");
        }
        else if (error == 9)
        {
            Message(response, "Distance must be greater than 0");
        }
        else if (error == 10)
        {
            Message(response, "Rate is too large");
        }
        else if (error == 11)
        {
            Message(response, "Current password is incorrect !");
        }
        else if (error == 12)
        {
            Message(response, "Re-password is not compair !");
        }
        else if (error == 13)
        {
            Message(response, "Password don't have a space");
        }
        else if (error == 14)
        {
            Message(response, "Password is too short, must be greater than 8 characters");
        }
        else if (error == 15)
        {
            Message(response, "Date of birth is not valid. Must be dd/mm/yyyy");
        }
        else if (error == 16)
        {
            Message(response, "Are you sure about Date of birth ! She/He isnt borned now");
        }
        else if (error == 17)
        {
            Message(response, "This route is exist ! Please chose other route !");
        }
        else if (error == 18)
        {
            Message(response, "How to a bus can run in both two route concurrently ! Please choose again !");
        }
        else if (error == 19)
        {
            Message(response, "This name is exist ! Please chose other name !");
        }
        else if (error == 20)
        {
            Message(response, "This email is exist ! Please chose other email !");
        }
        else if (error == 21)
        {
            Message(response, "This type is exist ! Please chose other type !");
        }
        else if (error == 22)
        {
            Message(response, "This number plate is exist ! Please chose other number plate !");
        }
        else if (error == 23)
        {
            Message(response, "Cannot load distance, please try again !");
        }
        else if (error == 24)
        {
            Message(response, "Cannot load price, please try again !");
        }
        else if (error == 25)
        {
            Message(response, "Cannot load rate, please try again !");
        }
        else if (error == 26)
        {
            Message(response, "Price must be greater than 0, please try again !");
        }
        else if (error == 27)
        {
            Message(response, "Date Start is gone, cannot edit !");
        }
        else
        {
            Message(response, "Having some errors ! Please try again !");
        }
    }
    public static void ShowResult(HttpResponse response, String action, int code)
    {
        if (code == 1)
        {
            Message(response, action+ " success !");
        }
        else if (code == 2)
        {
            Message(response, action + " fail ! Please try again !");
        }
        else
        {
            Message(response, action + " fail ! Please try again !");
        }
    }
    public static void Message(HttpResponse response, String msg)
    {
        response.Write("<script>alert('" + msg + "')</script>");
    }
    public static string HexStringFromBytes(byte[] bytes)
    {
        var sb = new StringBuilder();
        foreach (byte b in bytes)
        {
            var hex = b.ToString("x2");
            sb.Append(hex);
        }
        return sb.ToString();
    }
}
