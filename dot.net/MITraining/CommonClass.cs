using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Net.Mail;
using System.Drawing.Imaging;
using System.Configuration;

//namespace MyGreatVision
//{
	public class CommonClass : System.Web.UI.Page 
	{
		public SqlConnection ret_conn =  new SqlConnection();
		private string cnn = "";
		
		public SqlConnection OpenConnection()
		{
			try
			{
				if(cnn == string.Empty )
				{
                    ret_conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                  }
				else
				{
					ret_conn = new SqlConnection(cnn);
				}
				ret_conn.Open();
				
			}
		      catch
			{
				throw;
			}
			return ret_conn;
		}

		public void CloseConnection(SqlConnection  cnn)
		{
			try
			{
				if((cnn != null) && (cnn.State  & ConnectionState.Open) == ConnectionState.Open)
				{
					cnn.Close();
					cnn.Dispose();
				}
			}
			catch
			{
				cnn = null;
			}
		}
		//Author : Anil Saini, Created on : 22,may 2007
        //public Boolean  SendMail(string strFrom, string  strTo, string strSubject, string strBody)  
        //{
        //    try
        //    {
        //        string emailServer = ConfigurationManager.ConnectionStrings["EmailServer"].ConnectionString;
        //        MailMessage ObjMail = new MailMessage();
        //        ObjMail.To  = strTo.ToString();
        //        ObjMail.From = strFrom.ToString();
        //        ObjMail.Subject = strSubject.ToString();
        //        ObjMail.Body = strBody.ToString();
        //        ObjMail.BodyFormat = MailFormat.Html;
        //        SmtpMail.SmtpServer.Insert(0,"localhost");
        //        SmtpMail.Send(ObjMail);
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex);
        //        return false;
        //    }
        //}			
		
        public SqlDataReader RunSqlReturnDR(string SQL)
		 {
			SqlConnection cn;
			cn = OpenConnection();
			SqlDataReader dr;
			SqlCommand cmd = new SqlCommand(SQL,cn);
            cmd.CommandTimeout = cn.ConnectionTimeout;
			dr = cmd.ExecuteReader();
			cmd.Dispose();
			//CloseConnection(cn);
			return dr;
		}
		public DataSet  RunSQLReturnDS(string strSQL )
		{

			SqlConnection cn;
			cn = OpenConnection();
			DataSet ds = new DataSet();
			SqlDataAdapter da = new SqlDataAdapter(strSQL, cn);
			da.Fill(ds);
			da.Dispose();
			return ds;

		}
		public DataView  RunSQLReturnDV(string strSQL )
		{

			SqlConnection cn;
			cn = OpenConnection();
			DataSet ds = new DataSet();
			SqlDataAdapter da = new SqlDataAdapter(strSQL, cn);
			da.Fill(ds);
			da.Dispose();
			return ds.Tables[0].DefaultView;
		}
		public DataView  RunSQLReturnListDV(string strSQL,int Start,int PageSize,string TableName)
		{
        	SqlConnection cn;
			cn = OpenConnection();
			DataSet ds = new DataSet();
			SqlDataAdapter da = new SqlDataAdapter(strSQL, cn);
			da.Fill(ds,Start,PageSize,TableName);
			da.Dispose();
			return ds.Tables[0].DefaultView;
		}
		public int RunSql(string strSQL)
		{
			SqlConnection cn;
			cn=OpenConnection();
			int objRowsAffected=0;
			try
			{
				SqlCommand sqlComm=new SqlCommand(strSQL,cn);
                sqlComm.CommandTimeout = cn.ConnectionTimeout;
				objRowsAffected= sqlComm.ExecuteNonQuery();
			}
			catch(Exception ex)
			{
				Response.Write(ex);
			}
			return objRowsAffected;

		}

		public SqlDataReader RunSPReturnDR(string strSP) 
		{ 
			SqlConnection cn = OpenConnection(); 
			SqlDataReader rdr; 
			SqlCommand cmd = new SqlCommand(strSP, cn); 
			cmd.CommandType = CommandType.StoredProcedure; 
			rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection); 
			cmd.Dispose(); 
			CloseConnection(cn); 
			return rdr; 
		}
        public SqlDataReader RunSPReturnDR(string strSP, params SqlParameter[] commandParameters)
        {
            SqlConnection cn = OpenConnection();
            SqlDataReader rdr;
            SqlCommand cmd = new SqlCommand(strSP, cn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p;
            foreach (SqlParameter p1 in commandParameters)
            {
                p = cmd.Parameters.Add(p1);
                p.Direction = ParameterDirection.Input;
            }
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            cmd.Dispose();
            return rdr;
        }
        public DataSet RunSPReturnDataSet(string strSP, params SqlParameter[] commandParameters)
        {
            SqlConnection cn = OpenConnection();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSP, cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //SqlParameter p;
            foreach (SqlParameter p in commandParameters)
            {
                da.SelectCommand.Parameters.Add(p);
                p.Direction = ParameterDirection.Input;
            }
            da.Fill(ds);
            CloseConnection(cn);
            da.Dispose();
            return ds;
        }
        public DataSet RunSPReturnDataSet(string strSP)
        {
            SqlConnection cn = OpenConnection();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSP, cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
                      
            da.Fill(ds);
            CloseConnection(cn);
            da.Dispose();
            return ds;
        }
        public DataView RunSPReturnListDV(string strSP, int Start, int PageSize, string TableName, params SqlParameter[] commandParameters)
        {
            SqlConnection cn = OpenConnection();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSP, cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p in commandParameters)
            {
                da.SelectCommand.Parameters.Add(p);
                p.Direction = ParameterDirection.Input;
            }
             da.Fill(ds, Start, PageSize, TableName);
             CloseConnection(cn);
            da.Dispose();
            return ds.Tables[0].DefaultView;
        }
        public DataView RunSPReturnListDV(string strSP, int Start, int PageSize, string TableName)
        {
            SqlConnection cn = OpenConnection();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSP, cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
           
            da.Fill(ds, Start, PageSize, TableName);
            CloseConnection(cn);
            da.Dispose();
            return ds.Tables[0].DefaultView;
        }
        public DataView RunSPReturnDV(string strSP, params SqlParameter[] commandParameters)
        {
            SqlConnection cn = OpenConnection();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSP, cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter p in commandParameters)
            {
                da.SelectCommand.Parameters.Add(p);
                p.Direction = ParameterDirection.Input;
            }
            da.Fill(ds);
            CloseConnection(cn);
            da.Dispose();
            return ds.Tables[0].DefaultView;
        }
        public DataView RunSPReturnDV(string strSP)
        {
            SqlConnection cn = OpenConnection();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(strSP, cn);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.Fill(ds);
            CloseConnection(cn);
            da.Dispose();
            return ds.Tables[0].DefaultView;
        }
        public string  RunSP(string strSP, params SqlParameter[] commandParameters) 
		{ 
			string Roweffect="";
			SqlConnection cn = OpenConnection(); 
			SqlCommand cmd = new SqlCommand(strSP, cn); 
			cmd.CommandType = CommandType.StoredProcedure; 
			SqlParameter p; 
			foreach (SqlParameter p1 in commandParameters) 
			{ 
				p = cmd.Parameters.Add(p1); 
				p.Direction = ParameterDirection.Input; 
				Roweffect = Roweffect + "#" + p.Value.ToString();
			} 
			//Roweffect = cmd.ExecuteNonQuery();
			cmd.ExecuteNonQuery();
			cmd.Dispose(); 
			CloseConnection(cn); 
			return Roweffect;
		
		}
		//		public void RunSP(string strSP) 
		//		{ 
		//			SqlConnection cn = OpenConnection(); 
		//			SqlCommand cmd = new SqlCommand(strSP, cn); 
		//			cmd.CommandType = CommandType.StoredProcedure; 
		//			cmd.ExecuteNonQuery(); 
		//			cmd.Dispose(); 
		//			CloseConnection(cn); 
		//		}

		//		public void RunSQLUpdate(string TableName, ArrayList args, ArrayList whereArgs) 
		//		{ 
		//			SqlConnection cn = OpenConnection(); 
		//			string strSQL; 
		//			try 
		//			{ 
		//				int i; 
		//				object ParType; 
		//				SqlCommand objcommand = new SqlCommand(); 
		//				strSQL = "Update " + TableName + " Set "; 
		//				for (int i = 0; i <= args.Count - 1; i++) 
		//				{ 
		//					ParType = args(i); 
		//					strSQL = strSQL + ParType.Name + "=@" + ParType.Name + ","; 
		//				} 
		//				strSQL = strSQL.Substring(0, strSQL.Length - 1); 
		//				if (whereArgs.Count != 0) 
		//				{ 
		//					strSQL = strSQL + " where "; 
		//					for (int i = 0; i <= whereArgs.Count - 1; i++) 
		//					{ 
		//						ParType = whereArgs(i); 
		//						strSQL = strSQL + ParType.Name + "=@" + ParType.Name + " and "; 
		//					} 
		//					strSQL = strSQL.Substring(0, strSQL.Trim().Length - 3); 
		//				} 
		//				objcommand = new SqlCommand(strSQL, cn); 
		//				for (int i = 0; i <= args.Count - 1; i++) 
		//				{ 
		//					ParType = args(i); 
		//					objcommand.Parameters.Add(new SqlParameter(("@" + ParType.Name), ParType.Value.ToString())); 
		//				} 
		//				for (int i = 0; i <= whereArgs.Count - 1; i++) 
		//				{ 
		//					ParType = whereArgs(i); 
		//					objcommand.Parameters.Add(new SqlParameter(("@" + ParType.Name), ParType.Value.ToString())); 
		//				} 
		//				objcommand.ExecuteNonQuery(); 
		//				objcommand.Dispose(); 
		//			} 
		//			catch (Exception exc) 
		//			{ 
		//			} 
		//			finally 
		//			{ 
		//				CloseConnection(cn); 
		//			} 
		//		}

		//		public void RunSQLInsert(string TableName, ArrayList args) 
		//		{ 
		//			SqlConnection cn = OpenConnection(); 
		//			string strSQL; 
		//			try 
		//			{ 
		//				int i; 
		//				object ParType; 
		//				SqlCommand objcommand = new SqlCommand(); 
		//				strSQL = "Insert into " + TableName + "("; 
		//				for (int i = 0; i <= args.Count - 1; i++) 
		//				{ 
		//					ParType = args(i); 
		//					strSQL = strSQL + ParType.Name + ","; 
		//				} 
		//				strSQL = strSQL.Substring(0, strSQL.Length - 1); 
		//				strSQL = strSQL + ") values("; 
		//				for (int i = 0; i <= args.Count - 1; i++) 
		//				{ 
		//					ParType = args(i); 
		//					strSQL = strSQL + "@" + ParType.Name + ","; 
		//				} 
		//				strSQL = strSQL.Substring(0, strSQL.Trim().Length - 1); 
		//				strSQL = strSQL + ")"; 
		//				objcommand = new SqlCommand(strSQL, cn); 
		//				for (int i = 0; i <= args.Count - 1; i++) 
		//				{ 
		//					ParType = args(i); 
		//					objcommand.Parameters.Add(new SqlParameter(("@" + ParType.Name), ParType.Value.ToString())); 
		//				} 
		//				objcommand.ExecuteNonQuery(); 
		//				objcommand.Dispose(); 
		//			} 
		//			catch (Exception exc) 
		//			{ 
		//			} 
		//			finally 
		//			{ 
		//				CloseConnection(cn); 
		//			} 
		//		}




        public void SendMail(string strFrom, string strTo, string strSubject, string strBody)
        {
            try
            {
                string emailServer = ConfigurationManager.AppSettings["EmailServer"];
                MailMessage ObjMail = new MailMessage(strFrom, strTo, strSubject, strBody);
                ObjMail.IsBodyHtml = false;
                SmtpClient send = new SmtpClient();
                send.Host = emailServer;
                send.Port = 25;
                send.Send(ObjMail);

            }
            catch 
            {

               


            }
        }
	
		public string ManageMail(Hashtable htblParamMailBody)
		{
			//bool boolMailStatus = true;
			string strBody = "";
			string strSubject ="";

			try
			{
				//-------- retrieve the mail subject and body format

				//Hashtable htblParamMailId = new Hashtable();
				//htblParamMailId.Add("StrName", htblParamMailBody["MailId"].ToString());
				DataSet objDs = new DataSet();
				objDs= RunSQLReturnDS("select * from MF_M_MailFormats where id='"+ htblParamMailBody["MailId"].ToString() +"'");
				if(objDs.Tables[0].Rows.Count>0)
				{
					//-------- retrieve the mail subject and body format end here
					strSubject = objDs.Tables[0].Rows[0]["subject"].ToString();
					strBody = objDs.Tables[0].Rows[0]["body"].ToString();

				}
				//-------- replace the tags with values in the mail body format
				foreach (DictionaryEntry de in htblParamMailBody)
				{
					strBody = strBody.Replace("#" + de.Key.ToString() + "#",de.Value.ToString());
				}
				strBody = strBody.Replace("\r\n", "<br>");
				
			}
			catch (Exception ex)
			{
				strBody = ex.Message.ToString();
			}
			return strBody;
		}
	
	}
//}
