using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace airpollutionweb.account
{
    public partial class manager_account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["rank"])!=5)
            {
                Response.Write("<script>alert('你不是管理員哦');location.href='../main.aspx'</script>");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "myInsert")
            {
                GridView1.DataSourceID = null;
            }
        }

        protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
        }

        protected void bntBack_Click(object sender, EventArgs e)
        {
            GridView1.DataSourceID = "SqlDataSource1";
        }
    }
}