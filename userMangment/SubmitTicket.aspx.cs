using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userMangment_SubmitTicket : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Ensure the user is logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string title = txtTitle.Text.Trim();
        string description = txtDescription.Text.Trim();
        string category = ddlCategory.SelectedValue;
        int priorityID = Convert.ToInt32(ddlPriority.SelectedValue);
        int userID = Convert.ToInt32(Session["UserID"]);

        // Validate input
        if (string.IsNullOrEmpty(title) || string.IsNullOrEmpty(description) || string.IsNullOrEmpty(category) || priorityID == 0)
        {
            lblMessage.Text = "Please fill in all fields.";
            lblMessage.CssClass = "message error";
            lblMessage.Visible = true;
            return;
        }

        // Insert ticket into the database
        string connectionString = ConfigurationManager.ConnectionStrings["HD"].ConnectionString;
        string query = @"
            INSERT INTO Tickets (
                Title, Description, UserID, Category, PriorityID, DateCreated, StatusID, CreatedBy
            ) VALUES (
                @Title, @Description, @UserID, @Category, @PriorityID, @DateCreated, @StatusID, @CreatedBy
            )";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@Title", title);
                command.Parameters.AddWithValue("@Description", description);
                command.Parameters.AddWithValue("@UserID", userID);
                command.Parameters.AddWithValue("@Category", category);
                command.Parameters.AddWithValue("@PriorityID", priorityID);
                command.Parameters.AddWithValue("@DateCreated", DateTime.Now);
                command.Parameters.AddWithValue("@StatusID", 1); // Default status: Open
                command.Parameters.AddWithValue("@CreatedBy", userID); // CreatedBy is the same as UserID

                try
                {
                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblMessage.Text = "Ticket submitted successfully!";
                        lblMessage.CssClass = "message success";
                        lblMessage.Visible = true;

                        // Clear form fields
                        txtTitle.Text = "";
                        txtDescription.Text = "";
                        ddlCategory.SelectedIndex = 0;
                        ddlPriority.SelectedIndex = 0;
                    }
                    else
                    {
                        lblMessage.Text = "An error occurred while submitting the ticket.";
                        lblMessage.CssClass = "message error";
                        lblMessage.Visible = true;
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An error occurred: " + ex.Message;
                    lblMessage.CssClass = "message error";
                    lblMessage.Visible = true;
                }
            }
        }
    }
}