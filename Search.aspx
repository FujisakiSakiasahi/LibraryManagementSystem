<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="LibraryManagementSystem.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css" /> 
    <link rel="stylesheet" href="CSS/Footer.css" /> 
        <link rel="stylesheet" href="CSS/Search/Content.css" /> 

    <style type="text/css">


.search-bar-textbox {
    height: 38px;
    width: 856px;
    border: 0;
    border-radius: 10px;
    font-size: 20px;
    padding: 10px;
}</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
          <div class="header-logo-container">
              <div class="header-logo">
                  <asp:Image ID="logo_image" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
              </div>
          </div>

          <div class="header-navigation-container">
              <asp:Button ID="header_home" runat="server" Text="Home" CssClass="nav-buttons" />
              <asp:Button ID="header_search" runat="server" Text="Search" CssClass="nav-buttons" />
              <asp:Button ID="header_about_us" runat="server" Text="About Us" CssClass="nav-buttons" />
              <asp:Button ID="header_temp" runat="server" Text="Temp" CssClass="nav-buttons" />
          </div>

          <div class="header-login-container">
              <div class="header-login">
                  <a href="Login.aspx" class="link">
                      <asp:Label ID="login_button" runat="server" Text="Login / Sign Up" CssClass="link"></asp:Label>
                  </a>
              </div>
          </div>


       </div>
        <div class="content">
                    <input id="textbox_search" type="text" placeholder="Search for books here..." class="search-bar" /><br />
            <asp:Button ID="Button_Search" runat="server" Text="Search" CssClass="search-button" />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            </div>
        <div class="footer">
            <div class="footer-container">
                <div class="footer-item footer-item-1">

                </div>
                <div class="footer-item footer-item-2">

                </div>
            </div>

        </div>
    </form>
</body>
</html>
