<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="LibraryManagementSystem.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css" /> 
    <link rel="stylesheet" href="CSS/Footer.css" /> 
    <link rel="stylesheet" href="CSS/Search/Content.css" /> 

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <?php
        $title = $_GET['title'];
        $page = $_GET['page'];
    ?>

    <style type="text/css">

        :root {
            --bs-light: $gray-200;
        }

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
        <div class="container-fluid">
            <div class="row">
                <div class="top-container">
                    <asp:TextBox runat="server" ID="Textbox_Search" class="search-bar-textbox"> </asp:TextBox>
                    <!--<input id="textbox_search" type="text" placeholder="Search for books here..." class="search-bar" />-->
                    <br />
                    <asp:Button ID="Button_Search" runat="server" Text="Search" CssClass="search-button" OnClick="Button_Search_Click" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2">
                </div>
                <div class="col-lg-2 bg-light">
                    <div class="row">
                        <asp:Label ID="Label1" runat="server" Text="Filter"></asp:Label>
                    </div>
                    <hr/>
                    <div class="row">
                        <asp:CheckBoxList ID="CheckBoxList_Filter" runat="server">
                            <asp:ListItem>Tag</asp:ListItem>
                        </asp:CheckBoxList>
                    </div>
                </div>
                <div class="col-lg-6 bg-light">
                    <div class="row">
                        <h2>Result...</h2>
                        <hr/>
                    </div>
                    <div class="row">

                            <div class="row">
                                    <div class="container">
                                        <ul class="list-group" id="search_result" runat="server">
                                            <!--list item card, result for searching
                                            
                                            
                                            <li class="list-group-item">
                                                <a href="Description.aspx?bookId=12">
                                                    <div class="row">
                                                        <div class="col-lg-3">
                                                            <img src="/images/book.jpg" />
                                                        </div>
                                                        <div class="col-lg-9">
                                                            <h4 class="text-dark">Title</h4>
                                                            <p class="text-dark">Description</p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </li>
                                                -->

                                        </ul>
                                    </div>
                                    
                                </div>
                            <div class="row">
                                    <div class="d-flex justify-content-center">
                                        <div id="pager_buttons" runat="server">
                                            <!--
                                                
                                            <ul class="pagination">
                                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item active"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                            </ul>
                                                
                                                -->
                                        </div>
                                    </div>
                                </div>

                    </div>
                </div>
                <div class="col-lg-2">
                </div>
            </div>
            <div class="row">
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
            </div>
        </div>
    </form>
</body>
</html>
