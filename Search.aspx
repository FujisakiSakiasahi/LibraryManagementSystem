﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="LibraryManagementSystem.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Search</title>

    <link rel="stylesheet" href="CSS/Header.css" />
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="CSS/search.css" />

    <!--Bootstrap 5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <?php
        $title = $_GET['title'];
        $page = $_GET['page'];
        $filter = $_GET['filter']
        
        ?>

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
                                    <li><a class="dropdown-item" href="Wishlist.aspx">Wishlist</a></li>
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
        <div class="container">

            <!--Search Bar-->
            <div class="search-container container-fluid">
                <div class="row">
                    <div class="col-11">
                        <asp:TextBox ID="Textbox_Search" runat="server" CssClass="search-bar" TextMode="Search" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-1">
                        <asp:Button ID="Button_Search" runat="server" Text="Search" CssClass="search-button" OnClick="Button_Search_Click" />
                    </div>
                </div>
            </div>

            <!--Filter & Result-->
            <div class="container-fluid">
                <div class="row">

                    <!--Filter-->
                    <div class="filter col-3">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <h2>Filter</h2>
                                    <hr />
                                </div>
                            </div>
                        </div>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <asp:CheckBoxList ID="CheckBoxList_Filter" runat="server">
                                        <asp:ListItem>Tag</asp:ListItem>
                                    </asp:CheckBoxList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Results-->
                    <div class="result col-9">
                        <div class="contaier-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <h2>Results</h2>
                                    <hr />
                                </div>
                            </div>
                        </div>
                        <div class="contaier-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="list-group shadow" id="search_result" runat="server">
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
                        </div>
                    </div>

                </div>
            </div>

            <!--Pager Buttons-->
            <div class="pager-buttons container-fluid">
                <div class="row">
                    <div class="col-12">
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
