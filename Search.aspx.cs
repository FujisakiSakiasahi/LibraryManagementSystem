using MySqlX.XDevAPI.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class Search : System.Web.UI.Page
    {
        SessionHandler sessionHandler = new SessionHandler();
        string bookTitle;
        int page;
        string link;
        string filter;
        protected void Page_Load(object sender, EventArgs e)
        {
            SetInitialLoginState();
            HeaderUIHandler();


            try {
                if (!Page.IsPostBack)
                {
                    bookTitle = Request.QueryString["title"];

                    if (bookTitle != null)
                    {
                        Textbox_Search.Text = bookTitle.Replace("+", " ");
                    }


                    try
                    {
                        page = int.Parse(Request.QueryString["page"]);
                        if (page <= 0) { 
                        page = 1;
                        }
                    }
                    catch
                    {
                        page = 1;
                    }

                    filter = Request.QueryString["filter"];


                    LoadFilterList(sessionHandler.RunQuery("SELECT genre, COUNT(bookId) as num_books FROM Genre GROUP BY genre;"));


                    GenerateSearchPageLink(out link, Textbox_Search.Text, GetFilterString());

                    //get data from database
                    string query;
                    if (!string.IsNullOrEmpty(filter))
                    {
                        string filterString = GetFilterString();
                        query = $"SELECT bookId, bookName, bookDescription, bookImage FROM Book WHERE bookName LIKE '%{ReplacePlusWithSpace(bookTitle)}%' AND bookId IN (SELECT bookId FROM Genre WHERE genre IN ({filterString}));";
                    }
                    else
                    {
                        query = $"SELECT bookId, bookName, bookDescription, bookImage FROM Book WHERE bookName LIKE '%{ReplacePlusWithSpace(bookTitle)}%'";
                    }
                    DataTable returnedData = sessionHandler.RunQuery(query);

                    LoadBookDataIntoList(returnedData);
                    LoadListPager((int)(Math.Ceiling((float)(returnedData.Rows.Count) / 10)));
                }
            } catch {
                //get data from database
                string query;
                if (filter != null) {
                    string filterString = GetFilterString();
                    query = $"SELECT bookId, bookName, bookDescription, bookImage FROM Book WHERE bookId IN (SELECT bookId FROM Genre WHERE genre IN ({filterString}));";
                } else {
                    query = "SELECT bookId, bookName, bookDescription, bookImage FROM Book;";
                }
                DataTable returnedData = sessionHandler.RunQuery(query);

                LoadBookDataIntoList(returnedData);
                LoadListPager((int)(Math.Ceiling((float)(returnedData.Rows.Count) / 10)));
            }
        }

        protected void Logout_Function(object sender, EventArgs e)
        {
            string link = sessionHandler.GetIsLibrarian() && Request.RawUrl.Equals("Librarian.aspx") ? "Home.aspx" : Request.RawUrl;

            Session["userLoginState"] = false;
            Session.Abandon();
            Response.Redirect(link);
        }

        protected void GenerateSearchPageLink(out string link, string title, string filter) {
            link = "Search.aspx?";
            bool hasQuery = false;

            if (!string.IsNullOrEmpty(title)) {
                link += $"title={title.Replace(" ", "+")}";
                hasQuery = true;
            }

            string filterString = filter;
            if (!string.IsNullOrEmpty(filterString)) {
                if (hasQuery) {
                    link += "&";
                }

                link += $"filter={filterString.Replace("'", "").Replace(",","-")}";
                hasQuery = true;
            }

            if (hasQuery) {
                link += "&";
            }

            link += $"page={page}";
        }

        protected string GetFilterString() {
            bool hasFilter = false;
            string filterString = "";
            foreach (ListItem item in CheckBoxList_Filter.Items) 
            {
                if (item.Selected) {
                    hasFilter = true;
                    filterString += "'" + item.Value.Substring(0, item.Value.IndexOf('(')).Trim() + "'" + ",";
                }
            }

            filterString = hasFilter ? filterString.TrimEnd(',') : null;
            

            return filterString;
        }

        protected void HeaderUIHandler()
        {
            login_link.Visible = false;
            profile.Visible = false;

            librarian_link.Visible = false;

            if (sessionHandler.GetLoginState() == false)
            {
                login_link.Visible = true;
            }
            else
            {
                profile.Visible = true;
            }

            if (sessionHandler.GetIsLibrarian())
            {
                librarian_link.Visible = true;
            }
        }

        protected void SetInitialLoginState()
        {
            if (Session["loginState"] != null)
            {
                sessionHandler.CheckLoginState();
            }
            else { Session["loginState"] = "false"; }
        }

        protected void LoadFilterList(DataTable dataTable){ 
            CheckBoxList_Filter.Items.Clear();
            string[] filterList = null;
            if (!string.IsNullOrEmpty(filter))
            {
                filterList = filter.Split('-');
            }

            for (int i = 0; i < dataTable.Rows.Count; i++) {
                ListItem item = new ListItem(" " + dataTable.Rows[i][0].ToString() + $" ({dataTable.Rows[i][1]})");
                CheckBoxList_Filter.Items.Add(item);
                if (filterList != null) {
                    foreach (string filter in filterList) {
                        if (dataTable.Rows[i][0].ToString().Equals(filter.Trim())) {
                            item.Selected = true;
                            break;
                        }
                    }
                }
            }
        }

        protected string ReplacePlusWithSpace(string input) {
            if (input == null) return "";
            string output = input.Replace("+", " ");
            return output;
        }

        protected void LoadListPager(int totalPage) {
            string content;

            if (totalPage == 0) {
                content = $@"<ul class=""pagination disable"">
                                            <li class=""page-item""><a class=""page-link text-dark"" href=""#"">Previous</a></li>
                                            <li class=""page-item active""><a class=""page-link text-dark"" href=""#"">1</a></li>
                                            <li class=""page-item""><a class=""page-link text-dark"" href=""#"">Next</a></li>
                                        </ul>";
            } else {
                content = $@"<ul class=""pagination"">";

                content += $@"<li class=""page-item""><a class=""page-link text-dark"" href=""";
                if (page - 1 == 0) {
                    content += "";
                } else {
                    page -= 1;
                    GenerateSearchPageLink(out link, bookTitle, filter);
                    content += link;
                    page += 1;
                    GenerateSearchPageLink(out link, bookTitle, filter);
                }
                content += $@""">Previous</a></li>";

                int currentPage = page;
                for (int i = 0; i < totalPage; i++) {
                    content += $@"<li class=""page-item";
                    if (currentPage == i + 1) content += " active";
                    content += $@"""><a class=""page-link";
                    content += (page == i + 1) ? " text-light" : " text-dark";
                    page= i + 1;
                    GenerateSearchPageLink(out link, bookTitle, filter);
                    content += $@""" href=""{link}"">{i + 1}</a></li>";
                }
                page = currentPage;

                content += $@"<li class=""page-item""><a class=""page-link text-dark"" href=""";
                if (page + 1 == totalPage + 1) {
                    content += "";
                } else {
                    page += 1;
                    GenerateSearchPageLink(out link, bookTitle, filter);
                    content += link;
                    page -= 1;
                    GenerateSearchPageLink(out link, bookTitle, filter);
                }
                content += $@""">Next</a></li>";
            }

            content += $@" </ul>";
            pager_buttons.InnerHtml = "";
            pager_buttons.InnerHtml = content;
        }

        protected void LoadBookDataIntoList(DataTable dataTable) {
            if (dataTable.Rows.Count == 0 || dataTable.Rows.Count < page * 10-10) { search_result.InnerHtml = "<li class=\"list-group-item\">No book was found...</li>"; return; }
            if (dataTable.Rows.Count > page * 10) {
                string content = "";
                for (int i = 0; i < 10; i++) {
                    int dataIndex = i + (page * 10 - 10);
                    string image = dataTable.Rows[dataIndex][3].ToString() != "" ? File.Exists($"/images/{dataTable.Rows[dataIndex][3].ToString()}") ? dataTable.Rows[dataIndex][3].ToString() : "book.jpg" : "book.jpg";

                    content += $@"<li class=""list-group-item"">
                                    <a href=""Description.aspx?bookId={dataTable.Rows[dataIndex][0]}"">
                                        <div class=""row"">
                                            <div class=""col-lg-3"">
                                                <img src=""/images/{image}"" />
                                            </div>
                                            <div class=""col-lg-9"">
                                                <h4 class=""text-dark"">{dataTable.Rows[dataIndex][1]}</h4>
                                                <p class=""text-dark"">{dataTable.Rows[dataIndex][2]}</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>";
                }

                search_result.InnerHtml = "";
                search_result.InnerHtml = content;
            } else { 
                string content = "";
                for (int i = 0; i < dataTable.Rows.Count-(page*10-10); i++) {
                    int dataIndex = i + (page * 10 - 10);
                    string image = dataTable.Rows[dataIndex][3].ToString() != "" ? File.Exists($"/images/{dataTable.Rows[dataIndex][3].ToString()}") ? dataTable.Rows[dataIndex][3].ToString() : "book.jpg" : "book.jpg";

                    content += $@"<li class=""list-group-item"">
                                    <a href=""Description.aspx?bookId={dataTable.Rows[dataIndex][0]}"">
                                        <div class=""row"">
                                            <div class=""col-lg-3"">
                                                <img src=""/images/{image}"" />
                                            </div>
                                            <div class=""col-lg-9"">
                                                <h4 class=""text-dark"">{dataTable.Rows[dataIndex][1]}</h4>
                                                <p class=""text-dark"">{dataTable.Rows[dataIndex][2]}</p>
                                            </div>
                                        </div>
                                    </a>
                                </li>";
                }

                search_result.InnerHtml = "";
                search_result.InnerHtml = content;
            }
        }

        protected void Button_Search_Click(object sender, EventArgs e) {
            GenerateSearchPageLink(out link, Textbox_Search.Text, GetFilterString());
            
            Response.Redirect(link);
        }
    }
}