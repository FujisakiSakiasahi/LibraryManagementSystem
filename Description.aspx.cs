using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Description : System.Web.UI.Page
    {
        SessionHandler sessionHandler = new SessionHandler();
        string bookId;

        protected void Page_Load(object sender, EventArgs e)
        {
            SetInitialLoginState();
            HeaderUIHandler();

            username.InnerHtml = sessionHandler.RunQuery($"SELECT memberName FROM Member WHERE memberId={sessionHandler.GetUserId()}").Rows[0][0].ToString();

            DataTable dataTable = new DataTable();

            try {
                bookId = Request.QueryString["bookId"];
                dataTable = sessionHandler.RunQuery("SELECT * FROM Book WHERE bookId="+bookId+";");
                LoadBookData(dataTable);
                SetCitationText(dataTable.Rows[0][1].ToString(), dataTable.Rows[0][6].ToString(), dataTable.Rows[0][2].ToString(), dataTable.Rows[0][5].ToString());
            } catch {
                Response.Write("<script>alert('Book ID not found, redirecting to home')</script>");
                string redirectScript = "<script>window.location.href = 'Home.aspx';</script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript", redirectScript, false);
            }
        }

        protected void SetInitialLoginState() {
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }
        }

        protected void HeaderUIHandler() {
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
            }
        }

        protected void AddBookToWishList(String bookId) {
            if (sessionHandler.GetLoginState()) {
                //already login
                try {
                    sessionHandler.RunQuery("INSERT INTO Wishlist (bookId, memberId) VALUES (" + bookId + ", " + sessionHandler.GetUserId() + ");");//add the book to the wishlist table
                } catch {
                    Response.Write("<script>alert('The book has been added into wishlist')</script>");
                }
            } else {
                //no login
                Response.Redirect("Login.aspx");
            }
        }

        protected void ReservingBook(String bookId) {
            if (sessionHandler.GetLoginState()) {
                //already login
                if (CheckIfBookIsAvailabe(bookId)) {
                    sessionHandler.RunQuery("INSERT INTO Reserved (bookId, memberId, reservedUntil) VALUES (" + bookId + ", " + sessionHandler.GetUserId() + ", '" + DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + "');");//add the book to the reserved table
                } else { Response.Write("<script>alert('This book already reserved by a user.')</script>"); }
            } else {
                //no login
                Response.Redirect("Login.aspx");
            }
        }

        protected bool CheckIfBookIsAvailabe(String bookId) {
            DataTable bookAvailable = sessionHandler.RunQuery($"SELECT available FROM Book WHERE bookId = {bookId};");
            DataTable bookReserved = sessionHandler.RunQuery($"SELECT * FROM Reserved WHERE bookId = {bookId}");

            if (bookAvailable.Rows[0][0].ToString() != "1") return false;
            if (bookReserved.Rows.Count != 0) return false;
            return true;
        }

        protected void LoadBookData(DataTable dataTable) {
            Label_Title.InnerHtml = dataTable.Rows[0][1].ToString();
            Label_Description.Text = dataTable.Rows[0][4].ToString();
            tablecell_author.Text = dataTable.Rows[0][2].ToString();
            tablecell_publisher.Text = dataTable.Rows[0][5].ToString();
            tablecell_publishdate.Text = dataTable.Rows[0][6].ToString();
            tablecell_rating.Text = dataTable.Rows[0][7].ToString();
            tablecell_language.Text = dataTable.Rows[0][8].ToString();
            tablecell_ISBN.Text = dataTable.Rows[0][9].ToString();
            tablecell_availability.Text = dataTable.Rows[0][10].ToString();
            tablecell_shelfid.Text = dataTable.Rows[0][11].ToString();
        }

        protected void SetCitationText(string title, string publishDate, string author, string publisher) {
            // Format author name
            string[] authorNames = author.Split(' ');
            string lastName = authorNames[authorNames.Length - 1];
            string initials = "";
            for (int i = 0; i < authorNames.Length - 1; i++) {
                initials += authorNames[i][0] + ".";
            }

            // Format publish date
            DateTime date = DateTime.Parse(publishDate);
            string formattedDate = date.ToString("yyyy");

            // Assemble citation string
            string citation = lastName + ", " + initials + " (" + formattedDate + "). " + title + ", " + publisher + ".";

            citingText.InnerHtml = citation;
        }

        protected void Button_Wishlist_Click(object sender, EventArgs e) {
            AddBookToWishList(bookId);
        }

        protected void Button_ReserveBook_Click(object sender, EventArgs e) {
            ReservingBook(bookId);
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