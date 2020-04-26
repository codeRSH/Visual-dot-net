using System;
using System.IO;
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

public partial class Admin_Admin_Products_List : CommonClass
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
            SqlDataReader dr = RunSqlReturnDR("Select ID,Product_Code,Product_Name,('../' + Image_name) as Image_name,Sub_heading," +
                        "Description,Price,Unit,Sales_Point,Pair_rate,case Isdeleted when 1 then 'Yes' else 'No' end as Isdeleted  from MI_MGV_Products ");
            gvproducts.DataSource = dr;
            gvproducts.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }
    protected void gvproducts_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {
            gvproducts.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void gvproducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {
            gvproducts.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void gvproducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            RunSql("delete from MI_MGV_Products where ID =" + gvproducts.DataKeys[e.RowIndex].Value + "");            
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void gvproducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            TextBox txtName = (TextBox)gvproducts.Rows[e.RowIndex].FindControl("txt_name");
            HtmlInputFile updImage = (HtmlInputFile)gvproducts.Rows[e.RowIndex].FindControl("updImage");
            TextBox txtTitle = (TextBox)gvproducts.Rows[e.RowIndex].FindControl("txt_title");
            TextBox txtdesc = (TextBox)gvproducts.Rows[e.RowIndex].FindControl("txt_desc");
            TextBox txtPrice = (TextBox)gvproducts.Rows[e.RowIndex].FindControl("txt_price");
            TextBox txtUnit = (TextBox)gvproducts.Rows[e.RowIndex].FindControl("txt_unit");
            TextBox txtSales = (TextBox)gvproducts.Rows[e.RowIndex].FindControl("txt_sp");
            TextBox txtPair = (TextBox)gvproducts.Rows[e.RowIndex].FindControl("txt_pr");

            string path = "";
            string filetype = "";
            filetype = System.IO.Path.GetExtension(updImage.PostedFile.FileName);
            filetype = filetype.ToLower();

            if (filetype == ".bmp" || filetype == ".jpg" || filetype == ".gif" || filetype == ".png" || filetype == ".tif" || filetype == ".ico" || filetype == ".wmf")
            {
                string imgFolder = Server.MapPath("../Product_Images/");
                string imgtype = System.IO.Path.GetFileName(updImage.PostedFile.FileName.ToString());                
                string[] imgList = Directory.GetFiles(imgFolder, imgtype);
                foreach (string img in imgList)
                {
                    FileInfo imgInfo = new FileInfo(img);
                    if (imgInfo.Name.ToString() == imgtype)
                    {
                        imgInfo.Delete();
                    }
                }
                updImage.PostedFile.SaveAs(MapPath("../Product_Images/" + System.IO.Path.GetFileName(updImage.PostedFile.FileName.ToString())));
                path = "Product_Images/" + System.IO.Path.GetFileName(updImage.PostedFile.FileName.ToString());
            }

            RunSql("update MI_MGV_Products set Product_Name='" + txtName.Text.Trim() + "',Image_name='" + path + "', " +
                "Sub_heading = '" + txtTitle.Text.Trim() + "',Description='" + txtdesc.Text.Trim() + "'," +
                "Price= '" + txtPrice.Text.Trim() + "',Unit= " + txtUnit.Text.Trim() + ",Sales_Point = '" + txtSales.Text.Trim() + "',Pair_rate = '" + txtPair.Text.Trim() + "' " +
                "where ID =" + gvproducts.DataKeys[e.RowIndex].Value + "");
            //customer.Update(GridView1.DataKeys[e.RowIndex].Values[0].ToString(), txtName.Text, cmbGender.SelectedValue, txtCity.Text, CustomerType.SelectedValue);
            gvproducts.EditIndex = -1;
            BindGrid();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    } 
   
}
