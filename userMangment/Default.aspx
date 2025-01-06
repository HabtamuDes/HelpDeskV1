<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/default.css" rel="stylesheet" />
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="intro-section">
        <h1>Welcome to the Enterprise Help Desk System</h1>
        <p class="lead">
            Your trusted partner in managing and resolving IT issues efficiently and effectively.
        </p>
        <div class="features">
            <div class="feature-item">
                <i class="fas fa-ticket-alt"></i>
                <h3>Ticket Management</h3>
                <p>Easily submit, track, and resolve support tickets with our intuitive system.</p>
            </div>
            <div class="feature-item">
                <i class="fas fa-book"></i>
                <h3>Knowledge Base</h3>
                <p>Access a comprehensive library of articles and solutions to common issues.</p>
            </div>
            <div class="feature-item">
                <i class="fas fa-headset"></i>
                <h3>24/7 Support</h3>
                <p>Our dedicated support team is available around the clock to assist you.</p>
            </div>
        </div>
        <div class="cta">
            <a href="tickets.aspx" class="cta-button">Submit a Ticket</a>
            <a href="knowledgebase.aspx" class="cta-button secondary">Explore Knowledge Base</a>
        </div>
    </div>
</asp:Content>