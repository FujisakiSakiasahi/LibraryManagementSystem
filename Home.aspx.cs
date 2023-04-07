using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
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

            SetBookRecommendation();
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

        protected void SetBookRecommendation() {
            //html string for item-card
            string item = @"<div class=""col-lg-3\"">
                               <div class=""thumbnail"">
                                        <a href=""Description.aspx?bookId=12"">
                                            <img src=""/images/book.jpg"" style=""width:100%""/>
                                            <div class=""caption"">
                                                <p>Title</p>
                                                <p>By Author</p>
                                             </div>
                                        </a>
                                    </div>
                                </div>";

            //get a list of book from the database
            string[] queryList = new string[2];
            queryList[0] = "SELECT Book.bookId, Book.bookName, Book.authorName, Book.bookImage, AVG(Ratings.rating) AS avg_rating FROM Ratings JOIN Book ON Ratings.bookId = Book.bookId GROUP BY Book.bookId, Book.bookName, Book.authorName, Book.bookImage ORDER BY avg_rating DESC LIMIT 4;";//get top 4 rating books
            queryList[1] = "SELECT bookId, bookName, authorName, bookImage FROM Book ORDER BY bookId DESC LIMIT 4;";//get 4 newest book

            DataTable result = sessionHandler.RunQuery(queryList[0]);
            string content = "";
            if (result.Rows.Count != 0) {//insert 4 popular book
                for (int i = 0; i < result.Rows.Count; i++) {
                    string image = result.Rows[i][3].ToString()!="" ? File.Exists($"/images/{result.Rows[i][3].ToString()}") ? result.Rows[i][3].ToString() : "book.jpg" : "book.jpg";

                    content += $@"<div class=""col-lg-3"">
                                    <div class=""thumbnail"">
                                            <a href=""Description.aspx?bookId={result.Rows[i][0]}"">
                                                <img src=""/images/{image}"" style=""width:100%""/>
                                                <div class=""caption"">
                                                    <p>{result.Rows[i][1]}</p>
                                                    <p>By {result.Rows[i][2]}</p>
                                                    </div>
                                            </a>
                                        </div>
                                    </div>";
                }
                popular_book_content.InnerHtml = "";
                popular_book_content.InnerHtml = content;
            } else {
                popular_book_content.InnerHtml = "";
                popular_book_content.InnerHtml = $@"<div class=""col-lg-3"">
                                                           <div class=""thumbnail"">
                                                                    <img src=""/images/book.jpg"" style=""width:100%""/>
                                                                    <div class=""caption"">
                                                                        <p>No Books</p>
                                                                    </div>
                                                                </div>
                                                            </div>";
            }



/*
            if () {//random genre
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
            }*/
            

            //set the books to the page here
        }

        protected void Button_Search_Click(object sender, EventArgs e){
            
            Response.Redirect($"Search.aspx?search_query={ReplaceSpacesWithPlus(Textbox_Search.Text)}");
        }

        public string ReplaceSpacesWithPlus(string input) {
            string output = input.Replace(" ", "+");
            return output;
        }
    }
}