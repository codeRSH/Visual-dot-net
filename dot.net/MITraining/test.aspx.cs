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

public partial class test : CommonClass 
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    private void GetDates()
    {
        double offset = 0;
        DateTime stDate;
        DateTime endDate;
        switch (System.DateTime.Today.DayOfWeek)
        {
            case DayOfWeek.Monday:
                offset = 0;
                break;
            case DayOfWeek.Tuesday:
                offset = -1;
                break;
            case DayOfWeek.Wednesday:
                offset = -2;
                break;
            case DayOfWeek.Thursday:
                offset = -3;
                break;
            case DayOfWeek.Friday:
                offset = -4;
                break;
            case DayOfWeek.Saturday:
                offset = -5;
                break;
            case DayOfWeek.Sunday:
                offset = -6;
                break;
        }
        stDate = System.DateTime.Today.AddDays(offset);
        endDate = System.DateTime.Today.AddDays(6 + offset);
        lbldate.Text = stDate.ToShortDateString() + "  " + endDate.ToShortDateString();
    }
    protected void btntest_Click(object sender, EventArgs e)
    {
        //GetDates();
        DateTime weekStartDate;
        DateTime weekEndDate;
        SqlDataReader drdate = RunSqlReturnDR("select [dbo].[ufn_GetFirstDayOfWeek] ( GETDATE() ) as currentdate");
        if (drdate.Read())
        {
            weekStartDate = Convert.ToDateTime(drdate["currentdate"].ToString());            
            weekEndDate = weekStartDate.AddDays(6);
           // lbldate.Text = weekStartDate.ToShortDateString() + "  " + weekEndDate.ToShortDateString();

            SqlDataReader dr = RunSqlReturnDR("select * from MI_MGV_registrationDetails where Join_Date between '" + weekStartDate + "' and '" + weekEndDate + "'");
        }

    }
}
