using System;
using System.Collections.Generic;
using System.Data;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            string bookId = Request.QueryString["bookId"];

            DataTable dataTable = sessionHandler.RunQuery("SELECT * FROM Book WHERE bookId="+bookId+";");

            LoadBookData(dataTable);
            SetCitationText(dataTable.Rows[0][1].ToString(), dataTable.Rows[0][6].ToString(), dataTable.Rows[0][2].ToString(), dataTable.Rows[0][5].ToString());
        }

        protected void LoadBookData(DataTable dataTable) {
            Label_Title.Text = dataTable.Rows[0][1].ToString();
            Label_Description.Text = dataTable.Rows[0][4].ToString();

            tablecell_author.InnerHtml = dataTable.Rows[0][2].ToString();
            tablecell_publisher.InnerHtml = dataTable.Rows[0][5].ToString();
            tablecell_publishdate.InnerHtml = dataTable.Rows[0][6].ToString();
            tablecell_rating.InnerHtml = dataTable.Rows[0][7].ToString();
            tablecell_language.InnerHtml = dataTable.Rows[0][8].ToString();
            tablecell_ISBN.InnerHtml = dataTable.Rows[0][9].ToString();
            tablecell_availability.InnerHtml = dataTable.Rows[0][10].ToString();
            tablecell_shelfid.InnerHtml = dataTable.Rows[0][11].ToString();
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
    }
}