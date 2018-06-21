<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="airpollutionDiscussion.aspx.cs" Inherits="airpollutionweb.airpollution.airpollutionDiscussion" %>

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
        <h2>討論區</h2>
            <p>&nbsp;</p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="aid" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="title" HeaderText="標題" SortExpression="title" />
                        <asp:BoundField DataField="content" HeaderText="內容" SortExpression="content" />
                        <asp:BoundField DataField="name" HeaderText="作者" SortExpression="name" />
                        <asp:BoundField DataField="date_time" HeaderText="日期" SortExpression="date_time" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDbConnection %>" DeleteCommand="DELETE FROM [db_Discussion] WHERE [aid] = @aid" InsertCommand="INSERT INTO [db_Discussion] ([title], [content], [name], [date_time]) VALUES (@title, @content, @name, @date_time)" SelectCommand="SELECT * FROM [db_Discussion]" UpdateCommand="UPDATE [db_Discussion] SET [title] = @title, [content] = @content, [name] = @name, [date_time] = @date_time WHERE [aid] = @aid">
                    <DeleteParameters>
                        <asp:Parameter Name="aid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="content" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="date_time" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="title" Type="String" />
                        <asp:Parameter Name="content" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="date_time" Type="String" />
                        <asp:Parameter Name="aid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>請先登入才可留言!!!</p>
            <p>&nbsp;</p>
            <p>
                <asp:Label ID="Label1" runat="server" Text="標題:"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" MaxLength="10" Width="300px"></asp:TextBox>
            </p>
            <p>&nbsp;</p>
            <p>
                <asp:Label ID="Label2" runat="server" Text="內容:"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" Height="150px" MaxLength="50" Width="300px" TextMode="MultiLine"></asp:TextBox>
            </p>
            <p>&nbsp;</p>
            <p>
                <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="清除" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="送出" />
            </p>
            <p>&nbsp;</p>
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
