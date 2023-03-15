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
    public partial class WebForm2 : System.Web.UI.Page
    {
        private SqlConnection connection = new SqlConnection("Server=localhost\\SQLEXPRESS ; Database=LibraryDb ; Integrated Security = TRUE");

        protected DataTable runQuery(String query)
        {
            DataTable returningData = new DataTable();

            connection.Open();

            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand(query, connection));
            da.Fill(returningData);

            connection.Close();

            return returningData;
        }

        public bool userLoginState = false;
        protected void checkLoginState()
        {
            if (Session["loginState"].ToString() == "true")
            {
                userLoginState = true;
            }
            else
            {
                userLoginState = false;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginState"] != null)
            {
                checkLoginState();
            }
            else { Session["loginState"] = "false"; }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String email = TextBox1.Text.ToString();
            String password = TextBox2.Text.ToString();

            if (email == null || email == "" || password == null || password == "")
            {
                Response.Write("<script>alert('Empty field')</script>");
            }
            else {
                Login(email, password);
            }
        }

        protected void Login(String email, String password) {
            String query;
            query = "SELECT memberId,librarian FROM Member WHERE memberEmail='"+email+"' AND memberPasswd='"+password+"' ;";
            DataTable returnedData = runQuery(query);

            if (returnedData == null || returnedData.Rows.Count !=1)
            {
                Response.Write("<script>alert('No matched account')</script>");
            }
            else {
                Session["loginState"] = "true";
                Session["memberId"] = returnedData.Rows[0][0];
                Response.Redirect("homepage_code.aspx");
            }
        }
    }
}