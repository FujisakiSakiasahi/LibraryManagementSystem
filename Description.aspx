<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Description.aspx.cs" Inherits="LibraryManagementSystem.Description" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css" /> 
    <link rel="stylesheet" href="CSS/Footer.css" /> 
    <link rel="stylesheet" href="CSS/Description/Content.css" /> 

    <?php
        $bookId = $_GET['bookId'];
    ?>
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
            <div class="description">

                <asp:Label ID="Label2" runat="server" Text="Title of the book"></asp:Label>
                <br/>

                <asp:Image ID="Image2" runat="server" CssClass="temp-img" ImageUrl="~/images/book.jpg" />
                <asp:Label ID="Label3" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur dignissim dignissim commodo. Suspendisse purus ex, efficitur nec libero et, rutrum faucibus diam. Pellentesque et lacus mollis, commodo urna nec, congue urna. Proin pulvinar eros vel odio vestibulum, quis ultrices justo feugiat. Etiam pellentesque sit amet lorem vitae tempor. Donec vehicula ipsum vel sem condimentum faucibus. Vestibulum iaculis est vel justo finibus, et accumsan urna rutrum. Duis posuere ipsum vitae felis cursus efficitur.Ut sodales, arcu vitae hendrerit placerat, orci sem pharetra magna, ac vulputate nisi ante id elit. Donec non congue libero, quis tincidunt risus. Duis mi est, malesuada eu ultricies at, suscipit non augue. Quisque vel tempus leo, nec rhoncus velit. Maecenas id accumsan tellus. Etiam efficitur imperdiet leo. Duis massa dui, ultrices sed varius tincidunt, fermentum vel arcu. Nunc pretium urna sed turpis bibendum, id tristique mauris faucibus. Integer dictum finibus purus, laoreet varius risus molestie varius. Duis malesuada eleifend sapien sit amet varius."></asp:Label>
                <br/>
                <asp:Button ID="Button2" runat="server" Text="Wishlist" />
                <asp:Button ID="Button1" runat="server" Text="Copy Citation" />
                <asp:Button ID="Button3" runat="server" Text="Borrow" />

            </div>

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
