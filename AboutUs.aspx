<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LibraryManagementSystem.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css"/>
    <link rel="stylesheet" href="CSS/AboutUs/Content.css"/>
    <link rel="stylesheet" href="CSS/Footer.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
          <div class="header-logo">
              <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
          </div>
          <div class="header-login">
              <a href="Login.aspx">
                  <asp:Label ID="Label1" runat="server" Text="Login / Sign Up"></asp:Label>
              </a>
          </div>
       </div>

        <div>
            About us content
            <div class="aboutus-container">
                <asp:Label ID="Label2" runat="server" CssClass="labels" Text="Our library is a hub for knowledge, learning, and exploration. We strive to provide a welcoming and inclusive space for all members of our community to access a wide range of learning resources and find their next great read."></asp:Label>
            </div>
            <div class="aboutus-container">
                <asp:Label ID="Label3" runat="server" CssClass="labels" Text="For years, we've been dedicated to promoting literacy and lifelong learning. Our team of knowledgeable librarians is always on hand to help you find the perfect book, navigate our digital resources, or answer any other questions you may have."></asp:Label>
            </div>
            <div class="aboutus-container">
                <asp:Label ID="Label4" runat="server" CssClass="labels" Text="At our library, we believe that access to reading materials and educational resources is a fundamental right for all. That's why we work hard to keep our library well-stocked and up-to-date with the latest and greatest books, magazines, audiobooks, and more. We also offer a variety of digital resources, such as e-books, audiobooks, and databases, so that you can access our materials from anywhere."></asp:Label>
            </div>
            <div class="aboutus-container">
                <asp:Label ID="Label5" runat="server" CssClass="labels" Text="Thank you for choosing Our Library as your go-to source for all things books and knowledge. We look forward to seeing you soon and helping you on your learning journey."></asp:Label>

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
