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
                    <asp:View ID="View0" runat="server">
                        <asp:TextBox ID="TextBox19" runat="server" Wrap="False"></asp:TextBox>
                        <asp:Button ID="Button17" runat="server" OnClick="Button17_Click" Text="Search" />
                        <br />
                        <asp:GridView ID="GridView1" runat="server">
                        </asp:GridView>
                    </asp:View>
                    <asp:View ID="View1" runat="server">
                        <div class="view-container">
                            <div class="content-container">
                                <div class="left-container">
                                    <asp:Label ID="Label2" runat="server" CssClass="labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:Label ID="label" runat="server" Text="*Title*" CssClass="labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text="Description:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label4" runat="server" Text="*Description*" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label51" runat="server" Text="Image" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label62" runat="server" CssClass="labels" Text="Author:"></asp:Label>
                                    <br />
                                    <asp:Label ID="label63" runat="server" CssClass="labels" Text="*Author*"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label61" runat="server" CssClass="labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:Label ID="label7" runat="server" Text="*Publisher*" CssClass="labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label8" runat="server" Text="Publish Date:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Text="*Publish date*" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label10" runat="server" Text="Rating:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label16" runat="server" CssClass="labels" Text="*Rating*"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label17" runat="server" CssClass="labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label18" runat="server" CssClass="labels" Text="*Language*"></asp:Label>
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="Label11" runat="server" CssClass="labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:Label ID="label12" runat="server" Text="*ISBN*" CssClass="labels"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label13" runat="server" Text="Availability:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:Label ID="Label14" runat="server" Text="*Availability*" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label15" runat="server" Text="Shelf ID:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Label ID="Label19" runat="server" CssClass="labels" Text="*Shelf ID*"></asp:Label>
                                    <br />
                                
                                </div>
                            </div>
                            <div class="action-buttons-container">
                                <asp:Button ID="Button18" runat="server" OnClick="Button18_Click" Text="Back" />
                                <asp:Button ID="Button7" runat="server" Text="Delete Book" />
                                <asp:Button ID="Button8" runat="server" Text="Edit Book" OnClick="Button8_Click" />
                                <asp:Button ID="Button9" runat="server" Text="Add New Book" OnClick="Button9_Click" />
                            </div>
                            
                        </div>

                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div class="view-container">
                            <div class="content-container">
                                <div class="left-container">
                                    <asp:Label ID="Label23" runat="server" CssClass="labels" Text="Title:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label25" runat="server" Text="Description:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox8" runat="server" Height="208px" Width="417px"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label27" runat="server" Text="Image" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/book.jpg" />
                                
                                    <br />
                                    <asp:Button ID="Button15" runat="server" Text="Choose Image" />
                                
                                </div>
                                <div class="center-container">
                                    <asp:Label ID="Label64" runat="server" CssClass="labels" Text="Author:"></asp:Label>

                                    <br />
                                    <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label28" runat="server" CssClass="labels" Text="Publisher:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label30" runat="server" Text="Publish Date:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label32" runat="server" Text="Rating:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label34" runat="server" CssClass="labels" Text="Language:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                                <div class="right-container">
                                    <asp:Label ID="Label36" runat="server" CssClass="labels" Text="ISBN:"></asp:Label>

                                    <br />

                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label38" runat="server" Text="Availability:" CssClass="labels"></asp:Label>
                                
                                    <br />
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                
                                    <br />
                                    <br />
                                    <asp:Label ID="Label40" runat="server" Text="Shelf ID:" CssClass="labels"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <br />
                                
                                </div>
                            </div>
                            <div class="action-buttons-container">
                                <asp:Button ID="Button5" runat="server" Text="Discard Changes" OnClick="Button5_Click" />
                                <asp:Button ID="Button11" runat="server" Text="Save Changes" />
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
                                <asp:Button ID="Button12" runat="server" Text="Abort Adding New Book" OnClick="Button12_Click" />
                                <asp:Button ID="Button14" runat="server" Text="Add New Book" />
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <div class="view-container">

                        </div>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <div class="view-container">

                        </div>
                    </asp:View>
                    <asp:View ID="View6" runat="server">
                        <div class="view-container">

                        </div>

                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <asp:Label ID="Label20" runat="server" Text="check in page"></asp:Label>
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <asp:Label ID="Label21" runat="server" Text="check out page"></asp:Label>
                    </asp:View>
                    <asp:View ID="View9" runat="server">
                        <asp:Label ID="Label22" runat="server" Text="manage notification page"></asp:Label>
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
