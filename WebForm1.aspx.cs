using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS ; Database=LibrarylDb ; Integrated Security = TRUE");
        //private SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS ; Database=LibrarylDb ; Integrated Security = TRUE");

        public bool userLoginState = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            checkLoginState();
        }

        protected void checkLoginState() {
            if (Session["loginState"].ToString() == "true")
            {
                userLoginState = true;
            }
            else { 
                userLoginState = false;
            }
        }

        protected void setCookie(String cookieName, String cookieValue) {
            HttpContext.Current.Response.Cookies.Add(new HttpCookie(cookieName, cookieValue));
        }

        protected void login() {
            if (true)
                Session["loginState"] = "true";
        }

        //for the use of getting data from database by running SQL query
        protected DataTable runQuery(String query) 
        {
            DataTable returningData = new DataTable();

            connection.Open();

            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand(query, connection));
            da.Fill(returningData);

            connection.Close();

            return returningData;
        }

        protected void Search(String searchStatement, String filter) 
        {
            String searchQuery = "SELECT * FROM Book WHERE " + filter + "=" + searchStatement + ";";
            DataTable result = runQuery(searchQuery);


            //set the returning datatable to the required space
            //write here
        }

        ///!!!! to-be written after the advanced search UI is done
        protected void Search(String title, String author, String lang, int isbn, bool availablility)
        {
            String searchQuery = "SELECT * FROM Book WHERE ";
            if (!String.IsNullOrEmpty(title)) {
                searchQuery += "bookName='" + title + "'";
            }
        }

        protected void SetBookRecommendation(String genre){
            //get a list of book from the database
            String query;
            if(genre == "random"){//random genre
                query = "SELECT DISTINCT genre FROM Genre;";
                DataTable genreListData = runQuery(query);
                int genreCount = genreListData.Rows.Count;
                
                String[] genreList = new String[genreCount];
                for(int i = 0 ; i < genreCount ; i++){
                    genreList[i] = genreListData.Rows[i].ToString();
                }

                //randomly select one genre
                Random rnd = new Random();
                int genreIndexChosen = rnd.Next(genreCount);

                //set query
                query = "SELECT bookName, authorName, bookImage FROM Book WHERE bookId IN (SELECT bookId FROM genre WHERE genre='"+genreList[genreIndexChosen]+"';);";
            }else{//specific genre
                query = "SELECT bookName, authorName, bookImage FROM Book WHERE bookId IN(SELECT bookId FROM genre WHERE genre='"+genre+"';)";
            }
            DataTable result = runQuery(query);

            //set the books to the page here
        }
    }
}