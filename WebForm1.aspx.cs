using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection("Server=localhost\SQLEXPRESS ; Database=SchoolDb ; Integrated Security = TRUE");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //for the use of getting data from database by running SQL query
        protected DataTable runQuery(String query) 
        {
            DataTable returningData = new DataTable();

            connection.Open();

            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand(query, connection));
            da.Fill(returningData);

            connection.Close();

            return returningData;
        }
    }
}