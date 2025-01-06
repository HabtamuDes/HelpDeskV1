using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userMangment_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Clear the session
        Session.Clear();
        Session.Abandon();

        // Redirect to the login page
        Response.Redirect("Login.aspx");
    }
}