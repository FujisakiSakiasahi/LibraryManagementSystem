<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Description.aspx.cs" Inherits="LibraryManagementSystem.Description" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css" /> 
    <link rel="stylesheet" href="CSS/Footer.css" /> 
    <link rel="stylesheet" href="CSS/Description/Content.css" /> 

     <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
            <div class="row content">
                <div class="col-sm-2 sidenav">
                </div>
                <div class="col-sm-8 text-left">
                    <div class="content">
                        <div class="description">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h2 id="Label_Title" runat="server"></h2>
                                </div>
                            </div>
                            <hr class="solid" />
                            <div class="row">
                                <div class="col-lg-3">
                                    <asp:Image ID="Image_BookCover" runat="server" CssClass="temp-img" ImageUrl="~/images/book.jpg" />
                                </div>
                                <div class="col-lg-9">
                                    <asp:Label ID="Label_Description" runat="server" Text="*desciption*" class="text-left"></asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3">
                                    <asp:Button ID="Button_Wishlist" runat="server" Text="Wishlist" OnClick="Button_Wishlist_Click" />
                                    <asp:Button ID="Button_CopyCite" runat="server" Text="Copy Citation" OnClientClick="return copyText()"/>
                                    <asp:Button ID="Button_ReserveBook" runat="server" Text="Reserve" OnClick="Button_ReserveBook_Click" />
                                </div>
                                <div class="col-lg-9">
                                    <div class="row">
                                        <h3 class="text-left">More Information</h3>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">Author:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_author" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">Publisher:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_publisher" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">Publish Date:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_publishdate" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">Rating:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_rating" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">Language:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_language" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">ISBN:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_ISBN" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">Availability:</asp:Label>
                                             <asp:Label runat="server" ID="tablecell_availability" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" class="col-lg-2 text-left">Shelf ID:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_shelfid" class="col-lg-2 text-left"></asp:Label>
                                        </div>
                                    </div>
                        
                                    <!--this is use to store the citingText for copy usage-->
                                    <textarea id="citingText" runat="server" style="display: none;"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-2 sidenav">
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
