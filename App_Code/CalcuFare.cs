using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for CalcuFare
/// </summary>
public class CalcuFare
{
	public CalcuFare()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public double FareType(string type, double fare)
    {
        switch (type)
        {
            case "Express":
                { return fare; break; }
            case "Luxury":
                { return fare * 1.05; break; }
            case "Volvo(Non-A/C)":
                { return fare * 1.1; }
            case "Volvo(A/C)":
                { return fare * 1.15; }
            default:
                { return 1; break; }
        }
    }
    public double FareTaxe(double fare)
    {
        return fare * 0.1;
    }
    public double CheckAge(int age)
    {
        if (age < 5) return 0;
        if (5 <= age && age <= 12) return 0.5;
        if (12 < age && age <= 50) return 1;
        else return 0.7;
    }
}
