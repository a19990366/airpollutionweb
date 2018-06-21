<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="airpollutionQuestionnaire.aspx.cs" Inherits="airpollutionweb.airpollution.airpollutionQuestionnaire" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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
        <div id="content">
            <H2>空汙報表</H2>
            <p>&nbsp;</p>
            <asp:Label ID="Label1" runat="server" Text="城市:"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="city" DataValueField="city" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Selected="True">未選取</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="測站:"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="station" DataValueField="station" Enabled="False">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="日期:"></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" style="height: 19px">
                <asp:ListItem>2018</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
            </asp:DropDownList>
            年<asp:DropDownList ID="DropDownList5" runat="server">
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
            </asp:DropDownList>
            月<br />
            <br />
            Y軸:<asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem>AQI</asp:ListItem>
                <asp:ListItem>SO2</asp:ListItem>
                <asp:ListItem>CO</asp:ListItem>
                <asp:ListItem>O3</asp:ListItem>
                <asp:ListItem Value="PM2_5">PM2.5</asp:ListItem>
                <asp:ListItem>NO2</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="查詢" />
            <br />
            <br />
            <h2>長條圖</h2>
            <p>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="500px" Width="500px" Visible="False">
                    <series>
                        <asp:Series Name="Series1" XValueMember="date_time" YValueMembers="AQI" YValuesPerPoint="4">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                </p>
                <br/>
                <h2>折線圖</h2>
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource1" Height="500px" Width="500px" Visible="False">
                    <series>
                        <asp:Series ChartArea="ChartArea1" ChartType="Line" Name="Series1" XValueMember="date_time" YValueMembers="AQI">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
            <br />
            <br/>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT * FROM [db_APData]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [db_APData]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [db_APData]"></asp:SqlDataSource>
        </div>
    <footer>
        <div>
            <p>請勿轉載或作為商業利益使用</p>
        </div>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="jquery.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    </form>
</body>
</html>