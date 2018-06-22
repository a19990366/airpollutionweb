using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airpollutionweb.airpollution
{
    public partial class airpollutionDataUpdate : System.Web.UI.Page
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
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string city = DropDownList1.SelectedValue;
            SqlDataSource3.SelectCommand = "SELECT DISTINCT station From db_APData where city like '%" + city + "%'";
            DropDownList2.Enabled = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.Year.ToString() + "/" + Calendar1.SelectedDate.Month.ToString() + "/" + Calendar1.SelectedDate.Day.ToString();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection("Server=163.17.9.68;Database=DB1_05;User Id=DB1_05;Password=DB1_05; ");
            Conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO db_APData VALUES ('" + DropDownList1.SelectedValue + "','" + TextBox1.Text + "','" + DropDownList2.SelectedValue + "'," + Convert.ToInt32(TextBox2.Text) + "," + Convert.ToDouble(TextBox3.Text) + ","+ Convert.ToDouble(TextBox4.Text) + "," + Convert.ToInt32(TextBox5.Text) +","+ Convert.ToInt32(TextBox6.Text) + ","+ Convert.ToInt32(TextBox7.Text) + ")", Conn);
            cmd.ExecuteNonQuery();
            Conn.Close();
            Conn.Dispose();
            Response.Write("<script>alert('新增成功!');location.href='airpollutionData.aspx'</script>");
        }
    }
}