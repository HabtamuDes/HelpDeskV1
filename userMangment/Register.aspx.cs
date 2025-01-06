using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userMangment_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnRegister_Click(object sender, EventArgs e)
    {
        var username = this.username.Text;
        var password = this.password.Text;
        var phone = this.phone.Text;
        var email = this.email.Text;
        var role = this.role.SelectedValue;
        var dateCreated = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        // Validate input
        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(role))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please fill in all required fields.');", true);
            return;
        }

        // Insert into database
        var connectionString = ConfigurationManager.ConnectionStrings["HD"].ConnectionString;
        string query = "INSERT INTO Users (UserName, UserPasword, UserPhone, UserEmail, DateCreated, Role) VALUES (@UserName, @UserPasword, @UserPhone, @UserEmail, @DateCreated, @Role)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@UserName", username);
                command.Parameters.AddWithValue("@UserPasword", password); // In a real application, hash the password
                command.Parameters.AddWithValue("@UserPhone", phone);
                command.Parameters.AddWithValue("@UserEmail", email);
                command.Parameters.AddWithValue("@DateCreated", dateCreated);
                command.Parameters.AddWithValue("@Role", role);

                try
                {
                    connection.Open();
                    int result = command.ExecuteNonQuery();
                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User registered successfully!');", true);
                        // Clear form fields
                        this.username.Text = "";
                        this.password.Text = "";
                        this.phone.Text = "";
                        this.email.Text = "";
                        this.role.SelectedIndex = 0;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration failed. Please try again.');", true);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred: "+ex.Message+"');", true);
                }
            }
        }
    }
}