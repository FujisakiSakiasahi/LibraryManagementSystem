<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/Login/Content.css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <!--Login-->

        <div class="container-fluid">
            <div class="row">
                <div class="background col-3">
                    asdf
                </div>
                <div class="login-panel col-6">
                    asdf
                </div>
                <div class="background col-3">
                    asdf
                </div>
            </div>
        </div>

        <div class="login-container">
            <div class="image-container">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Logo_WhiteBG.png" />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Login to HamiShu"></asp:Label>
            </div>
            <div class="textbox-container">
                <asp:Panel runat="server" DefaultButton="Button2">
                    <asp:Label ID="Label1" runat="server" Text="Email Address"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Width="419px" CssClass="textbox"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" Width="419px" CssClass="textbox"></asp:TextBox>
                </asp:Panel>
            </div>
            <div class="button-container">
                <div class="buttons">
                    <asp:Button ID="Button1" runat="server" Text="Forgot Password" CssClass="button-forgotpassword" PostBackUrl="~/FAQ.aspx" />
                    <asp:Button ID="Button2" runat="server" Text="Login" CssClass="button-login" OnClick="Button2_Click" />
                </div>
                
            </div>
        </div>
        <div class="create-account">
            <asp:Label ID="Label4" runat="server" Text="Don't have an account? Learn how to become a member "></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">here.</asp:HyperLink>
        </div>
    </form>
</body>
</html>
