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
        private bool userLoginState;
        private int loginUserId;
        private bool isLibrarian; 

        public SessionHandler()
        {
            //connection = new SqlConnection("Server=localhost\\SQLEXPRESS ; Database=LibraryDb ; Integrated Security = TRUE");

            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["myCon"];

            if (settings != null)
                connection = new MySqlConnection(settings.ConnectionString);

            userLoginState = false;
            isLibrarian = false;
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

            //load isLibrarian
            if (HttpContext.Current.Session["memberId"] != null) {
                if (HttpContext.Current.Session["isLibrarian"].ToString() == "1" || HttpContext.Current.Session["isLibrarian"].ToString() == "true") {
                    isLibrarian = true;
                } else { 
                    isLibrarian= false;
                }
                
            } else {
                isLibrarian = false;
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

        public bool GetIsLibrarian() {
            return isLibrarian;
        }
    }
}