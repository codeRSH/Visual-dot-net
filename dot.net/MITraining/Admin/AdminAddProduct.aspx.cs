using System;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_AdminAddProduct : CommonClass 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnadd.Attributes.Add("onClick", "return checkfields();");
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            string path = "";
            string filetype = "";
            filetype = System.IO.Path.GetExtension(uploadfile.FileName);
            filetype = filetype.ToLower();

            if (filetype == ".bmp" || filetype == ".jpg" || filetype == ".gif" || filetype == ".png" || filetype == ".tif" || filetype == ".ico" || filetype == ".wmf")
            {
                string imgFolder = Server.MapPath("~/Product_Images/");
                string imgtype = uploadfile.FileName.ToString();
                string[] imgList = Directory.GetFiles(imgFolder, imgtype);
                foreach (string img in imgList)
                {
                    FileInfo imgInfo = new FileInfo(img);
                    if (imgInfo.Name.ToString() == uploadfile.FileName.ToString())
                    {
                        imgInfo.Delete();                       
                    }
                }

                uploadfile.SaveAs(MapPath("~/Product_Images/" + uploadfile.FileName.ToString()));
                path = "Product_Images/" + uploadfile.FileName.ToString();
            }

            string strInsert = "Insert into MI_MGV_Products(Product_Code,Product_Name,Image_name,Sub_heading,Description,Price,Unit,Sales_Point,Pair_rate) " +
                        " values(" + txtcode.Text.ToString().Trim() + ",'" + txtProductName.Text.ToString().Trim() + "','" + path + "' " +
                        " ,'" + txtTitle.Text.ToString().Trim() + "','" + txtdescription.Text.ToString().Trim() + "'," +
                        "'" + txtprice.Text.ToString().Trim() + "'," + txtunit.Text.ToString().Trim() + "," + txtsalesPoint.Text.ToString().Trim() + "," + txtPairRate.Text.ToString().Trim() + ")";

            int objInserted = RunSql(strInsert);
            if (objInserted > 0)
            {
                Session["Message"] = "Product Added Successfully ";
                Response.Redirect("Admin_Conformation.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}
