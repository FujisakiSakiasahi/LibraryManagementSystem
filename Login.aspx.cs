using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();

        protected void Page_Load(object sender, EventArgs e) {
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }
        }

        protected void UserLogin(String email, String password) {
            String query;
            query = "SELECT memberId,librarian FROM Member WHERE memberEmail='" + email + "' AND memberPasswd='" + password + "' ;";
            DataTable returnedData = sessionHandler.RunQuery(query);

            if (returnedData == null || returnedData.Rows.Count != 1) {
                Response.Write("<script>alert('No matched account')</script>");
            } else {
                Session["loginState"] = "true";
                Session["memberId"] = returnedData.Rows[0][0];
                Session["isLibrarian"] = returnedData.Rows[0][1];

                Label3.Text = returnedData.Rows[0][1].ToString();
                if (returnedData.Rows[0][1].ToString() == "False" || returnedData.Rows[0][1].ToString() == "0") {
                    Response.Redirect("Home.aspx");
                } else if (returnedData.Rows[0][1].ToString() == "True" || returnedData.Rows[0][1].ToString() == "1") {
                    Response.Redirect("Librarian.aspx");
                } else {
                    Response.Write("<script>alert('Login data returning error occurs')</script>");
                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e) {
            String email = TextBox1.Text.ToString();
            String password = TextBox2.Text.ToString();

            if (email == null || email == "" || password == null || password == "") {
                Response.Write("<script>alert('Empty field')</script>");
            } else {
                UserLogin(email, password);
            }
        }
    }
}