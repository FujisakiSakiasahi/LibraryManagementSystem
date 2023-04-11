<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LibraryManagementSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/Login/Content.css" />

        <!--Bootstrap 5-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <title></title>
</head>
<body class="background">
    <form id="form1" runat="server">

        <!--Login-->

        <div class="container-fluid">
            <div class="row">
                <div class="col-4 position-absolute top-50 start-50 translate-middle">

                    <!--Inside box-->
                    <div class="login container-fluid">

                        <!--Image and Login text--> 
                        <div class="intro-container container-fluid text-center">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/HamiShu_Logo_WhiteBG.png" />
                            <br />
                            <asp:Label ID="Label3" runat="server" Text="Login to HamiShu"></asp:Label>
                        </div>

                        <!--Email & Password Input-->

                        <div class="input-container container-fluid justify-content-center text-center">
                            <asp:Panel runat="server" DefaultButton="Button2">
                                <div class="container-fluid">
                                    <asp:Label ID="Label1" runat="server" Text="Email Address"></asp:Label>

                                </div>
                                <div class="container-fluid">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox"></asp:TextBox>
                                </div>
                                <div class="container-fluid">
                                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>

                                </div>
                                <div class="container-fluid">
                                    <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox" TextMode="Password"></asp:TextBox>

                                </div>
                            </asp:Panel>
                        </div>

                        <!--Buttons-->
                        <div class="button-container container-fluid">
                            <div class="row">
                                <div class="col-8 offset-2">
                                    <asp:Button ID="Button1" runat="server" Text="Forgot Password" CssClass="button-forgotpassword" PostBackUrl="~/FAQ.aspx" TabIndex="1" />
                                    <asp:Button ID="Button2" runat="server" Text="Login" CssClass="button-login" OnClick="Button2_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Out of box text-->
                    <div class="container-fluid text-center">
                        <asp:Label ID="Label5" runat="server" Text="Don't have an account? Learn how to become a member "></asp:Label>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/FAQ.aspx">here.</asp:HyperLink>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
