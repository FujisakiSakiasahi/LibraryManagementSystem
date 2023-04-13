using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Wishlist : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            SetInitialLoginState();
            HeaderUIHandler();

            if (!Page.IsPostBack)
            {
                if (!sessionHandler.GetLoginState())
                {
                    Response.Write("<script>alert('Access denied, redirecting to home')</script>");
                    string redirectScript = "<script>window.location.href = 'Home.aspx';</script>";
                    ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript", redirectScript, false);
                }
                else
                {
                    username.InnerHtml = sessionHandler.RunQuery($"SELECT memberName FROM Member WHERE memberId={sessionHandler.GetUserId()}").Rows[0][0].ToString();
                }

                DataTable wishlistList = sessionHandler.RunQuery($"SELECT bookId, bookImage, bookName, bookDescription FROM Book INNER JOIN Wishlist USING (bookId) WHERE Wishlist.memberId = {sessionHandler.GetUserId()};");
                string content = "";
                for (int i = 0; i < wishlistList.Rows.Count; i++)
                {
                    content += $@"<li class=""list-group-item"">
                                    <a href=""Description.aspx?bookId={wishlistList.Rows[i][0]}"">
                                        <div class=""row"">
                                            <div class=""col-lg-3"">
                                                <img src=""{wishlistList.Rows[i][1].ToString().TrimStart('~')}"" class=""book-cover-size""/>
                                            </div>
                                            <div class=""col-lg-9"">
                                                <h4 class=""text-dark"">{wishlistList.Rows[i][2]}</h4>
                                                <p class=""text-dark"">{wishlistList.Rows[i][3]}</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>";
                }

                wishlist.InnerHtml = "";
                wishlist.InnerHtml = content;
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

            Session["loginState"] = false;
            Session.Abandon();
            Response.Redirect(link);
        }
    }
}