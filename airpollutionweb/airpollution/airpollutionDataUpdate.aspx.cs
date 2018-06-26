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
            if (Convert.ToInt32(Session["rank"]) != 5)
            {
                Response.Write("<script>alert('您沒有權限新增資料!');location.href='../main.aspx'</script>");
            }
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
            Button10.Enabled = true;
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