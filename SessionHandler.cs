using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace LibraryManagementSystem
{
    public class SessionHandler : System.Web.HttpApplication
    {
        private SqlConnection connection;
        public bool userLoginState;

        public SessionHandler() {
            connection = new SqlConnection("Server=localhost\\SQLEXPRESS ; Database=LibraryDb ; Integrated Security = TRUE");
            userLoginState = false;
        }

        public void CheckLoginState()
        {
            if (Session["loginState"] != null)
            {
                Session["loginState"] = "false";
            }
            else
            {
                if (Session["loginState"].ToString() == "true")
                {
                    userLoginState = true;
                }
                else
                {
                    userLoginState = false;
                };
            }
        }



    }
}