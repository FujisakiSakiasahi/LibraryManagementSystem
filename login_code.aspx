<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_code.aspx.cs" Inherits="LibraryManagementSystem.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <a href="homepage_code.aspx"> back</a>
            <br/>
            <asp:Label ID="Label1" runat="server" Text="email"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br/>
            <asp:Label ID="Label2" runat="server" Text="password"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br/>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
