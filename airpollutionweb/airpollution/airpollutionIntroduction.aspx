<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="airpollutionIntroduction.aspx.cs" Inherits="airpollutionweb.airpollution.airpollutionIntroduction" %>

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
            <H2>空氣汙染介紹</H2>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" Height="227px" Width="755px" DataKeyNames="aid">
                <EditRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <Fields>
                    <asp:BoundField DataField="title" HeaderText="標題" SortExpression="title">
                    </asp:BoundField>
                    <asp:BoundField DataField="content" HeaderText="內容" SortExpression="content" />
                </Fields>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" Height="20px" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle ForeColor="#330099" HorizontalAlign="Center" BackColor="#FFFFCC" />
                <RowStyle ForeColor="#330099" BackColor="White" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB1_05ConnectionString %>" SelectCommand="SELECT * FROM [db_introduction]" DeleteCommand="DELETE FROM [db_introduction] WHERE [aid] = @aid" InsertCommand="INSERT INTO [db_introduction] ([title], [content]) VALUES (@title, @content)" UpdateCommand="UPDATE [db_introduction] SET [title] = @title, [content] = @content WHERE [aid] = @aid">
                <DeleteParameters>
                    <asp:Parameter Name="aid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="content" Type="String" />
                    <asp:Parameter Name="aid" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    <footer>
        <div>
            <p>請勿轉載或作為商業利益使用</p>
        </div>
    </footer>
    </form>
</body>
</html>
