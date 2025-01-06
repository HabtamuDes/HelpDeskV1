
<%@ Page  Title="Knowledge Base"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Admin.master" CodeFile="KnowledgeBase.aspx.cs" Inherits="userMangment_KnowledgeBase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/knowledgebase.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="knowledgebase-container">
        <h1>Knowledge Base</h1>
        <p>Search for solutions to common issues.</p>

        <!-- Search Bar -->
        <div class="search-bar">
            <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search articles..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-button" OnClick="btnSearch_Click" />
        </div>

        <!-- Category Filter -->
        <div class="category-filter">
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="category-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                <asp:ListItem Text="All Categories" Value=""></asp:ListItem>
                <asp:ListItem Text="Hardware" Value="Hardware"></asp:ListItem>
                <asp:ListItem Text="Software" Value="Software"></asp:ListItem>
                <asp:ListItem Text="Network" Value="Network"></asp:ListItem>
            </asp:DropDownList>
        </div>

        <!-- Article List -->
        <asp:Repeater ID="rptArticles" runat="server">
            <ItemTemplate>
                <div class="article-item">
                    <h2><%# Eval("Title") %></h2>
                    <p><%# Eval("Content") %></p>
                    <div class="article-meta">
                        <span>Category: <%# Eval("Category") %></span>
                        <span>Created By: <%# Eval("CreatedBy") %></span>
                        <span>Date: <%# Eval("CreatedDate", "{0:MM/dd/yyyy}") %></span>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <!-- No Results Message -->
        <asp:Label ID="lblNoResults" runat="server" Text="No articles found." CssClass="no-results" Visible="false"></asp:Label>
    </div>
</asp:Content>
