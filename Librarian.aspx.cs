using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
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
                            4: list all
                            5: view info
                            6: edit info
                            7: add new info
                        8    : check in (return book)
                        9    : check out (borrow book)
                        10    : notification (maybe can add one more, to use for editing notification)
             */
            ManageBook,
            ViewBook,
            EditBook,
            AddNewBook,
            ManageUser,
            ViewUser,
            EditUser,
            AddNewUser,
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

        protected void Button_Click_ViewBook(object sender, GridViewCommandEventArgs e) {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewBook;

            GridViewRow gridViewRow = GridView_BookList.Rows[Convert.ToInt32(e.CommandArgument)];

            DataTable returned = sessionHandler.RunQuery($"SELECT * FROM Book WHERE bookId = {(gridViewRow.FindControl("BOOK_ID") as Label).Text}");

            LoadBookData(SelectedPage.ViewBook, returned);

            DataTable borrowed = sessionHandler.RunQuery($"SELECT Member.memberId, Member.memberName FROM Borrowed INNER JOIN Member USING (memberId) WHERE bookId = {Label_BookID.Text};");

            if (borrowed.Rows.Count == 0)
            {
                Label_BorrowedBy2.Text = "N/A";
            }
            else
            {
                Label_BorrowedBy2.Text = borrowed.Rows[0][1].ToString() + $" ({borrowed.Rows[0][0].ToString()})";
            }

        }

        protected void Button_Click_BackToManageBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ManageBook;
        }

        protected void Button_Click_DeleteBook(object sender, EventArgs e) {
            sessionHandler.RunQuery($"DELETE FROM Book WHERE bookId = {Label_BookID.Text};");
            MultiView1.ActiveViewIndex = (int)SelectedPage.ManageBook;

            String[] tableColumn = { "bookId", "bookName" };
            LoadDataIntoGridView(GetAllData(SelectedPage.ManageBook).AsDataView().ToTable(true, tableColumn), GridView_BookList);

        }

        protected void Button_Click_EditBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = (int)SelectedPage.EditBook;

            Label_BookID2.Text = Label_BookID.Text;
            TextBox_Title2.Text = Label_Title.Text;
            TextBox_Description2.Text = Label_Description.Text;
            TextBox_Author2.Text = Label_Author.Text;
            TextBox_Publisher2.Text = Label_Publisher.Text;
            Calendar_PublishDate2.SelectedDate = Convert.ToDateTime(Label_PublishDate.Text);
            DropDownList_Rating2.SelectedValue = Label_Rating.Text;
            TextBox_Language2.Text = Label_Language.Text;
            TextBox_ISBN2.Text = Label_ISBN.Text;
            CheckBox_Availability2.Checked = Convert.ToBoolean(Label_Availability.Text);
            TextBox_ShelfID2.Text = Label_ShelfID.Text;

        }

        protected void Button_Click_AddNewBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = (int)SelectedPage.AddNewBook;
        }

        protected void Button_Click_DiscardChangesBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewBook;
        }

        protected void Button_Click_SaveChangesBook(object sender, EventArgs e) {
            String date = Calendar_PublishDate2.SelectedDate.ToString("yyyy-MM-dd");

            String query = $"UPDATE Book SET bookName = '{TextBox_Title2.Text}', bookDescription = '{TextBox_Description2.Text}', authorName = '{TextBox_Author2.Text}', publisherName = '{TextBox_Publisher2.Text}', pubDate = '{date}', rating = {DropDownList_Rating2.SelectedValue}, lang = '{TextBox_Language2.Text}', isbn = {TextBox_ISBN2.Text}, available = b'{(CheckBox_Availability2.Checked ? 1 : 0)}', shelfid = '{TextBox_ShelfID2.Text}' WHERE Book.bookId = {Label_BookID2.Text};";

            sessionHandler.RunQuery(query);

            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewBook;

            DataTable returned = sessionHandler.RunQuery($"SELECT * FROM Book WHERE bookId = {Label_BookID2.Text}");

            LoadBookData(SelectedPage.ViewBook, returned);

        }

        protected void Button_Click_AbortAddingNewBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ManageBook;
        }

        protected void Button_Click_AddingNewBook(object sender, EventArgs e) {
            MultiView1.ActiveViewIndex = (int)SelectedPage.AddNewBook;
            String date = Calendar_PublishDate3.SelectedDate.ToString("yyyy-MM-dd");

            int highest = int.Parse(sessionHandler.RunQuery("SELECT MAX(bookId) FROM Book").Rows[0][0].ToString());
            Label_BookID3.Text = highest.ToString();

            String query = $"INSERT INTO `Book` (`bookId`, `bookName`, `authorName`, `bookImage`, `bookDescription`, `publisherName`, `pubDate`, `rating`, `lang`, `isbn`, `available`, `shelfid`) VALUES ('{highest += 1}', '{TextBox_Title3.Text}', '{TextBox_Author3.Text}', 'placeholder.png', '{TextBox_Description3.Text}', '{TextBox_Publisher3.Text}', '{date}', '{DropDownList_Rating3.SelectedValue}', '{TextBox_Language3.Text}', '{TextBox_ISBN3.Text}', b'{(CheckBox_Availability3.Checked ? 1 : 0)}', '{TextBox_ShelfID3.Text}');";


            sessionHandler.RunQuery(query);

            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewBook;

            LoadBookData(SelectedPage.ViewBook, sessionHandler.RunQuery($"SELECT * FROM Book WHERE bookId = {highest}"));

        }

        //button functions for Manage User
        protected void Button_Click_ManageUser(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ManageUser;

            String[] tableColumn = { "memberId", "memberName" };

            LoadDataIntoGridView(GetAllData(SelectedPage.ManageUser).AsDataView().ToTable(true, tableColumn), GridView_UserList);


        }

        protected void Button_Click_SearchUser(object sender, EventArgs e) {
            String[] tableColumn = { "memberId", "memberName" };
            LoadDataIntoGridView(Search(SelectedPage.ManageUser, Textbox_SearchUser.Text).AsDataView().ToTable(true, tableColumn), GridView_UserList);
        }

        protected void Button_Click_AddUser(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.AddNewUser;
        }

        protected void Button_Click_AddingNewUser(object sender, EventArgs e)
        {

            int highest = int.Parse(sessionHandler.RunQuery("SELECT MAX(memberID) FROM Member").Rows[0][0].ToString());
            Label_MemberID3.Text = highest.ToString();

            String query = $"INSERT INTO `Member` (`memberId`, `memberName`, `memberNo`, `memberEmail`, `memberPasswd`, `newsletter`, `librarian`) VALUES ('{highest += 1}', '{TextBox_MemberName3.Text}', '{TextBox_PhoneNumber3.Text}', '{TextBox_Email3.Text}', 'PlaceHolder_Password', b'{(CheckBox_Notification2.Checked ? 1 : 0)}', b'{(CheckBox_Librarian2.Checked ? 1 : 0)}');";

            sessionHandler.RunQuery(query);

            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewUser;

            LoadUserData(SelectedPage.ViewUser, sessionHandler.RunQuery($"SELECT * FROM Member WHERE memberId = {highest}"));
        }

        protected void Button_Click_AbortNewUser(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ManageUser;
        }

        protected void Button_Click_ViewUser(object sender, GridViewCommandEventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewUser;

            GridViewRow gridViewRow = GridView_UserList.Rows[Convert.ToInt32(e.CommandArgument)];

            DataTable returned = sessionHandler.RunQuery($"SELECT * FROM Member WHERE memberId = {(gridViewRow.FindControl("USER_ID") as Label).Text}");

            LoadUserData(SelectedPage.ViewUser, returned);
        }

        protected void Button_Click_EditUser(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.EditUser;

            Label_MemberID2.Text = Label_MemberID.Text;
            TextBox_MemberName.Text = Label_MemberName2.Text;
            TextBox_PhoneNumber.Text = Label_PhoneNumber2.Text;
            TextBox_Email.Text = Label_Email2.Text;
            Label_Notification4.Text = Label_Notification2.Text;
            if (Label_Librarian2.Text.Equals("True"))
            {
                CheckBox_Librarian.Checked = true;
            }
            else
            {
                CheckBox_Librarian.Checked = false;
            }
        }

        protected void Button_Click_SaveChangesUser(object sender, EventArgs e)
        {
            String query = $"UPDATE `Member` SET `memberName` = '{TextBox_MemberName.Text}', memberNo = '{TextBox_PhoneNumber.Text}', memberEmail = '{TextBox_Email.Text}', `librarian` = b'{(CheckBox_Librarian2.Checked ? 1 : 0)}' WHERE `Member`.`memberId` = {Label_MemberID2.Text};";

            sessionHandler.RunQuery(query);

            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewUser;

            DataTable returned = sessionHandler.RunQuery($"SELECT * FROM Member WHERE memberId = {Label_MemberID.Text}");

            LoadUserData(SelectedPage.ViewUser, returned);
        }

        protected void Button_Click_DiscardChangesUser(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.ViewUser;
        }

        protected void Button_Click_DeleteUser(object sender, EventArgs e)
        {
            sessionHandler.RunQuery($"DELETE FROM Member WHERE memberId = {Label_MemberID.Text};");
            MultiView1.ActiveViewIndex = (int)SelectedPage.ManageUser;

            String[] tableColumn = { "memberId", "memberName" };
            LoadDataIntoGridView(GetAllData(SelectedPage.ManageUser).AsDataView().ToTable(true, tableColumn), GridView_UserList);

        }

        //button functions for Check In

        protected void Button_CLick_SearchForBorrowedBooks(object sender, EventArgs e)
        {
            DataTable BorrowedBooks = Search(SelectedPage.CheckIn, Textbox_SearchBorrowedBookBasedOnUser.Text);

            Label_StoreUser.Text = BorrowedBooks.Rows[0][2].ToString();

            CheckBoxList_CheckIn.Items.Clear();

            foreach (DataRow book in BorrowedBooks.Rows)
            {
                CheckBoxList_CheckIn.Items.Add(book["bookName"].ToString());
            }

            Button_CheckInBooks.Visible = true;

        }
        protected void Button_Click_CheckIn(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 8;

        }

        protected void Button_Click_CheckInBooks(object sender, EventArgs e)
        {
            String bookQuery = "";

            foreach (ListItem book in CheckBoxList_CheckIn.Items)
            {
                if (book.Selected)
                {
                    bookQuery += "'" + book.Value + "'" + ", ";
                }
            }

            //add error handling here when none are selected
            char[] toTrim = {',', ' '};
            bookQuery = bookQuery.TrimEnd(toTrim);

            String nowDate = DateTime.Now.ToString("yyyy-MM-dd");

            String query = $"UPDATE Borrowed SET returnDate = '{nowDate}' WHERE memberId = {Label_StoreUser.Text} AND bookId IN (SELECT bookId FROM Book WHERE bookName IN ({bookQuery}))";
            Debug.WriteLine(query);

            sessionHandler.RunQuery(query);

            DataTable BorrowedBooks = Search(SelectedPage.CheckIn, Textbox_SearchBorrowedBookBasedOnUser.Text);

            CheckBoxList_CheckIn.Items.Clear();

            foreach (DataRow book in BorrowedBooks.Rows)
            {
                CheckBoxList_CheckIn.Items.Add(book["bookName"].ToString());
            }

        }

        //button functions for Check Out

        protected void Button_Click_CheckOut(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = (int)SelectedPage.CheckOut;

            DataTable memberNames = sessionHandler.RunQuery("SELECT * FROM Member WHERE memberId >= 1;");
            ListBox_SearchedUserCheckOut.DataSource = memberNames;
            ListBox_SearchedUserCheckOut.DataTextField = "memberName";
            ListBox_SearchedUserCheckOut.DataValueField = "memberId";
            ListBox_SearchedUserCheckOut.DataBind();

            DataTable bookNames = sessionHandler.RunQuery("SELECT * FROM Book WHERE available = TRUE;");
            ListBox_SearchedBookCheckOut.DataSource = bookNames;
            ListBox_SearchedBookCheckOut.DataTextField = "bookName";
            ListBox_SearchedBookCheckOut.DataValueField = "bookId";
            ListBox_SearchedBookCheckOut.DataBind();
        }

        protected void Button_Click_SearchUserCheckOut(object sender, EventArgs e)
        {
            if (TextBox_SearchUserCheckOut.Text.Equals(""))
            {
                DataTable memberNames = sessionHandler.RunQuery("SELECT * FROM Member WHERE memberId >= 1;");
                ListBox_SearchedUserCheckOut.DataSource = memberNames;
                ListBox_SearchedUserCheckOut.DataTextField = "memberName";
                ListBox_SearchedUserCheckOut.DataValueField = "memberId";
                ListBox_SearchedUserCheckOut.DataBind();
            }
            else
            {
                String searchString = TextBox_SearchUserCheckOut.Text;
                String query = "SELECT * FROM Member WHERE memberId >= 1 AND ";

                if (int.TryParse(searchString, out int memberId))
                {
                    query += "memberId = " + memberId + ";";
                }
                else
                {
                    query += "memberName LIKE '%" + searchString + "%';";
                }

                DataTable memberNames = sessionHandler.RunQuery(query);
                ListBox_SearchedUserCheckOut.DataSource = memberNames;
                ListBox_SearchedUserCheckOut.DataTextField = "memberName";
                ListBox_SearchedUserCheckOut.DataValueField = "memberId";
                ListBox_SearchedUserCheckOut.DataBind();
            }
        }
        protected void Button_Click_SearchBookCheckOut(object sender, EventArgs e)
        {
            if (TextBox_SearchBookCheckOut.Text.Equals(""))
            {
                DataTable bookNames = sessionHandler.RunQuery("SELECT * FROM Book WHERE available = TRUE;");
                ListBox_SearchedBookCheckOut.DataSource = bookNames;
                ListBox_SearchedBookCheckOut.DataTextField = "bookName";
                ListBox_SearchedBookCheckOut.DataValueField = "bookId";
                ListBox_SearchedBookCheckOut.DataBind();
            }
            else
            {
                String searchString = TextBox_SearchBookCheckOut.Text;
                String query = "SELECT * FROM Book WHERE available = TRUE AND ";

                if (int.TryParse(searchString, out int bookId))
                {
                    query += "bookId = " + bookId + ";";
                }
                else
                {
                    query += "bookName LIKE '%" + searchString + "%';";
                }

                DataTable bookNames = sessionHandler.RunQuery(query);
                ListBox_SearchedBookCheckOut.DataSource = bookNames;
                ListBox_SearchedBookCheckOut.DataTextField = "bookName";
                ListBox_SearchedBookCheckOut.DataValueField = "bookId";
                ListBox_SearchedBookCheckOut.DataBind();
            }
        }

        protected void Button_Click_ConfirmCheckOut(object sender, EventArgs e)
        {
            if (ListBox_SearchedBookCheckOut.SelectedItem == null || ListBox_SearchedUserCheckOut.SelectedItem == null)
            {
                Response.Write("<script>alert('Must have a user and a book selected.')</script>"); //needs improvement on the alerts
            }
            else
            {
                String memberId = ListBox_SearchedUserCheckOut.SelectedItem.Value;
                String bookId = ListBox_SearchedBookCheckOut.SelectedItem.Value;
                int highest = int.Parse(sessionHandler.RunQuery("SELECT MAX(borrowId) FROM Borrowed").Rows[0][0].ToString());



                String query = $"INSERT INTO Borrowed (borrowId, bookId, memberId, dateBorrowed, expectDate, returnDate) VALUES ({highest+1}, {bookId}, {memberId}, '{DateTime.Now.ToString("yyyy-MM-dd")}', '{DateTime.Now.AddDays(7).ToString("yyyy-MM-dd")}', NULL);";
                sessionHandler.RunQuery(query);

                sessionHandler.RunQuery($"UPDATE Book SET available = FALSE WHERE bookId = {bookId}");

                Button_Click_CheckOut(sender, e);
                //needs to add confirmation somehow

            }
        }

        //code for notifications page
        protected void Button_Click_Notification(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 10;

        }

        protected void Button_Click_CreateNotif(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 0;
            Button_CreateNotification.Enabled = false;
            Button_ManageNotification.Enabled = true;
        }

        protected void Button_Click_ManageNotif(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 1;

            DataTable notifications = sessionHandler.RunQuery("SELECT * FROM Notification;");

            GridView_Notifications.DataSource = notifications;
            GridView_Notifications.DataBind();

            Button_CreateNotification.Enabled = true;
            Button_ManageNotification.Enabled = false;
        }

        protected void Button_SendNotification_Click(object sender, EventArgs e)
        {
            String title = TextBox_NotifMsgTitle.Text; //add error handling for length
            String content = TextBox_NotifMsgContent.Text; //see above

            int user = 0;

            if (RadioButtonList_NotifUserSelect.SelectedValue != "0")
            {
                if (TextBox_NotifSelectMember.Text.Equals(""))
                {
                    Response.Write("<script>alert('Must enter Member ID.')</script>"); //needs improvement on the alerts
                }
                else
                {
                    user = int.Parse(TextBox_NotifSelectMember.Text);

                    if (sessionHandler.RunQuery($"SELECT memberName FROM Member WHERE memberId = {user};").Rows.Count == 0)
                    {
                        Response.Write("<script>alert('Member does not exist.')</script>"); //needs improvement on the alerts

                    }

                }
            }

            int highest = int.Parse(sessionHandler.RunQuery("SELECT MAX(notifId) FROM Notification;").Rows[0][0].ToString());

            String query = $"INSERT INTO Notification (notifId, notifTitle, memberId, msg) VALUES ({highest + 1}, '{title}', {user}, '{content}');";

            sessionHandler.RunQuery(query);

            TextBox_NotifMsgTitle.Text = "";
            TextBox_NotifMsgContent.Text = "";
            RadioButtonList_NotifUserSelect.SelectedIndex = 0;

        }

        protected void RadioButtonList_NotifUserSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            Debug.WriteLine("Test");
            if (RadioButtonList_NotifUserSelect.SelectedIndex == 1)
            {
                Label_NotifSelectMember.Visible = true;
                TextBox_NotifSelectMember.Visible = true;
            }
            else
            {
                Label_NotifSelectMember.Visible = false;
                TextBox_NotifSelectMember.Visible = false;
            }
        }

        protected void Button_Click_RemoveNotif(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gridViewRow = GridView_Notifications.Rows[Convert.ToInt32(e.CommandArgument)];

            sessionHandler.RunQuery($"DELETE FROM Notification WHERE notifId = {(gridViewRow.FindControl("NOTIF_ID") as Label).Text}");

            Button_Click_ManageNotif(sender, e);

        }

        //code for requested page
        protected void Button_Click_RequestedBooks(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 11;

            DataTable requestedBookList = sessionHandler.RunQuery("SELECT * FROM Requests;");

            CheckBoxList_RequestedBooks.DataSource = requestedBookList;
            CheckBoxList_RequestedBooks.DataTextField = "bookName";
            CheckBoxList_RequestedBooks.DataValueField = "requestId";
            CheckBoxList_RequestedBooks.DataBind();

        }

        protected void Button_Click_AddedRequestedBooks(object sender, EventArgs e)
        {
            String requests = "";

            foreach (ListItem request in CheckBoxList_RequestedBooks.Items)
            {
                if (request.Selected)
                {
                    requests += request.Value += ", ";
                }
            }

            if (requests == "")
            {
                Response.Write("<script>alert('Must select at least 1 book.')</script>"); //needs improvement on the alerts
                return;
            }

            char[] toTrim = { ',', ' ' };
            requests = requests.TrimEnd(toTrim);

            sessionHandler.RunQuery($"DELETE FROM Requests WHERE requestId IN ({requests})"); //needs confirmation

            Button_Click_RequestedBooks(sender, e);

        }



        //code for overdue page
        protected void Button_Click_ManageOverdue(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 12;

            DataTable overdues = sessionHandler.RunQuery("SELECT Borrowed.borrowId, Book.bookName, Member.memberName, Borrowed.dateBorrowed, Borrowed.expectDate, Borrowed.returnDate, DATEDIFF(CURRENT_DATE,\r\nBorrowed.expectDate) AS daysLate, FORMAT(DATEDIFF(CURRENT_DATE, Borrowed.expectDate)*0.1, 2) AS moneyOwed FROM Borrowed INNER JOIN Book\r\nUSING (bookId) INNER JOIN Member USING (memberId) WHERE expectDate < CURRENT_DATE AND returnDate IS NULL;");

            GridView_Overdue.DataSource = overdues; 
            GridView_Overdue.DataBind();

        }

        protected void Button_Click_ClaimOverdue(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow gridViewRow = GridView_Overdue.Rows[Convert.ToInt32(e.CommandArgument)];

            //this needs to add confirmation
            sessionHandler.RunQuery($"UPDATE Borrowed SET returnDate = '{DateTime.Now.ToString("yyyy-MM-dd")}' WHERE borrowId = {(gridViewRow.FindControl("BORROW_ID") as Label).Text} ");

            Button_Click_ManageOverdue(sender, e);

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
                        query += "bookName LIKE '%" + searchString + "%';";
                    }   
                    break;
                case SelectedPage.ManageUser:
                    query += "Member WHERE ";

                    if (int.TryParse(searchString, out int memberId))
                    {
                        query += "memberId = " + memberId;
                    }
                    else
                    {
                        query += "memberName LIKE '%" + searchString + "%'";
                    }

                    query += " WHERE memberId>=1;";

                    break;
                case SelectedPage.CheckIn:
                    query += "Borrowed INNER JOIN Book ON Book.bookId = Borrowed.bookId WHERE ";

                    if (int.TryParse(searchString, out int memberId2))
                    {
                        query += "memberId = " + memberId2;
                    }
                    else
                    {
                        query += "memberName LIKE '%" + searchString + "%'";
                    }

                    query += " AND returnDate IS NULL;";

                    break;
                case SelectedPage.CheckOut:
                    //SELECT CASE WHEN NOT EXISTS (SELECT bookId FROM (SELECT bookId FROM Borrowed UNION SELECT bookId FROM Reserved) as Combined) THEN 1 ELSE 0 END;
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
                    query += "Member WHERE memberId >= 1;";
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

        protected void LoadBookData(SelectedPage page, DataTable returnedData) {
            if (page == SelectedPage.ViewBook) {
                Label_BookID.Text = returnedData.Rows[0][0].ToString();
                Label_Title.Text = returnedData.Rows[0][1].ToString();
                Label_Author.Text = returnedData.Rows[0][2].ToString();
                Label_Description.Text = returnedData.Rows[0][4].ToString();
                Label_Publisher.Text = returnedData.Rows[0][5].ToString();
                Label_PublishDate.Text = returnedData.Rows[0][6].ToString();
                Label_Rating.Text = returnedData.Rows[0][7].ToString();
                Label_Language.Text = returnedData.Rows[0][8].ToString();
                Label_ISBN.Text = returnedData.Rows[0][9].ToString();
                Label_ShelfID.Text = returnedData.Rows[0][10].ToString();
                if (returnedData.Rows[0][10].ToString().Equals("1"))
                {
                    Label_Availability.Text = "True";
                }
                else if (returnedData.Rows[0][10].ToString().Equals("0"))
                {
                    Label_Availability.Text = "False";
                }
                else
                {
                    Label_Availability.Text = "N/A";

                }
            } else if (page == SelectedPage.EditBook) { 
            
            }
        }

        protected void LoadUserData(SelectedPage page, DataTable returnedData) {
            if (page == SelectedPage.ViewUser)
            {
                Label_MemberID.Text = returnedData.Rows[0][0].ToString();
                Label_MemberName2.Text = returnedData.Rows[0][1].ToString();
                Label_PhoneNumber2.Text = returnedData.Rows[0][2].ToString();
                Label_Email2.Text = returnedData.Rows[0][3].ToString();
                if (returnedData.Rows[0][5].ToString().Equals("0"))
                {
                    Label_Notification2.Text = "False";
                }
                else
                {
                    Label_Notification2.Text = "True";
                }
                if (returnedData.Rows[0][6].ToString().Equals("0"))
                {
                    Label_Librarian2.Text = "False";
                }
                else
                {
                    Label_Librarian2.Text = "True";
                }

                }
            }

        protected void GetUserBorrowedRecord(int userId) {
            String query = "SELECT * FROM Borrowed WHERE memberId=" + userId + ";";
            DataTable returnedData = sessionHandler.RunQuery(query);

            //load data into the list
            LoadDataIntoGridView(returnedData, GridView_UserList);
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

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView2.ActiveViewIndex = 12;

        }


    }
}