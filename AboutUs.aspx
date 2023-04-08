<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LibraryManagementSystem.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css"/>
    <link rel="stylesheet" href="CSS/AboutUs/Content.css"/>
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
              <asp:Button ID="header_home" runat="server" Text="Home" CssClass="nav-buttons" PostBackUrl="~/Home.aspx" />
              <asp:Button ID="header_search" runat="server" Text="Search" CssClass="nav-buttons" PostBackUrl="~/Search.aspx" />
              <asp:Button ID="header_about_us" runat="server" Text="About Us" CssClass="nav-buttons" PostBackUrl="~/AboutUs.aspx" />
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

        <div class="container-fluid text-center">
            <div class="row content">
                <div class="col-sm-2 sidenav">
                </div>
                <div class="col-sm-8 text-left">
                    <h1>About Us</h1>
                    <p>Our library is a hub for knowledge, learning, and exploration. We strive to provide a welcoming and inclusive space for all members of our community to access a wide range of learning resources and find their next great read.</p>
                    </>
                    <p>For years, we've been dedicated to promoting literacy and lifelong learning. Our team of knowledgeable librarians is always on hand to help you find the perfect book, navigate our digital resources, or answer any other questions you may have.</p>
                    <hr/>
                    <p>At our library, we believe that access to reading materials and educational resources is a fundamental right for all. That's why we work hard to keep our library well-stocked and up-to-date with the latest and greatest books, magazines, audiobooks, and more. We also offer a variety of digital resources, such as e-books, audiobooks, and databases, so that you can access our materials from anywhere.</p>
                    <hr/>
                    <p>Thank you for choosing Our Library as your go-to source for all things books and knowledge. We look forward to seeing you soon and helping you on your learning journey.</p>
                    <hr/>
                    <h3>Our Location</h3>
                    <p>6XXX, Jalan XXXXXXX,</p>
                    <p>110000, Georgetown,</p>
                    <p>Penang, Malaysia.</p>
                    <br/><br/>
                    <h3>Our Contact</h3>
                    <p>Phone no. 012-3456789</p>
                    <p>Tel no. 04-1234567</p>
                    <p>Fax no. 123-456-7890</p>
                    <br/><br/>
                </div>
                <div class="col-sm-2 sidenav">
                </div>
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
