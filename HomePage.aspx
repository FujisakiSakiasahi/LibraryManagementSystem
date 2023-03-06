<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LibraryManagementSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/HomePageHeaderFooter.css"/>
    <link rel="stylesheet" href="CSS/HomePageContent.css" />
</head>
<body>
     
    <form id="form1" runat="server">
      <div class="header">
          <div class="header-logo">
              <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
          </div>
          <div class="header-login">
              <asp:Label ID="Label1" runat="server" Text="Login / Sign Up"></asp:Label>
          </div>
       </div>
        <div class="content">

            <asp:Label ID="Label2" runat="server" Text="Content Here"></asp:Label>

        </div>
        <div class="footer">
            <div class="footer-container">
                <div class="footer-item footer-item-1">

                </div>
                <div class="footer-item footer-item-2">

                </div>
                <div class="footer-item footer-item-3">

                </div>
            </div>

        </div>
    </form>
</body>
</html>
