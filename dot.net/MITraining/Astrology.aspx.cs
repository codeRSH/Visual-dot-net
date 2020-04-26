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
using System.Net.Mail;
public partial class Astrology : System.Web.UI.Page
{
    CommonClass cm = new CommonClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        btn.Attributes.Add("onClick","return validate();");

        if (!this.IsPostBack)
        {
            int MI_MGV_counter;
            int MI_PM_Counter;
            int Mcounter;

            SqlDataReader MI_MGV_drCOUNTRY = cm.RunSqlReturnDR("Select ID,Name from MI_MGV_Country_Master");
            ddlCountry.DataValueField = "ID";
            ddlCountry.DataTextField = "Name";
            ddlCountry.DataSource = MI_MGV_drCOUNTRY;
            ddlCountry.DataBind();
            MI_MGV_drCOUNTRY.Close();
            MI_MGV_drCOUNTRY = null;

            for (Mcounter = 0; Mcounter < 60; Mcounter++)
            {
                DropDownList2.Items.Add(Mcounter.ToString());
            }


            for (MI_MGV_counter = 1950; MI_MGV_counter <= 2009; MI_MGV_counter++)
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

            for (MI_PM_Counter = 1; MI_PM_Counter <= 12; MI_PM_Counter++)
            {
                DropDownList1.Items.Add(MI_PM_Counter.ToString());
            }



        }



    }
   
    protected void btn_Click(object sender, EventArgs e)
    {

        try
        {
            DateTime eda = DateTime.Now;
            string sex = Dropsex.SelectedItem.Text;
            string MI_MGV_dob = ddlDay.SelectedItem.Text + "-" + ddlMonth.SelectedItem.Text + "-" + ddlYear.SelectedItem.Text;
            string MI_Tdob = DropDownList1.SelectedItem.Text + ":" + DropDownList2.SelectedItem.Text + ":00"+DropDownList3.SelectedItem.Text;


            string strInsert = "Insert into MI_Astrology(Name,FHname,Sex,Dbirth,Tbirth,City,State,Country,Pin,Phone,mobile,Edate,Email)values('" + txtName.Text.ToString().Trim() + "','" + txtFHName.Text.ToString().Trim() + "','" + Dropsex.SelectedItem.Text + "','" + MI_MGV_dob + "','" + MI_Tdob + "','" + txtCity.Text.ToString().Trim() + "','"+txtState.Text.ToString().Trim()+"','"+ddlCountry.SelectedItem.Text+"','"+txtPin.Text.ToString().Trim()+"','"+txtPhone.Text.ToString().Trim()+"','"+txtMobile.Text.ToString().Trim()+"','"+ eda+"','"+txtEmail.Text.ToString().Trim()+"')";                  
                      

            int objInserted = cm.RunSql(strInsert);
            if (objInserted > 0)
            {
                Response.Redirect("Astrology_Confomation.aspx");
            }
            
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}

