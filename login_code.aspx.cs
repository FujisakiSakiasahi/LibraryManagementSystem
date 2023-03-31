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
        private SessionHandler sessionHandler = new SessionHandler();

        protected void Page_Load(object sender, EventArgs e) {
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }
        }

        protected void Button1_Click(object sender, EventArgs e) {
            String email = TextBox1.Text.ToString();
            String password = TextBox2.Text.ToString();

            if (email == null || email == "" || password == null || password == "") {
                Response.Write("<script>alert('Empty field')</script>");
            } else {
                Login(email, password);
            }
        }

        protected void Login(String email, String password) {
            String query;
            query = "SELECT memberId,librarian FROM Member WHERE memberEmail='" + email + "' AND memberPasswd='" + password + "' ;";
            DataTable returnedData = sessionHandler.RunQuery(query);

            if (returnedData == null || returnedData.Rows.Count != 1) {
                Response.Write("<script>alert('No matched account')</script>");
            } else {
                Session["loginState"] = "true";
                Session["memberId"] = returnedData.Rows[0][0];

                Label3.Text = returnedData.Rows[0][1].ToString();
                //we have no fucking clue as to why sometime false sometime 0
                if (returnedData.Rows[0][1].ToString() == "False" || returnedData.Rows[0][1].ToString() == "0") {
                    Response.Redirect("homepage_code.aspx");
                } else if (returnedData.Rows[0][1].ToString() == "True" || returnedData.Rows[0][1].ToString() == "1") {
                    Response.Redirect("librarian_page_code.aspx");
                } else {
                    Response.Write("<script>alert('Login data returning error occurs')</script>");
                }

            }
        }
    }
}