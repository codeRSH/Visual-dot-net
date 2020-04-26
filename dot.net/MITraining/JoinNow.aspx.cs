using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class JoinNow :CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {

        btn.Attributes.Add("onClick", "return validate();");
        if (!this.IsPostBack)
        {
            int MI_MGV_counter;
            

            SqlDataReader MI_MGV_drCOUNTRY = RunSqlReturnDR("Select ID,Name from MI_MGV_Country_Master");
            ddlCountry.DataValueField = "ID";
            ddlCountry.DataTextField = "Name";
            ddlCountry.DataSource = MI_MGV_drCOUNTRY;
            ddlCountry.DataBind();
            MI_MGV_drCOUNTRY.Close();
            MI_MGV_drCOUNTRY = null;


            SqlDataReader MI_MGV_drHINTQUES = RunSqlReturnDR("Select ID,Question from MI_MGV_HintQues");
            ddlHintQues.DataValueField = "ID";
            ddlHintQues.DataTextField = "Question";
            ddlHintQues.DataSource = MI_MGV_drHINTQUES;
            ddlHintQues.DataBind();
            MI_MGV_drHINTQUES.Close();
            MI_MGV_drHINTQUES = null;

            SqlDataReader MI_MGV_drPRODUCT = RunSqlReturnDR("Select Product_Name,Sales_Point from MI_MGV_Products");
            ddlProduct.DataValueField = "Sales_Point";
            ddlProduct.DataTextField = "Product_Name";
            ddlProduct.DataSource = MI_MGV_drPRODUCT;
            ddlProduct.DataBind();
            MI_MGV_drPRODUCT.Close();
            MI_MGV_drPRODUCT = null;

            for (MI_MGV_counter = 1950; MI_MGV_counter <= 2008; MI_MGV_counter++)
            {
                ddlYear.Items.Add(MI_MGV_counter.ToString());
            }

            // ddlMonth.Items.Insert(0, "Month");
            ddlMonth.Items.Insert(0, "Jan");
            ddlMonth.Items.Insert(1, "Feb");
            ddlMonth.Items.Insert(2, "Mar");
            ddlMonth.Items.Insert(3, "Apr");
            ddlMonth.Items.Insert(4, "May");
            ddlMonth.Items.Insert(5, "June");
            ddlMonth.Items.Insert(6, "July");
            ddlMonth.Items.Insert(7, "Aug");
            ddlMonth.Items.Insert(8, "Sep");
            ddlMonth.Items.Insert(9, "Oct");
            ddlMonth.Items.Insert(10, "Nov");
            ddlMonth.Items.Insert(11, "Dec");


            for (MI_MGV_counter = 1; MI_MGV_counter <= 31; MI_MGV_counter++)
            {
                ddlDay.Items.Add(MI_MGV_counter.ToString());
            }

           


        }

    }
    protected void Submit1_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet DsParentID = RunSPReturnDataSet("isValidParentID", new SqlParameter("@ParentID", txtParentId.Text.ToString()));
            DataSet DsReferenceID = RunSPReturnDataSet("isValidReferenceID", new SqlParameter("@ReferenceID", txtreferrerId.Text.ToString()));
            if (DsParentID.Tables[0].Rows.Count == 0 && DsReferenceID.Tables[0].Rows.Count == 0)
            {
                lblParentID.Text = "Invalid ParentID";
                lblReferenceID.Text = "Invalid ReferranceID";
            }
            else
            {
                lblParentID.Text = "";
                lblReferenceID.Text = "";
                if (DsParentID.Tables[0].Rows.Count == 0)
                {
                    lblParentID.Text = "Invalid ParentID";

                }
                else if (DsReferenceID.Tables[0].Rows.Count == 0)
                {
                    lblReferenceID.Text = "Invalid ReferranceID";
                }

                else
                {
                    SqlDataReader drUser = RunSqlReturnDR("Select ID from MI_MGV_registrationDetails where RegistrationNo = '" + txtUserName.Text.Trim().ToString() + "'");
                    if (drUser.HasRows)
                    {
                        lbluseridexist.Text = "User ID already exist! Choose another";
                        return;
                    }
                    else
                    {
                        lbluseridexist.Text = "";
                    }
                    if ((ddlNode.SelectedItem.Value == "0" && DsParentID.Tables[0].Rows[0]["LeftChildRegNo"].ToString() == "0") || (ddlNode.SelectedItem.Value == "1" && DsParentID.Tables[0].Rows[0]["RightChildRegNo"].ToString() == "0"))// for left child
                    {
                        lblReferenceID.Text = "";
                        string MI_MGV_dob = ddlDay.SelectedItem.Text + "-" + ddlMonth.SelectedItem.Text + "-" + ddlYear.SelectedItem.Text;

                        //string MI_MGV_NextEmpCode = MI_MGV_GetNextCode();
                        int Depth_Level = 0;
                        SqlDataReader MI_MGV_drLevel = RunSqlReturnDR("Select Depth_Level from MI_MGV_registrationDetails where RegistrationNo = '" + txtParentId.Text.ToString() + "'");
                        if (MI_MGV_drLevel.Read())
                        {
                            Depth_Level = Convert.ToInt32(MI_MGV_drLevel["Depth_Level"]) + 1;
                        }

                        string MI_MGV_objInserted = RunSP("MGV_Insert_NewMember",
                                  new SqlParameter("@MI_MGV_referenceby", txtreferrerId.Text.ToString()),
                                  new SqlParameter("@MI_MGV_Parent_Id", txtParentId.Text.ToString()),
                                  new SqlParameter("@MI_MGV_addto", ddlNode.SelectedItem.Value),
                            // new SqlParameter("@MI_MGV_registrationno", MI_MGV_NextEmpCode),
                                  new SqlParameter("@MI_MGV_registrationno", txtUserName.Text.Trim().ToString()),
                            //new SqlParameter("@MI_MGV_leftchildregno",txtreferrerId.Text.ToString()),
                            //new SqlParameter("@MI_MGV_rightchildregno",txtreferrerId.Text.ToString()),
                                  new SqlParameter("@MI_MGV_title", ddlTitle.SelectedItem.Value),
                                  new SqlParameter("@MI_MGV_name", txtName.Text.ToString()),
                                  new SqlParameter("@MI_MGV_fhname", txtFHName.Text.ToString()),
                                  new SqlParameter("@MI_MGV_dob", MI_MGV_dob),
                                  new SqlParameter("@MI_MGV_nationality", txtNationality.Text.ToString()),
                                  new SqlParameter("@MI_MGV_marital_status", ddlMStatus.SelectedItem.Value),
                                  new SqlParameter("@MI_MGV_address", txtAddress.Text.ToString()),
                                  new SqlParameter("@MI_MGV_city", txtCity.Text.ToString()),
                                  new SqlParameter("@MI_MGV_state", txtState.Text.ToString()),
                                  new SqlParameter("@MI_MGV_country", ddlCountry.SelectedItem.Value),
                                  new SqlParameter("@MI_MGV_pin", txtPin.Text.ToString()),
                                  new SqlParameter("@MI_MGV_phone", txtPhone.Text.ToString()),
                                  new SqlParameter("@MI_MGV_mobile", txtMobile.Text.ToString()),
                                  new SqlParameter("@MI_MGV_email", txtEmail.Text.ToString()),
                            //new SqlParameter("@MI_MGV_isactive",txtreferrerId.Text.ToString()),
                                  new SqlParameter("@MI_MGV_cheque_name", txtchequename.Text.ToString()),
                                  new SqlParameter("@MI_MGV_cheque_relation", txtchequerelation.Text.ToString()),
                                  new SqlParameter("@MI_MGV_nom_name", txtNomName.Text.ToString()),
                                  new SqlParameter("@MI_MGV_nom_relation", txtNomRelation.Text.ToString()),
                                  new SqlParameter("@MI_MGV_user_name", txtUserName.Text.Trim().ToString()),
                                  new SqlParameter("@MI_MGV_password", txtPassword.Text.Trim().ToString()),
                                  new SqlParameter("@MI_MGV_hint_ques", ddlHintQues.SelectedItem.Value),
                                  new SqlParameter("@MI_MGV_hint_answer", txtHintAnswer.Text.ToString()),
                                  new SqlParameter("@MI_MGV_JoinDate", System.DateTime.Now),
                                  new SqlParameter("@MI_MGV_JoiningPoints", ddlProduct.SelectedItem.Value),
                                  new SqlParameter("@MI_MGV_DepthLevel", Depth_Level));

                        if (MI_MGV_objInserted != "")
                        {
                            //Response.Write("ok");
                            Response.Redirect("Thanks.aspx?From=join_now");
                        }
                    }
                    else
                    {
                        if ((ddlNode.SelectedItem.Value == "0") && (DsParentID.Tables[0].Rows[0]["LeftChildRegNo"].ToString() != "0"))
                        {
                            lblMessages.Text = "Left Node is already filled";
                            return;
                        }
                        else if ((ddlNode.SelectedItem.Value == "1") && (DsParentID.Tables[0].Rows[0]["RightChildRegNo"].ToString() != "0"))
                        {
                            lblMessages.Text = "Right Node is already filled";
                            return;
                        }
                    }
                }

            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
        
    }
}
