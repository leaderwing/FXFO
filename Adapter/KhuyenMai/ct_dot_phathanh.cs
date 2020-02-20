using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.ComponentModel;
using System.Data.SqlClient;
using CORE.CoreObjectContext;

namespace VPB_CRM.Adapter.KhuyenMai
{
    public static class ct_dot_phathanh
    {
        private static UserContext _objUserContext = (UserContext)System.Web.HttpContext.Current.Session["objUserContext"];

        /// <summary>
        /// 
        /// </summary>
        /// <param name="lanphathanh"></param>
        /// <param name="soluongphathanh"></param>
        /// <param name="ccy"></param>
        /// <param name="tienthuong1"></param>
        /// <param name="tyle1"></param>
        /// <param name="tienthuong2"></param>
        /// <param name="tyle2"></param>
        /// <param name="tienthuong3"></param>
        /// <param name="tyle3"></param>
        /// <returns></returns>
        public static int Create_DotPhatHanh(byte lanphathanh, int soluongphathanh, string ccy, int tienthuong1, byte tyle1, int tienthuong2, byte tyle2, int tienthuong3, byte tyle3)
        {
            int err_sys = 0;

            string SQL = "[dbo].[VPB_CREATENEW_DOTPHATHANH]";
            SqlConnection objConn = new SqlConnection(_objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 600;

            SqlParameter par = null;

            par = new SqlParameter("LANPHATHANH", lanphathanh);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("SOLUONGPHATHANH", soluongphathanh);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("LOAITIEN", ccy);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TIENTHUONG1", tienthuong1);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE1", tyle1);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TIENTHUONG2", tienthuong2);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE2", tyle2);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TIENTHUONG3", tienthuong3);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE3", tyle3);
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
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::Create_DotPhatHanh()", ex.Message, "white");
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
        /// <param name="lanphathanh"></param>
        /// <param name="soluongphathanh"></param>
        /// <param name="ccy"></param>
        /// <param name="tienthuong1"></param>
        /// <param name="tyle1"></param>
        /// <param name="tienthuong2"></param>
        /// <param name="tyle2"></param>
        /// <param name="tienthuong3"></param>
        /// <param name="tyle3"></param>
        /// <returns></returns>
        public static int BoSung_DotPhatHanh(byte lanphathanh, int soluongphathanh, string ccy, int tienthuong1, byte tyle1, int tienthuong2, byte tyle2, int tienthuong3, byte tyle3)
        {
            int err_sys = 0;

            string SQL = "[dbo].[VPB_CREATENEW_DOTPHATHANH]";
            SqlConnection objConn = new SqlConnection(_objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 600;

            SqlParameter par = null;

            par = new SqlParameter("LANPHATHANH", lanphathanh);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("PHATHANHBOSUNG", 1);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("SOLUONGPHATHANH", soluongphathanh);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("LOAITIEN", ccy);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TIENTHUONG1", tienthuong1);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE1", tyle1);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TIENTHUONG2", tienthuong2);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE2", tyle2);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TIENTHUONG3", tienthuong3);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TYLE3", tyle3);
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
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::Create_DotPhatHanh()", ex.Message, "white");
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
        /// <returns></returns>
        public static byte GetLastest_DotPhatHanh()
        {
            byte n = 0;
            string SQL = "SELECT MAX(PK_DOTPHATHANH) AS [DOT_PH] FROM CT_DOT_PHATHANH";
            SqlConnection objConn = new SqlConnection(_objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            try
            {
                objConn.Open();
                SqlDataReader rd = objCmd.ExecuteReader();
                while (rd.Read())
                {
                    n = byte.Parse(rd["DOT_PH"].ToString());
                }

            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::GetLastest_DotPhatHanh()", ex.Message, "white");
                n = 255;
            }
            finally
            {
                objConn.Close();
            }
            return n;
        }
        /// <summary>
        /// Lay tinh hinh phan bo so du thuong tren toan he thong theo dot phat hanh (da phan bo bao nhieu, chua phan bo bao nhieu, chi nhanh da nhan phan bo,...)
        /// </summary>
        /// <param name="released">Dot phat hanh</param>
        /// <returns></returns>
        public static DataSet Get_Overview_Phanbo_SDT_CN(byte released)
        {
            DataSet ds = new DataSet();

            string SQL = "[dbo].[VPB_OVERVIEW_PHANBO_SDT_CN]";
            SqlConnection objConn = new SqlConnection(_objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;

            SqlParameter par = new SqlParameter("DOT_PHATHANH", released);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            SqlDataAdapter ad = new SqlDataAdapter(objCmd);

            try
            {
                objConn.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::Get_Overview_Phanbo_SDT_CN()", ex.Message, "white");
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
        /// <returns></returns>
        public static DataSet Overview_DotPhatHanh()
        {
            DataSet ds = new DataSet();

            string SQL = "[DBO].[VPB_OVERVIEW_DOTPHATHANH]";
            SqlConnection objConn = new SqlConnection(_objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            try
            {
                objConn.Open();
                SqlDataAdapter ad = new SqlDataAdapter(objCmd);
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::Overview_DotPhatHanh()", ex.Message, "white");
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
        /// <param name="condition"></param>
        /// <param name="query"></param>
        /// <param name="objUserContext"></param>
        /// <returns></returns>
        public static DataSet getList(string condition, string query, UserContext objUserContext)
        {
            string SQL = string.Empty;

            if (!string.IsNullOrEmpty(query))
                SQL = "SELECT " + query + " FROM CT_DOT_PHATHANH WHERE 1=1";
            else
                SQL = "SELECT * FROM CT_DOT_PHATHANH WHERE 1=1";

            if (!string.IsNullOrEmpty(condition))
                SQL += condition;

            return ExecuteDataSet(SQL, 0, objUserContext);
        }

        #region Helpers
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SQL"></param>
        /// <param name="cmdTimeOut"></param>
        /// <returns></returns>
        private static DataSet ExecuteDataSet(string SQL, int cmdTimeOut, UserContext objUserContext)
        {
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
        

        #endregion
    }
}