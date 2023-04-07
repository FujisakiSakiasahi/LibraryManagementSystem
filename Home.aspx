<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LibraryManagementSystem.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css"/>
    <link rel="stylesheet" href="CSS/Home/Content.css" />
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="CSS/Home/Text.css" />

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
        <div class="content">
            <div class="banner-container">
                <div class="banner">

                    <asp:Image ID="banner_image" runat="server" Height="100px" ImageUrl="~/images/HamiShu_Blue_BG.png" />
                    <asp:Label ID="banner_label" runat="server" Text="Sample banner here"></asp:Label>

                </div>
            </div>
            <div class="search-bar-container">
                <div class="search-bar">
                    <asp:TextBox runat="server" ID="Textbox_Search" class="search-bar-textbox"> </asp:TextBox>
                    <!--<input id="test" type="text" placeholder="Search for books here..." class="search-bar-textbox" runat="server"/>-->
                    <br />
                    <asp:Button ID="search_button" runat="server" CssClass="advanced-search-button" Height="50px" OnClick="Button_Search_Click" Text="Search" />
                </div>
                </div>
            <div class="list-container">
                <div class="list">
                    <div class="list-item list-item-1">
                        <asp:Label ID="Label2" runat="server" Text="Popular Books" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-1" id="div_popular_book">
                            <div id="popular_book_content" runat="server" class="row">
                                <!--for popular book item carrd-->
                            </div>
                        </div>
                    </div>
                    <div class="list-item list-item-2">
                        <asp:Label ID="Label3" runat="server" Text="Newly Acquired" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-2">
                            <div id="newest_book_content" runat="server" class="row">
                                <!--for newest book item carrd-->
                            </div>
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
