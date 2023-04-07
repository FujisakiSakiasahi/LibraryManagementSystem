using System;
using System.Collections.Generic;
using System.Data;
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
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }

            bookId = Request.QueryString["bookId"];

            DataTable dataTable = sessionHandler.RunQuery("SELECT * FROM Book WHERE bookId="+bookId+";");

            LoadBookData(dataTable);
            SetCitationText(dataTable.Rows[0][1].ToString(), dataTable.Rows[0][6].ToString(), dataTable.Rows[0][2].ToString(), dataTable.Rows[0][5].ToString());
        }

        protected void AddBookToWishList(String bookId) {
            if (sessionHandler.GetLoginState()) {
                //already login
                sessionHandler.RunQuery("INSERT INTO Wishlist (bookId, memberId) VALUES (" + bookId + ", " + sessionHandler.GetUserId() + ");");//add the book to the wishlist table
            } else {
                //no login
                Response.Redirect("Login.aspx");
            }
        }

        protected void ReservingBook(String bookId) {
            if (sessionHandler.GetLoginState()) {
                //already login
                if (CheckIfBookIsAvailabe(bookId)) { 
                    sessionHandler.RunQuery("INSERT INTO Wishlist (bookId, memberId, reservedUntil) VALUES (" + bookId + ", " + sessionHandler.GetUserId() + ", '" + DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") + "');");//add the book to the reserved table
                }
            } else {
                //no login
                Response.Redirect("Login.aspx");
            }
        }

        protected bool CheckIfBookIsAvailabe(String bookId) {
            DataTable bookAvailable = sessionHandler.RunQuery($"SELECT available FROM Book WHERE bookId = {bookId};");
            DataTable bookReserved = sessionHandler.RunQuery($"SELECT * FROM Reserved WHERE bookId = {bookId}");

            if (bookAvailable.Rows[0][0].ToString() != "1") return false;
            if (bookReserved != null) return false;
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
    }
}