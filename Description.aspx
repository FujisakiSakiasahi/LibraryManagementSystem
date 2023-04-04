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

    <script type="text/javascript">
        function copyText() {
            var textarea = document.getElementById("citingText");
            textarea.style.display = "block";
            textarea.select();
            document.execCommand("copy");
            textarea.style.display = "none";
        }

    </script>
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
                <div class="title">
                    <asp:Label ID="Label_Title" runat="server" Text="Title of the book"></asp:Label>
                </div>
                <div class="book-cover">
                    <asp:Image ID="Image_BookCover" runat="server" CssClass="temp-img" ImageUrl="~/images/book.jpg" />
                </div>
                <div class="book-description">
                    <asp:Label ID="Label_Description" runat="server" Text="*desciption*"></asp:Label>
                </div>
                <div class="operations">
                    <asp:Button ID="Button2" runat="server" Text="Wishlist" />
                    <asp:Button ID="Button1" runat="server" Text="Copy Citation" OnClientClick="return copyText()"/>
                    <asp:Button ID="Button3" runat="server" Text="Borrow" />
                </div>
                <div class="other-info">
                    <dl>
                        <dt>Author:</dt><dd id="tablecell_author" runat="server"></dd>
                        <dt>Publisher:</dt><dd id="tablecell_publisher" runat="server"></dd>
                        <dt>Publish Date:</dt><dd id="tablecell_publishdate" runat="server"></dd>
                        <dt>Rating:</dt><dd id="tablecell_rating" runat="server"></dd>
                        <dt>Language:</dt><dd id="tablecell_language" runat="server"></dd>
                        <dt>ISBN:</dt><dd id="tablecell_ISBN" runat="server"></dd>
                        <dt>Availability:</dt><dd id="tablecell_availability" runat="server"></dd>
                        <dt>Shelf ID:</dt><dd id="tablecell_shelfid" runat="server"></dd>
                    </dl>
                    <textarea id="citingText" runat="server" style="display: none;"></textarea>
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
