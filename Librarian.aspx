<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Librarian.aspx.cs" Inherits="LibraryManagementSystem.Librarian" %>

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
          <div class="header-logo-container">
              <div class="header-logo">
                  <asp:Image ID="logo_image" runat="server" ImageUrl="~/images/HamiShu_Blue_BG.png" Width="208px" />
              </div>
          </div>

          <div class="header-navigation-container">
              <asp:Button ID="header_home" runat="server" Text="Home" CssClass="nav-buttons" />
              <asp:Button ID="header_search" runat="server" Text="Search" CssClass="nav-buttons" />
              <asp:Button ID="header_about_us" runat="server" Text="About Us" CssClass="nav-buttons" />
              <asp:Button ID="header_temp" runat="server" Text="Temp" CssClass="nav-buttons" />
          </div>

          <div class="header-login-container">
              <div class="header-login">
                  <a href="Login.aspx" class="link">
                      <asp:Label ID="login_button" runat="server" Text="Login / Sign Up" CssClass="link"></asp:Label>
                  </a>
              </div>
          </div>


       </div>
        <div class="content">
            <div class="navigation-buttons-container">

                <asp:Button ID="Button_ManageBook" runat="server" Text="Books" CssClass="nav-buttons" OnClick="Button_Click_ManageBook" />
                <asp:Button ID="Button_ManageUser" runat="server" Text="User" CssClass="nav-buttons" OnClick="Button_Click_ManageUser" />
                <asp:Button ID="Button_CheckIn" runat="server" Text="Check In" CssClass="nav-buttons" OnClick="Button_Click_CheckIn" />
                <asp:Button ID="Button_CheckOut" runat="server" Text="Check Out" CssClass="nav-buttons" OnClick="Button_Click_CheckOut" />
                <asp:Button ID="Button_Notification" runat="server" Text="Notification" CssClass="nav-buttons" OnClick="Button_Click_Notification" />


            </div>
            <div class="multiview">

                <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                    <!--
                        0 - 3: manage book
                            0: list all
                            1: view info
                            2: edit info
                            3: add new
                        4 - 6: manage user
                            4: list all
                            5: view info
                            6: edit info
                            7: add new info
                        8    : check in (return book)
                        9    : check out (borrow book)
                        10    : notification (maybe can add one more, to use for editing notification)
                        -->
                    <asp:View ID="View0" runat="server">
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchBook" runat="server" Wrap="False" Height="33px" Width="227px"></asp:TextBox>
                            <asp:Button ID="Button_SearchBook" runat="server" OnClick="Button_Click_SearchBook" Text="Search" />
                            <asp:Button ID="Button_AddNewBook0" runat="server" OnClick="Button_Click_AddNewBook" Text="Add New Book" />
                            <br />
                            <asp:GridView ID="GridView_BookList" runat="server" ForeColor="Black" AutoGenerateColumns="False" OnRowCommand="Button_Click_ViewBook">

                                <Columns>
                                    <asp:TemplateField HeaderText="Book ID">
                                        <ItemTemplate >
                                            <asp:Label ID="BOOK_ID" runat="server" Text='<%# Bind("bookId")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Book Name">
                                        <ItemTemplate >
                                            <asp:Label ID="BOOK_NAME" runat="server" Text='<%# Bind("bookName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:Button ID="Button_Edit" runat="server" Text="View" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                
                            </asp:GridView>
                        </div> 
                    </asp:View>
                    <asp:View ID="View1" runat="server">
                        <div class="view-container">
                            <div class="content-container">
                                <div class="left-container">
                                    <asp:Label ID="Label_TitleText1" runat="server" CssClass="labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:Label ID="Label_Title" runat="server" Text="*Title*" CssClass="labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_DescriptionText1" runat="server" Text="Description:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label_Description" runat="server" Text="*Description*" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ImageText1" runat="server" Text="Image" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image_BookCover" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label_AuthorText1" runat="server" CssClass="labels" Text="Author:"></asp:Label>
                                    <br />
                                    <asp:Label ID="label_Author" runat="server" CssClass="labels" Text="*Author*"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_PublisherText1" runat="server" CssClass="labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:Label ID="label_Publisher" runat="server" Text="*Publisher*" CssClass="labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_PublishDateText1" runat="server" Text="Publish Date:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label_PublishDate" runat="server" Text="*Publish date*" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_RatingText1" runat="server" Text="Rating:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_Rating" runat="server" CssClass="labels" Text="*Rating*"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_LanguageText1" runat="server" CssClass="labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_Language" runat="server" CssClass="labels" Text="*Language*"></asp:Label>
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="Label_ISBNText1" runat="server" CssClass="labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:Label ID="Label_ISBN" runat="server" Text="*ISBN*" CssClass="labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelAvailabilityText1" runat="server" Text="Availability:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label_Availability" runat="server" Text="*Availability*" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ShelfIDText1" runat="server" Text="Shelf ID:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_ShelfID" runat="server" CssClass="labels" Text="*Shelf ID*"></asp:Label>
                                    <br />
                                
                                </div>
                            </div>
                            <div class="action-buttons-container">
                                <asp:Button ID="Button_BackToManageBook" runat="server" OnClick="Button_Click_BackToManageBook" Text="Back" />
                                <asp:Button ID="Button_DeleteBook" runat="server" OnClick="Button_Click_DeleteBook" Text="Delete Book" />
                                <asp:Button ID="Button_EditBook" runat="server" Text="Edit Book" OnClick="Button_Click_EditBook" />
                            </div>
                            
                        </div>

                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div class="view-container">
                            <div class="content-container">
                                <div class="left-container">
                                    <asp:Label ID="Label_TitleText2" runat="server" CssClass="labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Title2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Description2" runat="server" Text="Description:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox_Description2" runat="server" Height="208px" Width="417px"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Image2" runat="server" Text="Image" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image_Book2" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                    <br />
                                    <asp:Button ID="Button_ChooseImage" runat="server" Text="Choose Image" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label_AuthorText2" runat="server" CssClass="labels" Text="Author:"></asp:Label>

                                    <br />
                                    <asp:TextBox ID="TextBox_Author2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Publisher2" runat="server" CssClass="labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Publisher2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_PublishDateText2" runat="server" Text="Publish Date:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox_PublishDate2" runat="server"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_RatingText2" runat="server" Text="Rating:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_Rating2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_LanguageText2" runat="server" CssClass="labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_Language2" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="LabelISBNText2" runat="server" CssClass="labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBoxISBN2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_AvailabilityText2" runat="server" Text="Availability:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox_Availability2" runat="server"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ShelfIDText2" runat="server" Text="Shelf ID:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_ShelfID2" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                            </div>
                            <div class="action-buttons-container">
                                <asp:Button ID="Button_DiscardChanges_Book" runat="server" Text="Discard Changes" OnClick="Button_Click_DiscardChangesBook" />
                                <asp:Button ID="Button_SaveChanges_Book" runat="server" Text="Save Changes" OnClick="Button_Click_SaveChangesBook"/>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <div class="view-container">
                            <div class="content-container">
                                <div class="left-container">
                                    <asp:Label ID="Label24" runat="server" CssClass="labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label26" runat="server" Text="Description:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox20" runat="server" Height="208px" Width="417px"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label29" runat="server" Text="Image" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                    <br />
                                    <asp:Button ID="Button16" runat="server" Text="Choose Image" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label31" runat="server" CssClass="labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label33" runat="server" Text="Publish Date:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label35" runat="server" Text="Rating:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label37" runat="server" CssClass="labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="Label39" runat="server" CssClass="labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label41" runat="server" Text="Availability:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label42" runat="server" Text="Shelf ID:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                            </div>
                            <div class="action-buttons-container">
                                <asp:Button ID="Button12" runat="server" Text="Abort Adding New Book" OnClick="Button_Click_AbortAddingNewBook" />
                                <asp:Button ID="Button14" runat="server" Text="Add New Book" OnClick="Button_Click_AddingNewBook" />
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchUser" runat="server" Wrap="False" Height="33px" Width="227px"></asp:TextBox>
                            <asp:Button ID="Button_SearchUser" runat="server" OnClick="Button_Click_SearchUser" Text="Search" />
                            <br />
                            <asp:GridView ID="GridView_UserList" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:TemplateField HeaderText="User ID">
                                        <ItemTemplate >
                                            <asp:Label ID="USER_ID" runat="server" Text='<%# Bind("memberId")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Username">
                                        <ItemTemplate >
                                            <asp:Label ID="USER_NAME" runat="server" Text='<%# Bind("memberName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:Button ID="Button_Edit" runat="server" Text="View" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <div class="view-container">
                            <asp:Label ID="Label_view">view user</asp:Label>
                        </div>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <div class="view-container">
                            <asp:Label ID="Label_edit">view user</asp:Label>
                        </div>
                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <div class="view-container">
                            <asp:Label ID="Label_add">view user</asp:Label>
                        </div>
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <asp:Label ID="Label20" runat="server" Text="check in page"></asp:Label>
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchBorrowedBookBasedOnUser" runat="server"></asp:TextBox>
                            <asp:Button ID="Button_SearchBorrowedBookBasedOnUser" runat="server" Text="Button" />
                            <div id="checkIn_result" runat="server">
                                <asp:CheckBoxList ID="CheckBoxList_CheckIn" runat="server">
                                    
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View9" runat="server">
                        <asp:Label ID="Label21" runat="server" Text="check out page"></asp:Label>
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchBookToBeBorrowed" runat="server"></asp:TextBox>
                            <asp:Button ID="Button_ConfirmedBookToBeBorrowed" runat="server" Text="Button" />
                        </div>
                    </asp:View>
                    <asp:View ID="View10" runat="server">
                        <asp:Label ID="Label22" runat="server" Text="manage notification page"></asp:Label>
                        <div class="view-container">
                            <asp:Button ID="Button_CreateNotification" runat="server" Text="Create Notification" OnClick="Button18_Click" />
                            <asp:Button ID="Button_ManageNotification" runat="server" Text="Manage Notification" OnClick="Button17_Click" />
                            <br />
                            <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                                <asp:View ID="View11" runat="server">
                                    <asp:Label ID="Label43" runat="server" CssClass="labels" Text="Create Notif"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label45" runat="server" CssClass="labels" Text="Message Title"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label46" runat="server" CssClass="labels" Text="Message Content"></asp:Label>
                                    <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label47" runat="server" CssClass="labels" Text="Temp Label"></asp:Label>
                                    <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                        <asp:ListItem>All Users</asp:ListItem>
                                        <asp:ListItem>Users Only</asp:ListItem>
                                        <asp:ListItem>Librarian Only</asp:ListItem>
                                        <asp:ListItem>Specified User</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Button ID="Button_SendNotification" runat="server" Text="Send Notification" />
                                    <br />
                                </asp:View>
                                <asp:View ID="View12" runat="server">

                                    <asp:Label ID="Label44" runat="server" CssClass="labels" Text="Manage Notif"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:GridView ID="GridView1" runat="server">
                                    </asp:GridView>

                                </asp:View>
                            </asp:MultiView>
                        </div>
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
