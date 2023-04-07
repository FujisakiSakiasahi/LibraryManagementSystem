using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Search : System.Web.UI.Page
    {
        SessionHandler sessionHandler = new SessionHandler();
        string search_query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }

            try { 
                search_query = Request.QueryString["search_query"];

                //get data from database
                DataTable returnedData = sessionHandler.RunQuery("");

                LoadBookDataIntoList(returnedData);
            } catch {
                //get data from database
                DataTable returnedData = sessionHandler.RunQuery("");

                LoadBookDataIntoList(returnedData);
            }
            
        }

        protected void LoadBookDataIntoList(DataTable dataTable) { 
            //load data into list using foreach
            
        }
    }
}