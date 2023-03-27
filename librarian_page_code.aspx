<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="librarian_page_code.aspx.cs" Inherits="LibraryManagementSystem.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="bookIdLbl" runat="server" Text="Book ID: "></asp:Label>
            <asp:Panel runat="server" DefaultButton="submitBtn">
                <asp:TextBox ID="booKIdTxt" runat="server"></asp:TextBox>   
                <asp:Button ID="submitBtn" runat="server" Text="Search" OnClick="Book_Load" />
            </asp:Panel>
            <br />
        </div>

        <div>
            <div>
                <asp:Label ID="bookNameLbl" runat="server" Text="Title: "></asp:Label>
                <asp:TextBox ID="bookNameTxt" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="authorNameLbl" runat="server" Text="Author: "></asp:Label>
                <asp:TextBox ID="authorNameTxt" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="bookDescLbl" runat="server" Text="Description: "></asp:Label>
                <asp:TextBox ID="bookDescTxt" runat="server" ReadOnly="True" Rows="10" Width="50%"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="pubNameLbl" runat="server" Text="Publisher: "></asp:Label>
                <asp:TextBox ID="pubNameTxt" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="pubDateLbl" runat="server" Text="Publishing Date: "></asp:Label>
                <asp:TextBox ID="pubDateTxt" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="ratingLbl" runat="server" Text="Rating: "></asp:Label>
                <asp:DropDownList ID="ratingDrop" runat="server" Enabled="False">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="langLbl" runat="server" Text="Language: "></asp:Label>
                <asp:TextBox ID="langTxt" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="isbnLbl" runat="server" Text="ISBN: "></asp:Label>
                <asp:TextBox ID="isbnTxt" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="availableLbl" runat="server" Text="Available: "></asp:Label>
                <asp:CheckBox ID="availableChk" runat="server" Enabled="False" />
            </div>
        </div>

        <div>
            <asp:Button ID="EditButton" runat="server" Text="Edit" OnClick="EditButton_Click" />
            <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" Visible="False" />
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" OnClick="CancelButton_Click" Visible="False" />
        </div>


            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
