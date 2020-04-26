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

public partial class Set_Rate : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {

        btnAdd.Attributes.Add("OnClick", "return ShowTrSave();");
        btnSave.Attributes.Add("OnClick", "return CheckFields();");
        btnCancel.Attributes.Add("OnClick", "return ShowTrAdd();");
        if (Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }
        if (!this.IsPostBack)
        {
            BindGrid();         
        }
       
    }

    public void BindGrid()
    {
        SqlDataReader dr = RunSqlReturnDR("Select ID,rate_type,rate from Rate_Master");
        grdRate.DataSource = dr;
        grdRate.DataBind();

    }
    
    public void MyDataGrid_Delete(object sendder, DataGridCommandEventArgs e)
    {
            SqlCommand MyCommand;
            SqlConnection MyConnection = new SqlConnection();
            MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string deleteCmd = "delete from Rate_Master where id=@id";
            MyCommand = new SqlCommand(deleteCmd, MyConnection);
            MyCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4));
            MyCommand.Parameters["@Id"].Value = grdRate.DataKeys[Convert.ToInt32(e.Item.ItemIndex)];
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
   
    public void MyDataGrid_Edit(object sendder, DataGridCommandEventArgs e)
    {
        grdRate.EditItemIndex = Convert.ToInt32(e.Item.ItemIndex);
        BindGrid();
    }

    public void MyDataGrid_Cancel(object sendder, DataGridCommandEventArgs e)
    {
        grdRate.EditItemIndex = -1;
        BindGrid();
    }

    public void MyDataGrid_Update(object sendder, DataGridCommandEventArgs e)
    {
        if (Page.IsValid)
        {
            SqlCommand MyCommand;
            SqlConnection MyConnection = new SqlConnection();
            MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            string UpdateCmd = "Update rate_master set rate_type=@Rate_Type,rate=@Rate where ID = @Id";
            MyCommand = new SqlCommand(UpdateCmd, MyConnection);
            MyCommand.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4));
            MyCommand.Parameters.Add(new SqlParameter("@Rate_Type", SqlDbType.VarChar));
            MyCommand.Parameters.Add(new SqlParameter("@Rate", SqlDbType.Float));
            MyCommand.Parameters["@Id"].Value = grdRate.DataKeys[Convert.ToInt32(e.Item.ItemIndex)];
           
            System.Web.UI.WebControls.TextBox txtRate_Type;
            txtRate_Type = (TextBox)e.Item.FindControl("txtRate_Type");
            string strRate_Type = txtRate_Type.Text;
            MyCommand.Parameters["@Rate_Type"].Value = strRate_Type;

            System.Web.UI.WebControls.TextBox txtRate;
            txtRate = (TextBox)e.Item.FindControl("txtRate");
            string strRate = txtRate.Text;
            MyCommand.Parameters["@Rate"].Value = strRate;
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
         }
      }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //RunSql("insert into Rate_Master (Rate_Type,Rate) Values('','')");
        //BindGrid();
        
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        RunSql("insert into Rate_Master (Rate_Type,Rate) Values('"+ txtRate_Type.Text +"','"+ txtRate.Text +"')");
        BindGrid();
        
    }

    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    RunSql("insert into Rate_Master (Rate_Type,Rate) Values('"+ txtRate_Type.Text +"','"+ txtRate.Text +"')");
    //    //trAdd.Visible = true;
    //   // trSave.Visible = false;
    //    BindGrid();
    //}
}
