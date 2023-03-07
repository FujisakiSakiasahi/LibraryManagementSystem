﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="LibraryManagementSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/HomePage/Header.css"/>
    <link rel="stylesheet" href="CSS/HomePage/Content.css" />
    <link rel="stylesheet" href="CSS/HomePage/Footer.css" />

    <style type="text/css">
        #Text1 {
            height: 38px;
            width: 856px;
        }
    </style>

</head>
<body>
     
    <form id="form1" runat="server">
      <div class="header">
          <div class="header-logo">
              <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
          </div>
          <div class="header-login">
              <asp:Label ID="Label1" runat="server" Text="Login / Sign Up"></asp:Label>
          </div>
       </div>
        <div class="content">
            <div class="banner-container">
                <div class="banner">

                </div>
            </div>
            <div class="search-bar-container">
                <div class="search-bar">
                    <input id="Text1" type="text" /></div>
                </div>
            <div class="list-container">
                <div class="list">
                    <div class="list-item list-item-1">
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <div class="list-item-content list-item-content-1">

                        </div>
                    </div>
                    <div class="list-item list-item-2">
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        <div class="list-item-content list-item-content-2">

                        </div>
                    </div>
                    <div class="list-item list-item-3">
                        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                        <div class="list-item-content list-item-content-3">

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
