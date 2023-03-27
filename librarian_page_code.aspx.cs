﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagementSystem
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        private SessionHandler sessionHandler = new SessionHandler();
        private DataTable currentData = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginState"] != null)
            {
                sessionHandler.CheckLoginState();
            }
            else { Session["loginState"] = "false"; };
        }

        protected void Book_Load(object sender, EventArgs e)
        {
            if (booKIdTxt == null || booKIdTxt.Equals(""))
            {
                Response.Write("<script>alert('No Book with ID Found')</script>");
                return;
            }
            String query;
            query = $"SELECT * FROM Book WHERE bookId = {booKIdTxt.Text}";
            DataTable returnedData = sessionHandler.runQuery(query);
            currentData = returnedData.Copy();

            if (returnedData == null)
            {
                Response.Write("<script>alert('No Book with ID Found')</script>");
            }
            else
            {
                bookNameTxt.Text = returnedData.Rows[0][1].ToString();
                authorNameTxt.Text = returnedData.Rows[0][2].ToString();
                bookDescTxt.Text = returnedData.Rows[0][4].ToString();
                pubNameTxt.Text = returnedData.Rows[0][5].ToString();
                pubDateTxt.Text = returnedData.Rows[0][6].ToString();
                ratingDrop.SelectedIndex = int.Parse(returnedData.Rows[0][7].ToString()) - 1;
                langTxt.Text = returnedData.Rows[0][8].ToString();
                isbnTxt.Text = returnedData.Rows[0][9].ToString();
                if (returnedData.Rows[0][10].ToString().Equals("1"))
                {
                    availableChk.Checked = true;
                }

            }

        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            bookNameTxt.ReadOnly = false;
            authorNameTxt.ReadOnly = false;
            bookDescTxt.ReadOnly = false;
            pubNameTxt.ReadOnly = false;
            pubDateTxt.ReadOnly = false;
            ratingDrop.Enabled = true;
            langTxt.ReadOnly = false;
            isbnTxt.ReadOnly = false;
            availableChk.Enabled = true;
            EditButton.Visible = false;
            SaveButton.Visible = true;
            CancelButton.Visible = true;
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            EditButton.Visible = true;
            SaveButton.Visible = false;
            CancelButton.Visible = false;
            
            //i cant get this to work somehow
            /*bookNameTxt.Text = currentData.Rows[0][1].ToString();
            authorNameTxt.Text = currentData.Rows[0][2].ToString();
            bookDescTxt.Text = currentData.Rows[0][4].ToString();
            pubNameTxt.Text = currentData.Rows[0][5].ToString();
            pubDateTxt.Text = currentData.Rows[0][6].ToString();
            langTxt.Text = currentData.Rows[0][8].ToString();
            isbnTxt.Text = currentData.Rows[0][9].ToString();*/

        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            String query = $"UPDATE Book SET bookName = '{bookNameTxt.Text}', authorName = '{authorNameTxt.Text}', bookDescription = '{bookDescTxt.Text}', publisherName = '{pubNameTxt.Text}', pubDate = '{(pubDateTxt.Text)}', rating = '{ratingDrop.DataTextField}', lang = '{langTxt.Text}', isbn = '{isbnTxt.Text}', available = '{(availableChk.Checked ? 1 : 0)}' WHERE bookId = '{int.Parse(booKIdTxt.Text)}'";

            sessionHandler.runQuery(query);

        }
    }


}