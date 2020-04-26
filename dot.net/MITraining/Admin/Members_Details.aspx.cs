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

public partial class Admin_Members_Details : CommonClass
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnSendMail.Attributes.Add("OnClick", "return isEmailID();");
        if (Session["AdminID"] == null || Session["AdminID"].ToString() == "")
        {
            Response.Redirect("Default.aspx");
        }
        if (!this.IsPostBack)
        {
             DisplayValues();
        }
    }

    public void DisplayValues()
    {
        try
        {
            // SqlDataReader dr = RunSqlReturnDR("Select MI_MGV_registrationDetails.ID,ReferenceBy,ParentID,RegistrationNo,LeftChildRegNo,RightChildRegNo,title,MI_MGV_registrationDetails.Name,fhname,dob,Natioanlity, case Marital_Status when 1 then 'Married' else 'UnMarried' end as Marital_Status,Address,City,State,MI_MGV_Country_Master.name as Country,Pin,Phone,Mobile,Email,Nom_Name,Nom_Relation,Join_Date,Joining_Points,Last_Updated,case IsActive when 1 then 'Yes' else 'No' end as IsActive from MI_MGV_registrationDetails left outer join MI_MGV_Country_Master on MI_MGV_registrationDetails.Country = MI_MGV_Country_Master.id where MI_MGV_registrationDetails.RegistrationNo='" + Session["MemberID"].ToString() + "'");
            SqlDataReader dr = RunSPReturnDR("MemberDetails", new SqlParameter("@RegistrationNo", Session["MemberID"].ToString()));
            if (dr.HasRows)
            {
                dr.Read();
                lblReference.Text = dr["ReferenceBy"].ToString();
                lblParent.Text = dr["ParentID"].ToString();
                lblName.Text = dr["title"].ToString() + " " + dr["Name"].ToString();
                lblRegNo.Text = dr["RegistrationNo"].ToString();
                lblLeftChildID.Text = dr["LeftChildRegNo"].ToString();
                lblRightChildID.Text = dr["RightChildRegNo"].ToString();
                lblFHName.Text = dr["fhname"].ToString();
                lblDOB.Text = dr["dob"].ToString();
                lblNationality.Text = dr["Natioanlity"].ToString();
                lblMaritalStatus.Text = dr["Marital_Status"].ToString();
                lblAddress.Text = dr["Address"].ToString();
                lblCity.Text = dr["City"].ToString();
                lblState.Text = dr["State"].ToString();
                lblCountry.Text = dr["Country"].ToString();
                lblPin.Text = dr["Pin"].ToString();
                lblPhoneMobile.Text = dr["Phone"].ToString() + "/" + dr["Mobile"].ToString();
                lblEmail.Text = dr["Email"].ToString();
                hdnEmailID.Value = dr["Email"].ToString();
                lblNomName.Text = dr["Nom_Name"].ToString();
                lblNomRelation.Text = dr["Nom_Relation"].ToString();
                lblJoinDate.Text = dr["Join_Date"].ToString();
                lblJoinPoint.Text = dr["Joining_Points"].ToString();
                lblLastUpdated.Text = dr["Last_Updated"].ToString();
                lblIsActive.Text = dr["IsActive"].ToString();
                if (dr["IsActive"].ToString() == "Yes")
                    active.SelectedIndex = 0;
                else
                    active.SelectedIndex = 1;
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
       
        try
        {
           
           Int16 ColValue =Convert.ToInt16( active.SelectedValue.ToString());
            RunSP("updateMemberIsActive", new SqlParameter("@RegistrationNo", Session["MemberID"].ToString()), new SqlParameter("@IsActive", ColValue));
            DisplayValues();
            string status="";
            if(active.SelectedValue.ToString()=="0")
                status="Deactive";
            else
                 status="Active";
             lblActiveMessage.Text = "Registration No.(" + Session["MemberID"].ToString() + ") is " + status ;
        }
        catch (SqlException ex)
        {
          throw ex;
        }
    }
    protected void btnSendMail_Click(object sender, EventArgs e)
    {
        Session["MemberEmailID"] = "";
            Session["MemberEmailID"] = lblEmail.Text.Trim();
            Response.Redirect("Admin_Mail.aspx");
     
    }
}
