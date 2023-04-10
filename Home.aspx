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

                  <!--Login Page link before login-->
                  <div id="login_link" runat="server">
                      <a href="Login.aspx" class="link">
                          <asp:Label ID="login_button" runat="server" Text="Login / Sign Up" CssClass="link"></asp:Label>
                      </a>
                  </div>

                  <!--Profile Picture after login-->
                  <div id="profile" runat="server">
                      <div class="d-flex align-items-center">
                          <div class="dropdown text-end">
                              <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                  <img src="https://github.com/mdo.png" alt="mdo" width="40" height="40" class="rounded-circle"/>
                              </a>
                              <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                                  <li><a class="dropdown-item" href="#">New project...</a></li>
                                  <li><a class="dropdown-item" href="#">Settings</a></li>
                                  <li><a class="dropdown-item" href="#">Profile</a></li>
                                  <li>
                                      <hr class="dropdown-divider"/>
                                  </li>
                                  <li><a class="dropdown-item" href="#">Sign out</a></li>
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
        <!--Footer-->

        <footer class="text-center text-lg-start bg-dark text-white">
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                HamiShu LMS

                            </h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            </p>
                        </div>

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Useful links
                            </h6>
                            <p>
                                <a href="Home.aspx" class="text-reset">Home</a>
                            </p>
                            <p>
                                <a href="Search.aspx" class="text-reset">Search</a>
                            </p>
                            <p>
                                <a href="AboutUs.aspx" class="text-reset">About Us</a>
                            </p>
                            <p>
                                <a href="FAQ.aspx" class="text-reset">FAQ</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p>Jalan XXX, Taman XXX, 99999, City XXX, State XXX, Country XXX</p>
                            <p>XXX@example.com</p>
                            <p class="footer-text">+ 01 234 567 88</p>
                            <p>+ 01 234 567 89</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

        </footer>
        <!-- Footer -->
    </form>
</body>
</html>
