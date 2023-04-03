using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace LibraryManagementSystem
{
    public partial class Home : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();

        protected void Page_Load(object sender, EventArgs e) {
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }
        }

        protected void Search(String searchStatement, String filter) {
            String searchQuery = "SELECT * FROM Book WHERE " + filter + "=" + searchStatement + ";";
            DataTable result = sessionHandler.RunQuery(searchQuery);


            //set the returning datatable to the required space
            //write here
        }

        ///!!!! to-be written after the advanced search UI is done
        protected void Search(String title, String author, String lang, int isbn, bool availablility) {
            String searchQuery = "SELECT * FROM Book WHERE ";
            if (!String.IsNullOrEmpty(title)) {
                searchQuery += "bookName='" + title + "'";
            }
        }

        protected void SetBookRecommendation(String genre) {
            //get a list of book from the database
            String query;
            if (genre == "random") {//random genre
                query = "SELECT DISTINCT genre FROM Genre;";
                DataTable genreListData = sessionHandler.RunQuery(query);
                int genreCount = genreListData.Rows.Count;

                String[] genreList = new String[genreCount];
                for (int i = 0; i < genreCount; i++) {
                    genreList[i] = genreListData.Rows[i].ToString();
                }

                //randomly select one genre
                Random rnd = new Random();
                int genreIndexChosen = rnd.Next(genreCount);

                //set query
                query = "SELECT bookName, authorName, bookImage FROM Book WHERE bookId IN (SELECT bookId FROM genre WHERE genre='" + genreList[genreIndexChosen] + "';);";
            } else {//specific genre
                query = "SELECT bookName, authorName, bookImage FROM Book WHERE bookId IN(SELECT bookId FROM genre WHERE genre='" + genre + "';)";
            }
            DataTable result = sessionHandler.RunQuery(query);

            //set the books to the page here
        }

        protected void Button1_Click(object sender, EventArgs e) { 
        }
    }
}