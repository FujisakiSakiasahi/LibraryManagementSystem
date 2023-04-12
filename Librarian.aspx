﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Librarian.aspx.cs" Inherits="LibraryManagementSystem.Librarian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="CSS/Header.css" /> 
    <link rel="stylesheet" href="CSS/Footer.css" /> 
    <link rel="stylesheet" href="CSS/Librarian/Content.css" />
     <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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

          <div class="header-login-container">
              <div class="header-login">
                  <div class="d-flex align-items-center justify-content-end">
                      <div class="dropdown text-end">
                          <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                              <img src="/images/user.jpg" alt="mdo" width="40" height="40" class="rounded-circle" />
                          </a>
                          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                              <li><p id="username" runat="server" class="dropdown-item"></p></li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                              <li><a class="dropdown-item" href="Notification.aspx">Notification</a></li>
                              <li><a class="dropdown-item" href="Request.aspx">Request a book</a></li>
                              <li><a class="dropdown-item" href="Setting.aspx">Setting</a></li>
                              <li>
                                  <hr class="dropdown-divider" />
                              </li>
                              <li><a class="dropdown-item" href="#" id="Logout_Button" runat="server" onserverclick="Logout_Function">Sign out</a></li>
                          </ul>
                      </div>
                  </div>
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
                <asp:Button ID="Button2" runat="server" Text="Requests" CssClass="side-nav-buttons" OnClick="Button_Click_RequestedBooks" />
                <asp:Button ID="Button_Overdue" runat="server" Text="Overdue" CssClass="side-nav-buttons" OnClick="Button_Click_ManageOverdue" />

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
                        11  : requests
                        12  : overdue
                        -->
                    <asp:View ID="View0" runat="server">
                        <div class="view-container container-fluid">

                            <!--Search Bar-->
                            <div class="view-container container-fluid">
                                <div class="container">
                                     <div class="row">
                                    <div class="col-11">      
                                            <asp:TextBox ID="Textbox_SearchBook" runat="server" Wrap="False" Height="33px" CssClass="search-bar" TextMode="Search"></asp:TextBox>
                                    </div>
                                    <div class="col-1">
                                         <asp:Button ID="Button_SearchBook" runat="server" OnClick="Button_Click_SearchBook" Text="Search" CssClass="search-button" />                                        
                                    </div>             
                                </div>
                               </div> 
                                <div class="container">
                                    <asp:Button ID="Button_AddNewBook0" runat="server" OnClick="Button_Click_AddNewBook" Text="Add New Book" />
                                     <br />
                                </div>
                                <div class="container">
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
                            </div>
                        </div>
                        
                    </asp:View>
                    <asp:View ID="View1" runat="server">
                        <div class="view-container container-fluid">
                            <div class="content-container">
                                <div class="row">
                                <div class="col-4">
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
                                <div class="col-4">
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
                                <div class="col-4">
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
                                
                                    <br />
                                    <asp:Label ID="Label_BorrowedBy" runat="server" Text="Borrowed By:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label_BorrowedBy2" runat="server" CssClass="desc-labels" Text="*Member Name*"></asp:Label>
                                </div>
                              </div>
                            </div>
                            <div class="action-buttons-container">
                                <div class="row">
                                    <div class="col-9">
       
                                     </div>
                                        <div class="col-3">
                                        <asp:Button ID="Button_BackToManageBook" runat="server" OnClick="Button_Click_BackToManageBook" Text="Back" />
                                        <asp:Button ID="Button_DeleteBook" runat="server" OnClick="Button_Click_DeleteBook" Text="Delete Book" />
                                        <asp:Button ID="Button_EditBook" runat="server" Text="Edit Book" OnClick="Button_Click_EditBook" />
                                  </div>
                                </div>     
                            </div> 
                        </div>

                    </asp:View>

                    <asp:View ID="View2" runat="server">
                        <div class="view-container container-fluid">
                            <div class="content-container">
                                <div class="row">
                                    <div class="col-6">
                                    <asp:Label ID="Label_BookID2" runat="server" Text="" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_TitleText2" runat="server" CssClass="title-labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Title2" runat="server" MaxLength="50"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Description2" runat="server" Text="Description:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox_Description2" runat="server" Height="208px" Width="417px" TextMode="MultiLine" MaxLength="1000"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Image2" runat="server" Text="Image" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image_Book2" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                    <br />
                                    <asp:FileUpload ID="FileUpload_Image" runat="server" />
                                    <br />
                                
                                </div>
                                <div class="col-5">
                                    <asp:Label ID="Label_AuthorText2" runat="server" CssClass="title-labels" Text="Author:"></asp:Label>

                                    <br />
                                    <asp:TextBox ID="TextBox_Author2" runat="server" MaxLength="50"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Publisher2" runat="server" CssClass="title-labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Publisher2" runat="server" MaxLength="50"></asp:TextBox>
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
                                    <asp:TextBox ID="TextBox_Language2" runat="server" MaxLength="10"></asp:TextBox>
                                    <br />
                                
                                </div>
                                <div class="col-1">
                                    <asp:Label ID="LabelISBNText2" runat="server" CssClass="title-labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_ISBN2" runat="server" TextMode="Number"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_AvailabilityText2" runat="server" Text="Availability:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:CheckBox ID="CheckBox_Availability2" runat="server" />
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ShelfIDText2" runat="server" Text="Shelf ID:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_ShelfID2" runat="server" TextMode="Number"></asp:TextBox>
                                    <br />
                                 </div>
                                </div>
                               </div>
                            <div class="action-buttons-container">
                                <div class="row">
                                    <div class="col-9">
       
                                     </div>
                                 <div class="col-3">
                                <asp:Button ID="Button_DiscardChanges_Book" runat="server" Text="Discard Changes" OnClick="Button_Click_DiscardChangesBook" />
                                <asp:Button ID="Button_SaveChanges_Book" runat="server" Text="Save Changes" OnClick="Button_Click_SaveChangesBook"/>
                            </div>
                           </div>
                         </div>
                     </div>      
                    </asp:View>

                    <asp:View ID="View3" runat="server">
                        <div class="view-container container-fluid">
                            <div class="content-container">
                                <div class="col-4">
                                    <asp:Label ID="Label_BookID3" runat="server" Text="" Visible="False"></asp:Label>
                                    <asp:Label ID="Label_Title3" runat="server" CssClass="title-labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Title3" runat="server" MaxLength="50"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Description3" runat="server" Text="Description:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox_Description3" runat="server" Height="208px" Width="417px" TextMode="MultiLine" MaxLength="1000"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Image3" runat="server" Text="Image" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                    <br />
                                    <asp:FileUpload ID="FileUpload_Image2" runat="server" />
                                    <br />
                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label_Author3" runat="server" CssClass="title-labels" Text="Author:"></asp:Label>

                                    <br />
                                    <asp:TextBox ID="TextBox_Author3" runat="server" MaxLength="50"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Publisher3" runat="server" CssClass="title-labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_Publisher3" runat="server" MaxLength="50"></asp:TextBox>
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
                                    <asp:TextBox ID="TextBox_Language3" runat="server" MaxLength="10"></asp:TextBox>
                                
                                    <br />
                                
                                </div>
                                <div class="col-4">
                                    <asp:Label ID="Label_ISBN3" runat="server" CssClass="title-labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox_ISBN3" runat="server" TextMode="Number"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_Availability3" runat="server" Text="Availability:" CssClass="title-labels"></asp:Label>
                                
                                    <br />
                                    <asp:CheckBox ID="CheckBox_Availability3" runat="server" />
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ShelfID3" runat="server" Text="Shelf ID:" CssClass="title-labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_ShelfID3" runat="server" TextMode="Number"></asp:TextBox>
                                    <br />
                                
                                </div>
                            </div>
                            <div class="action-buttons-container">
                                <div class="row">
                                    <div class="col-9">
       
                                     </div>
                                    <div class="col-3">
                                <asp:Button ID="Button12" runat="server" Text="Back" OnClick="Button_Click_AbortAddingNewBook" />
                                <asp:Button ID="Button14" runat="server" Text="Add New Book" OnClick="Button_Click_AddingNewBook" />
                            </div>
                           </div>  
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <div class="view-container">
                            <asp:Panel runat="server" DefaultButton="Button_SearchUser">
                                <asp:TextBox ID="Textbox_SearchUser" runat="server" Wrap="False" Height="33px" CssClass="search-bar" TextMode="Search"></asp:TextBox>
                                <asp:Button ID="Button_SearchUser" runat="server" OnClick="Button_Click_SearchUser" Text="Search" CssClass="search-button" />
                            </asp:Panel>
                            <asp:Button ID="Button_AddUser" runat="server" Text="Add New User" OnClick="Button_Click_AddUser"/>
                            <br />
                            <asp:GridView ID="GridView_UserList" runat="server" ForeColor="Black" AutoGenerateColumns="False" OnRowCommand="Button_Click_ViewUser">
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
                                <asp:Label ID="Label_MemberID" runat="server" CssClass="desc-labels" Text="*ID*" Visible="False"></asp:Label>
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
                                <asp:Label ID="Label_Password" runat="server" CssClass="title-labels" Text="Password:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Password2" runat="server" CssClass="desc-labels" Text="*Password*"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label_PhoneNumber" runat="server" CssClass="title-labels" Text="Phone Number:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_PhoneNumber2" runat="server" CssClass="desc-labels" Text="*Phone Number*"></asp:Label>
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
                            <asp:Button ID="Button_UserBack" runat="server" Text="Back" OnClick="Button_Click_ManageUser"/>
                            <asp:Button ID="Button_DeleteUser" runat="server" Text="Delete User" OnClick="Button_Click_DeleteUser" />
                            <asp:Button ID="Button_EditUser" runat="server" Text="Edit User" OnClick="Button_Click_EditUser" />
                        </div>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <div class="view-container">
                            <div class="left-container">
                                <asp:Label ID="Label_MemberID2" runat="server" CssClass="desc-labels" Text="*ID*" Visible="False"></asp:Label>
                                <asp:Label ID="Label_MemberName3" runat="server" CssClass="title-labels" Text="Name:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_MemberName" runat="server" MaxLength="50"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Email3" runat="server" CssClass="title-labels" Text="Email:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_Email" runat="server" TextMode="Email" MaxLength="30"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Password3" runat="server" CssClass="title-labels" Text="Password:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_Password" runat="server" MaxLength="50"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_PhoneNumber3" runat="server" CssClass="title-labels" Text="Phone Number:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_PhoneNumber" runat="server" TextMode="Number"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Notification3" runat="server" CssClass="title-labels" Text="Notification:"></asp:Label>
                                <br />
                                <asp:Label ID="Label_Notification4" runat="server" CssClass="desc-labels" Text="*Notification*"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="Label_Librarian3" runat="server" CssClass="title-labels" Text="Librarian:"></asp:Label>
                                <br />
                                <asp:CheckBox ID="CheckBox_Librarian" runat="server" />
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="Discard Changes" OnClick="Button_Click_DiscardChangesUser" />
                            <asp:Button ID="Button_UserSave" runat="server" Text="Save Changes" OnClick="Button_Click_SaveChangesUser" />
                        
                        </div>
                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <div class="view-container">
                            <div class="left-container">
                                <asp:Label ID="Label_MemberID3" runat="server" Text="Label" Visible="False"></asp:Label>
                                <asp:Label ID="Label_MemberName4" runat="server" CssClass="title-labels" Text="Name:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_MemberName3" runat="server" MaxLength="50"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Email4" runat="server" CssClass="title-labels" Text="Email:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_Email3" runat="server" Width="190px" TextMode="Email" MaxLength="30"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Password4" runat="server" CssClass="title-labels" Text="Password:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_Password3" runat="server" MaxLength="50"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_PhoneNumber4" runat="server" CssClass="title-labels" Text="Phone Number:"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox_PhoneNumber3" runat="server" TextMode="Number"></asp:TextBox>
                                <br />
                                <br />
                                <asp:Label ID="Label_Notification5" runat="server" CssClass="title-labels" Text="Notification:"></asp:Label>
                                <br />
                                <asp:CheckBox ID="CheckBox_Notification2" runat="server" />
                                <br />
                                <br />
                                <asp:Label ID="Label_Librarian4" runat="server" CssClass="title-labels" Text="Librarian:"></asp:Label>
                                <br />
                                <asp:CheckBox ID="CheckBox_Librarian2" runat="server" />
                            </div>
                            <asp:Button ID="Button3" runat="server" Text="Back" OnClick="Button_Click_AbortNewUser"/>
                            <asp:Button ID="Button4" runat="server" Text="Create New User" OnCLick="Button_Click_AddingNewUser"/>
                        
                        </div>
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <asp:Label ID="Label20" runat="server" Text="check in page"></asp:Label>
                        <div class="view-container">
                            <asp:Panel runat="server" DefaultButton="Button_SearchBorrowedBookBasedOnUser">
                                <asp:TextBox ID="Textbox_SearchBorrowedBookBasedOnUser" runat="server" CssClass="search-bar" TextMode="Search"></asp:TextBox>
                                <asp:Button ID="Button_SearchBorrowedBookBasedOnUser" runat="server" Text="Button" CssClass="search-button" OnClick="Button_CLick_SearchForBorrowedBooks"  />
                            </asp:Panel>
                            <asp:ListBox ID="ListBox_CheckIn" runat="server" OnSelectedIndexChanged="ListBox_CheckIn_SelectedIndexChanged" AutoPostBack="True" ></asp:ListBox>
                            <div id="checkIn_result" runat="server" style="text-align: left; margin: 0 auto; display: block"> <%--can we center this somehow--%>
                                <asp:CheckBoxList ID="CheckBoxList_CheckIn" ForeColor="Black" runat="server"/>
                                <asp:Label ID="Label_StoreUser" runat="server" Text="Label" Visible="False"></asp:Label>
                            </div>
                            <asp:Button ID="Button_CheckInBooks" runat="server" Text="Check In" OnClick="Button_Click_CheckInBooks" Visible="False" />
                        </div>
                    </asp:View>
                    <asp:View ID="View9" runat="server">
                        <asp:Label ID="Label21" runat="server" Text="check out page"></asp:Label>
                        <div class="view-container">
                            <div class="content-container">
                                <div class="user-container">
                                    <div class="top-container">
                                        <asp:Panel runat="server" DefaultButton="Button_SearchUserCheckOut">
                                            <asp:TextBox ID="TextBox_SearchUserCheckOut" runat="server"></asp:TextBox>
                                            <asp:Button ID="Button_SearchUserCheckOut" runat="server" Text="Search" OnClick="Button_Click_SearchUserCheckOut"/>
                                        </asp:Panel>
                                    </div>
                                    <div class="bottom-container">
                                        <asp:ListBox ID="ListBox_SearchedUserCheckOut" runat="server"/>
                                    </div>

                                </div>
                                <div class="book-container">
                                    <div class="top-container">
                                        <asp:Panel runat="server" DefaultButton="Button_SearchBookCheckOut">
                                             <asp:TextBox ID="TextBox_SearchBookCheckOut" runat="server"></asp:TextBox>
                                            <asp:Button ID="Button_SearchBookCheckOut" runat="server" Text="Button" OnClick="Button_Click_SearchBookCheckOut" />
                                        </asp:Panel>
                                    </div>
                                    <div class="bottom-container">
                                        
                                        <asp:ListBox ID="ListBox_SearchedBookCheckOut" runat="server"/>
                                    </div>
                                </div>
                            </div>
                            <div class="check-out-button-container">
                                <asp:Label ID="Label_ConfirmCheckOut" runat="server" ForeColor="Green" Text="Books Have Been Successfully Checked Out" Visible="False"></asp:Label>
                                <asp:Button ID="Button_ConfirmCheckOut" runat="server" Text="Confirm Checkout" OnClick="Button_Click_ConfirmCheckOut"/>
                                
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View10" runat="server">
                        <asp:Label ID="Label22" runat="server" Text="manage notification page"></asp:Label>
                        <div class="view-container">
                            <asp:Button ID="Button_CreateNotification" runat="server" Text="Create Notification" OnClick="Button_Click_CreateNotif" Enabled="False" />
                            <asp:Button ID="Button_ManageNotification" runat="server" Text="Manage Notification" OnClick="Button_Click_ManageNotif" />
                            <br />
                            <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                                <asp:View ID="View11" runat="server">
                                    <asp:Label ID="Label_CreateNotif" runat="server" CssClass="labels" Text="Create Notif"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_NotifMsgTitle" runat="server" CssClass="title-labels" Text="Message Title"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_NotifMsgTitle" runat="server" Height="47px" TextMode="MultiLine" Width="1086px" MaxLength="500"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_NotifMsgContent" runat="server" CssClass="title-labels" Text="Message Content"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_NotifMsgContent" runat="server" Height="307px" TextMode="MultiLine" Width="1154px" MaxLength="1024"></asp:TextBox>
                                    <br />
                                    <br />
                                    <br />
                                    <asp:RadioButtonList ID="RadioButtonList_NotifUserSelect" runat="server" ForeColor="Black" OnSelectedIndexChanged="RadioButtonList_NotifUserSelect_SelectedIndexChanged" AutoPostBack="True"> <%--center this pls @jhunkit--%>
                                        <asp:ListItem Selected="True" Value="0" ForeColor="Black">All Users</asp:ListItem> <%--id = 0--%>
                                        <asp:ListItem Value="1" ForeColor="Black">Specified User</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="Label_NotifSelectMember" runat="server" Text="Member ID:" CssClass="title-labels" Visible="False"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox_NotifSelectMember" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label_ConfirmSendNotification" ForeColor="Green" Visible="false" runat="server" Text="Notification Sent!"></asp:Label>
                                    <br />
                                    <asp:Button ID="Button_SendNotification" runat="server" Text="Send Notification" OnClick="Button_SendNotification_Click" />
                                    <br />
                                </asp:View>
                                <asp:View ID="View12" runat="server">

                                    <asp:Label ID="Label44" runat="server" CssClass="labels" Text="Manage Notif"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:GridView ID="GridView_Notifications" runat="server" ForeColor="Black" OnRowCommand="Button_Click_RemoveNotif" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Notification ID">
                                                <ItemTemplate >
                                                    <asp:Label ID="NOTIF_ID" runat="server" Text='<%# Bind("notifId")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Notification Title">
                                                <ItemTemplate >
                                                    <asp:Label ID="NOTIF_TITLE" runat="server" Text='<%# Bind("notifTitle")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Receivers">
                                                <ItemTemplate>
                                                    <asp:Label ID="RECEIVERS" runat="server" Text='<%# Bind("memberId")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Operation">
                                                <ItemTemplate>
                                                    <asp:Button ID="Button_Remove_Notif" runat="server" Text="Remove" CommandName="Remove" CommandArgument="<%# Container.DataItemIndex %>"/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </asp:View>
                            </asp:MultiView>
                        </div>
                    </asp:View>
                    <asp:View ID="View13" runat="server">
                        <div class="view-container">
                            <div style="text-align: left; margin: 0 auto; display: block"> <%--can we center this somehow--%>
                            <asp:CheckBoxList ID="CheckBoxList_RequestedBooks" ForeColor="Black" runat="server"/> 
                            </div>
                            <asp:Label ID="Label_AddedRequestedBooks" ForeColor="Green" runat="server" Text="Removed Books" Visible="False"></asp:Label>
                            <asp:Button ID="Button_AddedRequestedBooks" runat="server" Text="Remove" OnClick="Button_Click_AddedRequestedBooks" />

                        </div>
                    </asp:View>
                    <asp:View ID="View14" runat="server">
                        <div class="view-container">
                            <asp:GridView ID="GridView_Overdue" runat="server" ForeColor="Black" AutoGenerateColumns="False" OnRowCommand="Button_Click_ClaimOverdue">

                                <Columns>
                                    <asp:TemplateField HeaderText="Borrow ID">
                                        <ItemTemplate >
                                            <asp:Label ID="BORROW_ID" runat="server" Text='<%# Bind("borrowId")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Book Name">
                                        <ItemTemplate >
                                            <asp:Label ID="BOOK_NAME" runat="server" Text='<%# Bind("bookName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Member Name">
                                        <ItemTemplate >
                                            <asp:Label ID="MEMBER_NAME" runat="server" Text='<%# Bind("memberName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Borrow Date">
                                        <ItemTemplate >
                                            <asp:Label ID="BORROW_DATE" runat="server" Text='<%# Bind("dateBorrowed")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Expected Date">
                                        <ItemTemplate >
                                            <asp:Label ID="EXPECT_DATE" runat="server" Text='<%# Bind("expectDate")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Days Late">
                                        <ItemTemplate >
                                            <asp:Label ID="LATE_DAYS" runat="server" Text='<%# Bind("daysLate")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Money Owed">
                                        <ItemTemplate >
                                            <asp:Label ID="MONEY_OWED" runat="server" Text='<%# Bind("moneyOwed")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Operation">
                                        <ItemTemplate>
                                            <asp:Button ID="Button_Claim" runat="server" Text="Claimed" CommandName="View" CommandArgument="<%# Container.DataItemIndex %>"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                
                            </asp:GridView>
                            <asp:Label ID="Label_ClaimedBooks" runat="server" ForeColor="Green" Text="Claimed Book" Visible="False"></asp:Label>
                        </div>
                    </asp:View>
                </asp:MultiView>

            </div>
           

        </div>
        <!--Footer-->

        <footer class="text-center text-lg-start bg-dark text-white">
            <!-- Section: Links  -->
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <!-- Grid row -->
                    <div class="row mt-3">
                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <!-- Content -->
                            <h6 class="text-uppercase fw-bold mb-4">
                                HamiShu LMS

                            </h6>
                            <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                            </p>
                        </div>

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Useful links
                            </h6>
                            <p>
                                <a href="Home.aspx" class="text-reset">Home</a>
                            </p>
                            <p>
                                <a href="Search.aspx" class="text-reset">Search</a>
                            </p>
                            <p>
                                <a href="AboutUs.aspx" class="text-reset">About Us</a>
                            </p>
                            <p>
                                <a href="FAQ.aspx" class="text-reset">FAQ</a>
                            </p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p>Jalan XXX, Taman XXX, 99999, City XXX, State XXX, Country XXX</p>
                            <p>XXX@example.com</p>
                            <p class="footer-text">+ 01 234 567 88</p>
                            <p>+ 01 234 567 89</p>
                        </div>
                        <!-- Grid column -->
                    </div>
                    <!-- Grid row -->
                </div>
            </section>
            <!-- Section: Links  -->

        </footer>
        <!-- Footer -->
    </form>
</body>
</html>