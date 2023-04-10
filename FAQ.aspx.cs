using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
	public partial class FAQ : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            SessionHandler sessionHandler = new SessionHandler();

            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }

            login_link.Visible = false;
            profile.Visible = false;

            librarian_link.Visible = false;

            if (sessionHandler.GetLoginState() == false) {
                login_link.Visible = true;
            } else {
                profile.Visible = true;
            }

            if (sessionHandler.GetIsLibrarian()) { 
                librarian_link.Visible = true;
                Response.Write($"<script>alert('{librarian_link + " " + true}')</script>");
            }
        }
	}
}