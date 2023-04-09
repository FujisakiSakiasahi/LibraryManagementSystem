<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LibraryManagementSystem.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css"/>
    <link rel="stylesheet" href="CSS/Home/Content.css" />
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="CSS/Home/Text.css" />

    <!--
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>   
        -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
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
                  <div id="login_link" runat="server">
                      <a href="Login.aspx" class="link">
                          <asp:Label ID="login_button" runat="server" Text="Login / Sign Up" CssClass="link"></asp:Label>
                      </a>
                  </div>
                  <div id="profile" runat="server">
                    <div class="d-flex align-items-center">
                      <div class="dropdown">
                        <!-- Profile picture with dropdown toggle -->
                        <a href="#" class="d-block rounded-circle overflow-hidden border border-2 border-light dropdown-toggle" id="profile_menu" data-bs-toggle="dropdown" aria-expanded="false">
                          <img src="images/book.jpg" alt="Profile Picture" class="w-100 h-100"/>
                        </a>

                        <!-- Dropdown menu with items -->
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile-menu">
                          <li><a class="dropdown-item" href="#">Notification</a></li>
                          <li><a class="dropdown-item" href="#">Settings</a></li>
                          <li><hr class="dropdown-divider"/></li>
                          <li><a class="dropdown-item" href="#">Log Out</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
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
                        <div class="list-item-content list-item-content-1">
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
                        <asp:Label ID="Label4" runat="server" Text="Recommended to you" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-3">
                            <div id="recommended_book_content" runat="server" class="row">
                                <!--for newest book item carrd-->
                            </div>
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
