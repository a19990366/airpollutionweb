﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airpollutionweb.account
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Equals(Session["Login"], "OK") == true)
            {
                Response.Write("<script>alert('請勿重複登入!!!');location.href='../main.aspx'</script>");
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection("Server=163.17.9.68;Database=DB1_05;User Id=DB1_05;Password=DB1_05; ");
            Conn.Open();
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand("Select * From db_account Where account='" + account.Text + "' and password = '" + password.Text + "'", Conn);
            dr = cmd.ExecuteReader();

            if (!dr.Read())
            {
                Label1.Text = "帳號或密碼錯誤!";
                cmd.Cancel();
                dr.Close();
                Conn.Close();
                Conn.Dispose();
            }
            else
            {
                Session["Login"] = "OK";
                Session["name"] = dr["name"].ToString();
                Session["rank"] = dr["rank"].ToString();
                cmd.Cancel();
                dr.Close();
                Conn.Close();
                Conn.Dispose();
                Response.Write("<script>alert('登入成功!!!自動導向首頁~~~');location.href='../main.aspx'</script>");
            }
        }
    }
}