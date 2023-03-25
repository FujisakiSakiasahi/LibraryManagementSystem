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

            loadNotificationList();
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

            loadNotificationList();
        }

        //use to load all the notification that has been made
        protected void loadNotificationList()
        {
            DataTable returnedData = sessionHandler.runQuery("SELECT * FROM Notification;");

            //set it into datatable
            GridView1.DataSource = returnedData;
            GridView1.DataBind();
        }
    }
}