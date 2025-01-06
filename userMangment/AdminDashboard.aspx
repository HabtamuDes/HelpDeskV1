
<%@ Page  Title="Admin Dashboard"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.master" CodeFile="AdminDashboard.aspx.cs" Inherits="userMangment_AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/dashboard.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="dashboard-container">
        <h1>Admin Dashboard</h1>
        <p>Welcome, Admin! Here are your administrative tools.</p>
        <div class="dashboard-actions">
            <a href="ManageUsers.aspx" class="dashboard-button">Manage Users</a>
            <a href="ViewReports.aspx" class="dashboard-button">View Reports</a>
            <a href="Settings.aspx" class="dashboard-button">Settings</a>
        </div>
    </div>
</asp:Content>