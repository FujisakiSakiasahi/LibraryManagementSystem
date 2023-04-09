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
                    <input id="textbox_search" type="text" placeholder="Search for books here..." class="search-bar" /><br />
                    <asp:Button ID="Button_Search" runat="server" Text="Search" CssClass="search-button" />
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
                <div class="footer">
                    <div class="footer-container">
                        <div class="footer-item footer-item-1">
                        </div>
                        <div class="footer-item footer-item-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
