
<%@ Page Title="User Dashboard" Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.master" CodeFile="UserDashboard.aspx.cs" Inherits="userMangment_UserDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/dashboard.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="dashboard-container">
        <h1>User Dashboard</h1>
        <p>Welcome, User! Here are your tools.</p>
        <div class="dashboard-actions">
            <a href="SubmitTicket.aspx" class="dashboard-button">Submit a Ticket</a>
            <a href="ViewTickets.aspx" class="dashboard-button">View My Tickets</a>
            <a href="KnowledgeBase.aspx" class="dashboard-button">Knowledge Base</a>
        </div>
    </div>
</asp:Content>