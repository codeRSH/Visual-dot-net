using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;

public partial class AdEn : System.Web.UI.Page
{
    public static string str()
    {
        return "Integrated Security=SSPI;Initial Catalog=project;Data Source=MAYA17\\SQLEXPRESS";
    }

    SqlConnection con;
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Visible = false;
        if (Page.IsPostBack == false)
        {
            con = new SqlConnection(str());
            con.Open();
            cmd = new SqlCommand("Select name from enquiry", con);

            SqlDataReader dr = cmd.ExecuteReader();

            DataTable dt = new DataTable();

            dt.Load(dr);

           // DropDownList1.Items.Add("Select Name");

            DropDownList1.DataSource = dt;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "name";
            DropDownList1.DataBind();

            con.Close();

        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
     
        con = new SqlConnection(str());
        con.Open();
        cmd = new SqlCommand("select * from enquiry where name=@a", con);
        cmd.Parameters.AddWithValue("@a", DropDownList1.SelectedItem.Text);

        SqlDataReader dr = cmd.ExecuteReader();
      
        DataTable dt = new DataTable();

        dt.Load(dr);

        DetailsView1.DataSource = dt;
        DetailsView1.DataBind();

        Button2.Visible = true;
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Visible = true;
        Button1.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Visible = false;
        Button1.Visible = false;
        Label2.Visible = true;
    }
}
