using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Product_Details : CommonClass 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["Product_Code"] != null && Request.QueryString["Product_Code"] != "")
            {

                int product_code = Convert.ToInt32(Request.QueryString["Product_Code"]);
                SqlDataReader MI_MGV_drProduct = RunSqlReturnDR("select * from MI_MGV_Products where Product_Code= " + product_code + "");

                if (MI_MGV_drProduct.Read())
                {
                    lblProduct_name.Text = MI_MGV_drProduct["Product_Name"].ToString();
                    lblsubheading.Text = MI_MGV_drProduct["Sub_heading"].ToString();
                    lblprice.Text = MI_MGV_drProduct["Price"].ToString();
                    lblsalespoint.Text = MI_MGV_drProduct["Unit"].ToString();
                    imgProduct_image.ImageUrl = MI_MGV_drProduct["Image_name"].ToString();
                    lblDescription.Text = MI_MGV_drProduct["Description"].ToString();

                }                
            }
        }
    }
}
