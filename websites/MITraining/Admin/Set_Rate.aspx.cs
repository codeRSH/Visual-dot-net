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
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
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
        try
        {
            SqlDataReader dr = RunSqlReturnDR("Select ID,rate_type,rate,Level from Rate_Master");
            // SqlDataReader dr = RunSPReturnDR("SelectRateList");
            grdRate.DataSource = dr;
            grdRate.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }
    
    public void MyDataGrid_Delete(object sendder, DataGridCommandEventArgs e)
    {
            try
            {
                RunSP("DeleteRateListItem", new SqlParameter("@RateID", grdRate.DataKeys[Convert.ToInt32(e.Item.ItemIndex)]));
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
        try
        {
            grdRate.EditItemIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    public void MyDataGrid_Update(object sendder, DataGridCommandEventArgs e)
    {
        if (Page.IsValid)
        {
            System.Web.UI.WebControls.TextBox txtRate;
            txtRate = (TextBox)e.Item.FindControl("txtRate");
            
            System.Web.UI.WebControls.TextBox txtLevel;
            txtLevel = (TextBox)e.Item.FindControl("txtLevel");
             try
            {
               RunSP("UpdateRateListItem", new SqlParameter("@RateID", grdRate.DataKeys[Convert.ToInt32(e.Item.ItemIndex)]), new SqlParameter("@Rate", txtRate.Text), new SqlParameter("@Level", txtLevel.Text));
            }
            catch (SqlException ex)
            {
                throw ex;
            }
         }
      }    
    
}
