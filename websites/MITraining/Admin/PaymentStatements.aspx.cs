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

public partial class Admin_PaymentStatements : CommonClass 
{
    public static int Sno = 0;
    public int PageNo = 0;

    static string sortexp = "";
    static string sortDirc = "";
    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";

    protected void Page_Load(object sender, EventArgs e)
    {
        Sno = 0;
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "" )
        {
            Response.Redirect("Default.aspx");
        }
        if (!IsPostBack)
        {
            try
            {

                bind_griedview();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }


        }
    }

    public void bind_griedview()
    {
        try
        {
            DataView dv;
            dv = RunSQLReturnDV("select id,Reg_No,convert(varchar,Week_Start_date,105) as Week_Start_date," +
                "convert(varchar,Week_End_date,105) as Week_End_date,convert(varchar,Payment_Generate_date,105) " +
                "as Payment_Generate_date,Direct_Income,Binary_Income,SingleLine_Income,SingleLeg_Income," +
                "case Paid_Status when 0 then '../images/no.gif' else '../images/yes.gif' end as Paid_Status " +
                "from MI_MGV_Weekly_Payment where SL_Status = 1 order by Payment_Generate_date");
            //dv = RunSQLReturnDV("Select * from MI_MGV_registrationDetails");
            if (dv.Count > 0)
            {
                if (sortexp != "" && sortDirc != "")
                {
                    dv.Sort = sortexp + sortDirc;
                    gvPaymentStatements.DataSource = dv;
                    gvPaymentStatements.DataBind();
                }
                else
                {
                    gvPaymentStatements.DataSource = dv;
                    gvPaymentStatements.DataBind();
                }
                
                dv.Dispose();
            }
            else
            {
                lblnorecord.Text = "There is no record for Payment Statements";
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    protected void OnSort(object sender, GridViewSortEventArgs e)
    {
        string sortExpression = e.SortExpression;
        sortexp = sortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {

            GridViewSortDirection = SortDirection.Descending;
            sortDirc = " DESC";

            SortGridView(sortExpression, DESCENDING);

        }

        else
        {

            GridViewSortDirection = SortDirection.Ascending;
            sortDirc = " ASC";

            SortGridView(sortExpression, ASCENDING);

        }

    }

    private void SortGridView(string sortExpression, string direction)
    {

        // You can cache the DataTable for improving performance

        Sno = (PageNo * gvPaymentStatements.PageSize) + 1;

        DataView dv;
        dv = RunSQLReturnDV("select id,Reg_No,convert(varchar,Week_Start_date,105) as Week_Start_date," +
            "convert(varchar,Week_End_date,105) as Week_End_date,convert(varchar,Payment_Generate_date,105) " +
            "as Payment_Generate_date,Direct_Income,Binary_Income,SingleLine_Income," +
            "case Paid_Status when 0 then '../images/no.gif' else '../images/yes.gif' end as Paid_Status " +
            "from MI_MGV_Weekly_Payment order by Week_Start_date DESC");

        dv.Sort = sortExpression + direction;

        gvPaymentStatements.DataSource = dv;

        gvPaymentStatements.DataBind();

    }

    public SortDirection GridViewSortDirection
    {

        get
        {

            if (ViewState["sortDirection"] == null)

                ViewState["sortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["sortDirection"];

        }

        set { ViewState["sortDirection"] = value; }

    }

    public void sno(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Sno++;
            e.Row.Cells[0].Text = Sno.ToString();
        }
    }

    public void gvPaymentGenerate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Sno = 0;
        gvPaymentStatements.PageIndex = e.NewPageIndex;
        PageNo = e.NewPageIndex;
        Sno = (PageNo * gvPaymentStatements.PageSize) + 1;
        bind_griedview();
    }

    //protected void btnDetails_Click(object sender, EventArgs e)
    //{
    //    Button objbtn = (Button)sender;
    //    Session["EmpId"] = "";
    //    Session["EmpId"] = objbtn.CommandArgument.ToString();
    //    Response.Redirect("Payment.aspx");
    //}

}
