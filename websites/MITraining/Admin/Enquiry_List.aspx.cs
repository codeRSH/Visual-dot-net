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

public partial class Admin_Enquiry_List : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }
        if (!this.IsPostBack)
        {
            try
            {
                DataView Dv = new DataView();

                intCurrIndex.Text = Convert.ToString(grdEnquiry.CurrentPageIndex);
                if (ddlStatus.SelectedValue == "0")
                {
                    //Dv = RunSQLReturnDV("select id from MI_MGV_Enquiry where isReplied=0");
                    Dv = RunSPReturnDV("EnquiryCount", new SqlParameter("@IsReplied", "0"));


                }
                else if (ddlStatus.SelectedValue == "1")
                {
                    // Dv = RunSQLReturnDV("select id from MI_MGV_Enquiry where isReplied=1");
                    Dv = RunSPReturnDV("EnquiryCount", new SqlParameter("@IsReplied", "1"));
                }
                grdEnquiry.VirtualItemCount = Dv.Count;
                BindGrid();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }

    public void BindGrid()
    {
        DataView Dv= new DataView();
        if (ddlStatus.SelectedValue == "0")
        {
            // Dv = RunSQLReturnListDV("Select ID,Name,email as EmailID,subject,case IsReplied when 1 then 'Yes' else 'No' end as IsReplied from MI_MGV_Enquiry where isReplied=0", Convert.ToInt32(intCurrIndex.Text), grdEnquiry.PageSize, "temp");
            Dv = RunSPReturnListDV("EnquiryList", Convert.ToInt32(intCurrIndex.Text), grdEnquiry.PageSize, "temp", new SqlParameter("@IsReplied","0"));

        }
        else if (ddlStatus.SelectedValue == "1")
        {
             //Dv = RunSQLReturnListDV("Select ID,Name,email as EmailID,subject,case IsReplied when 1 then 'Yes' else 'No' end as IsReplied from MI_MGV_Enquiry where isReplied=1", Convert.ToInt32(intCurrIndex.Text), grdEnquiry.PageSize, "temp");
             Dv = RunSPReturnListDV("EnquiryList", Convert.ToInt32(intCurrIndex.Text), grdEnquiry.PageSize, "temp", new SqlParameter("@IsReplied", "1"));
        }
        grdEnquiry.DataSource = Dv;
        grdEnquiry.DataBind();
   }
    
    public void MyDataGrid_Page(Object sender, DataGridPageChangedEventArgs e)
    {

        grdEnquiry.CurrentPageIndex = e.NewPageIndex;
        intCurrIndex.Text = Convert.ToString(grdEnquiry.CurrentPageIndex * grdEnquiry.PageSize);
        BindGrid();
    }
    
    protected void btnReply_Click(object sender, EventArgs e)
    {
        Button objBtn = (Button)sender;
        Session["EnquiryID"] = "";
        Session["EnquiryID"] = objBtn.CommandArgument.ToString();
        Response.Redirect("Admin_Mail.aspx");
    }
    
    protected void btnDetails_Click(object sender, EventArgs e)
    {
        Button objBtn = (Button)sender;
        Session["EnquiryID"] = "";
        Session["EnquiryID"] = objBtn.CommandArgument.ToString();
        Response.Redirect("Admin_Enquiry_Details.aspx");
    }
    
    public void MyDataGrid_Delete(object sendder, DataGridCommandEventArgs e)
    {
        SqlCommand MyCommand;
        SqlConnection MyConnection = new SqlConnection();
        MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        string deleteCmd = "delete from MI_MGV_Enquiry where id=@id";
        MyCommand = new SqlCommand(deleteCmd, MyConnection);
        MyCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4));
        MyCommand.Parameters["@Id"].Value = grdEnquiry.DataKeys[Convert.ToInt32(e.Item.ItemIndex)];
        try
        {
            MyCommand.Connection.Open();
            MyCommand.ExecuteNonQuery();
            MyCommand.Connection.Close();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        BindGrid();
    }
   
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid();
    }
   
}
