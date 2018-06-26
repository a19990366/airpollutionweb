using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace airpollutionweb.airpollution
{
    public partial class airpollutionQuestionnaire : System.Web.UI.Page
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
            DropDownList3.Enabled = true;
            DropDownList4.Enabled = true;
            DropDownList5.Enabled = true;
            DropDownList6.Enabled = true;
            Button10.Enabled = true;
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (DropDownList6.SelectedValue == "Column")
            {
                Chart1.Series["Series1"].ChartType = SeriesChartType.Column;
            }
            else if (DropDownList6.SelectedValue == "Line")
            {
                Chart1.Series["Series1"].ChartType = SeriesChartType.Line;
            }
            else if (DropDownList6.SelectedValue == "Point")
            {
                Chart1.Series["Series1"].ChartType = SeriesChartType.Point;
            }
            Chart1.Series["Series1"].YValueMembers = DropDownList3.SelectedValue;
            string city = DropDownList1.SelectedValue;
            string station = DropDownList2.SelectedValue;
            string year = DropDownList4.SelectedValue + "/";
            string month = "/" + DropDownList5.SelectedValue + "/";
            string cmd = SqlDataSource1.SelectCommand;
            SqlDataSource1.SelectCommand = "SELECT  * From db_APData where city like '%" + city + "%' AND station like '%" + station + "%' AND date_time like '%" + year + "%' AND date_time like '%" + month + "%'";
            Chart1.Visible = true;
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string time = Calendar1.SelectedDate.Year.ToString() + "/" + Calendar1.SelectedDate.Month.ToString() + "/" + Calendar1.SelectedDate.Day.ToString();
            SqlDataSource4.SelectCommand = "SELECT  * From db_APData where date_time like '"+ time + "' ORDER BY AQI DESC";
            Chart2.Visible = true;
        }
    }
}