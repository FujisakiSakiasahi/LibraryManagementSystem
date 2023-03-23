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

                <asp:Button ID="Button1" runat="server" Text="Button" CssClass="nav-buttons" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Button" CssClass="nav-buttons" />
                <asp:Button ID="Button3" runat="server" Text="Button" CssClass="nav-buttons" />
                <asp:Button ID="Button4" runat="server" Text="Button" CssClass="nav-buttons" OnClick="Button4_Click" />

            </div>
            <div class="multiview">

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <input id="Text1" type="text" />
                        <asp:Button ID="Button5" runat="server" Text="Button" />
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                    </asp:View>
                    <asp:View ID="View3" runat="server">`
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                    </asp:View>
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
