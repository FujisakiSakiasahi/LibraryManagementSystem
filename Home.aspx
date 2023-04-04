<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LibraryManagementSystem.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css"/>
    <link rel="stylesheet" href="CSS/Home/Content.css" />
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="CSS/Home/Text.css" />
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
            <div class="banner-container">
                <div class="banner">

                    <asp:Image ID="banner_image" runat="server" Height="100px" ImageUrl="~/images/HamiShu_Blue_BG.png" />
                    <asp:Label ID="banner_label" runat="server" Text="Sample banner here"></asp:Label>

                </div>
            </div>
            <div class="search-bar-container">
                <div class="search-bar">
                    <input id="textbox_search" type="text" placeholder="Search for books here..." class="search-bar-textbox" />
                    <br />
                    <asp:Button ID="search_button" runat="server" CssClass="advanced-search-button" Height="50px" OnClick="Button1_Click" Text="Search" />
                </div>
                </div>
            <div class="list-container">
                <div class="list">
                    <div class="list-item list-item-1">
                        <asp:Label ID="Label2" runat="server" Text="Popular Books" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-1" id="div_popular_book">
                            <a href="Description.aspx?bookId=12">
                                <asp:ImageButton ID="book_item1" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" PostBackUrl="Description.aspx?bookId=12" />
                            </a>
                            
                            <asp:ImageButton ID="book_item2" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item3" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item4" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />

                        </div>
                    </div>
                    <div class="list-item list-item-2">
                        <asp:Label ID="Label3" runat="server" Text="Newly Acquired" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-2">

                            <asp:ImageButton ID="book_item5" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/unknown.png" />
                            <asp:ImageButton ID="book_item6" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/unknown.png" />
                            <asp:ImageButton ID="book_item7" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/unknown.png" />
                            <asp:ImageButton ID="book_item8" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/unknown.png" />

                            <asp:ImageButton ID="book_item9" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item10" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item11" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item12" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />

                        </div>
                    </div>
                    <div class="list-item list-item-3">
                        <asp:Label ID="Label4" runat="server" Text="Most Liked" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-3">


                            <asp:ImageButton ID="book_item13" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item14" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item15" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="book_item16" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-container">
                <div class="footer-item footer-item-1">

                    <asp:Image ID="footer_logo_image" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="484px" />
                    <br />
                    <br />
                    <asp:HyperLink ID="footer_home" runat="server" NavigateUrl="~/Home.aspx" Target="_self">Home</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="footer_search" runat="server">Search</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="footer_temp" runat="server">Temp</asp:HyperLink>
                    <br />
                    <br />
                    <asp:HyperLink ID="footer_temp2" runat="server">temp</asp:HyperLink>

                </div>
                <div class="footer-item footer-item-2">

                </div>
            </div>

        </div>
    </form>
</body>
</html>
