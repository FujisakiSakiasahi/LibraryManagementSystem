using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Setting : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SetInitialLoginState();
                HeaderUIHandler();

                if (!sessionHandler.GetLoginState())
                {
                    Response.Write("<script>alert('Access denied, redirecting to home')</script>");
                    string redirectScript = "<script>window.location.href = 'Home.aspx';</script>";
                    ScriptManager.RegisterStartupScript(this, GetType(), "RedirectScript", redirectScript, false);
                }

                LoadSettings();
                username.InnerHtml = sessionHandler.RunQuery($"SELECT memberName FROM Member WHERE memberId={sessionHandler.GetUserId()}").Rows[0][0].ToString();
            }
        }

        protected void LoadSettings() {
            DataTable returnedData = sessionHandler.RunQuery($"SELECT newsletter FROM Member WHERE memberId={sessionHandler.GetUserId()};");

            if (!(returnedData.Rows.Count <= 0)) {
                if (returnedData.Rows[0][0].ToString() == "false" || returnedData.Rows[0][0].ToString() == "0") {
                    CheckBox_Notification.Checked = false;
                } else {
                    CheckBox_Notification.Checked = true;
                }
            }

            system_response.Visible = false;
            Debug.WriteLine(sessionHandler.GetUserId());
        }

        protected void HeaderUIHandler()
        {
            librarian_link.Visible = false;

            if (sessionHandler.GetIsLibrarian())
            {
                librarian_link.Visible = true;
            }
        }

        protected void SetInitialLoginState()
        {
            if (Session["loginState"] != null)
            {
                sessionHandler.CheckLoginState();
            }
            else { Session["loginState"] = "false"; }
        }

        protected void Logout_Function(object sender, EventArgs e)
        {
            string link = sessionHandler.GetIsLibrarian() && Request.RawUrl.Equals("Librarian.aspx") ? "Home.aspx" : Request.RawUrl;

            Session["userLoginState"] = false;
            Session.Abandon();
            Response.Redirect(link);
        }

        protected void Button_Save_Click(object sender, EventArgs e) {
            // somehow the user id save in sessionHandler becomes 0, dun know why, theres one debug write line in the LoadSettings() function, help me check sat why


            Debug.WriteLine(sessionHandler.GetUserId());
            int notification_setting = CheckBox_Notification.Checked ? 1 : 0;
            Debug.WriteLine(sessionHandler.GetUserId());
            //sessionHandler.RunQuery($"UPDATE SET newsletter={notification_setting} WHERE memberId={sessionHandler.GetUserId()};");

            /*
                        system_response.Visible = true;
                        system_response.InnerHtml = "The changes has saved successfully!";*/
        }

        protected void Button_Reset_Click(object sender, EventArgs e) {
            CheckBox_Notification.Checked = false;
            try { 
                sessionHandler.RunQuery($"UPDATE SET newsletter=0 WHERE memberId={sessionHandler.GetUserId()};");
                
                system_response.Visible = true;
                system_response.InnerHtml = "The settings has reset to default!";
            } catch {
                system_response.Visible = true;
                system_response.Style.Add("color","red");
                system_response.InnerHtml = "The settings already at default state!";
            }
        }
    }
}