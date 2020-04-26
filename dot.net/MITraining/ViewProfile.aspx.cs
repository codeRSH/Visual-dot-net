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

public partial class ViewProfile : CommonClass 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnsave.Attributes.Add("onClick", "return validForm();");
        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            try
            {
                SqlDataReader MI_MGV_Dr;
                string strsql = "select ReferenceBy,ParentId, case AddTo when 0 then 'Left' else 'Right' end as AddTo,RegistrationNo,Title,MI_MGV_registrationDetails.Name as Name,FHName,DOB,Natioanlity," +
                                "case Marital_Status when 0 then 'Married' else 'Unmarried' end as Marital_Status,Address,City,State,Country,MI_MGV_Country_Master.name as Countryname,Pin,Phone,Mobile,Email,Nom_Name," +
                                "Nom_Relation from MI_MGV_registrationDetails,MI_MGV_Country_Master where RegistrationNo = '" + Session["UserID"].ToString() + "' and MI_MGV_registrationDetails.Country = MI_MGV_Country_Master.Id";
                MI_MGV_Dr = RunSqlReturnDR(strsql);
                if (MI_MGV_Dr.Read())
                {
                    lblregno.Text = MI_MGV_Dr["RegistrationNo"].ToString();
                    lblparentid.Text = MI_MGV_Dr["ParentId"].ToString();
                    lblreferreid.Text = MI_MGV_Dr["ReferenceBy"].ToString();
                    lblnode.Text = MI_MGV_Dr["AddTo"].ToString();
                    lblname.Text = MI_MGV_Dr["Title"].ToString() + " " + MI_MGV_Dr["Name"].ToString();
                    lblfhname.Text = MI_MGV_Dr["FHName"].ToString();
                    lbldob.Text = MI_MGV_Dr["DOB"].ToString();
                    lblmarital.Text = MI_MGV_Dr["Marital_Status"].ToString();
                    lblnationality.Text = MI_MGV_Dr["Natioanlity"].ToString();                    
                    lbladdress.Text = MI_MGV_Dr["Address"].ToString();                    
                    lbltown.Text = MI_MGV_Dr["City"].ToString();                    
                    lblstate.Text = MI_MGV_Dr["State"].ToString();                    
                    lblcountry.Text = MI_MGV_Dr["Countryname"].ToString();
                    lblpin.Text = MI_MGV_Dr["Pin"].ToString();                    
                    lblphone.Text = MI_MGV_Dr["Phone"].ToString();                    
                    lblmobile.Text = MI_MGV_Dr["Mobile"].ToString();                    
                    lblemail.Text = MI_MGV_Dr["Email"].ToString();                    
                    lblnominee.Text = MI_MGV_Dr["Nom_Name"].ToString();                    
                    lblrelation.Text = MI_MGV_Dr["Nom_Relation"].ToString();                    

                    if (!IsPostBack)
                    {
                        txtnationality.Text = MI_MGV_Dr["Natioanlity"].ToString();
                        txtaddress.Text = MI_MGV_Dr["Address"].ToString();
                        txttown.Text = MI_MGV_Dr["City"].ToString().Trim();
                        txtstate.Text = MI_MGV_Dr["State"].ToString().Trim();
                        txtpin.Text = MI_MGV_Dr["Pin"].ToString();
                        txtphone.Text = MI_MGV_Dr["Phone"].ToString();
                        txtmobile.Text = MI_MGV_Dr["Mobile"].ToString();
                        txtemail.Text = MI_MGV_Dr["Email"].ToString();
                        txtnominee.Text = MI_MGV_Dr["Nom_Name"].ToString();
                        txtrelation.Text = MI_MGV_Dr["Nom_Relation"].ToString();

                        //Fill country//

                        SqlDataReader MI_MGV_drCOUNTRY = RunSqlReturnDR("Select ID,Name from MI_MGV_Country_Master");
                        ddlcountry.DataValueField = "ID";
                        ddlcountry.DataTextField = "Name";
                        ddlcountry.DataSource = MI_MGV_drCOUNTRY;
                        ddlcountry.DataBind();
                        ddlcountry.SelectedValue = MI_MGV_Dr["Country"].ToString();
                        MI_MGV_drCOUNTRY.Close();
                        MI_MGV_drCOUNTRY = null; 


                        if (MI_MGV_Dr["Marital_Status"].ToString() == "Married")
                        {
                            ddlmarital.SelectedValue = "0";
                        }
                        else
                        {
                            ddlmarital.SelectedValue = "1";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
            
        }

    }

    public void Edit_Profile(object sender, EventArgs e)
    {
        ddlmarital.Visible = true;
        lblmarital.Visible = false;
        txtnationality.Visible = true;
        lblnationality.Visible = false;
        txtaddress.Visible = true;
        lbladdress.Visible = false;
        txttown.Visible = true;
        lbltown.Visible = false;
        txtstate.Visible = true;
        lblstate.Visible = false;
        ddlcountry.Visible = true;
        lblcountry.Visible = false;
        txtpin.Visible = true;
        lblpin.Visible = false;
        txtphone.Visible = true;
        lblphone.Visible = false;
        txtmobile.Visible = true;
        lblmobile.Visible = false;
        txtemail.Visible = true;
        lblemail.Visible = false;
        txtnominee.Visible = true;
        lblnominee.Visible = false;
        txtrelation.Visible = true;
        lblrelation.Visible = false;
        btnsave.Visible = true;
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            int rowaffected = 0;
            rowaffected = RunSql("update MI_MGV_registrationDetails set Marital_Status= '" + ddlmarital.SelectedValue + "'," +
                "Natioanlity= '" + txtnationality.Text + "',Address='" + txtaddress.Text.Trim() + "',City= '" + txttown.Text.Trim() + "'," +
                "State='" + txtstate.Text.Trim() + "',Country = '" + ddlcountry.SelectedValue + "',Pin='" + txtpin.Text + "'," +
                "Phone='" + txtphone.Text + "',Mobile='" + txtmobile.Text + "',Email='" + txtemail.Text + "',Nom_Name='" + txtnominee.Text + "'," +
                "Nom_Relation='" + txtrelation.Text + "' where RegistrationNo = '" + Session["UserID"].ToString() + "'");

            if (rowaffected > 0)
            {
                Response.Redirect("ViewProfile.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}
