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
using System.Data.SqlClient;

public partial class LeftRightnodes : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }

        calculateNode();
    }

    public void calculateNode()
    {
        try
        {
            SqlDataReader MI_MGV_drROOT = RunSqlReturnDR("select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points from MI_MGV_registrationDetails where RegistrationNo = '" + Session["UserID"].ToString() + "'");
            if (MI_MGV_drROOT.Read())
            {
                
                // Root left Start
                if (MI_MGV_drROOT["LeftChildRegNo"].ToString() != "0" && MI_MGV_drROOT["LeftChildRegNo"] != null)
                {
                    SqlDataReader MI_MGV_drMAINLEFT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["LeftChildRegNo"] + "'");
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
                    SqlDataReader MI_MGV_drMAINRIGHT = RunSqlReturnDR("Select RegistrationNo,LeftChildRegNo,RightChildRegNo,Depth_Level,Joining_Points,ID from MI_MGV_registrationDetails where RegistrationNo = '" + MI_MGV_drROOT["RightChildRegNo"] + "'");
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

            SqlDataReader MI_MGV_drCountLeftNodes = RunSqlReturnDR("Select count(reg_no) as Leftnodes from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "' and Parent_Position = 0");
            if(MI_MGV_drCountLeftNodes.Read())
            {
                lblleftmember.Text = MI_MGV_drCountLeftNodes["Leftnodes"].ToString();
            }

            SqlDataReader MI_MGV_drCountRightNodes = RunSqlReturnDR("Select count(reg_no) as Rightnodes from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "' and Parent_Position = 1");
            if (MI_MGV_drCountRightNodes.Read())
            {
                lblrightmember.Text = MI_MGV_drCountRightNodes["Rightnodes"].ToString();
            }

            //total nodes


            lbltotalMembers.Text = Convert.ToString(Convert.ToInt32(lblleftmember.Text) + Convert.ToInt32(lblrightmember.Text));

            RunSql("Delete from MI_MGV_BPayment where LoginMember='" + Session["UserID"].ToString() + "'");
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    public void Check_Pair(string RegNo, string LeftCRegNo, string RightCRegNo, int Dlevel, int JPoints, int Preference)
    {
        try
        {
            int Position = 0;

            SqlDataReader MI_MGV_drCheckPair = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where ParentID = '" + RegNo + "'");
            SqlDataReader MI_MGV_drGETPARENT = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo = '" + RegNo + "'");
            
            SqlDataReader MI_MGV_drCheckPair2 = RunSqlReturnDR("Select * from MI_MGV_registrationDetails Where RegistrationNo in ('" + RegNo + "')");

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

    public void setParentPosition(string RegNo, string ParentRegNo, int Positon)
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
}
