<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="airpollutionweb.account.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>空汙</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="../css/login.css" />
</head>

<body>
    <div id="wrapper">
    <header>
        <ul>
            <li><a href="../main.aspx">首頁</a></li>
            <li><a href="../airpollution/airpollutionIntroduction.aspx">空汙介紹</a></li>
            <li><a href="../airpollution/airpollutionData.aspx">空汙數據</a></li>
            <li><a href="../airpollution/airpollutionQuestionnaire.aspx">空汙報表</a></li>
            <li><a href="../airpollution/airpollutionDiscussion.aspx">討論區</a></li>
            <li><a href="#">登入</a></li>
            <li><a href="../account/signup.aspx">註冊</a></li>
        </ul>
    </header>
</div>

    <div id="content">
        <img src="../img/login.png" />
        <h1>Login</h1>
        <br />

        <form id="form1" runat="server">
            帳號:
            <br />
            <asp:TextBox ID="account" runat="server" required="true" Height="25px"></asp:TextBox>
            <br />
            <br />
            密碼:
            <br />
            <asp:TextBox ID="password" runat="server" required="true" TextMode="Password" Height="25px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" ForeColor="Red" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Login_Click" Text="登入" />
            <br />
        </form>
    </div>

</body>
</html>
