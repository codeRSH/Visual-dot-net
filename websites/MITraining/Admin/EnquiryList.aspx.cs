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
public partial class Admin_EnquiryList : System.Web.UI.Page
{
    CommonClass cm = new CommonClass();
    public static int Sno = 1;
    public static int PageNo = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Visible = false;
        Button1.Visible = false;
        Button2.Visible = false;
        if (!IsPostBack)
        {
            Sno = 1;
            GridView1.DataSource = cm.fill();
            GridView1.DataBind();
        }
    }

    public void sno(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Text = Sno.ToString();
            Sno++;


        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        PageNo = e.NewPageIndex;
        Sno = (PageNo * GridView1.PageSize) + 1;
        GridView1.DataSource = cm.fill();
        GridView1.DataBind();
    }

    public void details(object s, EventArgs e)
    {
        LinkButton link = (LinkButton)s;
        Session["detail"] = link.CommandArgument;
        Response.Redirect("Enq_details.aspx");
    }


    public void reply(object s, EventArgs e)
    {
        try
        {
            LinkButton id = (LinkButton)s;
            Session["reply"] = id.CommandArgument;
            CommonClass cl = new CommonClass();
            SqlDataReader dr = cl.RunSqlReturnDR("select IsReplied from MI_MGV_Enquiry where id=" + Session["reply"] + "");
            dr.Read();

            if (Convert.ToInt32(dr["IsReplied"]) == 1)
            {
                Label1.Visible = true;
                Label1.Text = "Already Replied,Do You Want To Re Reply ? ";
                Button1.Visible = true;
                Button2.Visible = true;

            }
            else
            {
                Response.Redirect("Admin_Mail.aspx");
            }
        }
        catch 
        {
            

        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin_Mail.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Server.Transfer("EnquiryList.aspx");
    }
}

