using MySqlX.XDevAPI.Common;
using System;
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
        string search_query;
        int page;
        string link = "Search.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginState"] != null) {
                sessionHandler.CheckLoginState();
            } else { Session["loginState"] = "false"; }

            try { 
                search_query = Request.QueryString["search_query"];
                try {
                    page = int.Parse(Request.QueryString["page"]);
                } catch { 
                    page = 1;
                }

                link += search_query!=null ? $"?search_query={search_query}&page=" : "?page=";

                //get data from database
                DataTable returnedData = sessionHandler.RunQuery($"SELECT bookId, bookName, bookDescription, bookImage FROM Book WHERE bookName LIKE '%{search_query}%'");

                LoadBookDataIntoList(returnedData);
                LoadListPager((int)(Math.Ceiling((float)(returnedData.Rows.Count)/10)));
            } catch {
                //get data from database
                DataTable returnedData = sessionHandler.RunQuery("SELECT bookId, bookName, bookDescription, bookImage FROM Book;");

                LoadBookDataIntoList(returnedData);
                LoadListPager((int)(Math.Ceiling((float)(returnedData.Rows.Count) / 10)));
            }
            
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
                content += (page - 1 == 0) ? "" : (link + (page - 1));
                content += $@""">Previous</a></li>";

                for (int i = 0; i < totalPage; i++) {
                    content += $@"<li class=""page-item";
                    if (page == i + 1) content += " active";
                    content += $@"""><a class=""page-link";
                    content += (page == i + 1) ? " text-light" : " text-dark";
                    content += $@""" href=""{link + (i + 1)}"">{i + 1}</a></li>";
                }

                content += $@"<li class=""page-item""><a class=""page-link text-dark"" href=""";
                content += (page + 1 == totalPage + 1) ? "" : (link + (page + 1));
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