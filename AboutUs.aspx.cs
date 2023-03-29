using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class WebForm4 : System.Web.UI.Page
    {

        private SessionHandler sessionHandler = new SessionHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginState"] != null)
            {
                sessionHandler.CheckLoginState();
            }
            else { Session["loginState"] = "false"; }
        }

    }
}