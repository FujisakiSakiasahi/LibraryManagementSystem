using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace LibraryManagementSystem
{
    public class SessionHandler
    {
        private SqlConnection connection;
        public bool userLoginState;
        public int loginUserId;

        public SessionHandler()
        {
            connection = new SqlConnection("Server=localhost\\SQLEXPRESS ; Database=LibraryDb ; Integrated Security = TRUE");
            userLoginState = false;
        }

        public void CheckLoginState()
        {
            //load login state
            if (HttpContext.Current.Session["loginState"].ToString() == "true")
            {
                userLoginState = true;
            }
            else
            {
                userLoginState = false;
            }

            //load member id
            if (HttpContext.Current.Session["memberId"] != null)
            {
                loginUserId = int.Parse(HttpContext.Current.Session["memberId"].ToString());
            }
            else
            {
                loginUserId = -1;
            }
        }

        public DataTable runQuery(String query)
        {
            DataTable returningData = new DataTable();

            connection.Open();

            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand(query, connection));
            da.Fill(returningData);

            connection.Close();

            return returningData;
        }

        public int GetUserId() { 
            return loginUserId;
        }

        public bool GetLoginState()
        {
            return userLoginState;
        }

        public void setCookie(String cookieName, String cookieValue)
        {
            HttpContext.Current.Response.Cookies.Add(new HttpCookie(cookieName, cookieValue));
        }
    }
}