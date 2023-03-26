using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginState"] != null)
            {
                sessionHandler.CheckLoginState();
            }
            else { Session["loginState"] = "false"; };

            LoadNotificationList();
        }
        
        protected void GetUserBorrowedRecord(int userId) {
            String query = "SELECT * FROM Borrowed WHERE memberId=" + userId + ";";
            DataTable returnedData = sessionHandler.runQuery(query);

            //load data into the list
            LoadDataIntoGridView(returnedData, GridView1);
        }

        protected float CalculateLateFee(String expectedReturnedDate, String returnedDate) {
            float fee = 0;
            float feeRate = 0.1f;
            
            //fee = (returnedDate - expectedReturnedDate) * feeRate;


            return fee;
        }


        protected void AddNewNotification(String title, String content) {
            //get the highest Id of the notification
            DataTable returnedData = sessionHandler.runQuery("SELECT MAX(notifId) FROM Notification");
            int notifId = int.Parse(returnedData.Rows[0][0].ToString());

            String query = "INSERT INTO Notification (notifId, memberId, title, msg) VALUES (" +
                (notifId+1).ToString() +
                ", " +
                sessionHandler.GetUserId().ToString() +
                ", '" + title + 
                "', '" + content +
                "');";
            sessionHandler.runQuery(query);

            LoadNotificationList();
        }

        //use to load all the notification that has been made
        protected void LoadNotificationList()
        {
            DataTable returnedData = sessionHandler.runQuery("SELECT * FROM Notification;");

            //set it into datatable
            LoadDataIntoGridView(returnedData, GridView1);
        }

        protected void LoadDataIntoGridView(DataTable dataTable, GridView gridView) {
            gridView.DataSource = dataTable;
            gridView.DataBind();
        }
    }
}