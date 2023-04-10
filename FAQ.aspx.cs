using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
	public partial class FAQ : System.Web.UI.Page
	{   SessionHandler sessionHandler = new SessionHandler();
		
        protected void Page_Load(object sender, EventArgs e)
		{
            

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

        protected void Logout_Function(object sender, EventArgs e) {
            string link = sessionHandler.GetIsLibrarian() && Request.RawUrl.Equals("Librarian.aspx") ?  "Home.aspx" : Request.RawUrl;
            
            Session["userLoginState"] = false;
            Session.Abandon();
            Response.Redirect(link);
        }
	}
}