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

                <asp:Button ID="Button1" runat="server" Text="Books" CssClass="nav-buttons" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="User" CssClass="nav-buttons" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="Check In" CssClass="nav-buttons" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" Text="Check Out" CssClass="nav-buttons" OnClick="Button4_Click" />
                <asp:Button ID="Button6" runat="server" Text="Notification" CssClass="nav-buttons" OnClick="Button6_Click" />


            </div>
            <div class="multiview">

                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <!--
                        1 - 3: manage book
                        4 - 6: manage user
                        7    : check in (return book)
                        8    : check out (borrow book)
                        9    : notification (maybe can add one more, to use for editing notification)
                        -->
                    <asp:View ID="View1" runat="server">
                        <input id="Text1" type="text" />
                        <asp:Button ID="Button5" runat="server" Text="Button" />
                        <asp:Label ID="Label2" runat="server" Text="manage book page"></asp:Label>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <asp:Label ID="Label4" runat="server" Text="manage user page"></asp:Label>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                    </asp:View>
                    <asp:View ID="View6" runat="server">

                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <asp:Label ID="Label5" runat="server" Text="check in page"></asp:Label>
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <asp:Label ID="Label6" runat="server" Text="check out page"></asp:Label>
                    </asp:View>
                    <asp:View ID="View9" runat="server">
                        <asp:Label ID="Label7" runat="server" Text="manage notification page"></asp:Label>
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
