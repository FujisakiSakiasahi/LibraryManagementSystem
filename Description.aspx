<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Description.aspx.cs" Inherits="LibraryManagementSystem.Description" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css" /> 
    <link rel="stylesheet" href="CSS/Footer.css" /> 
    <link rel="stylesheet" href="CSS/Description/Content.css" /> 

     <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

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
        <!--Header-->
        <div class="navigation-bar container-fluid">
            <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">


                <!--Logo-->
                <a href="Home.aspx" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <img src="images/HamiShu_Blue_BG.png" alt="Alternate Text" class="img-responsive" width="150" />
                </a>

                <!--Navigation Links-->
                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="Home.aspx" class="nav-link px-2 link-light ">Home</a></li>
                    <li><a href="Search.aspx" class="nav-link px-2 link-light">Search</a></li>
                    <li><a href="AboutUs.aspx" class="nav-link px-2 link-light">About Us</a></li>
                    <li><a href="FAQ.aspx" class="nav-link px-2 link-light">FAQ</a></li>
                    <li id="librarian_link" runat="server"><a href="Librarian.aspx" class="nav-link px-2 link-light">Librarian</a></li>
                </ul>

                <!--Login / Profile Dropdown-->
                <div class="col-md-3 text-end ">

                    <!--Login / Signup-->
                    <div id="login_link" runat="server">
                        <a href="Login.aspx" class="link-light login-text">
                            <asp:Label ID="login_button" runat="server" Text="Login / Sign Up" CssClass="link"></asp:Label>
                        </a>
                    </div>

                    <!--Profile Picture & Dropdown after login-->
                    <div id="profile" runat="server">
                        <div class="d-flex align-items-center justify-content-end">
                            <div class="dropdown text-end">
                                <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="/images/user.jpg" alt="mdo" width="40" height="40" class="rounded-circle" />
                                </a>
                                <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                                    <li><p id="username" runat="server" class="dropdown-item"></p></li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li><a class="dropdown-item" href="Notification.aspx">Notification</a></li>
                                    <li><a class="dropdown-item" href="Request.aspx">Request a book</a></li>
                                    <li><a class="dropdown-item" href="Setting.aspx">Setting</a></li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li><a class="dropdown-item" href="#" id="Logout_Button" runat="server" onserverclick="Logout_Function">Sign out</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
        </div>

        <!--Content-->
        <div class="container content shadow">

            <!--Title-->
            <div class="container-fluid">
                <h2 id="Label_Title" runat="server"></h2>
                <hr />
            </div>

            <div class="container-fluid">
                <div class="row">

                    <!--left side-->
                    <div class="col-md-2 col-sm-12 foreground justify-content-center">

                        <!--image-->
                        <div class="row">
                            <asp:Image ID="Image_BookCover" runat="server" CssClass="book-image" ImageUrl="~/images/book.jpg" AlternateText="book image" />
                        </div>

                        <!--buttons-->
                        <div class="row buttons">
                            <asp:Button ID="Button_Wishlist" runat="server" Text="Wishlist" OnClick="Button_Wishlist_Click"  CssClass="wishlist-button"/>
                            <asp:Button ID="Button_CopyCite" runat="server" Text="Copy Citation" OnClientClick="return copyText()" CssClass="copy-citation-button" />
                            <asp:Button ID="Button_ReserveBook" runat="server" Text="Reserve" OnClick="Button_ReserveBook_Click" CssClass="reserve-button" />
                        </div>

                        <!--User Rating-->
                        <div class="row">
                            <div class="col-6">
                                <div class="rating-label">
                                    <asp:Label ID="Label_Rating" runat="server" Text="Rating: "></asp:Label>
                                </div>

                            </div>
                            <div class="col-6">
                                <asp:DropDownList ID="DropDownList_Rating" runat="server" CssClass="rating-dropdownlist">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="save-button">
                                <asp:Button ID="Button_SaveRating" runat="server" Text="Save Rating" CssClass="" />

                            </div>
                        </div>
                    </div>

                    <!--right side-->
                    <div class="col-md-10 col-sm-12">
                        
                        <!--Description-->
                        <div class="row">
                            <h3>Description</h3>
                            <hr />
                        </div>
                        <div class="row description">
                            <asp:Label ID="Label_Description" runat="server" Text="*desciption*"></asp:Label>

                        </div>

                        <!--More Information-->
                        <div class="row">
                            <div class="row">
                                <h3>More Information</h3>
                                <hr />
                            </div>
                            <div class="row more-information">
                                <div class="row">

                                    <!--info left-->
                                    <div class="col-6">
                                        <div class="row desc">
                                            <asp:Label runat="server" CssClass="title-label">Author:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_author"></asp:Label>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" CssClass="title-label">Publisher:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_publisher"></asp:Label>
                                            <br />
                                            <br />

                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" CssClass="title-label">Publish Date:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_publishdate"></asp:Label>
                                            <br />
                                            <br />

                                        </div>
                                    </div>

                                    <!--info right-->
                                    <div class="col-6">
                                        <div class="row">
                                            <asp:Label runat="server" CssClass="title-label">Rating:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_rating"></asp:Label>
                                            <br />
                                            <br />

                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" CssClass="title-label">Language:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_language"></asp:Label>
                                            <br />
                                            <br />

                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" CssClass="title-label">ISBN:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_ISBN"></asp:Label>
                                            <br />
                                            <br />

                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" CssClass="title-label">Availability:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_availability"></asp:Label>
                                            <br />
                                            <br />

                                        </div>
                                        <div class="row">
                                            <asp:Label runat="server" CssClass="title-label">Shelf ID:</asp:Label>
                                            <asp:Label runat="server" ID="tablecell_shelfid"></asp:Label>
                                            <br />
                                            <br />

                                        </div>

                                        <!--this is use to store the citingText for copy usage-->
                                        <textarea id="citingText" runat="server" style="display: none;"></textarea>

                                    </div>
                                </div>
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
