

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Admin.master" CodeFile="Register.aspx.cs" Inherits="userMangment_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/register.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="register-container">
        <div class="register-box">
            <h2>User Registration</h2>
            <p>Please fill in the details to create a new account.</p>
            <div class="form-group">
                <label for="username">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="phone">Phone</label>
                <asp:TextBox ID="phone" runat="server" CssClass="form-control" placeholder="Enter your phone number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="role">Role</label>
                <asp:DropDownList ID="role" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Role" Value="" />
                    <asp:ListItem Text="Admin" Value="Admin" />
                    <asp:ListItem Text="Support" Value="Support" />
                    <asp:ListItem Text="User" Value="User" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn-register" OnClick="btnRegister_Click" />
            </div>
        </div>
    </div>
</asp:Content>