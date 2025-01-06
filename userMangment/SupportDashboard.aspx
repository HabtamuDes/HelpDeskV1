
<%@ Page   Title="Support Dashboard"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Dashboard.master" CodeFile="SupportDashboard.aspx.cs" Inherits="userMangment_SupportDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/dashboard.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="dashboard-container">
        <h1>Support Dashboard</h1>
        <p>Welcome, Support! Here are your support tools.</p>
        <div class="dashboard-actions">
            <a href="ManageTickets.aspx" class="dashboard-button">Manage Tickets</a>
            <a href="RespondToQueries.aspx" class="dashboard-button">Respond to Queries</a>
            <a href="KnowledgeBase.aspx" class="dashboard-button">Knowledge Base</a>
        </div>
    </div>
</asp:Content>