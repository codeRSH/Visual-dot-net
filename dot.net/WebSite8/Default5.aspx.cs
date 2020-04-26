using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class Default5 : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;

    public static string str1()
    {
        return "Integrated Security=SSPI;Initial Catalog=project;Data Source=MAYA17\\SQLEXPRESS";
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        con = new SqlConnection(str1());
        con.Open();
        cmd = new SqlCommand("insert into enquiry values (@a, @b, @c, @d, @e, @f)", con);
        cmd.Parameters.AddWithValue("@a", TextBox1.Text);
        cmd.Parameters.AddWithValue("@b", TextBox2.Text);
        cmd.Parameters.AddWithValue("@c", TextBox3.Text);
        cmd.Parameters.AddWithValue("@d", TextBox4.Text);
        cmd.Parameters.AddWithValue("@e", TextBox5.Text);
        cmd.Parameters.AddWithValue("@f", TextBox6.Text);

        cmd.ExecuteNonQuery();
        con.Close();

        Response.Redirect("Default2.aspx");
    }
}
