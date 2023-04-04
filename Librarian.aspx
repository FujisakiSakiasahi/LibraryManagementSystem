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
                  <asp:Image ID="Image5" runat="server" CssClass="user-image" ImageUrl="~/images/unknown.png" />
              </div>
          </div>


       </div>
        <div class="content">
            <div class="navigation-buttons-container">

                <asp:Button ID="Button_ManageBook" runat="server" Text="Books" CssClass="side-nav-buttons" OnClick="Button_Click_ManageBook" />
                <asp:Button ID="Button_ManageUser" runat="server" Text="User" CssClass="side-nav-buttons" OnClick="Button_Click_ManageUser" />
                <asp:Button ID="Button_CheckIn" runat="server" Text="Check In" CssClass="side-nav-buttons" OnClick="Button_Click_CheckIn" />
                <asp:Button ID="Button_CheckOut" runat="server" Text="Check Out" CssClass="side-nav-buttons" OnClick="Button_Click_CheckOut" />
                <asp:Button ID="Button_Notification" runat="server" Text="Notification" CssClass="side-nav-buttons" OnClick="Button_Click_Notification" />


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
                        <asp:Label ID="Label1" runat="server" Text="Manage Books"></asp:Label>
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchBook" runat="server" Wrap="False" Height="33px" CssClass="search-bar"></asp:TextBox>
                            <asp:Button ID="Button_SearchBook" runat="server" OnClick="Button_Click_SearchBook" Text="Search" CssClass="search-button" />
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
                                            <asp:Button ID="Button_View" runat="server" Text="View" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>"/>
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
                                    <asp:Label ID="Label_BookID" runat="server" Text="" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_TitleText1" runat="server" CssClass="title-labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:Label ID="Label_Title" runat="server" Text="*Title*" CssClass="desc-labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_DescriptionText1" runat="server" Text="Description:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label_Description" runat="server" Text="*Description*" CssClass="desc-labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ImageText1" runat="server" Text="Image:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    
                                    <asp:Image ID="Image_BookCover" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label_AuthorText1" runat="server" CssClass="title-labels" Text="Author:"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_Author" runat="server" CssClass="desc-labels" Text="*Author*"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_PublisherText1" runat="server" CssClass="title-labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:Label ID="Label_Publisher" runat="server" Text="*Publisher*" CssClass="desc-labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_PublishDateText1" runat="server" Text="Publish Date:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label_PublishDate" runat="server" Text="*Publish date*" CssClass="desc-labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_RatingText1" runat="server" Text="Rating:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_Rating" runat="server" CssClass="desc-labels" Text="*Rating*"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_LanguageText1" runat="server" CssClass="title-labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_Language" runat="server" CssClass="desc-labels" Text="*Language*"></asp:Label>
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="Label_ISBNText1" runat="server" CssClass="title-labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:Label ID="Label_ISBN" runat="server" Text="*ISBN*" CssClass="desc-labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="LabelAvailabilityText1" runat="server" Text="Availability:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label_Availability" runat="server" Text="*Availability*" CssClass="desc-labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ShelfIDText1" runat="server" Text="Shelf ID:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_ShelfID" runat="server" CssClass="desc-labels" Text="*Shelf ID*"></asp:Label>
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
                                    <asp:Label ID="Label_BookID2" runat="server" Text="" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_TitleText2" runat="server" CssClass="title-labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Title2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Description2" runat="server" Text="Description:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox_Description2" runat="server" Height="208px" Width="417px" TextMode="MultiLine"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Image2" runat="server" Text="Image" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image_Book2" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                    <br />
                                    <asp:Button ID="Button_ChooseImage" runat="server" Text="Choose Image" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label_AuthorText2" runat="server" CssClass="title-labels" Text="Author:"></asp:Label>

                                    <br />
                                    <asp:TextBox ID="TextBox_Author2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Publisher2" runat="server" CssClass="title-labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Publisher2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_PublishDateText2" runat="server" Text="Publish Date:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:Calendar ID="Calendar_PublishDate2" runat="server"></asp:Calendar>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_RatingText2" runat="server" Text="Rating:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DropDownList_Rating2" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_LanguageText2" runat="server" CssClass="title-labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_Language2" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="LabelISBNText2" runat="server" CssClass="title-labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_ISBN2" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_AvailabilityText2" runat="server" Text="Availability:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:CheckBox ID="CheckBox_Availability2" runat="server" />
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ShelfIDText2" runat="server" Text="Shelf ID:" CssClass="title-labels"></asp:Label>
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
                                    <asp:Label ID="Label_BookID3" runat="server" Text="" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_Title3" runat="server" CssClass="title-labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Title3" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Description3" runat="server" Text="Description:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox_Description3" runat="server" Height="208px" Width="417px" TextMode="MultiLine"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Image3" runat="server" Text="Image" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                    <br />
                                    <asp:Button ID="Button_Image3" runat="server" Text="Choose Image" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label_Author3" runat="server" CssClass="title-labels" Text="Author:"></asp:Label>

                                    <br />
                                    <asp:TextBox ID="TextBox_Author3" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Publisher3" runat="server" CssClass="title-labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Publisher3" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_PublishDate3" runat="server" Text="Publish Date:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:Calendar ID="Calendar_PublishDate3" runat="server"></asp:Calendar>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Rating3" runat="server" CssClass="title-labels" Text="Rating:"></asp:Label>
                                    <br />
                                    <asp:DropDownList ID="DropDownList_Rating3" runat="server">
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Language3" runat="server" CssClass="title-labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_Language3" runat="server"></asp:TextBox>
                                
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="Label_ISBN3" runat="server" CssClass="title-labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_ISBN3" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Availability3" runat="server" Text="Availability:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:CheckBox ID="CheckBox_Availability3" runat="server" />
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ShelfID3" runat="server" Text="Shelf ID:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_ShelfID3" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                            </div>
                            <div class="action-buttons-container">
                                <asp:Button ID="Button12" runat="server" Text="Back" OnClick="Button_Click_AbortAddingNewBook" />
                                <asp:Button ID="Button14" runat="server" Text="Add New Book" OnClick="Button_Click_AddingNewBook" />
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchUser" runat="server" Wrap="False" Height="33px" CssClass="search-bar"></asp:TextBox>
                            <asp:Button ID="Button_SearchUser" runat="server" OnClick="Button_Click_SearchUser" Text="Search" CssClass="search-button" />
                            <asp:Button ID="Button_AddUser" runat="server" Text="Add New User" />
                            <br />
                            <asp:GridView ID="GridView_UserList" runat="server" ForeColor="Black" AutoGenerateColumns="False">
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
                            <div class="left-container">
                                <asp:Label ID="Label_MemberName" runat="server" CssClass="title-labels" Text="Name:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_MemberName2" runat="server" CssClass="desc-labels" Text="*Name*"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label_Email" runat="server" CssClass="title-labels" Text="Email:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Email2" runat="server" CssClass="desc-labels" Text="*Email*"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label_Notification" runat="server" CssClass="title-labels" Text="Notification:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Notification2" runat="server" CssClass="desc-labels" Text="*Notification*"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label_Librarian" runat="server" CssClass="title-labels" Text="Librarian:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Librarian2" runat="server" CssClass="desc-labels" Text="*Librarian*"></asp:Label>
                            </div>
                            <asp:Button ID="Button_UserBack" runat="server" Text="Back" />
                            <asp:Button ID="Button_DeleteUser" runat="server" Text="Delete User" />
                            <asp:Button ID="Button_EditUser" runat="server" Text="Edit User" />
                        </div>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <div class="view-container">
                            <div class="left-container">
                                <asp:Label ID="Label_MemberName3" runat="server" CssClass="title-labels" Text="Name:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Email3" runat="server" CssClass="title-labels" Text="Email:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Notification3" runat="server" CssClass="title-labels" Text="Notification:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Notification4" runat="server" CssClass="desc-labels" Text="*Notification*"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label_Librarian3" runat="server" CssClass="title-labels" Text="Librarian:"></asp:Label>
                                <br />
                                <asp:RadioButton ID="RadioButton_LibrarianNo" runat="server" CssClass="desc-labels" Text="No" />
                                <asp:RadioButton ID="RadioButton_LibrarianYes" runat="server" CssClass="desc-labels" Text="Yes" />
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="Discard Changes" />
                            <asp:Button ID="Button2" runat="server" Text="Save Changes" />
                        
                        </div>
                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <div class="view-container">
                            <div class="left-container">
                                <asp:Label ID="Label_MemberName4" runat="server" CssClass="title-labels" Text="Name:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Email4" runat="server" CssClass="title-labels" Text="Email:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Notification5" runat="server" CssClass="title-labels" Text="Notification:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Notification6" runat="server" CssClass="desc-labels" Text="*Notification*"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label_Librarian4" runat="server" CssClass="title-labels" Text="Librarian:"></asp:Label>
                                <br />
                                <asp:RadioButton ID="RadioButton_LibrarianNo0" runat="server" CssClass="desc-labels" Text="No" />
                                <asp:RadioButton ID="RadioButton_LibrarianYes0" runat="server" CssClass="desc-labels" Text="Yes" />
                            </div>
                            <asp:Button ID="Button3" runat="server" Text="Back" />
                            <asp:Button ID="Button4" runat="server" Text="Create New User" />
                        
                        </div>
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <asp:Label ID="Label20" runat="server" Text="check in page"></asp:Label>
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchBorrowedBookBasedOnUser" runat="server" CssClass="search-bar"></asp:TextBox>
                            <asp:Button ID="Button_SearchBorrowedBookBasedOnUser" runat="server" Text="Button" CssClass="search-button" />
                            <div id="checkIn_result" runat="server">
                                <asp:CheckBoxList ID="CheckBoxList_CheckIn" runat="server">
                                    
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View9" runat="server">
                        <asp:Label ID="Label21" runat="server" Text="check out page"></asp:Label>
                        <div class="view-container">
                            <asp:TextBox ID="Textbox_SearchBookToBeBorrowed" runat="server" CssClass="search-bar"></asp:TextBox>
                            <asp:Button ID="Button_ConfirmedBookToBeBorrowed" runat="server" Text="Button" CssClass="search-button" />
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
