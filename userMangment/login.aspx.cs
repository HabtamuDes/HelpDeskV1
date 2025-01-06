using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userMangment_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string username = this.username.Text;
        string password = this.password.Text;

        // Validate input
        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please enter both username and password.');", true);
            return;
        }

        // Retrieve connection string from Web.config
        string connectionString = ConfigurationManager.ConnectionStrings["HD"].ConnectionString;

        // Check credentials in the database
        string query = "SELECT UserID, Role FROM Users WHERE UserName = @UserName AND UserPasword = @UserPasword";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@UserName", username);
                command.Parameters.AddWithValue("@UserPasword", password); // In a real application, use hashed passwords

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.HasRows)
                    {
                        reader.Read();
                        string role = reader["Role"].ToString();
                        string userID = reader["UserID"].ToString();
                        Session["UserID"] = userID;
                        Session["Role"] = role;
                        reader.Close();

                        // Redirect based on role
                        switch (role)
                        {
                            case "Admin":
                                Response.Redirect("AdminDashboard.aspx");
                                break;
                            case "Support":
                                Response.Redirect("SupportDashboard.aspx");
                                break;
                            case "User":
                                Response.Redirect("UserDashboard.aspx");
                                break;
                            default:
                                Response.Redirect("Default.aspx");
                                break;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Invalid username or password.');", true);
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
