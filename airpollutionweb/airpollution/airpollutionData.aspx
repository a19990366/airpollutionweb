<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="airpollutionData.aspx.cs" Inherits="airpollutionweb.airpollution.airpollutionData" %>

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
            <p>
                <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="點此新增一筆資料" Visible="False" />
            </p>
            <p>&nbsp;</p>
            <p>查詢系統</p>
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
            <asp:Label ID="Label4" runat="server" Text="日期:"></asp:Label>
            <asp:DropDownList ID="DropDownList3" runat="server" style="height: 19px" Enabled="False">
                <asp:ListItem>2018</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
            </asp:DropDownList>
            年<asp:DropDownList ID="DropDownList4" runat="server" Enabled="False">
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
            </asp:DropDownList>
            月<br />
            <br />
                        <asp:Button class="btn" ID="btn" runat="server" Text="查詢" OnClick="btn_Click" Height="21px" Enabled="False" />
                        <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" Height="399px" Width="754px" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="city" HeaderText="城市" SortExpression="city" />
                    <asp:BoundField DataField="date_time" HeaderText="日期" SortExpression="date_time" />
                    <asp:BoundField DataField="station" HeaderText="觀測站" SortExpression="station" />
                    <asp:BoundField DataField="AQI" HeaderText="AQI" SortExpression="AQI" />
                    <asp:BoundField DataField="SO2" HeaderText="SO2(ppb)" SortExpression="SO2" />
                    <asp:BoundField DataField="CO" HeaderText="CO(ppm)" SortExpression="CO" />
                    <asp:BoundField DataField="O3" HeaderText="O3(ppb)" SortExpression="O3" />
                    <asp:BoundField DataField="PM2_5" HeaderText="PM2.5(μg/m3)" SortExpression="PM2_5" />
                    <asp:BoundField DataField="NO2" HeaderText="NO2(ppb)" SortExpression="NO2" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT * FROM [db_APData]" DeleteCommand="DELETE FROM [db_APData] WHERE [id] = @id" InsertCommand="INSERT INTO [db_APData] ([city], [date_time], [station], [AQI], [SO2], [CO], [O3], [PM2_5], [NO2]) VALUES (@city, @date_time, @station, @AQI, @SO2, @CO, @O3, @PM2_5, @NO2)" UpdateCommand="UPDATE [db_APData] SET [city] = @city, [date_time] = @date_time, [station] = @station, [AQI] = @AQI, [SO2] = @SO2, [CO] = @CO, [O3] = @O3, [PM2_5] = @PM2_5, [NO2] = @NO2 WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="date_time" Type="String" />
                    <asp:Parameter Name="station" Type="String" />
                    <asp:Parameter Name="AQI" Type="Int32" />
                    <asp:Parameter Name="SO2" Type="Double" />
                    <asp:Parameter Name="CO" Type="Double" />
                    <asp:Parameter Name="O3" Type="Int32" />
                    <asp:Parameter Name="PM2_5" Type="Int32" />
                    <asp:Parameter Name="NO2" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="city" Type="String" />
                    <asp:Parameter Name="date_time" Type="String" />
                    <asp:Parameter Name="station" Type="String" />
                    <asp:Parameter Name="AQI" Type="Int32" />
                    <asp:Parameter Name="SO2" Type="Double" />
                    <asp:Parameter Name="CO" Type="Double" />
                    <asp:Parameter Name="O3" Type="Int32" />
                    <asp:Parameter Name="PM2_5" Type="Int32" />
                    <asp:Parameter Name="NO2" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
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
