<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="LibraryManagementSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Header.css"/>
    <link rel="stylesheet" href="CSS/Home/Content.css" />
    <link rel="stylesheet" href="CSS/Footer.css" />
    <link rel="stylesheet" href="CSS/Home/Text.css" />

    <style type="text/css">
        #Text1 {
            height: 38px;
            width: 856px;
            border: 0;
            border-radius: 10px;
            font-size: 20px;
            padding: 10px;
        }
    </style>

</head>
<body>
     
    <form id="form1" runat="server">
      <div class="header">
          <div class="header-logo-container">
              <div class="header-logo">
                  <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
              </div>
          </div>

          <div class="header-navigation-container">
              <asp:Button ID="Button2" runat="server" Text="Button" />
              <asp:Button ID="Button3" runat="server" Text="Button" />
              <asp:Button ID="Button4" runat="server" Text="Button" />
              <asp:Button ID="Button5" runat="server" Text="Button" />
          </div>

          <div class="header-login-container">
              <div class="header-login">
                  <a href="Login.aspx" class="link">
                      <asp:Label ID="Label1" runat="server" Text="Login / Sign Up" CssClass="link"></asp:Label>
                  </a>
              </div>
          </div>


       </div>
        <div class="content">
            <div class="banner-container">
                <div class="banner">

                    <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl="~/images/HamiShu_Blue_BG.png" />
                    <asp:Label ID="Label5" runat="server" Text="Sample banner here"></asp:Label>

                </div>
            </div>
            <div class="search-bar-container">
                <div class="search-bar">
                    <input id="Text1" type="text" placeholder="Search for books here..." />
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="advanced-search-button" Height="50px" OnClick="Button1_Click" Text="Search" />
                </div>
                </div>
            <div class="list-container">
                <div class="list">
                    <div class="list-item list-item-1">
                        <asp:Label ID="Label2" runat="server" Text="Popular Books" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-1">

                            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton2" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton3" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton4" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />

                        </div>
                    </div>
                    <div class="list-item list-item-2">
                        <asp:Label ID="Label3" runat="server" Text="Newly Acquired" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-2">


                            <asp:ImageButton ID="ImageButton5" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton6" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton7" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton8" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />

                        </div>
                    </div>
                    <div class="list-item list-item-3">
                        <asp:Label ID="Label4" runat="server" Text="Most Liked" CssClass="labels" ForeColor="White"></asp:Label>
                        <div class="list-item-content list-item-content-3">


                            <asp:ImageButton ID="ImageButton9" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton10" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton11" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />
                            <asp:ImageButton ID="ImageButton12" runat="server" CssClass="list-item-content-images" Height="200px" ImageUrl="~/images/book.jpg" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-container">
                <div class="footer-item footer-item-1">

                </div>
                <div class="footer-item footer-item-2">

                </div>
            </div>

        </div>
    </form>
</body>
</html>
