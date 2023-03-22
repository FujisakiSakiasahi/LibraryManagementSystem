<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Librarian.aspx.cs" Inherits="LibraryManagementSystem.librarian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/Header.css" /> 
    <link rel="stylesheet" href="CSS/Footer.css" /> 
    <link rel="stylesheet" href="CSS/Librarian/Content.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
          <div class="header-logo">
              <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
          </div>
          <div class="header-login">
              <a href="Login.aspx" class="link">
                  <asp:Label ID="Label1" runat="server" Text="Login / Sign Up" CssClass="link"></asp:Label>
              </a>
          </div>
       </div>
        <div class="content">
            <div class="navigation-buttons-container">

                <asp:Button ID="Button1" runat="server" Text="Button" CssClass="nav-buttons" />
                <asp:Button ID="Button2" runat="server" Text="Button" CssClass="nav-buttons" />
                <asp:Button ID="Button3" runat="server" Text="Button" CssClass="nav-buttons" />
                <asp:Button ID="Button4" runat="server" Text="Button" CssClass="nav-buttons" />

            </div>
            <div class="multiview">

                <asp:MultiView ID="MultiView1" runat="server">
                </asp:MultiView>

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
