using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using CORE.CoreObjectContext;
using System.Data.SqlClient;
using System.ComponentModel;
using vpb.app.business.FX.Definition.OPERATORS;

namespace VPB_CRM.Adapter.KhuyenMai
{
    public class ct_khoso_duthuong
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static int GetSoLuongPhieuDTChuaPhatHanh(UserContext objUserContext)
        {
            int err_sys = 0;

            string SQL = "SELECT COUNT(1) FROM CT_KHOSO_DUTHUONG WHERE CCY='VND' AND RELEASED=0";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL,objConn);
            objCmd.CommandType=CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
                err_sys = int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch (Exception ex)
            {
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::GetSoLuongPhieuDTChuaPhatHanh()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        /// <summary>
        /// phan bo so du thuong xuong cac diem theo ty le 80/10/10
        /// </summary>
        /// <param name="dotphathanh"></param>
        /// <param name="cocode"></param>
        /// <param name="soluongphanbo"></param>
        /// <param name="tyle1"></param>
        /// <param name="tienthuong1"></param>
        /// <param name="tyle2"></param>
        /// <param name="tienthuong2"></param>
        /// <param name="tyle3"></param>
        /// <param name="tienthuong3"></param>
        /// <returns></returns>
        public static int PhanBo_SDT_CN(byte dotphathanh, string cocode, int soluongphanbo, byte tyle1, int tienthuong1, byte tyle2, int tienthuong2, byte tyle3, int tienthuong3, int append, UserContext objUserContext)
        {
            int err_sys = 0;

            string SQL = "[dbo].[VPB_PHANPHOI_SODUTHUONG_CHINHANH]";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL,objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 600;

            SqlParameter par = null;

            par = new SqlParameter("RELEASED", dotphathanh);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY", cocode);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("SOLUONG", soluongphanbo);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE1", tyle1);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("MENHGIA1", tienthuong1);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE2", tyle2);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("MENHGIA2", tienthuong2);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE3", tyle3);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("MENHGIA3", tienthuong3);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("BOSUNG", append);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("RETURNVALUE", 0);
            par.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(par);

            try
            {
                objConn.Open();
                objCmd.ExecuteNonQuery();
                err_sys = int.Parse(objCmd.Parameters["RETURNVALUE"].Value.ToString());
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::PhanBo_SDT_CN()", ex.Message, "white");
                err_sys = -1;
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dotphathanh"></param>
        /// <param name="cocode"></param>
        /// <param name="soluongbosung"></param>
        /// <param name="tienthuong"></param>
        /// <returns></returns>
        public static int BoSung_SDT_CN(byte dotphathanh, string cocode, int soluongbosung, int tienthuong, UserContext objUserContext)
        {
            int err_sys = 0;

            string SQL = "[dbo].[VPB_BOSUNG_SODUTHUONG_CHINHANH]";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 600;

            SqlParameter par = null;

            par = new SqlParameter("RELEASED", dotphathanh);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY", cocode);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("SOLUONGBOSUNG", soluongbosung);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("MENHGIA", tienthuong);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("RETURNVALUE", 0);
            par.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(par);

            try
            {
                objConn.Open();
                objCmd.ExecuteNonQuery();
                err_sys = int.Parse(objCmd.Parameters["RETURNVALUE"].Value.ToString());
                //if (err_sys == 0)
                    VPB_CRM.Helper.CommonFunc.AddAuditLog(0, AUDITLOG.APPEND, "Bổ sung SDT cho " + cocode + " - Đợt " + dotphathanh.ToString(), tienthuong.ToString() + "VND(" + soluongbosung.ToString() + " số)",objUserContext);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::BoSung_SDT_CN()", ex.Message, "white");
                err_sys = -1;
            }
            finally
            {
                objCmd = null;
                objConn.Close();
            }
            return err_sys;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="dotphathanh"></param>
        /// <param name="cocode"></param>
        /// <param name="soluongbosung"></param>
        /// <param name="tienthuong"></param>
        /// <returns></returns>
        public static int ThuHoi_SDT_CN(byte released, string cocode, int soluong, int amount, UserContext objUserContext)
        {
            int err_sys = 0;

            string SQL = "[dbo].[VPB_THUHOI_SODUTHUONG_CHINHANH]";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 600;

            SqlParameter par = null;

            par = new SqlParameter("RELEASED", released);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY", cocode);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("SOLUONGTHUHOI", soluong);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("MENHGIA", amount);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("RETURNVALUE", 0);
            par.Direction = ParameterDirection.Output;
            objCmd.Parameters.Add(par);

            try
            {
                objConn.Open();
                objCmd.ExecuteNonQuery();
                err_sys = int.Parse(objCmd.Parameters["RETURNVALUE"].Value.ToString());
                //if (err_sys == 0)
                    VPB_CRM.Helper.CommonFunc.AddAuditLog(0, AUDITLOG.RECALL, "Thu hồi SDT của " + cocode + " - Đợt " + released.ToString(), amount.ToString() + "VND(" + soluong.ToString() + " số)",objUserContext);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::ThuHoi_SDT_CN()", ex.Message, "white");
                err_sys = -1;
            }
            finally
            {
                objCmd = null;
                objConn.Close();
            }
            return err_sys;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="company"></param>
        /// <param name="released"></param>
        /// <returns></returns>
        public static DataSet GetTrangThaiPhanBo(string company, byte released, UserContext objUserContext)
        {
            string SQL = "[dbo].[VPB_OVERVIEW_CHITIET_PHANBO_SDT_CN]";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL,objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            SqlParameter par = null;

            par = new SqlParameter("RELEASED", released);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY", company);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            DataSet ds = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);

            try
            {
                objConn.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::GetTrangThaiPhanBo()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return ds;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="released"></param>
        /// <param name="ccy"></param>
        /// <param name="company"></param>
        /// <returns></returns>
        public static DataTable VPB_STATISTIC_TINHTRANG_SODUTHUONG(byte released, string ccy, string company, UserContext objUserContext)
        {
            string SQL = "[dbo].[VPB_STATISTIC_TINHTRANG_SODUTHUONG]";
            SqlConnection objCon = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;

            SqlParameter par = null;

            par = new SqlParameter("RELEASED",released);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("CCY", ccy);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY", company);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            DataSet ds = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            
            try
            {
                objCon.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::VPB_STATISTIC_TINHTRANG_SODUTHUONG", ex.Message, "white");
            }
            finally
            {
                objCmd = null;
                objCon.Close();
            }
            return ds.Tables[0];
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="released"></param>
        /// <param name="company"></param>
        /// <returns></returns>
        public static DataTable VPB_REPORT_SODUTHUONG_STATUS(byte released, string company, string ngayphathanh,byte grouptype,UserContext objUserContext)
        {
            string SQL = "[dbo].[VPB_REPORT_SODUTHUONG_STATUS]";
            SqlConnection objCon = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 900;

            SqlParameter par = null;

            par = new SqlParameter("RELEASED", released);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY", company);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("NGAY_PHATHANH", ngayphathanh);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("GROUPTYPE", grouptype);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            DataSet ds = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);

            try
            {
                objCon.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::VPB_REPORT_SODUTHUONG_STATUS", ex.Message, "white");
            }
            finally
            {
                objCmd = null;
                objCon.Close();
            }
            return ds.Tables[0];
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="released"></param>
        /// <param name="ccy"></param>
        /// <param name="company"></param>
        /// <returns></returns>
        public static DataTable VPB_REPORT_SODUTHUONG_32864(byte released, string ccy, string company, UserContext objUserContext)
        {
            string SQL = "[dbo].[VPB_REPORT_SODUTHUONG_32864]";
            SqlConnection objCon = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 900;

            SqlParameter par = null;

            par = new SqlParameter("RELEASED", released);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("CCY", ccy);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY", company);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            DataSet ds = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);

            try
            {
                objCon.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::VPB_REPORT_SODUTHUONG_32864()", ex.Message, "white");
            }
            finally
            {
                objCmd = null;
                objCon.Close();
            }
            return ds.Tables[0];
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="valuedate"></param>
        /// <param name="companybook"></param>
        /// <param name="tygia"></param>
        /// <param name="objUserContext"></param>
        /// <returns></returns>
        public static DataTable VPB_REPORT_DOANHSO_HUYDONG_CTKM(string todate,string companybook,byte grouptype, UserContext objUserContext)
        {
            string SQL = "[dbo].[VPB_REPORT_DOANHSO_HUYDONG_CTKM]";
            SqlConnection objCon = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 900;

            SqlParameter par = null;

            par = new SqlParameter("TO_DATE", todate);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("COMPANY_BOOK", companybook);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("GROUPTYPE", grouptype);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            DataSet ds = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);

            try
            {
                objCon.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::VPB_REPORT_DOANHSO_HUYDONG_CTKM()", ex.Message, "white");
            }
            finally
            {
                objCmd = null;
                objCon.Close();
            }
            return ds.Tables[0];
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="LotteryNumber"></param>
        /// <returns></returns>
        public static string updateLotterNumberRank_DacBiet(string LotteryNumber, UserContext objUserContext)
        {
            string ErrorMessage = string.Empty;
            string SQL = "[dbo].[VPB_UPDATE_LOTTERYNUMBER_RANK_DACBIET]";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            SqlParameter par = null;

            par = new SqlParameter("LOTTERYNUMBER", LotteryNumber);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("RANK", "DB");
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            DataSet ds = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);

            try
            {
                objConn.Open();
                ad.Fill(ds);
                ErrorMessage = ds.Tables[0].Rows[0]["ErrorMessage"].ToString();
            }
            catch (Exception ex)
            {
                ErrorMessage = "updateLotterNumberRank_DacBiet(): " + ex.Message;
            }
            finally
            {
                objConn.Close();
            }

            return ErrorMessage;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="LotteryNumber"></param>
        /// <param name="Rank"></param>
        /// <returns></returns>
        public static string updateLotterNumberRank(string LotteryNumber, string Rank, UserContext objUserContext)
        {
            string ErrorMessage = string.Empty;
            
            //string SQL = "UPDATE CT_KHOSO_DUTHUONG SET RANK_UPDATEDDATE=GETDATE(),RANK='" + Rank + "' WHERE LEN(ISNULL(RANK,''))=0 AND STATUS=16";
            string SQL = "UPDATE CT_KHOSO_DUTHUONG SET RANK_UPDATEDDATE=GETDATE(),RANK=ISNULL(RANK,'') + ':" + Rank + "' WHERE STATUS=16";

            string Condition = "";
            if ((Rank == "01") || (Rank == "02") || (Rank == "03") || (Rank == "04"))
                Condition = " AND PK_SODUTHUONG LIKE '%" + LotteryNumber + "'";
            else if (Rank == "KK")
            {
                string GiaiDB = getLotteryDB(objUserContext);
                string first5 = VPB_CRM.Helper.StringHelper.Left(GiaiDB, 5);
                string last5 = VPB_CRM.Helper.StringHelper.Right(GiaiDB, 5);
                Condition = " AND (PK_SODUTHUONG LIKE '%" + last5 + "'";
                Condition += " OR PK_SODUTHUONG LIKE '" + first5 + "%')";
            }
            else
            {
                ErrorMessage = "Rank is empty, transaction was aborted !";
                return ErrorMessage;
            }
            SQL += Condition;
            SqlConnection objCon = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL,objCon);
            try
            {
                objCon.Open();
                objCmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
            }
            finally
            {
                objCmd = null;
                objCon.Close();
            }
            return ErrorMessage;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Condition"></param>
        /// <returns></returns>
        public static DataTable VPB_GETLIST_DSKH_TRUNGGIAI(string Condition, UserContext objUserContext)
        {
            string SQL = "[dbo].[VPB_GETLIST_DSKH_TRUNGGIAI]";
            SqlConnection objCon = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objCon);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 900;

            SqlParameter par = null;

            par = new SqlParameter("CONDITION", Condition);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            DataSet ds = new DataSet();
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);

            try
            {
                objCon.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::VPB_GETLIST_DSKH_TRUNGGIAI()", ex.Message, "white");
            }
            finally
            {
                objCmd = null;
                objCon.Close();
            }
            return ds.Tables[0];
        }
        #region Data Object helper
        [DataObjectMethod(DataObjectMethodType.Fill)]
        public static DataSet getList(string condition, string query,UserContext objUserContext)
        {
            string SQL = string.Empty;

            if (!string.IsNullOrEmpty(query))
                SQL = "SELECT " + query + " FROM CT_KHOSO_DUTHUONG WHERE 1=1";
            else
                SQL = "SELECT * FROM CT_KHOSO_DUTHUONG WHERE 1=1";

            if (!string.IsNullOrEmpty(condition))
                SQL += condition;

            return ExecuteDataSet(SQL, 900);
        }
        #endregion

        #region Helper
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQL"></param>
        /// <param name="cmdTimeOut"></param>
        /// <returns></returns>
        private static DataSet ExecuteDataSet(string SQL, int cmdTimeOut)
        {
            UserContext objUserContext = (UserContext)System.Web.HttpContext.Current.Session["objUserContext"];
            DataSet ds = new DataSet();
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            if (cmdTimeOut > 0)
                objCmd.CommandTimeout = cmdTimeOut;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            try
            {
                objConn.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::ExecuteDataSet()", ex.Message, "white");
            }
            finally
            {
                objCmd = null;
                objConn.Close();
            }
            return ds;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static string getLotteryDB(UserContext objUserContext)
        {
            DataSet ds = ct_khoso_duthuong.getList(" AND CHARINDEX('DB',RANK)>0", "PK_SODUTHUONG", objUserContext);
            if (ds.Tables[0].Rows.Count == 0)
                return string.Empty;
            else
                return ds.Tables[0].Rows[0]["PK_SODUTHUONG"].ToString();
        }
        #endregion
    }
}
