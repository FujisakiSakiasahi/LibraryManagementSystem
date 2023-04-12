<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LibraryManagementSystem.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>About Us</title>

    <link rel="stylesheet" href="CSS/Header.css"/>
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="CSS/page-title.css" />

     <!--Bootstrap 5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

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
        <div class="content contaier">
            <div class="row gx-0">
                <div class="col-12 justify-content-center text-center">
                    <h2 class="page-title">
                        About Us
                    </h2>
                </div>
            </div>
        </div>

        <div class="container">

            <div class="row">
                <div class="col-12">
                    <h3>
                        HamiShu LMS
                    </h3>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <p>Our library is a hub for knowledge, learning, and exploration. We strive to provide a welcoming and inclusive space for all members of our community to access a wide range of learning resources and find their next great read.</p>
                    <p>For years, we've been dedicated to promoting literacy and lifelong learning. Our team of knowledgeable librarians is always on hand to help you find the perfect book, navigate our digital resources, or answer any other questions you may have.</p>
                    <hr/>
                    <p>At our library, we believe that access to reading materials and educational resources is a fundamental right for all. That's why we work hard to keep our library well-stocked and up-to-date with the latest and greatest books, magazines, audiobooks, and more. We also offer a variety of digital resources, such as e-books, audiobooks, and databases, so that you can access our materials from anywhere.</p>
                    <hr/>
                    <p>Thank you for choosing Our Library as your go-to source for all things books and knowledge. We look forward to seeing you soon and helping you on your learning journey.</p>
                    <hr/>
                </div>
            </div>

            <div class="row">
                <div class="col-6 text-center">
                    <h3>Our Location</h3>
                    <p>Jalan XXX, Taman XXX, 99999, City XXX,</p>
                    <p>State XXX, Country XXX</p>
                </div>
                <div class="col-6 text-center">
                    <h3>Our Contact</h3>
                    <p>Email: XXX@example.com</p>
                    <p>Tel no: + 01 234 567 89</p>
                </div>
            </div>
        </div>


          <!--Footer-->
        <footer class="text-center text-lg-start bg-dark text-white">
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">

                        <!--left col-->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">HamiShu LMS
                            </h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            </p>
                        </div>

                        <!--middle col-->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
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

                        <!--right col-->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p>Jalan XXX, Taman XXX, 99999, City XXX, State XXX, Country XXX</p>
                            <p>XXX@example.com</p>
                            <p class="footer-text">+ 01 234 567 88</p>
                            <p>+ 01 234 567 89</p>
                        </div>

                    </div>
                </div>
            </section>
        </footer>

    </form>
</body>
</html>
