<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.master" AutoEventWireup="true" CodeFile="SubmitTicket.aspx.cs" Inherits="userMangment_SubmitTicket" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="/css/submitticket.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="ticket-container">
        <h1>Submit a Ticket</h1>
        <p>Please provide details about the issue you're experiencing.</p>

        <!-- Ticket Form -->
        <div class="ticket-form">
            <div class="form-group">
                <label for="txtTitle">Title</label>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter a title for your ticket"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtDescription">Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Describe the issue in detail"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlCategory">Category</label>
                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
                    <asp:ListItem Text="Hardware" Value="Hardware"></asp:ListItem>
                    <asp:ListItem Text="Software" Value="Software"></asp:ListItem>
                    <asp:ListItem Text="Network" Value="Network"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlPriority">Priority</label>
                <asp:DropDownList ID="ddlPriority" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Priority" Value=""></asp:ListItem>
                    <asp:ListItem Text="Low" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Medium" Value="2"></asp:ListItem>
                    <asp:ListItem Text="High" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Urgent" Value="4"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Ticket" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <!-- Success/Error Messages -->
        <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
    </div>
</asp:Content>