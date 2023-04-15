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
    public class SessionHandler {
        private MySqlConnection connection;
        private bool loginState;
        private int loginUserId;
        private bool isLibrarian; 

        public SessionHandler() {
            ConnectionStringSettings settings = ConfigurationManager.ConnectionStrings["myCon"];

            if (settings != null) connection = new MySqlConnection(settings.ConnectionString);

            loginState = false;
            isLibrarian = false;
        }//end of SessionHandler constructor

        public void CheckLoginState() {
            //load login state
            if (HttpContext.Current.Session["loginState"].ToString() == "true") {
                loginState = true;
            } else {
                loginState = false;
            }

            //load member id
            if (HttpContext.Current.Session["memberId"] != null) {
                loginUserId = int.Parse(HttpContext.Current.Session["memberId"].ToString());
            } else {
                loginUserId = -1;
            }

            //load isLibrarian
            if (HttpContext.Current.Session["memberId"] != null) {
                if (HttpContext.Current.Session["isLibrarian"].ToString() == "1" 
                    || HttpContext.Current.Session["isLibrarian"].ToString() == "true") {
                    isLibrarian = true;
                } else { 
                    isLibrarian= false;
                }
                
            } else {
                isLibrarian = false;
            }
        }//end of CheckLoginState

        public DataTable RunQuery(String query) {
            DataTable returningData = new DataTable();

            MySqlDataAdapter da = new MySqlDataAdapter(new MySqlCommand(query, connection));
            da.Fill(returningData);

            return returningData;
        }//end of RunQuery

        public int GetUserId() { 
            return loginUserId;
        }

        public bool GetLoginState()
        {
            return loginState;
        }

        public bool GetIsLibrarian() {
            return isLibrarian;
        }
    }
}