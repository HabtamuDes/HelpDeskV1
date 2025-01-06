<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Admin.master" CodeFile="login.aspx.cs" Inherits="userMangment_login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-container">
        <div class="login-box">
            <h2>Login to Help Desk</h2>
            <p>Welcome back! Please enter your credentials to access your account.</p>
            <div class="form-group">
                <label for="username">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
            </div>
            <div class="forgot-password">
                <a href="#">Forgot Password?</a>
            </div>
        </div>
    </div>
</asp:Content>