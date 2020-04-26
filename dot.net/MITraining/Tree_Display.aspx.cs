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

public partial class tree_Display : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserID"].ToString() != "")
        //{
            
        //    SqlDataReader MI_MGV_drMemberName = RunSqlReturnDR("Select Name,Color_Theme from MI_MGV_RegistrationDetails where RegistrationNo='" + Session["UserID"].ToString() + "'");
        //    MI_MGV_drMemberName.Read();
        //    lbluser.Text = "Welcome" + " " + MI_MGV_drMemberName["Name"] + " (" + Session["UserID"].ToString() + ")";
        //}
        
        if (!this.IsPostBack)
        {
            // SqlDataReader MI_MGV_drTHEME = RunSqlReturnDR("Select SNO,Theme_Name from MI_MGV_theme");
            ////if(drTHEME.Read())
            ////{
            //ddlTheme.DataValueField = "SNO";
            //ddlTheme.DataTextField = "Theme_Name";
            //ddlTheme.DataSource = MI_MGV_drTHEME;
            //ddlTheme.DataBind();
            //MI_MGV_drTHEME.Close();
            //MI_MGV_drTHEME = null;
            ////}

        }


        SqlDataReader DrRootLevel;
        SqlDataReader DrFirstLevelLeft;
        SqlDataReader DrFirstLevelRight;
        SqlDataReader DrSecondLevelLeft1;
        SqlDataReader DrSecondLevelRight1;
        SqlDataReader DrSecondLevelLeft2;
        SqlDataReader DrSecondLevelRight2;
        SqlDataReader DrThirdLevelLeft1;
        SqlDataReader DrThirdLevelRight1;
        SqlDataReader DrThirdLevelLeft2;
        SqlDataReader DrThirdLevelRight2;
        SqlDataReader DrThirdLevelLeft3;
        SqlDataReader DrThirdLevelRight3;
        SqlDataReader DrThirdLevelLeft4;
        SqlDataReader DrThirdLevelRight4;

        try
        {
            if (!IsPostBack)
            {
                if (Session["UserID"].ToString() == "")
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    // Root Level Checking Start 
                     imgRoot.Src = "images/loginblue.jpg";
                     DrRootLevel = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + Session["UserID"].ToString() + "'");
                     if (DrRootLevel.Read())
                     {
                         //lblRootName.Text = DrRootLevel["Name"].ToString();
                         //lblRootName.Text = "<a title='Click here to view member details.'  href='ViewMemberDetails.aspx?RegistrationNo=" + DrRootLevel["RegistrationNo"] + "' target='_blank'>" + DrRootLevel["Name"].ToString() + "</a>";
                         lblRootName.Text = "<a href=javascript:poptastic('" + DrRootLevel["RegistrationNo"] + "');>" + DrRootLevel["RegistrationNo"].ToString() + "</a>";


                         //First Level Left Start
                         if (DrRootLevel["LeftChildRegNo"].ToString() != "0" && DrRootLevel["LeftChildRegNo"] != null)
                         {
                             imgLevel1Left.Src = "images/loginblue.jpg";
                             DrFirstLevelLeft = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrRootLevel["LeftChildRegNo"] + "'");
                             if (DrFirstLevelLeft.Read())
                             {
                                 //lbl_Lavel1_Left.Text = DrFirstLevelLeft["Name"].ToString();
                                 lbl_Lavel1_Left.Text = "<a href=javascript:poptastic('" + DrFirstLevelLeft["RegistrationNo"] + "');>" + DrFirstLevelLeft["RegistrationNo"].ToString() + "</a>";

                                 //Second Level Left1 Start
                                 if (DrFirstLevelLeft["LeftChildRegNo"].ToString() != "0" && DrFirstLevelLeft["LeftChildRegNo"] != null)
                                 {
                                     imgLevel2Left1.Src = "images/loginblue.jpg";
                                    
                                     DrSecondLevelLeft1 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrFirstLevelLeft["LeftChildRegNo"] + "'");
                                     if (DrSecondLevelLeft1.Read())
                                     {
                                         //lblLavel2_Left1.Text = DrSecondLevelLeft1["Name"].ToString();
                                         lblLavel2_Left1.Text = "<a href=javascript:poptastic('" + DrSecondLevelLeft1["RegistrationNo"] + "');>" + DrSecondLevelLeft1["RegistrationNo"].ToString() + "</a>";
                                         
                                         //Third Level Left1 Start
                                         if (DrSecondLevelLeft1["LeftChildRegNo"].ToString() != "0" && DrSecondLevelLeft1["LeftChildRegNo"] != null)
                                         {
                                             imgLevel3Left1.Src = "images/loginblue.jpg";
                                             DrThirdLevelLeft1 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelLeft1["LeftChildRegNo"] + "'");
                                             if (DrThirdLevelLeft1.Read())
                                             {
                                                 //lblLevel3_Left1.Text = DrThirdLevelLeft1["Name"].ToString();
                                                 //lblLevel3_Left1.Text = "<a href=javascript:poptastic('" + DrThirdLevelLeft1["RegistrationNo"] + "');>" + DrThirdLevelLeft1["Name"].ToString() + "</a>";
                                                 lblLevel3_Left1.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelLeft1["RegistrationNo"] + " target=_blank>" + DrThirdLevelLeft1["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelLeft1.Close();
                                             DrThirdLevelLeft1 = null;
                                         }
                                         
                                         else
                                         {
                                             lblLevel3_Left1.Text = "No Member";
                                         }
                                         //Third Level Left1 End

                                         //Third Level Right1 Start
                                         if (DrSecondLevelLeft1["RightChildRegNo"].ToString() != "0" && DrSecondLevelLeft1["RightChildRegNo"] != null)
                                         {
                                             imgLevel3Right1.Src = "images/loginblue.jpg";
                                             DrThirdLevelRight1 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelLeft1["RightChildRegNo"] + "'");
                                             if (DrThirdLevelRight1.Read())
                                             {
                                                 //lblLevel3_Right1.Text = DrThirdLevelRight1["Name"].ToString();
                                                 //lblLevel3_Right1.Text = "<a href=javascript:poptastic('" + DrThirdLevelRight1["RegistrationNo"] + "');>" + DrThirdLevelRight1["Name"].ToString() + "</a>";
                                                 lblLevel3_Right1.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelRight1["RegistrationNo"] + " target=_blank>" + DrThirdLevelRight1["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelRight1.Close();
                                             DrThirdLevelRight1 = null;
                                         }
                                         else
                                         {
                                             lblLevel3_Right1.Text = "No Member";
                                         }
                                         //Third Level Right1 End

                                     }
                                    
                                     DrSecondLevelLeft1.Close();
                                     DrSecondLevelLeft1 = null;
                                 }
                                 else
                                 {
                                     lblLavel2_Left1.Text = "No Member";
                                 }
                                 //Second Level Left1 End

                                 //Second LEvel Right1 Start
                                 if (DrFirstLevelLeft["RightChildRegNo"].ToString() != "0" && DrFirstLevelLeft["RightChildRegNo"] != null)
                                 {
                                     imgLevel2Right1.Src = "images/loginblue.jpg";
                                     DrSecondLevelRight1 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrFirstLevelLeft["RightChildRegNo"] + "'");
                                     if (DrSecondLevelRight1.Read())
                                     {
                                         //lblLevel2_Right1.Text = DrSecondLevelRight1["Name"].ToString();
                                         lblLevel2_Right1.Text = "<a href=javascript:poptastic('" + DrSecondLevelRight1["RegistrationNo"] + "');>" + DrSecondLevelRight1["RegistrationNo"].ToString() + "</a>";

                                         //Third Level Left2 Start
                                         if (DrSecondLevelRight1["LeftChildRegNo"].ToString() != "0" && DrSecondLevelRight1["LeftChildRegNo"] != null)
                                         {
                                             imgLevel3Left2.Src = "images/loginblue.jpg";
                                             DrThirdLevelLeft2 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelRight1["LeftChildRegNo"] + "'");
                                             if (DrThirdLevelLeft2.Read())
                                             {
                                                 //lblLevel3_Left2.Text = DrThirdLevelLeft2["Name"].ToString();
                                                 //lblLevel3_Left2.Text = "<a href=javascript:poptastic('" + DrThirdLevelLeft2["RegistrationNo"] + "');>" + DrThirdLevelLeft2["Name"].ToString() + "</a>";
                                                 lblLevel3_Left2.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelLeft2["RegistrationNo"] + " target=_blank>" + DrThirdLevelLeft2["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelLeft2.Close();
                                             DrThirdLevelLeft2 = null;
                                         }

                                         else
                                         {
                                             lblLevel3_Left2.Text = "No Member";
                                         }
                                         //Third Level Left2 End

                                         //Third Level Right2 Start
                                         if (DrSecondLevelRight1["RightChildRegNo"].ToString() != "0" && DrSecondLevelRight1["RightChildRegNo"] != null)
                                         {
                                             imgLevel3Right2.Src = "images/loginblue.jpg";
                                             DrThirdLevelRight2 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelRight1["RightChildRegNo"] + "'");
                                             if (DrThirdLevelRight2.Read())
                                             {
                                                 //lblLevel3_Right2.Text = DrThirdLevelRight2["Name"].ToString();
                                                 //lblLevel3_Right2.Text = "<a href=javascript:poptastic('" + DrThirdLevelRight2["RegistrationNo"] + "');>" + DrThirdLevelRight2["Name"].ToString() + "</a>";
                                                 lblLevel3_Right2.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelRight2["RegistrationNo"] + " target=_blank>" + DrThirdLevelRight2["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelRight2.Close();
                                             DrThirdLevelRight2 = null;
                                         }
                                         else
                                         {
                                             lblLevel3_Right2.Text = "No Member";
                                         }
                                         //Third Level Right2 End
                                     }
                                     
                                     DrSecondLevelRight1.Close();
                                     DrSecondLevelRight1 = null;
                                 }
                                 else
                                 {
                                     lblLevel2_Right1.Text = "No Member";
                                 }
                                 //Second Level Right1 End
                             }
                             else
                             {
                                 lbl_Lavel1_Left.Text = "No Member";
                             }

                             DrFirstLevelLeft.Close();
                             DrFirstLevelLeft = null;
                         }
                         //First Level Left End

                         //First Level Right Start
                         if (DrRootLevel["RightChildRegNo"].ToString() != "0" && DrRootLevel["RightChildRegNo"] != null)
                         {
                             imgLevel1Right.Src = "images/loginblue.jpg";
                             DrFirstLevelRight = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrRootLevel["RightChildRegNo"] + "'");
                             if (DrFirstLevelRight.Read())
                             {
                                 //lblLevel1_Right.Text = DrFirstLevelRight["Name"].ToString();
                                 lblLevel1_Right.Text = "<a href=javascript:poptastic('" + DrFirstLevelRight["RegistrationNo"] + "');>" + DrFirstLevelRight["RegistrationNo"].ToString() + "</a>";

                                 //Second Level Left2 Start
                                 if (DrFirstLevelRight["LeftChildRegNo"].ToString() != "0" && DrFirstLevelRight["LeftChildRegNo"] != null)
                                 {
                                     imgLevel2Left2.Src = "images/loginblue.jpg";
                                     DrSecondLevelLeft2 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrFirstLevelRight["LeftChildRegNo"] + "'");
                                     if (DrSecondLevelLeft2.Read())
                                     {
                                         //lblLevel2_Left2.Text = DrSecondLevelLeft2["Name"].ToString();
                                         lblLevel2_Left2.Text = "<a href=javascript:poptastic('" + DrSecondLevelLeft2["RegistrationNo"] + "');>" + DrSecondLevelLeft2["RegistrationNo"].ToString() + "</a>";

                                         //Third Level Left3 Start
                                         if (DrSecondLevelLeft2["LeftChildRegNo"].ToString() != "0" && DrSecondLevelLeft2["LeftChildRegNo"] != null)
                                         {
                                             imgLevel3Left3.Src = "images/loginblue.jpg";
                                             DrThirdLevelLeft3 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelLeft2["LeftChildRegNo"] + "'");
                                             if (DrThirdLevelLeft3.Read())
                                             {
                                                 //lblLevel3_Left3.Text = DrThirdLevelLeft3["Name"].ToString();
                                                 //lblLevel3_Left3.Text = "<a href=javascript:poptastic('" + DrThirdLevelLeft3["RegistrationNo"] + "');>" + DrThirdLevelLeft3["Name"].ToString() + "</a>";
                                                 lblLevel3_Left3.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelLeft3["RegistrationNo"] + " target=_blank>" + DrThirdLevelLeft3["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelLeft3.Close();
                                             DrThirdLevelLeft3 = null;
                                         }

                                         else
                                         {
                                             lblLevel3_Left3.Text = "No Member";
                                         }
                                         //Third Level Left3 End

                                         //Third Level Right3 Start
                                         if (DrSecondLevelLeft2["RightChildRegNo"].ToString() != "0" && DrSecondLevelLeft2["RightChildRegNo"] != null)
                                         {
                                             imgLevel3Right3.Src = "images/loginblue.jpg";
                                             DrThirdLevelRight3 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelLeft2["RightChildRegNo"] + "'");
                                             if (DrThirdLevelRight3.Read())
                                             {
                                                 //lblLevel3_Right3.Text = DrThirdLevelRight3["Name"].ToString();
                                                 //lblLevel3_Right3.Text = "<a href=javascript:poptastic('" + DrThirdLevelRight3["RegistrationNo"] + "');>" + DrThirdLevelRight3["Name"].ToString() + "</a>";
                                                 lblLevel3_Right3.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelRight3["RegistrationNo"] + " target=_blank>" + DrThirdLevelRight3["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelRight3.Close();
                                             DrThirdLevelRight3 = null;
                                         }
                                         else
                                         {
                                             lblLevel3_Right3.Text = "No Member";
                                         }
                                         //Third Level Right3 End
                                     }
                                     
                                     DrSecondLevelLeft2.Close();
                                     DrSecondLevelLeft2 = null;
                                 }
                                 else
                                 {
                                     lblLevel2_Left2.Text = "No Member";
                                 }
                                 //Second Level Left2 End

                                 //Second LEvel Right2 Start
                                 if (DrFirstLevelRight["RightChildRegNo"].ToString() != "0" && DrFirstLevelRight["RightChildRegNo"] != null)
                                 {
                                     imgLevel2Right2.Src = "images/loginblue.jpg";
                                     DrSecondLevelRight2 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrFirstLevelRight["RightChildRegNo"] + "'");
                                     if (DrSecondLevelRight2.Read())
                                     {
                                         //lblLevel2_Right2.Text = DrSecondLevelRight2["Name"].ToString();
                                         lblLevel2_Right2.Text = "<a href=javascript:poptastic('" + DrSecondLevelRight2["RegistrationNo"] + "');>" + DrSecondLevelRight2["RegistrationNo"].ToString() + "</a>";

                                         //Third Level Left4 Start
                                         if (DrSecondLevelRight2["LeftChildRegNo"].ToString() != "0" && DrSecondLevelRight2["LeftChildRegNo"] != null)
                                         {
                                             imgLevel3Left4.Src = "images/loginblue.jpg";
                                             DrThirdLevelLeft4 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelRight2["LeftChildRegNo"] + "'");
                                             if (DrThirdLevelLeft4.Read())
                                             {
                                                 //lblLevel3_Left4.Text = DrThirdLevelLeft4["Name"].ToString();
                                                 //lblLevel3_Left4.Text = "<a href=javascript:poptastic('" + DrThirdLevelLeft4["RegistrationNo"] + "');>" + DrThirdLevelLeft4["Name"].ToString() + "</a>";
                                                 lblLevel3_Left4.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelLeft4["RegistrationNo"] + " target=_blank>" + DrThirdLevelLeft4["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelLeft4.Close();
                                             DrThirdLevelLeft4 = null;
                                         }

                                         else
                                         {
                                             lblLevel3_Left4.Text = "No Member";
                                         }
                                         //Third Level Left4 End

                                         //Third Level Right4 Start
                                         if (DrSecondLevelRight2["RightChildRegNo"].ToString() != "0" && DrSecondLevelRight2["RightChildRegNo"] != null)
                                         {
                                             imgLevel3Right4.Src = "images/loginblue.jpg";
                                             DrThirdLevelRight4 = RunSqlReturnDR("Select RegistrationNo,ParentId,AddTo,LeftChildRegNo,RightChildRegNo,Name from MI_MGV_registrationDetails where RegistrationNo='" + DrSecondLevelRight2["RightChildRegNo"] + "'");
                                             if (DrThirdLevelRight4.Read())
                                             {
                                                 //lblLevel3_Right4.Text = DrThirdLevelRight4["Name"].ToString();
                                                 //lblLevel3_Right4.Text = "<a href=javascript:poptastic('" + DrThirdLevelRight4["RegistrationNo"] + "');>" + DrThirdLevelRight4["Name"].ToString() + "</a>";
                                                 lblLevel3_Right4.Text = "<a href=New_Tree_View.aspx?NextLeval=" + DrThirdLevelRight4["RegistrationNo"] + " target=_blank>" + DrThirdLevelRight4["RegistrationNo"].ToString() + "</a>";
                                             }

                                             DrThirdLevelRight4.Close();
                                             DrThirdLevelRight4 = null;
                                         }
                                         else
                                         {
                                             lblLevel3_Right4.Text = "No Member";
                                         }
                                         //Third Level Right4 End
                                     }
                                    
                                     DrSecondLevelRight2.Close();
                                     DrSecondLevelRight2 = null;
                                 }
                                 else
                                 {
                                     lblLevel2_Right2.Text = "No Member";
                                 }
                                 //Second Level Right2 End
                             }
                             else
                             {
                                 lblLevel1_Right.Text = "No Member";
                             }

                             DrFirstLevelRight.Close();
                             DrFirstLevelRight = null;

                         }
                         //First Level Right End

                     }
                     else
                     {
                         lblRootName.Text = "No Member";
                     }

                         
                       DrRootLevel.Close();
                       DrRootLevel = null;
                    //Root Level Checking End
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
    //protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    LinkCSS.Href = "CSS/" + ddlTheme.SelectedItem.Text.ToString() + ".css";
    //}
    //protected void btnlogin_Click1(object sender, ImageClickEventArgs e)
    //{
    //    try
    //    {
    //        SqlDataReader MI_MGV_drCheckLogin = RunSqlReturnDR("select RegistrationNo from MI_MGV_registrationDetails where User_name='" + txtUserName.Text.Trim() + "' and Password='" + txtPassword.Text.Trim() + "'");
    //        if (MI_MGV_drCheckLogin.HasRows)
    //        {
    //            MI_MGV_drCheckLogin.Read();
    //            Session["UserID"] = MI_MGV_drCheckLogin["RegistrationNo"].ToString();
    //            MI_MGV_drCheckLogin.Close();
    //            MI_MGV_drCheckLogin = null;
    //            //Response.Redirect("Tree_Display.aspx");
    //            Response.Redirect("User_Menu.aspx");
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        Response.Write(ex.ToString());
    //    }
    //}
}
