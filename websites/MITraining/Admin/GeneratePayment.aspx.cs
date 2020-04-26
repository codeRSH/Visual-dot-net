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

public partial class Admin_GeneratePayment : CommonClass 
{
    public static int Sno = 1;
    public static int PageNo =0;    
    string[] arrRegNoSingl;

    //int totalrowcount = 0;
    DateTime currDate;
    DateTime StartDateOfWeek;
    DateTime EndDateOfWeek;

    int Rootlevel;
    int SingleLineRateMaxLevel = 0;
    int SingleLegRateMaxLevel = 0;
    decimal DirectRate = 0;
    decimal SingleLineRate = 0;    
    decimal SingleLegRate = 0;    
    int CapingValue = 0;    

    DateTime FirstLevelPairCreatedOn = new DateTime();    
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");            
        }
        //start GetDates() first week and last week date;
            getdate();
            //GetDatesClient();
        //End GetDates() first week and last week date;
            try
            {
                // set income rate -- start

                SqlDataReader DrDirectRate = RunSqlReturnDR("select rate_type,rate,level from rate_master ");
                while (DrDirectRate.Read())
                {
                    if (DrDirectRate["rate_type"].ToString() == "Direct")
                        DirectRate = Convert.ToDecimal(DrDirectRate["rate"]);
                    else if (DrDirectRate["rate_type"].ToString() == "Single Line")
                    {
                        SingleLineRate = Convert.ToDecimal(DrDirectRate["rate"]);
                        SingleLineRateMaxLevel = Convert.ToInt32(DrDirectRate["level"]);
                    }
                    else if (DrDirectRate["rate_type"].ToString() == "Single Leg")
                    {
                        SingleLegRate = Convert.ToDecimal(DrDirectRate["rate"]);
                        SingleLegRateMaxLevel = Convert.ToInt32(DrDirectRate["level"]);
                    }
                    else if (DrDirectRate["rate_type"].ToString() == "Caping value")
                    {
                        CapingValue = Convert.ToInt32(DrDirectRate["rate"]);
                    }

                }

                DrDirectRate.Close();
                DrDirectRate = null;
                // set income rate -- End
                
            }
            catch (Exception ex)
            {
                //Response.Write(ex);
                lblError.Text = ex.ToString();
            }

        if (!IsPostBack)
        {
           
               lblpaymentdate.Text = "Payment From " + StartDateOfWeek.ToShortDateString() + " To " + EndDateOfWeek.ToShortDateString();

               bind_griedview();  
        }        
        
    }

    public void getdate()
    {
        try
        {
            SqlDataReader MI_MGV_drdate = RunSqlReturnDR("select [dbo].[ufn_GetFirstDayOfWeek] ( GETDATE() ) as currentdate");
            if (MI_MGV_drdate.Read())
            {
                currDate = Convert.ToDateTime(MI_MGV_drdate["currentdate"].ToString());
                StartDateOfWeek = currDate.AddDays(-7);
                EndDateOfWeek = currDate.AddDays(-1);
            }
            MI_MGV_drdate.Close();
            MI_MGV_drdate = null;
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    public void GetDatesClient()
    {
        double offset = 0;
        DateTime curDate = new DateTime();
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
        curDate = System.DateTime.Today.AddDays(offset);
        StartDateOfWeek = curDate.AddDays(-7);
        EndDateOfWeek = curDate.AddDays(-1);
    }    

    public void bind_griedview()
    {
        try
        {
            DataView dv;
            dv = RunSQLReturnDV("Select RegistrationNo,Name,FHName,DOB,City,Natioanlity,CONVERT(varchar, join_date, 105) AS join_date from MI_MGV_registrationDetails " +
                               "where (LeftChildRegNo != '0' or RightChildRegNo != '0') and IsActive=1 and Join_Date<= '" + EndDateOfWeek.ToShortDateString() + "' " +
                                "and RegistrationNo not in(select Reg_No from MI_MGV_Weekly_Payment where Week_Start_date = '" + StartDateOfWeek.ToShortDateString() + "' " +
                                "and Week_End_date = '" + EndDateOfWeek.ToShortDateString() + "') order by Name");
            //dv = RunSQLReturnDV("Select * from MI_MGV_registrationDetails");
            if (dv.Count > 0)
            {
                lblnorecord.Text = "Click on <b>GENERATE PAYMENT</b> button to calculate payment for next 10 Employee.";
                btnfinalPayment.Visible = false;
                gvPaymentGenerate.DataSource = dv;
                gvPaymentGenerate.DataBind();
                dv.Dispose();                
            }
            else
            {
                btnGeneratePayment.Visible = false;
                trgried.Visible = false;                
                lblnorecord.Text = "";
                lblnorecord.Text = "";
                btnfinalPayment.Visible = true;
                SqlDataReader dr = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where SL_Status =0");
                if (!dr.HasRows)
                {
                    lblnorecord.Text = "Payment Generated";
                    btnfinalPayment.Visible = false;
                }
                
            }
            
        }
        catch (Exception ex)
        {
            //Response.Write(ex);
            lblError.Text = ex.ToString();
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

    public void gvPaymentGenerate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvPaymentGenerate.PageIndex = e.NewPageIndex;
        PageNo = e.NewPageIndex;
        Sno = (PageNo * gvPaymentGenerate.PageSize) + 1;
        bind_griedview();
    }

    public void Check_Pair(string RegNo, string LeftCRegNo, string RightCRegNo, int Dlevel, int JPoints, int Preference)
    {
        try
        {
            int Position = 0;

            SqlDataReader MI_MGV_drCheckPair = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where ParentID = '" + RegNo + "' and IsActive=1");
            SqlDataReader MI_MGV_drGETPARENT = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo = '" + RegNo + "' and IsActive=1");
            SqlDataReader MI_MGV_drCheckPair2 = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo in ('" + RegNo + "') and IsActive=1");

            if (MI_MGV_drCheckPair.Read())
            {
                if (MI_MGV_drGETPARENT.Read())
                {
                    Position = Convert.ToInt32(MI_MGV_drGETPARENT["AddTo"]);
                    RunSql("insert into MI_MGV_BPaymentAdmin(PaymentFor,Parent_Reg_No,Reg_No,Position,Level,Joining_Points,Preference,Join_Date) values ('" + Session["UserID"].ToString() + "','" + MI_MGV_drGETPARENT["ParentID"] + "','" + MI_MGV_drGETPARENT["RegistrationNo"] + "'," + Position + "," + MI_MGV_drGETPARENT["Depth_Level"] + "," + JPoints + "," + Preference + ",'" + MI_MGV_drGETPARENT["Join_Date"] + "')");
                    MI_MGV_drGETPARENT.Close();
                    MI_MGV_drGETPARENT = null;
                }
                MI_MGV_drCheckPair.Close();
                MI_MGV_drCheckPair = null;
            }

            else if (MI_MGV_drCheckPair2.Read())
            {
                if (MI_MGV_drGETPARENT.Read())
                {
                    Position = Convert.ToInt32(MI_MGV_drGETPARENT["AddTo"]);
                    RunSql("insert into MI_MGV_BPaymentAdmin(PaymentFor,Parent_Reg_No,Reg_No,Position,Level,Joining_Points,Preference,Join_Date) values ('" + Session["UserID"].ToString() + "','" + MI_MGV_drGETPARENT["ParentID"] + "','" + MI_MGV_drGETPARENT["RegistrationNo"] + "'," + Position + "," + MI_MGV_drGETPARENT["Depth_Level"] + "," + JPoints + "," + Preference + ",'" + MI_MGV_drGETPARENT["Join_Date"] + "')");
                    MI_MGV_drGETPARENT.Close();
                    MI_MGV_drGETPARENT = null;
                }
                MI_MGV_drCheckPair.Close();
                MI_MGV_drCheckPair = null;
            }

            else
            {
                return;
            }


            //  left Start
            if (LeftCRegNo != "0")
            {
                SqlDataReader MI_MGV_drLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + LeftCRegNo + "' and IsActive=1");
                if (MI_MGV_drLEFT.Read())
                {
                    Check_Pair(MI_MGV_drLEFT["RegistrationNo"].ToString(), MI_MGV_drLEFT["LeftChildRegNo"].ToString(), MI_MGV_drLEFT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drLEFT["Depth_Level"]), Convert.ToInt32(MI_MGV_drLEFT["Joining_Points"]), Convert.ToInt32(MI_MGV_drLEFT["ID"]));
                    MI_MGV_drLEFT.Close();
                    MI_MGV_drLEFT = null;
                }
            }
            // Left End

            //  Right Start
            if (RightCRegNo != "0")
            {
                SqlDataReader MI_MGV_drRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + RightCRegNo + "' and IsActive=1");
                if (MI_MGV_drRIGHT.Read())
                {
                    Check_Pair(MI_MGV_drRIGHT["RegistrationNo"].ToString(), MI_MGV_drRIGHT["LeftChildRegNo"].ToString(), MI_MGV_drRIGHT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drRIGHT["Depth_Level"]), Convert.ToInt32(MI_MGV_drRIGHT["Joining_Points"]), Convert.ToInt32(MI_MGV_drRIGHT["ID"]));
                    MI_MGV_drRIGHT.Close();
                    MI_MGV_drRIGHT = null;
                }
            }
            //  Right End
        }
        catch (Exception ex)
        {
            //Response.Write(ex);
            lblError.Text = ex.ToString();
        }
    }

    public void Check_Pair_SingleLine(string RegNo, string LeftCRegNo, string RightCRegNo, int Dlevel, int JPoints, int Preference)
    {
        try
        {
            //int Position = 0;

            SqlDataReader MI_MGV_drCheckPair = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where ParentID = '" + RegNo + "' and IsActive=1");
            SqlDataReader MI_MGV_drGetBinary = RunSqlReturnDR("Select Binary_Income from MI_MGV_Weekly_Payment Where Reg_No = '" + RegNo + "' and " +
                "Week_Start_date='" + StartDateOfWeek.ToShortDateString() + "' and Week_End_date='" + EndDateOfWeek.ToShortDateString() + "'");

            SqlDataReader MI_MGV_drCheckPair2 = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo in ('" + RegNo + "') and IsActive=1");

            if (MI_MGV_drCheckPair.Read())
            {
                if (MI_MGV_drGetBinary.Read())
                {
                    //Position = Convert.ToInt32(MI_MGV_drGETPARENT["AddTo"]);
                    RunSql("insert into MI_MGV_SingleLine(Payment_For,RegNo,Binary_Income,D_level) values ('" + Session["UserID"].ToString() + "','" + RegNo + "','" + MI_MGV_drGetBinary["Binary_Income"] + "'," + Dlevel + ")");
                    MI_MGV_drGetBinary.Close();
                    MI_MGV_drGetBinary = null;
                }
                MI_MGV_drCheckPair.Close();
                MI_MGV_drCheckPair = null;
            }

            else if (MI_MGV_drCheckPair2.Read())
            {
                if (MI_MGV_drGetBinary.Read())
                {
                    //Position = Convert.ToInt32(MI_MGV_drGETPARENT["AddTo"]);
                    RunSql("insert into MI_MGV_SingleLine(Payment_For,RegNo,Binary_Income,D_level) values ('" + Session["UserID"].ToString() + "','" + RegNo + "','" + MI_MGV_drGetBinary["Binary_Income"] + "'," + Dlevel + ")");
                    MI_MGV_drGetBinary.Close();
                    MI_MGV_drGetBinary = null;
                }
                MI_MGV_drCheckPair.Close();
                MI_MGV_drCheckPair = null;
            }

            else
            {
                return;
            }


            //  left Start
            if (LeftCRegNo != "0")
            {
                SqlDataReader MI_MGV_drLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + LeftCRegNo + "' and IsActive=1");
                if (MI_MGV_drLEFT.Read())
                {
                    Check_Pair_SingleLine(MI_MGV_drLEFT["RegistrationNo"].ToString(), MI_MGV_drLEFT["LeftChildRegNo"].ToString(), MI_MGV_drLEFT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drLEFT["Depth_Level"]), Convert.ToInt32(MI_MGV_drLEFT["Joining_Points"]), Convert.ToInt32(MI_MGV_drLEFT["ID"]));
                    MI_MGV_drLEFT.Close();
                    MI_MGV_drLEFT = null;
                }
            }
            // Left End

            //  Right Start
            if (RightCRegNo != "0")
            {
                SqlDataReader MI_MGV_drRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + RightCRegNo + "' and IsActive=1");
                if (MI_MGV_drRIGHT.Read())
                {
                    Check_Pair_SingleLine(MI_MGV_drRIGHT["RegistrationNo"].ToString(), MI_MGV_drRIGHT["LeftChildRegNo"].ToString(), MI_MGV_drRIGHT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drRIGHT["Depth_Level"]), Convert.ToInt32(MI_MGV_drRIGHT["Joining_Points"]), Convert.ToInt32(MI_MGV_drRIGHT["ID"]));
                    MI_MGV_drRIGHT.Close();
                    MI_MGV_drRIGHT = null;
                }
            }
            //  Right End
        }
        catch (Exception ex)
        {
            //Response.Write(ex);
            lblError.Text = ex.ToString();
        }
    }


    public void setParentPosition(string RegNo, string ParentRegNo, int Positon)
    {
        try
        {
            if (ParentRegNo.ToString() == Session["UserID"].ToString())
            {
                RunSql("update MI_MGV_BPaymentAdmin set parent_Position=" + Positon + " where reg_no='" + RegNo + "' and PaymentFor='" + Session["UserID"].ToString() + "'");
            }
            else
            {
                int pos = FindParentID(RegNo);
                if (pos != 2)
                    RunSql("update MI_MGV_BPaymentAdmin set parent_Position=" + pos + " where reg_no='" + RegNo + "' and  PaymentFor='" + Session["UserID"].ToString() + "'");
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex);
            lblError.Text = ex.ToString();
        }

    }

    public int FindParentID(string RegNo)
    {
        int strPreviousPosition = 2;
        try
        {
            while (RegNo != "")
            {
                SqlDataReader MI_MGV_DR = RunSqlReturnDR("select Parent_Reg_No,position from MI_MGV_BPaymentAdmin where Reg_No='" + RegNo + "' and  PaymentFor='" + Session["UserID"].ToString() + "'");
                if (MI_MGV_DR.Read())
                {
                    strPreviousPosition = Convert.ToInt32(MI_MGV_DR["Position"]);
                    //FindParentID(MI_MGV_DR["Parent_Reg_No"].ToString());
                    RegNo = MI_MGV_DR["Parent_Reg_No"].ToString();
                }
                else
                {
                    RegNo = "";
                }
            }
        }
        catch (Exception ex)
        {
            //Response.Write(ex);
            lblError.Text = ex.ToString();
        }
        return strPreviousPosition;

    }

    public void calculateIncome()
    {
        try
        {

            decimal DirectIncome = 0;            
            Boolean BinaryPayment = false;

            SqlDataReader MI_MGV_drROOT = RunSqlReturnDR("select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points from MI_MGV_registrationDetails where RegistrationNo = '" + Session["UserID"].ToString() + "' and IsActive=1");
            if (MI_MGV_drROOT.Read())
            {
                Rootlevel = Convert.ToInt32(MI_MGV_drROOT["Depth_Level"]);

                SqlDataReader MI_MGV_drCountchild = RunSqlReturnDR("select count(id) as countId  from MI_MGV_RegistrationDetails where ParentId = '" + Session["UserID"].ToString() + "' and IsActive=1");
                if (MI_MGV_drCountchild.Read())
                {
                    int countid = Convert.ToInt32(MI_MGV_drCountchild["countId"].ToString());
                    if (countid > 1)
                    {
                        DataView DvLeftRightMemberChilds = RunSQLReturnDV("select top 1 id,Join_Date from MI_MGV_RegistrationDetails where ParentId in ('" + MI_MGV_drROOT["LeftChildRegNo"].ToString() + "','" + MI_MGV_drROOT["RightChildRegNo"].ToString() + "') and IsActive=1 order by id,join_date ");
                        if (DvLeftRightMemberChilds.Count > 0)
                        {
                            FirstLevelPairCreatedOn = Convert.ToDateTime(DvLeftRightMemberChilds[0]["Join_Date"].ToString());

                            SqlDataReader MI_MGV_drCheckReference = RunSqlReturnDR("select count(ReferenceBy) as refcount from MI_MGV_registrationdetails where ReferenceBy = '" + Session["UserID"].ToString() + "' and IsActive=1"); // atleast two references are mandatory for binary income
                            if (MI_MGV_drCheckReference.Read())
                            {
                                int countreference = Convert.ToInt32(MI_MGV_drCheckReference["refcount"].ToString());
                                if (countreference > 1)
                                {
                                    BinaryPayment = true;
                                }
                            }

                            MI_MGV_drCheckReference.Close();
                            MI_MGV_drCheckReference = null;
                        }

                        DvLeftRightMemberChilds.Dispose();
                        DvLeftRightMemberChilds = null;
                    }
                }
                MI_MGV_drCountchild.Close();
                MI_MGV_drCountchild = null;

                // Root left Start
                if (MI_MGV_drROOT["LeftChildRegNo"].ToString() != "0" && MI_MGV_drROOT["LeftChildRegNo"] != null)
                {
                    SqlDataReader MI_MGV_drMAINLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["LeftChildRegNo"] + "' and IsActive=1");
                    if (MI_MGV_drMAINLEFT.Read())
                    {
                        Check_Pair(MI_MGV_drMAINLEFT["RegistrationNo"].ToString(), MI_MGV_drMAINLEFT["LeftChildRegNo"].ToString(), MI_MGV_drMAINLEFT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drMAINLEFT["Depth_Level"]), Convert.ToInt32(MI_MGV_drMAINLEFT["Joining_Points"]), Convert.ToInt32(MI_MGV_drMAINLEFT["ID"]));
                        MI_MGV_drMAINLEFT.Close();
                        MI_MGV_drMAINLEFT = null;
                    }
                }
                // Root Left End

                // Root Right Start
                if (MI_MGV_drROOT["RightChildRegNo"].ToString() != "0" && MI_MGV_drROOT["RightChildRegNo"] != null)
                {
                    SqlDataReader MI_MGV_drMAINRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["RightChildRegNo"] + "' and IsActive=1");
                    if (MI_MGV_drMAINRIGHT.Read())
                    {
                        Check_Pair(MI_MGV_drMAINRIGHT["RegistrationNo"].ToString(), MI_MGV_drMAINRIGHT["LeftChildRegNo"].ToString(), MI_MGV_drMAINRIGHT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drMAINRIGHT["Depth_Level"]), Convert.ToInt32(MI_MGV_drMAINRIGHT["Joining_Points"]), Convert.ToInt32(MI_MGV_drMAINRIGHT["ID"]));
                        MI_MGV_drMAINRIGHT.Close();
                        MI_MGV_drMAINRIGHT = null;
                    }
                }
                // Root Right End
                MI_MGV_drROOT.Close();
                MI_MGV_drROOT = null;
            }

            // set parent position Start
            SqlDataReader MI_MGV_DrParentPosition = RunSqlReturnDR("select reg_no,Parent_reg_no,position from MI_MGV_BPaymentAdmin where PaymentFor='" + Session["UserID"].ToString() + "'");
            if (MI_MGV_DrParentPosition.HasRows)
            {
                while (MI_MGV_DrParentPosition.Read())
                {
                    setParentPosition(MI_MGV_DrParentPosition["reg_no"].ToString(), MI_MGV_DrParentPosition["Parent_reg_no"].ToString(), Convert.ToInt32(MI_MGV_DrParentPosition["position"]));
                }
            }

            MI_MGV_DrParentPosition.Close();
            MI_MGV_DrParentPosition = null;
            // set parent position End

            
            //start calculate direct income start

            SqlDataReader MI_MGV_drCheckFirstPaymentdirect = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where Reg_No = '" + Session["UserID"].ToString() + "'"); // check for first week
            if (MI_MGV_drCheckFirstPaymentdirect.Read())
            {
                SqlDataReader MI_MGV_drdirectincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_registrationdetails where ReferenceBy = '" + Session["UserID"].ToString() + "' and IsActive=1 and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                while (MI_MGV_drdirectincome.Read())
                {
                    int per = Convert.ToInt32(MI_MGV_drdirectincome["Joining_Points"]);
                    DirectIncome += (2 * per * DirectRate / 100);
                }
                MI_MGV_drdirectincome.Close();
                MI_MGV_drdirectincome = null;
            }
            else
            {
                SqlDataReader MI_MGV_drdirectincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_registrationdetails where ReferenceBy = '" + Session["UserID"].ToString() + "' and IsActive=1");
                while (MI_MGV_drdirectincome.Read())
                {
                    int per = Convert.ToInt32(MI_MGV_drdirectincome["Joining_Points"]);
                    DirectIncome += (2 * per * DirectRate / 100);
                }
                MI_MGV_drdirectincome.Close();
                MI_MGV_drdirectincome = null;

            }
            MI_MGV_drCheckFirstPaymentdirect.Close();
            MI_MGV_drCheckFirstPaymentdirect = null;
            //end calculate direct income end

            // start calculation for Single Leg payment start        

            Decimal intTotalSingleLegFifteenLevel = 0;
            int FifteenLevel = Rootlevel + SingleLegRateMaxLevel;

            SqlDataReader MI_MGV_drCheckFirstPaymentSL = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where Reg_No = '" + Session["UserID"].ToString() + "'"); // check for first week
            if (MI_MGV_drCheckFirstPaymentSL.Read())
            {
                SqlDataReader MI_MGV_drSingleLegincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_BPaymentAdmin where PaymentFor = '" + Session["UserID"].ToString() + "' and level <= " + FifteenLevel + " and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                while (MI_MGV_drSingleLegincome.Read())
                {
                    int per1 = Convert.ToInt32(MI_MGV_drSingleLegincome["Joining_Points"]);
                    intTotalSingleLegFifteenLevel += (2 * per1 * SingleLegRate / 100);
                }
                MI_MGV_drSingleLegincome.Close();
                MI_MGV_drSingleLegincome = null;

            }
            else
            {
                SqlDataReader MI_MGV_drSingleLegincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_BPaymentAdmin where PaymentFor = '" + Session["UserID"].ToString() + "' and level <= " + FifteenLevel + " ");
                while (MI_MGV_drSingleLegincome.Read())
                {
                    int per1 = Convert.ToInt32(MI_MGV_drSingleLegincome["Joining_Points"]);
                    intTotalSingleLegFifteenLevel += (2 * per1 * SingleLegRate / 100);
                }
                MI_MGV_drSingleLegincome.Close();
                MI_MGV_drSingleLegincome = null;

            }
            MI_MGV_drCheckFirstPaymentSL.Close();
            MI_MGV_drCheckFirstPaymentSL = null;
            // End calculation for Single Leg payment End  

            // start calculation for Binary payment start

            Decimal intTotalBinaryPayment = 0;//store total of binary payment
            Decimal intTotalSingleLineTenthLevel = 0;//store single line income upto define level
            //Decimal intTotalSingleLinePayment = 0;
            int TenthLevel = Rootlevel + SingleLineRateMaxLevel;
            int LeftJoiningPoints = 0;
            int RightJoiningPoints = 0;
            int TotalBinaryPoints = 0;
            int CarryPoints = 0;
            int leftcarrypoints = 0;
            int rightcarrypoints = 0;


            if (BinaryPayment)
            {
                SqlDataReader MI_MGV_drCarryPoints = RunSqlReturnDR("select Left_CarryPoints,Right_CarryPoints from MI_MGV_registrationDetails where RegistrationNo = '" + Session["UserID"].ToString() + "' and IsActive=1");
                if (MI_MGV_drCarryPoints.Read())
                {
                    leftcarrypoints = Convert.ToInt32(MI_MGV_drCarryPoints["Left_CarryPoints"]);
                    rightcarrypoints = Convert.ToInt32(MI_MGV_drCarryPoints["Right_CarryPoints"]);
                }

                SqlDataReader MI_MGV_drCheckFirstPayment = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where Reg_No = '" + Session["UserID"].ToString() + "'"); // check for first week
                if (MI_MGV_drCheckFirstPayment.Read())
                {
                    SqlDataReader MI_MGV_drLeftPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPaymentAdmin where PaymentFor = '" + Session["UserID"].ToString() + "' and Parent_Position = 0 and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                    if (MI_MGV_drLeftPoints.Read())
                    {
                        LeftJoiningPoints = Convert.ToInt32(MI_MGV_drLeftPoints["leftJoining_Points"]) + leftcarrypoints;
                    }
                    SqlDataReader MI_MGV_drRightPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPaymentAdmin where PaymentFor = '" + Session["UserID"].ToString() + "' and Parent_Position = 1 and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                    if (MI_MGV_drRightPoints.Read())
                    {
                        RightJoiningPoints = Convert.ToInt32(MI_MGV_drRightPoints["leftJoining_Points"]) + rightcarrypoints;
                    }
                }
                else
                {
                    SqlDataReader MI_MGV_drLeftPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPaymentAdmin where PaymentFor = '" + Session["UserID"].ToString() + "' and Parent_Position = 0");
                    if (MI_MGV_drLeftPoints.Read())
                    {
                        LeftJoiningPoints = Convert.ToInt32(MI_MGV_drLeftPoints["leftJoining_Points"]) + leftcarrypoints;
                    }
                    SqlDataReader MI_MGV_drRightPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPaymentAdmin where PaymentFor = '" + Session["UserID"].ToString() + "' and Parent_Position = 1");
                    if (MI_MGV_drRightPoints.Read())
                    {
                        RightJoiningPoints = Convert.ToInt32(MI_MGV_drRightPoints["leftJoining_Points"]) + rightcarrypoints;
                    }
                }

                if (RightJoiningPoints >= LeftJoiningPoints)
                {
                    CarryPoints = RightJoiningPoints - LeftJoiningPoints;
                    TotalBinaryPoints = RightJoiningPoints - CarryPoints;

                    RunSql("update MI_MGV_registrationDetails set Left_CarryPoints = 0, Right_CarryPoints = " + CarryPoints + " where RegistrationNo = '" + Session["UserID"].ToString() + "'");

                }
                else
                {
                    CarryPoints = LeftJoiningPoints - RightJoiningPoints;
                    TotalBinaryPoints = LeftJoiningPoints - CarryPoints;

                    RunSql("update MI_MGV_registrationDetails set Left_CarryPoints = " + CarryPoints + ", Right_CarryPoints = 0 where RegistrationNo = '" + Session["UserID"].ToString() + "'");

                }

                MI_MGV_drCheckFirstPayment.Close();
                MI_MGV_drCheckFirstPayment = null;

                intTotalBinaryPayment = 2 * TotalBinaryPoints;
            }
            else
            {
                intTotalBinaryPayment = 0;
            }

            if (intTotalBinaryPayment > CapingValue)
            {
                intTotalBinaryPayment = CapingValue; 
            }
            // end calculation for Binary payment end                    
                
            //total payment

            RunSql("insert into MI_MGV_Weekly_Payment(Reg_No,Week_Start_date,Week_End_date,Payment_Generate_date,Direct_Income,Binary_Income,SingleLine_Income,SingleLeg_Income) " +
                    "values('" + Session["UserID"].ToString() + "','" + StartDateOfWeek.ToShortDateString() + "','" + EndDateOfWeek.ToShortDateString() + "',getdate()," +
                    "" + DirectIncome + "," + intTotalBinaryPayment + "," + intTotalSingleLineTenthLevel + "," + intTotalSingleLegFifteenLevel + ")");

            RunSql("Delete from MI_MGV_BPaymentAdmin where PaymentFor='" + Session["UserID"].ToString() + "'");
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

    }

    public Decimal calculateSingleLineIncome(string RegNo)
    {
        Decimal intTotalSingleLineTenthLevel = 0;//store single line income upto define level
        //Boolean BinaryPaymentValid = false;
        try
        {
            SqlDataReader MI_MGV_drROOT = RunSqlReturnDR("select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points from MI_MGV_registrationDetails where RegistrationNo = '" + RegNo + "' and IsActive=1");
            if (MI_MGV_drROOT.Read())
            {
                Rootlevel = Convert.ToInt32(MI_MGV_drROOT["Depth_Level"]);                
                
                    // Root left Start
                    if (MI_MGV_drROOT["LeftChildRegNo"].ToString() != "0" && MI_MGV_drROOT["LeftChildRegNo"] != null)
                    {
                        SqlDataReader MI_MGV_drMAINLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["LeftChildRegNo"] + "' and IsActive=1");
                        if (MI_MGV_drMAINLEFT.Read())
                        {
                            Check_Pair_SingleLine(MI_MGV_drMAINLEFT["RegistrationNo"].ToString(), MI_MGV_drMAINLEFT["LeftChildRegNo"].ToString(), MI_MGV_drMAINLEFT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drMAINLEFT["Depth_Level"]), Convert.ToInt32(MI_MGV_drMAINLEFT["Joining_Points"]), Convert.ToInt32(MI_MGV_drMAINLEFT["ID"]));
                            MI_MGV_drMAINLEFT.Close();
                            MI_MGV_drMAINLEFT = null;
                        }
                    }
                    // Root Left End

                    // Root Right Start
                    if (MI_MGV_drROOT["RightChildRegNo"].ToString() != "0" && MI_MGV_drROOT["RightChildRegNo"] != null)
                    {
                        SqlDataReader MI_MGV_drMAINRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["RightChildRegNo"] + "' and IsActive=1");
                        if (MI_MGV_drMAINRIGHT.Read())
                        {
                            Check_Pair_SingleLine(MI_MGV_drMAINRIGHT["RegistrationNo"].ToString(), MI_MGV_drMAINRIGHT["LeftChildRegNo"].ToString(), MI_MGV_drMAINRIGHT["RightChildRegNo"].ToString(), Convert.ToInt32(MI_MGV_drMAINRIGHT["Depth_Level"]), Convert.ToInt32(MI_MGV_drMAINRIGHT["Joining_Points"]), Convert.ToInt32(MI_MGV_drMAINRIGHT["ID"]));
                            MI_MGV_drMAINRIGHT.Close();
                            MI_MGV_drMAINRIGHT = null;
                        }
                    }
                    // Root Right End
                    MI_MGV_drROOT.Close();
                    MI_MGV_drROOT = null;
                    

                    // start calculation for Single Line payment start
                    //int intTotalSingleLinePayment = 0;
                    int TenthLevel = Rootlevel + SingleLineRateMaxLevel;

                    SqlDataReader MI_MGV_drCalcSingleLine = RunSqlReturnDR("Select isnull(sum(Binary_Income),0) as Binary_Income from MI_MGV_SingleLine where Payment_For = '" + Session["UserID"].ToString() + "' and D_level <= " + TenthLevel + "");
                    if (MI_MGV_drCalcSingleLine.Read())
                    {
                       intTotalSingleLineTenthLevel = Convert.ToDecimal(MI_MGV_drCalcSingleLine["Binary_Income"].ToString()) * SingleLineRate / 100; 
                                               
                    }
                }

                RunSql("Delete from MI_MGV_SingleLine where Payment_For='" + Session["UserID"].ToString() + "'");

            }
        
        catch (Exception ex)
        {
            //Response.Write(ex);
            lblError.Text = ex.ToString();
        }

        return intTotalSingleLineTenthLevel;
    }

    protected void btnGeneratePayment_Click(object sender, EventArgs e)
    {
        try
        {
            string[] arrRegNo;
            arrRegNo = new string[10];
            int i = 0;
            SqlDataReader MI_MGV_drRegNoArray = RunSqlReturnDR("Select top 10 RegistrationNo from MI_MGV_registrationDetails " +
                                "where (LeftChildRegNo != '0' or RightChildRegNo != '0') and IsActive=1 and Join_Date<= '" + EndDateOfWeek.ToShortDateString() + "' " +
                                "and RegistrationNo not in(select Reg_No from MI_MGV_Weekly_Payment where Week_Start_date = '" + StartDateOfWeek.ToShortDateString() + "' " +
                                "and Week_End_date = '" + EndDateOfWeek.ToShortDateString() + "')");

            
            while (MI_MGV_drRegNoArray.Read())
            {
                arrRegNo[i] = MI_MGV_drRegNoArray["RegistrationNo"].ToString();
                i++;
            }

            MI_MGV_drRegNoArray.Close();
            MI_MGV_drRegNoArray = null;

            //store Reg no's into an array --- end

            for (int count = 0; count < i; count++)
            {
                if (arrRegNo[count] != "" || arrRegNo[count] != null)
                {
                    Session["UserID"] = arrRegNo[count];

                    calculateIncome();// Calculate all types of income except Single Line Income

                    Session["UserID"] = "";
                }  
            }           

            bind_griedview();            
        }
        catch (Exception ex)
        {
           // Response.Write(ex);
            lblError.Text = ex.ToString();
        }
        
       
    }
    protected void btnfinalPayment_Click(object sender, EventArgs e)
    {
        try
        {
            // store Reg_No in an Array for single line Income
        Decimal intTotalSingleLinePayment = 0;
        SqlDataReader MI_MGV_drCountReg_No = RunSqlReturnDR("select Count(Reg_No) as totalReg_No from MI_MGV_Weekly_Payment where SL_Status = 0");
        if (MI_MGV_drCountReg_No.Read())
        {
            if (Convert.ToInt32(MI_MGV_drCountReg_No["totalReg_No"]) > 0)
            {
                arrRegNoSingl = new string[Convert.ToInt32(MI_MGV_drCountReg_No["totalReg_No"])];
                int j = 0;
                SqlDataReader MI_MGV_drSLMembers = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where SL_Status = 0");
                while (MI_MGV_drSLMembers.Read())
                {
                    arrRegNoSingl[j] = MI_MGV_drSLMembers["Reg_No"].ToString();
                    j++;
                }
                MI_MGV_drSLMembers.Close();
                MI_MGV_drSLMembers = null;
            }            
        }
        MI_MGV_drCountReg_No.Close();
        MI_MGV_drCountReg_No = null;

        ////////////////////

        for (int count = 0; count < arrRegNoSingl.Length; count++)
        {
            SqlDataReader MI_MGV_drCheckReferenceSingle = RunSqlReturnDR("select count(ReferenceBy) as refcount from MI_MGV_registrationdetails where ReferenceBy = '" + arrRegNoSingl[count].ToString() + "'"); // atleast one references is mandatory for single line income
            if (MI_MGV_drCheckReferenceSingle.Read())
            {
                int countreference = Convert.ToInt32(MI_MGV_drCheckReferenceSingle["refcount"].ToString());
                if (countreference > 0)
                {
                    Session["UserID"] = arrRegNoSingl[count];
                    intTotalSingleLinePayment = calculateSingleLineIncome(arrRegNoSingl[count]);

                    RunSql("update MI_MGV_Weekly_Payment set SingleLine_Income = " + intTotalSingleLinePayment + " ,  SL_Status=1 where Reg_No='" + arrRegNoSingl[count].ToString() + "' " +
                        "and Week_Start_date='" + StartDateOfWeek.ToShortDateString() + "' and Week_End_date = '" + EndDateOfWeek.ToShortDateString() + "'");
                }
                else
                {
                    RunSql("update MI_MGV_Weekly_Payment set SL_Status=1 where Reg_No='" + arrRegNoSingl[count].ToString() + "' " +
                        "and Week_Start_date='" + StartDateOfWeek.ToShortDateString() + "' and Week_End_date = '" + EndDateOfWeek.ToShortDateString() + "'");
                }
                
                SqlDataReader MI_MGV_drGtotalinome = RunSqlReturnDR("select (Direct_Income + Binary_Income + SingleLine_Income + SingleLeg_Income) as total  from MI_MGV_Weekly_Payment where Reg_No='" + arrRegNoSingl[count].ToString() + "' " +
                        "and Week_Start_date='" + StartDateOfWeek.ToShortDateString() + "' and Week_End_date = '" + EndDateOfWeek.ToShortDateString() + "'");
                if (MI_MGV_drGtotalinome.Read())
                {
                    double G_Total = Convert.ToDouble(MI_MGV_drGtotalinome["total"]);
                    double TDS = G_Total * 10.3 / 100;
                    double Admin_charge = G_Total * 5 / 100;
                    double Edu_charge = G_Total * 3 / 100;
                    double Wellfare_charge = G_Total * 2 / 100;
                    double net_income = G_Total - (TDS + Admin_charge + Edu_charge + Wellfare_charge);

                    RunSql("update MI_MGV_Weekly_Payment set Total_Income = " + G_Total + ",TDS = " + TDS + ",Administration = " + Admin_charge + "," +
                            "Education_Charge = " + Edu_charge + ",WellFare_Charge = " + Wellfare_charge + ",Net_Income = " + net_income + " " +
                            "where Reg_No='" + arrRegNoSingl[count].ToString() + "' " +
                            "and Week_Start_date='" + StartDateOfWeek.ToShortDateString() + "' and Week_End_date = '" + EndDateOfWeek.ToShortDateString() + "'");

                }
            }
            MI_MGV_drCheckReferenceSingle.Close();
            MI_MGV_drCheckReferenceSingle = null;

            Session["UserID"] = "";
            lblnorecord.Text = "Payment Generated!";
        }

        bind_griedview();
    }
    catch (Exception ex)
    {
        Response.Write(ex);
    }
        
   }
}
