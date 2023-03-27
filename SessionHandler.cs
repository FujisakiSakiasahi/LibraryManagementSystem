using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services.Description;
using MySql.Data.MySqlClient;

namespace LibraryManagementSystem
{
    public class SessionHandler
    {
        private MySqlConnection connection;
        public bool userLoginState;
        public int loginUserId;

        public SessionHandler()
        {
            //connection = new SqlConnection("Server=localhost\\SQLEXPRESS ; Database=LibraryDb ; Integrated Security = TRUE");

            connection = new MySqlConnection("Server=na01-sql.pebblehost.com,3306; Database=customer_453349_hitoha ; User ID=customer_453349_hitoha ; Password=M0heuKdYvU1huSY!mgje");

            userLoginState = false;


        }

        public void CheckLoginState()
        {
            if (HttpContext.Current.Session["loginState"].ToString() == "true")
            {
                userLoginState = true;
            }
            else
            {
                userLoginState = false;
            }

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


            //SqlDataAdapter da = new SqlDataAdapter(new SqlCommand(query, connection));
            MySqlDataAdapter da = new MySqlDataAdapter(new MySqlCommand(query, connection));
            da.Fill(returningData);

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