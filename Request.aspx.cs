using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Request : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { 
                SetInitialLoginState();
                HeaderUIHandler();

                username.InnerHtml = sessionHandler.RunQuery($"SELECT memberName FROM Member WHERE memberId={sessionHandler.GetUserId()}").Rows[0][0].ToString();

                if (!sessionHandler.GetLoginState()) {
                    Response.Write("<script>alert('Access denied, redirecting to home')</script>");
                    string redirectScript = "<script>window.location.href = 'Home.aspx';</script>";
                    ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript", redirectScript, false);
                }
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

        protected void Button_Request_Click(object sender, EventArgs e) {
            if (!string.IsNullOrEmpty(Textbox_Request.Text)) {
                sessionHandler.RunQuery($"INSERT INTO Requests (bookName) VALUES ('{Textbox_Request.Text}');");
            }
        }
    }
}