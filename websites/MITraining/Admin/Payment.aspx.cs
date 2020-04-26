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

public partial class Admin_Payment : CommonClass
{
    //string empNo = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["Reg_No"] != null && Request.QueryString["Reg_No"].ToString() != "")
                {
                    Session["EmpReg_No"] = Request.QueryString["Reg_No"].ToString();
                    SqlDataReader MI_MGV_drEmpName = RunSqlReturnDR("Select Name from MI_MGV_registrationDetails where RegistrationNo= '" + Session["EmpReg_No"] + "'");
                    if (MI_MGV_drEmpName.Read())
                    {
                        lblempname.Text = MI_MGV_drEmpName["Name"].ToString();
                    }
                }

                if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
                {
                    Session["EmpId"] = Request.QueryString["id"].ToString();
                    SqlDataReader MI_MGV_drPayment = RunSqlReturnDR("Select * from MI_MGV_Weekly_Payment where Reg_No= '" + Session["EmpReg_No"] + "' and id ='" + Session["EmpId"] + "'");
                    if (MI_MGV_drPayment.Read())
                    {
                        lblgeneratedate.Text = MI_MGV_drPayment["Payment_Generate_date"].ToString();
                        lblStartingDate.Text = MI_MGV_drPayment["Week_Start_date"].ToString();
                        lblEndingDate.Text = MI_MGV_drPayment["Week_End_date"].ToString();
                        lbl_D_income.Text = MI_MGV_drPayment["Direct_Income"].ToString();
                        lbl_B_income.Text = MI_MGV_drPayment["Binary_Income"].ToString();
                        lbl_SL_income.Text = MI_MGV_drPayment["SingleLine_Income"].ToString();
                        lbl_SLeg_income.Text = MI_MGV_drPayment["SingleLeg_Income"].ToString();
                        lbl_Total.Text = MI_MGV_drPayment["Total_Income"].ToString();
                        lbl_TDS.Text = MI_MGV_drPayment["TDS"].ToString();
                        lbl_Admin.Text = MI_MGV_drPayment["Administration"].ToString();
                        lbl_Edu.Text = MI_MGV_drPayment["Education_Charge"].ToString();
                        lbl_Well.Text = MI_MGV_drPayment["WellFare_Charge"].ToString();
                        lbl_Net.Text = MI_MGV_drPayment["Net_Income"].ToString();
                        Boolean status = Convert.ToBoolean(MI_MGV_drPayment["Paid_Status"]);
                        if (status)
                        {
                            lblpaidstatus.Text = "PAID";
                            lblpaymode.Text = MI_MGV_drPayment["Payment_mode"].ToString();
                            lblchequeno.Text = MI_MGV_drPayment["Cheque_No"].ToString();
                            lblchequename.Text = MI_MGV_drPayment["Cheque_in_favor"].ToString();
                            lblPayDate.Text = MI_MGV_drPayment["Payment_date"].ToString();
                        }
                        else
                        {
                            lblpaidstatus.Text = "NOT PAID";
                            lnkbtnpaynow.Visible = true;
                        }
                    }
                }

            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }

    protected void Pay_Now(object sender, EventArgs e)
    {

        Response.Redirect("Pay_Payment.aspx?From=Details");
    }
}
