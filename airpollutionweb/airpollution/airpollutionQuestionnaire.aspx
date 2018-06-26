<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="airpollutionQuestionnaire.aspx.cs" Inherits="airpollutionweb.airpollution.airpollutionQuestionnaire" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>空汙</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../css/airpollutionQuestionnaire.css"/>
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
            <h2>空汙報表</h2>
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
            <asp:DropDownList ID="DropDownList4" runat="server" style="height: 19px" Enabled="False">
                <asp:ListItem>2018</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
            </asp:DropDownList>
            年<asp:DropDownList ID="DropDownList5" runat="server" Enabled="False">
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
            </asp:DropDownList>
            月<br />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Y軸:"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" Enabled="False">
                <asp:ListItem>AQI</asp:ListItem>
                <asp:ListItem>SO2</asp:ListItem>
                <asp:ListItem>CO</asp:ListItem>
                <asp:ListItem>O3</asp:ListItem>
                <asp:ListItem Value="PM2_5">PM2.5</asp:ListItem>
                <asp:ListItem>NO2</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label6" runat="server" Text="種類:"></asp:Label>
            <asp:DropDownList ID="DropDownList6" runat="server" Enabled="False">
                <asp:ListItem Value="Column">長條圖</asp:ListItem>
                <asp:ListItem Value="Line">折線圖</asp:ListItem>
                <asp:ListItem Value="Point">點陣圖</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="查詢" Enabled="False" />
            <br />
            <br />
            <p>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Height="500px" Width="500px" Visible="False" IsMapAreaAttributesEncoded="True">
                    <series>
                        <asp:Series Name="Series1" XValueMember="date_time" YValueMembers="AQI" YValuesPerPoint="4" Font="標楷體, 8.25pt">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                </p>
            <br />
            <h2>AQI前十大排行(Day)</h2>
            <p>&nbsp;</p>
            <p>(請點擊日期~)</p>
            <p>&nbsp;</p>
                        <asp:Calendar ID="Calendar1" cssclass="conter" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="220px">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <OtherMonthDayStyle ForeColor="#CC9966"/>
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        </asp:Calendar>
            <br />
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource4" Height="500px" Width="500px" IsMapAreaAttributesEncoded="True" Visible="False">
                    <series>
                        <asp:Series Name="Series1" YValuesPerPoint="4" Font="標楷體, 8.25pt" XValueMember="station" YValueMembers="AQI">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX IntervalAutoMode="VariableCount" IsLabelAutoFit="False" Maximum="10">
                                <LabelStyle IsStaggered="True" />
                            </AxisX>
                        </asp:ChartArea>
                    </chartareas>
                </asp:Chart>
                <br />
            <br/>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT * FROM [db_APData]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT DISTINCT [city] FROM [db_APData]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [db_APData]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT * FROM [db_APData] ORDER BY [AQI] DESC"></asp:SqlDataSource>
        </div>
    <footer>
        <div>
            <p>請勿轉載或作為商業利益使用</p>
        </div>
    </footer>
    </form>
</body>
</html>