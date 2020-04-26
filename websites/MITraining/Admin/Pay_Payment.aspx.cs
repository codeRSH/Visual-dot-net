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

public partial class Admin_Pay_Payment : CommonClass
{
    public static string cameFrom = "";   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }

        if (!IsPostBack)
        {
            try
            {
                btnPaid.Attributes.Add("onClick", "return checkValid();");
                // Fill Payment Mode Dropdown list start
                ddlpaymode.Items.Insert(0, "--Select--");
                ddlpaymode.Items.Insert(1, "Cash");
                ddlpaymode.Items.Insert(2, "Cheque");
                ddlpaymode.Items.Insert(3, "DD");
                // Fill Payment Mode Dropdown list end

                if (Session["EmpReg_No"].ToString() != "" && Session["EmpReg_No"] != null && Request.QueryString["From"].ToString() == "Details")
                {

                    cameFrom = "Details";
                    trselectemp.Visible = false;
                    SqlDataReader MI_MGV_drRegno = RunSqlReturnDR("select T2.Cheque_Name,convert(varchar,Week_Start_date,105) as Week_Start_date," +
                                        "convert(varchar,Week_End_date,105) as Week_End_date, " +
                                        "(Direct_Income+Binary_Income+SingleLine_Income+SingleLeg_Income+Achievement_Income) as Amount " +
                                        "from MI_MGV_Weekly_Payment T1,MI_MGV_registrationDetails T2 " +
                                        "where T1.Reg_No = '" + Session["EmpReg_No"] + "' and T1.id = '" + Session["EmpId"] + "' and T2.RegistrationNo = T1.Reg_No");

                    if (MI_MGV_drRegno.Read())
                    {
                        lblRegNo.Text = Session["EmpReg_No"].ToString();
                        lblDateFrom.Text = MI_MGV_drRegno["Week_Start_date"].ToString();
                        lblDateTo.Text = MI_MGV_drRegno["Week_End_date"].ToString();
                        lblAmount.Text = MI_MGV_drRegno["Amount"].ToString();
                        lblchequename.Text = MI_MGV_drRegno["Cheque_Name"].ToString();
                    }
                }
                else if (Request.QueryString["From"].ToString() == "Pay_Now")
                {
                    tremp.Visible = false;
                    cameFrom = "Pay_Now";
                    DataView MI_MGV_dvRegno = RunSQLReturnDV("select id,Reg_No from MI_MGV_Weekly_Payment where Paid_Status = 0");
                    if (MI_MGV_dvRegno.Count > 0)
                    {
                        ddlemp.DataSource = MI_MGV_dvRegno;
                        ddlemp.DataTextField = "Reg_No";
                        ddlemp.DataValueField = "id";
                        ddlemp.DataBind();
                        ddlemp.Items.Insert(0, "--Select--");

                        btnPaid.Enabled = false;
                        trdate.Visible = false;
                        trAmount.Visible = false;
                        trmode.Visible = false;
                        trchequeNo.Visible = false;
                        trchequname.Visible = false;

                    }


                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
    }
    protected void ddlemp_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Session["EmpReg_No"] = ddlemp.SelectedItem.Text;
            Session["EmpId"] = ddlemp.SelectedValue;
            SqlDataReader MI_MGV_drRegno = RunSqlReturnDR("select T2.Cheque_Name,convert(varchar,Week_Start_date,105) as Week_Start_date," +
                                        "convert(varchar,Week_End_date,105) as Week_End_date,Total_Income,Net_Income " +                                        
                                        "from MI_MGV_Weekly_Payment T1,MI_MGV_registrationDetails T2  " +
                                        "where T1.Reg_No = '" + Session["EmpReg_No"] + "' and T1.id = '" + Session["EmpId"] + "' and T2.RegistrationNo = T1.Reg_No");

            if (MI_MGV_drRegno.Read())
            {
                lblDateFrom.Text = MI_MGV_drRegno["Week_Start_date"].ToString();
                lblDateTo.Text = MI_MGV_drRegno["Week_End_date"].ToString();
                lblAmount.Text = MI_MGV_drRegno["Total_Income"].ToString();
                lblNet.Text = MI_MGV_drRegno["Net_Income"].ToString();
                lblchequename.Text = MI_MGV_drRegno["Cheque_Name"].ToString();

                btnPaid.Enabled = true;
                trdate.Visible = true;
                trAmount.Visible = true;
                trmode.Visible = true;
                trchequeNo.Visible = true;
                trchequname.Visible = true;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    protected void btnPaid_Click(object sender, EventArgs e)
    {
        string chequeName = "";
        string chequeNo = "";
        int objInsert = 0;
        if(ddlpaymode.SelectedItem.Text=="Cash")
        {
            chequeName = "None";
            chequeNo = "None";
        }
        else
        {
            chequeName = lblchequename.Text;
            chequeNo = txtchequeNo.Text;
        }

       objInsert = RunSql("update MI_MGV_Weekly_Payment set Payment_mode='" + ddlpaymode.SelectedItem.Text + "'," +
                "Cheque_No ='" + chequeNo + "', Cheque_in_favor='" + chequeName + "',Paid_Status=1," +
                "Payment_date= getdate() where Reg_No = '" + Session["EmpReg_No"] + "' and id = " + Session["EmpId"] + "");
       if (objInsert > 0)
       {
           //ClientScript.RegisterStartupScript(this.GetType(), "alert!", "alert('Paid Successfully!');", true);
           
           if (cameFrom == "Pay_Now")
           {
               Session["EmpReg_No"] = "";
               Session["EmpId"] = "";
               Response.Redirect("Pay_Payment.aspx?From=Pay_Now");
           }
           else if (cameFrom == "Details")
           {
               Response.Redirect("PaymentStatements.aspx");
           }
          //Response.Redirect("");
       }
    }
}
