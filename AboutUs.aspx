<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="LibraryManagementSystem.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="CSS/Home/Header.css"/>
    <link rel="stylesheet" href="CSS/Home/Content.css" />
    <link rel="stylesheet" href="CSS/Home/Footer.css" />
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
          <div class="header-logo">
              <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
          </div>
          <div class="header-login">
              <a href="Login.aspx">
                  <asp:Label ID="Label1" runat="server" Text="Login / Sign Up"></asp:Label>
              </a>
          </div>
       </div>

        <div>
            About us content
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
