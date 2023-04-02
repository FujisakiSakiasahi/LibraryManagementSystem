using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Librarian : System.Web.UI.Page
    {
        protected enum SelectedPage {
            /*
                0 - 3: manage book
                    0: list all
                    1: view info
                    2: edit info
                    3: add new
                4 - 6: manage user
                7    : check in (return book)
                8    : check out (borrow book)
                9    : notification (maybe can add one more, to use for editing notification)
             */
            ManageBook,
            ViewBook,
            EditBook,
            AddNewBook,
            ManageUser,
            CheckIn,
            CheckOut,
            Notification,
        }

        private SessionHandler sessionHandler = new SessionHandler();
        private DataTable currentData = new DataTable();

        //button functions for Manage Book
        protected void Button_Click_ManageBook(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ManageBook;
            String[] tableColumn = { "bookId", "bookName" };
            LoadDataIntoGridView(GetAllData(SelectedPage.ManageBook).AsDataView().ToTable(true, tableColumn), GridView_BookList);
        }

        protected void Button_Click_SearchBook(object sender, EventArgs e) 
        {
            String[] tableColumn = { "bookId", "bookName" };
            LoadDataIntoGridView(Search(SelectedPage.ManageBook, Textbox_SearchBook.Text).AsDataView().ToTable(true, tableColumn), GridView_BookList);
        }

        protected void Button_Click_ViewBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button_Click_BackToManageBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Click_DeleteBook(object sender, EventArgs e) {

        }

        protected void Button_Click_EditBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = 2;
            LoadBookData(SelectedPage.EditBook);
        }

        protected void Button_Click_AddNewBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = 3;
            LoadBookData(SelectedPage.AddNewBook);
        }

        protected void Button_Click_DiscardChangesBook(object sender, EventArgs e) {

        }

        protected void Button_Click_SaveChangesBook(object sender, EventArgs e) {

        }

        protected void Button_Click_AbortAddingNewBook(object sender, EventArgs e) {

        }

        protected void Button_Click_AddingNewBook(object sender, EventArgs e) {

        }

        //button functions for Manage User
        protected void Button_Click_ManageUser(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }

        protected void Button_Click_SearchUser(object sender, EventArgs e) {
            LoadDataIntoGridView(Search(SelectedPage.ManageBook, Textbox_SearchBook.Text), GridView_BookList);
        }

        //button functions for Check In
        protected void Button_Click_CheckIn(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 7;

        }

        protected void Button_Click_CheckOut(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 8;

        }

        protected void Button_Click_Notification(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 9;

        }

        //functions for the actual backend function
        protected void Page_Load(object sender, EventArgs e) {
            if (!this.IsPostBack) { 
                if (Session["loginState"] != null) {
                    sessionHandler.CheckLoginState();
                } else { Session["loginState"] = "false"; };

                //when the page is loaded the Multiview will be set on View 0 which is manage book page, this line of code is to load the data on the first hand
                String[] tableColumn = { "bookId", "bookName" };
                LoadDataIntoGridView(GetAllData(SelectedPage.ManageBook).AsDataView().ToTable(true, tableColumn), GridView_BookList);
            }
            
        }

        protected DataTable Search(SelectedPage page, String searchString) {
            String query = "SELECT * FROM ";
            switch (page) {
                case SelectedPage.ManageBook:
                    query += "Book WHERE ";

                    if (int.TryParse(searchString, out int bookId)) {
                        query += "bookId = " + bookId + ";";
                    } else { 
                        query += "bookName = '" + searchString + "';";
                    }   
                    break;
                case SelectedPage.ManageUser:
                    break;
                case SelectedPage.CheckIn: 
                    break;
                case SelectedPage.CheckOut: 
                    break;
                case SelectedPage.Notification: 
                    break;
            }
            
            return sessionHandler.RunQuery(query);
        }

        protected DataTable GetAllData(SelectedPage page) {
            String query = "SELECT * FROM ";
            switch (page) {
                case SelectedPage.ManageBook:
                    query += "Book;";
                    break;
                case SelectedPage.ManageUser:
                    query += "Member;";
                    break;
                case SelectedPage.CheckIn:
                    break;
                case SelectedPage.CheckOut:
                    break;
                case SelectedPage.Notification:
                    query += "Notification;";
                    break;
            }

            return sessionHandler.RunQuery(query);
        }

        protected void LoadBookData(SelectedPage page) {
            if (page == SelectedPage.EditBook) {

            } else if (page == SelectedPage.AddNewBook) { 
            
            }
        }

        protected void GetBookData() {
            //if (booKIdTxt == null || booKIdTxt.Equals("")) {
                //Response.Write("<script>alert('No Book with ID Found')</script>");
                //return;
            //}
            String query ="";
            //query = $"SELECT * FROM Book WHERE bookId = {booKIdTxt.Text}";
            DataTable returnedData = sessionHandler.RunQuery(query);
            currentData = returnedData.Copy();
            LoadDataIntoGridView(currentData, GridView_BookList);

            if (returnedData == null) {
                Response.Write("<script>alert('No Book with ID Found')</script>");
            } else {
                //bookNameTxt.Text = returnedData.Rows[0][1].ToString();
                //authorNameTxt.Text = returnedData.Rows[0][2].ToString();
                //bookDescTxt.Text = returnedData.Rows[0][4].ToString();
                //pubNameTxt.Text = returnedData.Rows[0][5].ToString();
                //pubDateTxt.Text = returnedData.Rows[0][6].ToString();
                //ratingDrop.SelectedIndex = int.Parse(returnedData.Rows[0][7].ToString()) - 1;
                //langTxt.Text = returnedData.Rows[0][8].ToString();
                //isbnTxt.Text = returnedData.Rows[0][9].ToString();
                if (returnedData.Rows[0][10].ToString().Equals("1")) {
                    //availableChk.Checked = true;
                }

            }
        }

        protected void AddNewBookData(object sender, EventArgs e) {
        }

        protected void EditBookData(object sender, EventArgs e) {
            LoadDataIntoGridView(this.currentData, GridView_BookList);

//            bookNameTxt.ReadOnly = false;
//            authorNameTxt.ReadOnly = false;
//            bookDescTxt.ReadOnly = false;
//            pubNameTxt.ReadOnly = false;
//            pubDateTxt.ReadOnly = false;
//            ratingDrop.Enabled = true;
//            langTxt.ReadOnly = false;
//            isbnTxt.ReadOnly = false;
//            availableChk.Enabled = true;
//            EditButton.Visible = false;
//            SaveButton.Visible = true;
//            CancelButton.Visible = true;
        }

        protected void DeleteBookData() {
        }

        protected void GetUserData() {
        }

        protected void AddNewUserData() {
        }

        protected void EditUserData() {
        }

        protected void DeleteUserData() {
        }

        protected void GetUserBorrowedRecord(int userId) {
            String query = "SELECT * FROM Borrowed WHERE memberId=" + userId + ";";
            DataTable returnedData = sessionHandler.RunQuery(query);

            //load data into the list
            LoadDataIntoGridView(returnedData, GridView_UserList);
        }

        protected float CalculateLateFee(String expectedReturnedDate, String returnedDate) {
            float fee = 0;
            float feeRate = 0.1f;

            //fee = (returnedDate - expectedReturnedDate) * feeRate;

            return fee;
        }


        protected void AddNewNotification(String title, String content) {
            //get the highest Id of the notification
            DataTable returnedData = sessionHandler.RunQuery("SELECT MAX(notifId) FROM Notification");
            int notifId = int.Parse(returnedData.Rows[0][0].ToString());

            String query = "INSERT INTO Notification (notifId, memberId, title, msg) VALUES (" +
                (notifId + 1).ToString() +
                ", " +
                sessionHandler.GetUserId().ToString() +
                ", '" + title +
                "', '" + content +
                "');";
            sessionHandler.RunQuery(query);

            LoadNotificationList();
        }

        //use to load all the notification that has been made
        protected void LoadNotificationList() {
            DataTable returnedData = sessionHandler.RunQuery("SELECT * FROM Notification;");

            //set it into datatable
            LoadDataIntoGridView(returnedData, GridView_UserList);
        }

        protected void LoadDataIntoGridView(DataTable dataTable, GridView gridView) {
            gridView.DataSource = dataTable;
            gridView.DataBind();
        }

        protected void CancelButton_Click(object sender, EventArgs e) {
            //EditButton.Visible = true;
            //SaveButton.Visible = false;
            //CancelButton.Visible = false;

            //i cant get this to work somehow, the class data keeps getting deleted
            /*            bookNameTxt.Text = currentData.Rows[0][1].ToString();
                        authorNameTxt.Text = currentData.Rows[0][2].ToString();
                        bookDescTxt.Text = currentData.Rows[0][4].ToString();
                        pubNameTxt.Text = currentData.Rows[0][5].ToString();
                        pubDateTxt.Text = currentData.Rows[0][6].ToString();
                        langTxt.Text = currentData.Rows[0][8].ToString();
                        isbnTxt.Text = currentData.Rows[0][9].ToString();*/

        }

        protected void SaveButton_Click(object sender, EventArgs e) {
            //String query = $"UPDATE Book SET bookName = '{bookNameTxt.Text}', authorName = '{authorNameTxt.Text}', bookDescription = '{bookDescTxt.Text}', publisherName = '{pubNameTxt.Text}', pubDate = '{(pubDateTxt.Text)}', rating = '{ratingDrop.DataTextField}', lang = '{langTxt.Text}', isbn = '{isbnTxt.Text}', available = '{(availableChk.Checked ? 1 : 0)}' WHERE bookId = '{int.Parse(booKIdTxt.Text)}'";

            //sessionHandler.RunQuery(query);

        }
    }
}