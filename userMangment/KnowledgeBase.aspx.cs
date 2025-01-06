using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userMangment_KnowledgeBase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindArticles();
        }
    }

    protected void BindArticles()
    {
        string query = "SELECT ArticleID, Title, Content, Category, CreatedBy, CreatedDate FROM KnowledgeBase WHERE 1=1";
        string searchText = txtSearch.Text.Trim();
        string category = ddlCategory.SelectedValue;

        // Apply search filter
        if (!string.IsNullOrEmpty(searchText))
        {
            query += " AND (Title LIKE @SearchText OR Content LIKE @SearchText)";
        }

        // Apply category filter
        if (!string.IsNullOrEmpty(category))
        {
            query += " AND Category = @Category";
        }

        // Fetch data from the database
        string connectionString = ConfigurationManager.ConnectionStrings["HD"].ConnectionString;
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                if (!string.IsNullOrEmpty(searchText))
                {
                    command.Parameters.AddWithValue("@SearchText", "%" + searchText + "%");
                }
                if (!string.IsNullOrEmpty(category))
                {
                    command.Parameters.AddWithValue("@Category", category);
                }

                connection.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptArticles.DataSource = dt;
                    rptArticles.DataBind();
                    lblNoResults.Visible = false;
                }
                else
                {
                    rptArticles.DataSource = null;
                    rptArticles.DataBind();
                    lblNoResults.Visible = true;
                }
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindArticles();
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindArticles();
    }
}
