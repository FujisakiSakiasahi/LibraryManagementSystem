using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Description : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = "https://localhost:44331/Desciption.aspx"; // replace with the URL of your ASPX page
            string data = Request.QueryString["bookId"];
            
            Label2.Text = data;
        }
    }
}