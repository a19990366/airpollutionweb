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
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection("Server=163.17.9.68;Database=DB1_05;User Id=DB1_05;Password=DB1_05; ");
            Conn.Open();
            SqlDataReader dr;
            SqlCommand cmd = new SqlCommand("Select * From db_account Where account='" + account.Text + "'", Conn);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Label1.Text = "帳號重複!";
                cmd.Cancel();
                dr.Close();
                Conn.Close();
                Conn.Dispose();
            }
            else if (!Equals(password.Text, password0.Text))
            {
                Label1.Text = "請重新確認密碼!";
                cmd.Cancel();
                dr.Close();
                Conn.Close();
                Conn.Dispose();
            }
            else
            {
                dr.Close();
                cmd = new SqlCommand("INSERT INTO db_account VALUES ('" + account.Text + "','" + password.Text + "','" + name.Text + "','" + email.Text + "','" + DropDownList1.Text + "',1)", Conn);
                cmd.ExecuteNonQuery();
                Conn.Close();
                Conn.Dispose();
                Response.Write("<script>alert('註冊成功!!!自動導向首頁~~~');location.href='../main.aspx'</script>");
            }
        }
    }
}