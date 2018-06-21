﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airpollutionweb.airpollution
{
    public partial class airpollutionDiscussion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Equals(Session["Login"], "OK") == false)
            {
                Button6.Visible = true;
                Button7.Visible = true;
            }
            else if (Equals(Session["Login"], "OK"))
            {
                Button8.Visible = true;
                Button8.Text = Session["name"].ToString() + "(登出)";
            }
            if (Convert.ToInt32(Session["rank"]) == 5)
            {
                Button9.Visible = true;
                GridView1.AutoGenerateDeleteButton = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("../main.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("airpollutionIntroduction.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("airpollutionData.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("airpollutionQuestionnaire.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("airpollutionDiscussion.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("../account/login.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("../account/signup.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Session["Login"] = "OFF";
            Session["account"] = null;
            Session["rank"] = 0;
            Response.Redirect("../main.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("../account/manager_account.aspx");
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            if (Equals(Session["Login"], "OK") == false)
            {
                Response.Write("<script>alert('請先登入才可留言!!!');location.href='airpollutionDiscussion.aspx'</script>");
            }
            else
            {
                SqlConnection Conn = new SqlConnection("Server=163.17.9.68;Database=DB1_05;User Id=DB1_05;Password=DB1_05; ");
                Conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO db_Discussion VALUES ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + Session["name"] + "','" + DateTime.Now.ToString() + "')", Conn);
                cmd.ExecuteNonQuery();
                Conn.Close();
                Conn.Dispose();
                Response.Write("<script>alert('留言成功!');location.href='airpollutionDiscussion.aspx'</script>");
            }
        }
    }
}