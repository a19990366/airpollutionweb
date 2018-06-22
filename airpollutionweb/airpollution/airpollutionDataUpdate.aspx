<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="airpollutionDataUpdate.aspx.cs" Inherits="airpollutionweb.airpollution.airpollutionDataUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>空汙</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../css/airpollutionIntroduction.css"/>
</head>

<body>
    <form id="form1" runat="server">
   <div id="wrapper">
    <header>
        <ul>
            <li>
                <asp:Button class="button" ID="Button1" runat="server" Text="首頁" OnClick="Button1_Click" />
            </li>
            <li>
                <asp:Button class="button" ID="Button2" runat="server" Text="空汙介紹"  OnClick="Button2_Click" />
            </li>
            <li>
                <asp:Button class="button" ID="Button3" runat="server" Text="空汙數據"  OnClick="Button3_Click" />
            </li>
            <li>
                <asp:Button class="button" ID="Button4" runat="server" Text="空汙報表"  OnClick="Button4_Click" />
            </li>
            <li>
                <asp:Button class="button" ID="Button5" runat="server" Text="討論區"  OnClick="Button5_Click" />
            </li>
            <li>
                <asp:Button class="button" ID="Button6" runat="server" Text="登入"  OnClick="Button6_Click" Visible="False" />
            </li>
            <li>
                <asp:Button class="button" ID="Button7" runat="server" Text="註冊" OnClick="Button7_Click" Visible="False" />
            </li>
            <li>
                <asp:Button class="button" ID="Button8" runat="server" Text="登出" OnClick="Button8_Click" Visible="False" OnClientClick="window.alert(&quot;登出成功!!!&quot;);" />
            </li>
            <li>
                <asp:Button class="button" ID="Button9" runat="server" Text="會員管理" OnClick="Button9_Click" Visible="False" />
            </li>
        </ul>
    </header>
    </div>
        <div id ="content">
        <h2>空汙數據庫</h2>
            <p>&nbsp;</p>
            <p>新增資料</p>
            <br />
            <asp:Label ID="Label1" runat="server" Text="城市:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="city" DataValueField="city" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Selected="True">未選取</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="觀測站:"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="station" DataValueField="station" Enabled="False">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="AQI:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" Width="70px"></asp:TextBox>
&nbsp;
            <asp:Label ID="Label6" runat="server" Text="SO2:"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" Width="70px"></asp:TextBox>
            ppb&nbsp;
            <asp:Label ID="Label7" runat="server" Text="CO:"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" Width="70px"></asp:TextBox>
            ppm<br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="O3:"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" Width="70px"></asp:TextBox>
            ppb&nbsp;
            <asp:Label ID="Label9" runat="server" Text="PM2.5:"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" Width="70px"></asp:TextBox>
            <span style="color: rgb(0, 0, 0); font-family: 微軟正黑體; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: nowrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(222, 222, 222); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">μg/m</span><sup style="color: rgb(0, 0, 0); font-family: 微軟正黑體; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 700; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: nowrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">3</sup>&nbsp;
            <asp:Label ID="Label10" runat="server" Text="NO2:"></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server" Width="70px"></asp:TextBox>
            ppb<br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="日期:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            <br />
                        <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="220px">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
            </asp:Calendar>
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="送出" />
                        <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [db_APData]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [db_APData]"></asp:SqlDataSource>
                        <br />
            </div>
    <footer>
        <div>
            <p>請勿轉載或作為商業利益使用</p>
        </div>
    </footer>
    </form>
</body>
</html>