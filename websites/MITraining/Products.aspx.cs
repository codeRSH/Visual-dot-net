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

public partial class Products : CommonClass
{
    public int Sno = 1;
    public string strImage = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            
            DataView dv;
            dv = RunSQLReturnDV("Select * from MI_MGV_Products");
            gvproducts.DataSource = dv;
            gvproducts.DataBind();
            dv.Dispose();
        }
        catch (Exception ex)
        {
            Response.Write(ex);
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
    
}
