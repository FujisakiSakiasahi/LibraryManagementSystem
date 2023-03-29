using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Services.Description;
using System.Xml.Linq;
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

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["myCon"];

            if (settings != null)
                connection = new MySqlConnection(settings.ConnectionString);

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

        public DataTable RunQuery(String query)
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

        public void SetCookie(String cookieName, String cookieValue)
        {
            HttpContext.Current.Response.Cookies.Add(new HttpCookie(cookieName, cookieValue));
        }
    }
}