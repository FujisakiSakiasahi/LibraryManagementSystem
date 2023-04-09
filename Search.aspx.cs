using MySqlX.XDevAPI.Common;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
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
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }

            try { 
                bookTitle = Request.QueryString["title"];
                try {
                    page = int.Parse(Request.QueryString["page"]);
                } catch { 
                    page = 1;
                }

                filter = Request.QueryString["filter"];

                LoadFilterList(sessionHandler.RunQuery("SELECT genre, COUNT(bookId) as num_books FROM Genre GROUP BY genre;"));
                GenerateSearchPageLink(out link);

                //get data from database
                string query;
                if (filter != null) {
                    GetFilterString(out string filterString);
                    query = $"SELECT bookId, bookName, bookDescription, bookImage FROM Book WHERE bookName LIKE '%{ReplacePlusWithSpace(bookTitle)}%' AND bookId IN (SELECT bookId FROM Genre WHERE genre IN ({filterString}));";
                } else {
                    query = $"SELECT bookId, bookName, bookDescription, bookImage FROM Book WHERE bookName LIKE '%{ReplacePlusWithSpace(bookTitle)}%'";
                }
                DataTable returnedData = sessionHandler.RunQuery(query);

                LoadBookDataIntoList(returnedData);
                LoadListPager((int)(Math.Ceiling((float)(returnedData.Rows.Count)/10)));
            } catch {
                //get data from database
                string query;
                if (filter != null) {
                    GetFilterString(out string filterString);
                    query = $"SELECT bookId, bookName, bookDescription, bookImage FROM Book WHERE bookId IN (SELECT bookId FROM Genre WHERE genre IN ({filterString});";
                } else {
                    query = "SELECT bookId, bookName, bookDescription, bookImage FROM Book;";
                }
                DataTable returnedData = sessionHandler.RunQuery(query);

                LoadBookDataIntoList(returnedData);
                LoadListPager((int)(Math.Ceiling((float)(returnedData.Rows.Count) / 10)));
            }
        }

        protected void GenerateSearchPageLink(out string link) {
            link = "Search.aspx";

            if (bookTitle != null) {
                link += $"?title={bookTitle}&page=";

                GetFilterString(out string filterString);
                if (filter != null) {
                    if (!filterString.Equals("")) {
                        filterString = filterString.Replace(',', '-');
                        link += $"&filter={filterString}";
                    }
                }

                link += $"&page={page}";
            } else {
                GetFilterString(out string filterString);
                if (filter != null) {
                    if (!filterString.Equals("")) {
                        filterString = filterString.Replace(',', '-');
                        link += $"?filter={filterString}";
                    }

                    link += $"&page={page}";
                } else {
                    link += $"?page={page}";
                }
            }
        }

        protected void GetFilterString(out string filterString) {
            bool hasFilter = false;
            filterString = "";
            foreach (ListItem item in CheckBoxList_Filter.Items) {
                if (item.Selected) {
                    hasFilter = true;
                    filterString += "'" + item.Value + "'" + ",";
                }
            }

            filterString = hasFilter ? filterString.Remove(filterString.Length - 1) : "";
        }

        protected void LoadFilterList(DataTable dataTable){ 
            CheckBoxList_Filter.Items.Clear();
            string[] filterList = filter?.Split('-');

            for (int i = 0; i < dataTable.Rows.Count; i++) {
                CheckBoxList_Filter.Items.Add(" " + dataTable.Rows[i][0].ToString() + $" ({dataTable.Rows[i][1]})");
            }

            //check if anything was selected before
            if (filterList != null) { 
                for (int i = 0; i < dataTable.Rows.Count; i++) {
                    for (int j = 0; j < dataTable.Rows.Count; j++) { 
                        if (dataTable.Rows[i][0].ToString().Equals(filterList[j])) {
                            CheckBoxList_Filter.Items.FindByText(" " + dataTable.Rows[i][0].ToString() + $" ({dataTable.Rows[i][1]})").Selected = true;
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
                    GenerateSearchPageLink(out link);
                    content += link;
                    page += 1;
                    GenerateSearchPageLink(out link);
                }
                content += $@""">Previous</a></li>";

                for (int i = 0; i < totalPage; i++) {
                    content += $@"<li class=""page-item";
                    if (page == i + 1) content += " active";
                    content += $@"""><a class=""page-link";
                    content += (page == i + 1) ? " text-light" : " text-dark";
                    content += $@""" href=""{link + (i + 1)}"">{i + 1}</a></li>";
                }

                content += $@"<li class=""page-item""><a class=""page-link text-dark"" href=""";
                if (page + 1 == totalPage + 1) {
                    content += "";
                } else {
                    page += 1;
                    GenerateSearchPageLink(out link);
                    content += link;
                    page -= 1;
                    GenerateSearchPageLink(out link);
                }
                content += $@""">Next</a></li>";
            }

            content += $@" </ul>";
            pager_buttons.InnerHtml = "";
            pager_buttons.InnerHtml = content;

            /*           pager_buttons.InnerHtml = $@" <ul class=""pagination"">
                               <li class=""page-item""><a class=""page-link"" href=""#"">Previous</a></li>
                               <li class=""page-item""><a class=""page-link"" href=""#"">1</a></li>
                               <li class=""page-item active""><a class=""page-link"" href=""#"">2</a></li>
                               <li class=""page-item""><a class=""page-link"" href=""#"">3</a></li>
                               <li class=""page-item""><a class=""page-link"" href=""#"">Next</a></li>
                           </ul>";*/

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
    }
}