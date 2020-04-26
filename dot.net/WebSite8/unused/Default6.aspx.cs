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

public partial class Default6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Integrated Security=SSPI;Initial Catalog=db1;Data Source=MAYA17\\SQLEXPRESS");

        con.Open();

        SqlCommand cmd = new SqlCommand("insert into join_now values(@a,@b,@c,@d,@f,@g,@h,@i,@j,@k,@l,@m,@n,@o)",con);   
        cmd.Parameters.AddWithValue("@a",TextBox1.Text);  
        cmd.Parameters.AddWithValue("@b",TextBox2.Text);
        cmd.Parameters.AddWithValue("@c",TextBox6.Text);
        cmd.Parameters.AddWithValue("@d",TextBox10.Text);

        cmd.Parameters.AddWithValue("@f",DropDownList4.Text);
        cmd.Parameters.AddWithValue("@g",TextBox11.Text);
        cmd.Parameters.AddWithValue("@h",TextBox15.Text);
        cmd.Parameters.AddWithValue("@i",TextBox16.Text);
        cmd.Parameters.AddWithValue("@j",TextBox18.Text);
        cmd.Parameters.AddWithValue("@k",TextBox19.Text);
        cmd.Parameters.AddWithValue("@l",TextBox21.Text);
        cmd.Parameters.AddWithValue("@m",TextBox22.Text);
        cmd.Parameters.AddWithValue("@n", DropDownList8.Text);
        cmd.Parameters.AddWithValue("@o", TextBox24.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("welcome.aspx");

    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

    }
}
