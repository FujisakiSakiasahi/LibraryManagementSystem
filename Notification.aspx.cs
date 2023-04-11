using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Notification : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialLoginState();
                HeaderUIHandler();

                username.InnerHtml = sessionHandler.RunQuery($"SELECT memberName FROM Member WHERE memberId={sessionHandler.GetUserId()}").Rows[0][0].ToString();

                if (!sessionHandler.GetLoginState())
                {
                    Response.Write("<script>alert('Access denied, redirecting to home')</script>");
                    string redirectScript = "<script>window.location.href = 'Home.aspx';</script>";
                    ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript", redirectScript, false);
                }

                DataTable notificationList = sessionHandler.RunQuery($"SELECT notifTitle, msg FROM Notification WHERE memberId={sessionHandler.GetUserId()} OR memberId=0;");
                string content = "";
                for (int i = 0; i < notificationList.Rows.Count; i++) { 
                    content += $@" <li class=""list-group-item"">
                                        <h3>{notificationList.Rows[i][0]}</h3>
                                        <hr/>
                                        <p>{notificationList.Rows[i][1]}</p>
                                    </li>";
                }

                notification_list.InnerHtml = "";
                notification_list.InnerHtml = content;
            }
        }

        protected void HeaderUIHandler()
        {
            librarian_link.Visible = false;

            if (sessionHandler.GetIsLibrarian())
            {
                librarian_link.Visible = true;
            }
        }
        protected void SetInitialLoginState()
        {
            if (Session["loginState"] != null)
            {
                sessionHandler.CheckLoginState();
            }
            else { Session["loginState"] = "false"; }
        }

        protected void Logout_Function(object sender, EventArgs e)
        {
            string link = sessionHandler.GetIsLibrarian() && Request.RawUrl.Equals("Librarian.aspx") ? "Home.aspx" : Request.RawUrl;

            Session["userLoginState"] = false;
            Session.Abandon();
            Response.Redirect(link);
        }
    }
}