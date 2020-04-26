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

public partial class Payment : CommonClass 
{
    public int Sno = 1;
    int Rootlevel;
    decimal DirectIncome = 0;
    decimal DirectRate = 0;
   
    decimal SingleLineRate = 0;
    int SingleLineRateMaxLevel = 0;
    decimal SingleLegRate = 0;
    int SingleLegRateMaxLevel = 0;
    int CapingValue = 0;
    //string CheckpairIn = "";
    DateTime FirstLevelPairCreatedOn = new DateTime();
    DateTime StartDateOfWeek = new DateTime();
    DateTime EndDateOfWeek = new DateTime();    
    Boolean BinaryPayment = false;

    string[] arrRegNo;
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }
        try
        {
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
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

        SqlDataReader DrIsActive = RunSqlReturnDR("select name from MI_MGV_registrationDetails where RegistrationNo = '" + Session["UserID"] + "' and IsActive=1");
        if (DrIsActive.Read())
        {
            calculateIncome();// Calculate all types of income
            Last_Payment_Gridview(); //Bind Last Payments GridView
            tractive.Visible = false;
        }
        else
        {
            lblactivemsg.Text = "Sorry! Your registraton is not active till now. Please contact to Administration";
            tractive.Visible = true;
            trlastgrd.Visible = false;
            trlast.Visible = false;
            trdate.Visible = false;
            trincom.Visible = false;
        }
        
         
    }

    public void Check_Pair(string RegNo, string LeftCRegNo, string RightCRegNo, int Dlevel,int JPoints,int Preference)
    {
        try
        {
            int Position = 0;

            SqlDataReader MI_MGV_drCheckPair = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where ParentID = '" + RegNo + "' and IsActive =1");
            SqlDataReader MI_MGV_drGETPARENT = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo = '" + RegNo + "' and IsActive =1");
            SqlDataReader MI_MGV_drCheckPair2 = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo in ('" + RegNo + "') and IsActive =1");

            if (MI_MGV_drCheckPair.Read())
            {
                if (MI_MGV_drGETPARENT.Read())
                {
                    Position = Convert.ToInt32(MI_MGV_drGETPARENT["AddTo"]);
                    RunSql("insert into MI_MGV_BPayment(LoginMember,Parent_Reg_No,Reg_No,Position,Level,Joining_Points,Preference,Join_Date) values ('" + Session["UserID"].ToString() + "','" + MI_MGV_drGETPARENT["ParentID"] + "','" + MI_MGV_drGETPARENT["RegistrationNo"] + "'," + Position + "," + MI_MGV_drGETPARENT["Depth_Level"] + "," + JPoints + "," + Preference + ",'" + MI_MGV_drGETPARENT["Join_Date"] + "')");
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
                    RunSql("insert into MI_MGV_BPayment(LoginMember,Parent_Reg_No,Reg_No,Position,Level,Joining_Points,Preference,Join_Date) values ('" + Session["UserID"].ToString() + "','" + MI_MGV_drGETPARENT["ParentID"] + "','" + MI_MGV_drGETPARENT["RegistrationNo"] + "'," + Position + "," + MI_MGV_drGETPARENT["Depth_Level"] + "," + JPoints + "," + Preference + ",'" + MI_MGV_drGETPARENT["Join_Date"] + "')");
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
                SqlDataReader MI_MGV_drLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + LeftCRegNo + "'");
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
                SqlDataReader MI_MGV_drRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + RightCRegNo + "'");
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
            Response.Write(ex);
        }
    }

    public void setParentPosition(string RegNo,string ParentRegNo,int Positon)
    {
        try
        {
            if (ParentRegNo.ToString() == Session["UserID"].ToString())
            {
                RunSql("update MI_MGV_BPayment set parent_Position=" + Positon + " where reg_no='" + RegNo + "' and LoginMember='" + Session["UserID"].ToString() + "'");
            }
            else
            {
                int pos = FindParentID(RegNo);
                if (pos != 2)
                    RunSql("update MI_MGV_BPayment set parent_Position=" + pos + " where reg_no='" + RegNo + "' and  LoginMember='" + Session["UserID"].ToString() + "'");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        
    }

    public int FindParentID(string RegNo)
    {
        
            int strPreviousPosition = 2;
            while (RegNo != "")
            {
                SqlDataReader MI_MGV_DR = RunSqlReturnDR("select Parent_Reg_No,position from MI_MGV_BPayment where Reg_No='" + RegNo + "' and  LoginMember='" + Session["UserID"].ToString() + "'");
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
            return strPreviousPosition;
        
    }

    public void GetDates()
    {
        double offset = 0;        
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
        StartDateOfWeek = System.DateTime.Today.AddDays(offset);
        EndDateOfWeek = System.DateTime.Today.AddDays(6 + offset);         
    }    

    public void calculateIncome()
    {
        try
        {
            SqlDataReader MI_MGV_drROOT = RunSqlReturnDR("select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points from MI_MGV_registrationDetails where RegistrationNo = '" + Session["UserID"].ToString() + "' and IsActive =1");
            if (MI_MGV_drROOT.Read())
            {
                Rootlevel = Convert.ToInt32(MI_MGV_drROOT["Depth_Level"]);

                SqlDataReader MI_MGV_drCountchild = RunSqlReturnDR("select count(id) as countId  from MI_MGV_RegistrationDetails where ParentId = '" + Session["UserID"].ToString() + "' and IsActive =1");
                if (MI_MGV_drCountchild.Read())
                {
                    int countid = Convert.ToInt32(MI_MGV_drCountchild["countId"].ToString());
                    if (countid > 1)
                    {
                        DataView DvLeftRightMemberChilds = RunSQLReturnDV("select top 1 id,Join_Date from MI_MGV_RegistrationDetails where ParentId in ('" + MI_MGV_drROOT["LeftChildRegNo"].ToString() + "','" + MI_MGV_drROOT["RightChildRegNo"].ToString() + "') and IsActive =1 order by id,join_date ");
                        if (DvLeftRightMemberChilds.Count > 0)
                        {
                            FirstLevelPairCreatedOn = Convert.ToDateTime(DvLeftRightMemberChilds[0]["Join_Date"].ToString());

                            SqlDataReader MI_MGV_drCheckReference = RunSqlReturnDR("select count(ReferenceBy) as refcount from MI_MGV_registrationdetails where ReferenceBy = '" + Session["UserID"].ToString() + "' and IsActive =1"); // atleast two references are mandatory for binary income
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
                    SqlDataReader MI_MGV_drMAINLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["LeftChildRegNo"] + "' and IsActive =1");
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
                    SqlDataReader MI_MGV_drMAINRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["RightChildRegNo"] + "' and IsActive =1");
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
            SqlDataReader MI_MGV_DrParentPosition = RunSqlReturnDR("select reg_no,Parent_reg_no,position from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "'");
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

            //calculate direct income start

            //start GetDates() first week and last week date;

            SqlDataReader MI_MGV_drdate = RunSqlReturnDR("select [dbo].[ufn_GetFirstDayOfWeek] ( GETDATE() ) as currentdate");
            if (MI_MGV_drdate.Read())
            {
                StartDateOfWeek = Convert.ToDateTime(MI_MGV_drdate["currentdate"].ToString());
                EndDateOfWeek = StartDateOfWeek.AddDays(6);
            }
            MI_MGV_drdate.Close();
            MI_MGV_drdate = null;

            //GetDates();
            
            //End GetDates() first week and last week date;

            lblStartingDate.Text = StartDateOfWeek.ToShortDateString();
            lblEndingDate.Text = EndDateOfWeek.ToShortDateString();

            //start calculate direct income start

            SqlDataReader MI_MGV_drCheckFirstPaymentdirect = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where Reg_No = '" + Session["UserID"].ToString() + "'"); // check for first week
            if (MI_MGV_drCheckFirstPaymentdirect.Read())
            {
                SqlDataReader MI_MGV_drdirectincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_registrationdetails where ReferenceBy = '" + Session["UserID"].ToString() + "' and IsActive =1 and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");                
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
                SqlDataReader MI_MGV_drdirectincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_registrationdetails where ReferenceBy = '" + Session["UserID"].ToString() + "' and IsActive =1");
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

            lbl_D_income.Text = DirectIncome.ToString();

            //end calculate direct income end

            // start calculation for Single Leg payment start        

            Decimal intTotalSingleLegFifteenLevel = 0;
            int FifteenLevel = Rootlevel + SingleLegRateMaxLevel;

            SqlDataReader MI_MGV_drCheckFirstPaymentSL = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where Reg_No = '" + Session["UserID"].ToString() + "'"); // check for first week
            if (MI_MGV_drCheckFirstPaymentSL.Read())
            {
                SqlDataReader MI_MGV_drSingleLegincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and level <= " + FifteenLevel + " and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
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
                SqlDataReader MI_MGV_drSingleLegincome = RunSqlReturnDR("select Joining_Points  from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and level <= " + FifteenLevel + " ");
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

            lbl_SLeg_income.Text = intTotalSingleLegFifteenLevel.ToString();


            // start calculation for Binary payment start

            Decimal intTotalBinaryPayment = 0;//store total of binary payment
            Decimal intTotalSingleLineTenthLevel = 0;//store single line income upto define level
            Decimal intTotalSingleLinePayment = 0;
            int TenthLevel = Rootlevel + SingleLineRateMaxLevel;
            int LeftJoiningPoints = 0;
            int RightJoiningPoints = 0;
            int TotalBinaryPoints = 0;
            int CarryPoints = 0;
            int leftcarrypoints = 0;
            int rightcarrypoints = 0;


            if (BinaryPayment)
            {
                SqlDataReader MI_MGV_drCarryPoints = RunSqlReturnDR("select Left_CarryPoints,Right_CarryPoints from MI_MGV_registrationDetails where RegistrationNo = '" + Session["UserID"].ToString() + "'");
                if (MI_MGV_drCarryPoints.Read())
                {
                    leftcarrypoints = Convert.ToInt32(MI_MGV_drCarryPoints["Left_CarryPoints"]);
                    rightcarrypoints = Convert.ToInt32(MI_MGV_drCarryPoints["Right_CarryPoints"]);
                }
                MI_MGV_drCarryPoints.Close();
                MI_MGV_drCarryPoints = null;

                SqlDataReader MI_MGV_drCheckFirstPayment = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where Reg_No = '" + Session["UserID"].ToString() + "'"); // check for first week
                if (MI_MGV_drCheckFirstPayment.Read())
                {
                    SqlDataReader MI_MGV_drLeftPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 0 and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                    if (MI_MGV_drLeftPoints.Read())
                    {
                        LeftJoiningPoints = Convert.ToInt32(MI_MGV_drLeftPoints["leftJoining_Points"]) + leftcarrypoints;
                    }
                    MI_MGV_drLeftPoints.Close();
                    MI_MGV_drLeftPoints = null;

                    SqlDataReader MI_MGV_drRightPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 1 and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                    if (MI_MGV_drRightPoints.Read())
                    {
                        RightJoiningPoints = Convert.ToInt32(MI_MGV_drRightPoints["leftJoining_Points"]) + rightcarrypoints;
                    }
                    MI_MGV_drRightPoints.Close();
                    MI_MGV_drRightPoints = null;
                }
                else
                {
                    SqlDataReader MI_MGV_drLeftPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 0");
                    if (MI_MGV_drLeftPoints.Read())
                    {
                        LeftJoiningPoints = Convert.ToInt32(MI_MGV_drLeftPoints["leftJoining_Points"]) + leftcarrypoints;
                    }
                    MI_MGV_drLeftPoints.Close();
                    MI_MGV_drLeftPoints = null;

                    SqlDataReader MI_MGV_drRightPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 1");
                    if (MI_MGV_drRightPoints.Read())
                    {
                        RightJoiningPoints = Convert.ToInt32(MI_MGV_drRightPoints["leftJoining_Points"]) + rightcarrypoints;
                    }
                    MI_MGV_drRightPoints.Close();
                    MI_MGV_drRightPoints = null;
                }

                if (RightJoiningPoints >= LeftJoiningPoints)
                {
                    CarryPoints = RightJoiningPoints - LeftJoiningPoints;
                    TotalBinaryPoints = RightJoiningPoints - CarryPoints;

                    lblLeftRight.Text = "Right Carry Points :";
                    lblcarrypoints.Text  = Convert.ToString(CarryPoints);
                }
                else
                {
                    CarryPoints = LeftJoiningPoints - RightJoiningPoints;
                    TotalBinaryPoints = LeftJoiningPoints - CarryPoints;

                    lblLeftRight.Text = "Left Carry Points :";
                    lblcarrypoints.Text  = Convert.ToString(CarryPoints);
                }

                MI_MGV_drCheckFirstPayment.Close();
                MI_MGV_drCheckFirstPayment = null;

                intTotalBinaryPayment = 2 * TotalBinaryPoints;
            }
            else
            {
                intTotalBinaryPayment = 0;
            }

            if (intTotalBinaryPayment <= CapingValue)
                lbl_B_income.Text = intTotalBinaryPayment.ToString();
            else
                lbl_B_income.Text = Convert.ToString(CapingValue);

            // end calculation for Binary payment end

            // start calculation for Single Line payment start

            SqlDataReader MI_MGV_drCheckReferenceSingle = RunSqlReturnDR("select count(ReferenceBy) as refcount from MI_MGV_registrationdetails where ReferenceBy = '" + Session["UserID"].ToString() + "' and IsActive =1"); // atleast one references is mandatory for single line income
            if (MI_MGV_drCheckReferenceSingle.Read())
            {
                int countreference = Convert.ToInt32(MI_MGV_drCheckReferenceSingle["refcount"].ToString());
                if (countreference > 0)
                {
                    // store Reg_No in an Array

                    SqlDataReader MI_MGV_drCountReg_No = RunSqlReturnDR("select Count(Reg_No) as totalReg_No from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and level <= " + TenthLevel + "");
                    if (MI_MGV_drCountReg_No.Read())
                    {
                        arrRegNo = new string[Convert.ToInt32(MI_MGV_drCountReg_No["totalReg_No"])];
                        int i = 0;
                        SqlDataReader MI_MGV_drSLMembers = RunSqlReturnDR("select Reg_No from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and level <= " + TenthLevel + "");
                        while (MI_MGV_drSLMembers.Read())
                        {
                            arrRegNo[i] = MI_MGV_drSLMembers["Reg_No"].ToString();
                            i++;
                        }
                        MI_MGV_drSLMembers.Close();
                        MI_MGV_drSLMembers = null;

                        RunSql("Delete from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "'");

                    }
                    MI_MGV_drCountReg_No.Close();
                    MI_MGV_drCountReg_No = null;

                    for (int count = 0; count < arrRegNo.Length; count++)
                    {
                        intTotalSingleLinePayment = calculateSingleLineIncome(arrRegNo[count]);
                        intTotalSingleLineTenthLevel += intTotalSingleLinePayment;
                    }

                    lbl_SL_income.Text = intTotalSingleLineTenthLevel.ToString();
                }
            }

            MI_MGV_drCheckReferenceSingle.Close();
            MI_MGV_drCheckReferenceSingle = null;

            // End calculation for Single Line payment start
            
            //total payment
            decimal totalincome;
            double totalincome1;           
            double deductions;
            totalincome = DirectIncome + intTotalBinaryPayment + intTotalSingleLineTenthLevel + intTotalSingleLegFifteenLevel;
            totalincome1 = Convert.ToDouble(totalincome);
            //lbl_Total.Text = Convert.ToString(DirectIncome + intTotalBinaryPayment + intTotalSingleLineTenthLevel + intTotalSingleLegFifteenLevel);
            lbl_Total.Text = Convert.ToString(totalincome1);
            lbl_TDS.Text = Convert.ToString(totalincome1 * 10.3 / 100);
            lbl_Admin_Charges.Text = Convert.ToString(totalincome1 * 5 / 100);
            lbl_Education.Text=Convert.ToString(totalincome * 3/100);
            lbl_wellfare_Charges.Text=Convert.ToString(totalincome * 2/100);

            deductions = totalincome1 * 20.3 / 100;
            lbl_net_Amount.Text = Convert.ToString(totalincome1 - deductions);

            RunSql("Delete from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "'");
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
        
    }

    public Decimal calculateSingleLineIncome(string RegNo)
    {
        Decimal intTotalSingleLineTenthLevel = 0;//store single line income upto define level
        Boolean BinaryPaymentValid = false;
        try
        {
            SqlDataReader MI_MGV_drROOT = RunSqlReturnDR("select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points from MI_MGV_registrationDetails where RegistrationNo = '" + RegNo + "' and IsActive =1");
            if (MI_MGV_drROOT.Read())
            {
                Rootlevel = Convert.ToInt32(MI_MGV_drROOT["Depth_Level"]);

                SqlDataReader MI_MGV_drCountchild = RunSqlReturnDR("select count(id) as countId  from MI_MGV_RegistrationDetails where ParentId = '" + RegNo + "' and IsActive =1");
                if (MI_MGV_drCountchild.Read())
                {
                    int countid = Convert.ToInt32(MI_MGV_drCountchild["countId"].ToString());
                    if (countid > 1)
                    {
                        DataView DvLeftRightMemberChilds = RunSQLReturnDV("select top 1 id,Join_Date from MI_MGV_RegistrationDetails where ParentId in ('" + MI_MGV_drROOT["LeftChildRegNo"].ToString() + "','" + MI_MGV_drROOT["RightChildRegNo"].ToString() + "') and IsActive =1 order by id,join_date ");
                        if (DvLeftRightMemberChilds.Count > 0)
                        {
                            FirstLevelPairCreatedOn = Convert.ToDateTime(DvLeftRightMemberChilds[0]["Join_Date"].ToString());

                            SqlDataReader MI_MGV_drCheckReference = RunSqlReturnDR("select count(ReferenceBy) as refcount from MI_MGV_registrationdetails where ReferenceBy = '" + RegNo + "' and IsActive =1"); // atleast two references are mandatory for binary income
                            if (MI_MGV_drCheckReference.Read())
                            {
                                int countreference = Convert.ToInt32(MI_MGV_drCheckReference["refcount"].ToString());
                                if (countreference > 1)
                                {
                                    BinaryPaymentValid = true;
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

                if (BinaryPaymentValid)
                {
                    // Root left Start
                    if (MI_MGV_drROOT["LeftChildRegNo"].ToString() != "0" && MI_MGV_drROOT["LeftChildRegNo"] != null)
                    {
                        SqlDataReader MI_MGV_drMAINLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["LeftChildRegNo"] + "' and IsActive =1");
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
                        SqlDataReader MI_MGV_drMAINRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["RightChildRegNo"] + "' and IsActive =1");
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

                    // set parent position Start
                    SqlDataReader MI_MGV_DrParentPosition = RunSqlReturnDR("select reg_no,Parent_reg_no,position from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "'");
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

                    // start calculation for Single Line payment start
                    int intTotalSingleLinePayment = 0;
                    int TenthLevel = Rootlevel + SingleLineRateMaxLevel;
                    int LeftJoiningPoints = 0;
                    int RightJoiningPoints = 0;
                    int TotalBinaryPoints = 0;
                    int CarryPoints = 0;
                    int leftcarrypoints = 0;
                    int rightcarrypoints = 0;


                    SqlDataReader MI_MGV_drCarryPoints = RunSqlReturnDR("select Left_CarryPoints,Right_CarryPoints from MI_MGV_registrationDetails where RegistrationNo = '" + RegNo + "' and IsActive =1");
                    if (MI_MGV_drCarryPoints.Read())
                    {
                        leftcarrypoints = Convert.ToInt32(MI_MGV_drCarryPoints["Left_CarryPoints"]);
                        rightcarrypoints = Convert.ToInt32(MI_MGV_drCarryPoints["Right_CarryPoints"]);
                    }
                    MI_MGV_drCarryPoints.Close();
                    MI_MGV_drCarryPoints = null;

                    SqlDataReader MI_MGV_drCheckFirstPayment = RunSqlReturnDR("select Reg_No from MI_MGV_Weekly_Payment where Reg_No = '" + RegNo + "'"); // check for first week
                    if (MI_MGV_drCheckFirstPayment.Read())
                    {
                        SqlDataReader MI_MGV_drLeftPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 0 and level <= " + TenthLevel + " and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                        if (MI_MGV_drLeftPoints.Read())
                        {
                            LeftJoiningPoints = Convert.ToInt32(MI_MGV_drLeftPoints["leftJoining_Points"]) + leftcarrypoints;
                        }
                        MI_MGV_drLeftPoints.Close();
                        MI_MGV_drLeftPoints = null;

                        SqlDataReader MI_MGV_drRightPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 1 and level <= " + TenthLevel + " and Join_Date between '" + StartDateOfWeek.ToShortDateString() + "' and '" + EndDateOfWeek.ToShortDateString() + "'");
                        if (MI_MGV_drRightPoints.Read())
                        {
                            RightJoiningPoints = Convert.ToInt32(MI_MGV_drRightPoints["leftJoining_Points"]) + rightcarrypoints;
                        }
                        MI_MGV_drRightPoints.Close();
                        MI_MGV_drRightPoints = null;
                    }
                    else
                    {
                        SqlDataReader MI_MGV_drLeftPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 0 and level <= " + TenthLevel + "");
                        if (MI_MGV_drLeftPoints.Read())
                        {
                            LeftJoiningPoints = Convert.ToInt32(MI_MGV_drLeftPoints["leftJoining_Points"]) + leftcarrypoints;
                        }
                        MI_MGV_drLeftPoints.Close();
                        MI_MGV_drLeftPoints = null;

                        SqlDataReader MI_MGV_drRightPoints = RunSqlReturnDR("select case when sum(Joining_Points) IS NULL then 0 else sum(Joining_Points) end as leftJoining_Points from MI_MGV_BPayment where LoginMember = '" + Session["UserID"].ToString() + "' and Parent_Position = 1 and level <= " + TenthLevel + "");
                        if (MI_MGV_drRightPoints.Read())
                        {
                            RightJoiningPoints = Convert.ToInt32(MI_MGV_drRightPoints["leftJoining_Points"]) + rightcarrypoints;
                        }

                        MI_MGV_drRightPoints.Close();
                        MI_MGV_drRightPoints = null;
                    }

                    if (RightJoiningPoints >= LeftJoiningPoints)
                    {
                        CarryPoints = RightJoiningPoints - LeftJoiningPoints;
                        TotalBinaryPoints = RightJoiningPoints - CarryPoints;
                    }
                    else
                    {
                        CarryPoints = LeftJoiningPoints - RightJoiningPoints;
                        TotalBinaryPoints = LeftJoiningPoints - CarryPoints;
                    }

                    MI_MGV_drCheckFirstPayment.Close();
                    MI_MGV_drCheckFirstPayment = null;

                    intTotalSingleLinePayment = 2 * TotalBinaryPoints;
                    intTotalSingleLineTenthLevel = intTotalSingleLinePayment * SingleLineRate / 100;

                }
                
                RunSql("Delete from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "'");
                
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }

        return intTotalSingleLineTenthLevel;
    }

    public void Last_Payment_Gridview()
    {
        try
        {
            DataView MI_MGV_dvLastPayments = RunSQLReturnDV("select convert(varchar,Week_Start_date,105) as Week_Start_date," +
                "convert(varchar,Week_End_date,105) as Week_End_date,convert(varchar,Payment_Generate_date,105) as Payment_Generate_date," +
                "Direct_Income,Binary_Income,SingleLine_Income,SingleLeg_Income,Achievement_Income," +
                "(Direct_Income + Binary_Income + SingleLine_Income +SingleLeg_Income + Achievement_Income) as Total_Income " +
                "from MI_MGV_Weekly_Payment where id in (select top 4(id) from MI_MGV_Weekly_Payment " +
                "where Reg_No='" + Session["UserID"] + "' order by id desc) order by id desc");

            if (MI_MGV_dvLastPayments.Count > 0)
            {
                gvLastPayments.DataSource = MI_MGV_dvLastPayments;
                gvLastPayments.DataBind();
            }
            else
            {
                lblMsgPayments.Text = "There is no payment for last week";
            }

            gvLastPayments.Dispose();
            gvLastPayments = null;
            
        }
        catch(Exception ex)
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    