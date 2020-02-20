using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using CORE.CoreObjectContext;
using vpb.app.business.FX.Definition.UMS;

namespace VPB_CRM.Adapter.KhuyenMai
{

    public static class ct_Phieu_DuThuong
    {
        public static DataSet Exits_SoDuThuong(string vPK_SoDuthuong, UserContext objUserContext)
        {
            string err_sys = string.Empty;
            string curCompany = ((Group)objUserContext.Groups[0]).GroupName;
            string SQL = "Select * from ct_khoso_duthuong where PK_Soduthuong = '" +  vPK_SoDuthuong + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
            }
            catch (Exception ex)
            {
                err_sys = "-1";
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::GetSeriStatus()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return ds;            
        }
        public static DataSet TienGui_KyHan(string cocode, string ToDate, string Ccy, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "[dbo].[VPB_REPORT_TIENGUI_KYHAN]";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 600;
            SqlParameter par = null;
            par = new SqlParameter("COMPANY", cocode);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("TODATE", ToDate);
            par.Direction = ParameterDirection.Input;
            objCmd.Parameters.Add(par);

            par = new SqlParameter("CCY", Ccy);
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
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::TienGui_KyHan()", ex.Message, "white");                
            }
            finally
            {
                objCmd = null;
                objConn.Close();
            }
            return ds;
        }
        public static DataSet KhoSo_ChiNhanh(string cocode, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "[dbo].[VPB_REPORT_KHOSO]";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.CommandTimeout = 600;
            SqlParameter par = null;
            par = new SqlParameter("COMPANY", cocode);
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
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KhoSo_ChiNhanh()", ex.Message, "white");
            }
            finally
            {
                objCmd = null;
                objConn.Close();
            }
            return ds;
        }
        public static DataSet ThongTinKhachHang(string Seri, UserContext objUserContext)
        {

            string SQL = "SELECT [CUST_ID],[SERINUMBER],[ACCOUNT_ID],[PASSBOOK_NUMBER],[AMOUNT],[TERM],[CCY],[VALUED_DATE],[MAT_DATE],[COMPANY],[SOLUONG_SDT],[TONG_TIENTHUONG],[STATUS],[NGAY_PHATHANH],[NGAY_THUHOI],[CREATEDDATETIME],[CREATEDBY] FROM CT_PHIEU_DUTHUONG WHERE SERINUMBER='" + Seri + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);

            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                objConn.Close();
            }
            return ds;
        }
        public static DataSet ThongTinKhachHang_ChiTiet(string Cust_id, UserContext objUserContext)
        {

            string SQL = "SELECT [ID],[NAME],[SHORTNAME],[SECTOR],[INDUSTRY],[ADDRESS],[CERT_ID],[CERT_DATED],[CERT_PLACE],[CERT_EXPIRYDATE],[VAT],[TEL],[EMAIL],[RESIDENCE],[SUBBRANCH],[PHONE],[FAX],[WEBSITE],[BUSINESS_INDUSTRIES],[GERERAL_DIRECTOR_NAME],[TOTAL_OF_LABOR],[LEGAL_CAPITAL_VND],[LEGAL_CAPITAL_USD],[DATE_OF_BIRTH],[WIFE_OR_HUSBAND_NAME],[WIFE_OR_HUSBAND_CERT_ID],[WIFE_OR_HUSBAND_CERT_DATED],[COUNTRY_CODE],[PROVINCE_CODE],[STATUS],[OPEN_DATE],[ASSET_CLASS],[ANNUAL_INCOME],[JOB_TITLE],[GENDER],[MARITAL_STATUS],[EDUCATION],[OCCUPATION],[NAME_OF_OFFICE],[OFFICE_ADDRESS],[CREATEDDATETIME] FROM [dbo].[FBNK_CUSTOMER] WHERE ID='" + Cust_id + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);

            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                objConn.Close();
            }
            return ds;
        }
        public static string FormatDate_T24(string _DateT24)
        { 
            string sDate = "";
            sDate = _DateT24.Substring(6, 2);
            sDate += "/" + _DateT24.Substring(4, 2);
            sDate += "/" + _DateT24.Substring(0, 4); 
            return sDate;
        }
        /// <summary>
        /// Lay trang thai phieu du thuong
        /// </summary>
        /// <param name="Seri"></param>
        /// <param name="Date"></param>
        /// <returns></returns>
        /// <author>Dungnt</author>
        /// <date>June 2010</date>
        public static int GetSeriStatus(string Seri, string Date, UserContext objUserContext)
        {
            string curCompany = ((Group)objUserContext.Groups[0]).GroupName;

            int err_sys = 0;
            string SQL = "SELECT [STATUS] FROM CT_PHIEU_DUTHUONG WHERE [SERINUMBER] = '" + Seri + "' and [COMPANY]='" + curCompany + "' and [Ngay_PhatHanh] = '" + Date + "'"; 
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                    err_sys = -1;
                else
                    err_sys = int.Parse(ds.Tables[0].Rows[0]["STATUS"].ToString());

                //err_sys = int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            catch (Exception ex)
            {
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::GetSeriStatus()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }

        /// <summary>
        /// Lay thong tin ve Seri (Status, CreatedBy)
        /// </summary>
        /// <param name="Seri"></param>
        /// <param name="Date"></param>
        /// <returns></returns>
        /// <author>Dungnt</author>
        /// <date>June 2010</date>
        public static string GetSeriInfo(string Seri, string Date, UserContext objUserContext)
        {
            string curCompany = ((Group)objUserContext.Groups[0]).GroupName;

            string result = string.Empty;

            string SQL = "SELECT [STATUS],[CREATEDBY] FROM CT_PHIEU_DUTHUONG WHERE [SERINUMBER] = '" + Seri + "' and [COMPANY]='" + curCompany + "' and [Ngay_PhatHanh] = '" + Date + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                    result = "";
                else
                    result = ds.Tables[0].Rows[0]["STATUS"].ToString() + ";" + ds.Tables[0].Rows[0]["CREATEDBY"].ToString();
            }
            catch (Exception ex)
            {
                result = "";
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::GetSeriInfo()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return result;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="Seri"></param>
        /// <param name="Date"></param>
        /// <param name="objUserContext"></param>
        /// <returns></returns>
        public static int KiemTraSeri(string Seri, string Date, UserContext objUserContext)
        {
            string curCompany = ((Group)objUserContext.Groups[0]).GroupName;

            int err_sys = 0;
            string SQL = "SELECT Count(SERINUMBER) FROM CT_PHIEU_DUTHUONG WHERE SERINUMBER = '" + Seri + "' and status in ('2') and COMPANY='" + curCompany + "' and Ngay_PhatHanh = '" + Date + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
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
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KiemTraSeri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        public static DataSet GetSeri_Full(string Seri, UserContext objUserContext)
        {
            string curCompany = ((Group)objUserContext.Groups[0]).GroupName;
            
            string SQL = "SELECT * FROM CT_PHIEU_DUTHUONG WHERE SERINUMBER = '" + Seri + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
                
            }
            catch (Exception ex)
            {                
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KiemTraSeri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return ds;
        }
        public static int KiemTraSeri_InPhieu(string Seri, UserContext objUserContext)
        {
            string curCompany = ((Group)objUserContext.Groups[0]).GroupName;

            string roleid = ((Role)objUserContext.Roles[0]).RoleID.ToUpper();


            int err_sys = 0;
            

            string SQL=string.Empty;

            if((roleid!=ROLES.APP_ADMIN)&&(roleid!=ROLES.SYS_ADMIN))
                SQL = "SELECT Count(SERINUMBER) FROM CT_PHIEU_DUTHUONG WHERE SERINUMBER = '" + Seri + "' and status in ('16') and COMPANY='" + curCompany + "'";
            else
                SQL = "SELECT Count(SERINUMBER) FROM CT_PHIEU_DUTHUONG WHERE SERINUMBER = '" + Seri + "' and status in ('16')";

            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
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
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KiemTraSeri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        public static int SoLanBam(string Seri, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "SELECT Count(SERINUMBER) FROM CT_KHOSO_DUTHUONG WHERE SERINUMBER = '" + Seri + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
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
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KiemTraSeri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        public static string GetBranch_Seri(string Seri, UserContext objUserContext)
        {
            string Branch_id = "";
            string SQL = "SELECT COMPANY FROM CT_PHIEU_DUTHUONG WHERE SERINUMBER = '" + Seri + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Branch_id = ds.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    Branch_id = "";
                }
            }
            catch (Exception ex)
            {
                Branch_id = string.Empty;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KiemTraSeri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return Branch_id;
        }
        public static string GetCustomer_Name(string Cust_id, UserContext objUserContext)
        {
            string Cust_Name = "";
            string SQL = "select Name from dbo.FBNK_CUSTOMER where ID = '" + Cust_id + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Cust_Name = ds.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    Cust_Name = "";
                }
            }
            catch (Exception ex)
            {
                Cust_Name = string.Empty;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KiemTraSeri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return Cust_Name;
        }
        public static int CapNhatSoDuThuong_Seri(string CoCode, string Seri, string ccy, int CachBam, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "";
            if (ccy == "VND")
            {
                SQL = "update CT_KHOSO_DUTHUONG set serinumber = '" + Seri + "',status = '16',activeddatetime = getdate() from CT_KHOSO_DUTHUONG where PK_SODUTHUONG in (select top " + CachBam + " PK_SODUTHUONG from CT_KHOSO_DUTHUONG where company = '" + CoCode + "' and IsWin = '1' and status = '4' AND CCY = '" + ccy + "' and released = (select top 1 PK_DotPhatHanh from CT_DOT_PHATHANH order by PK_DotPhatHanh DESC) order by newid())";
            }
            else
            {
                SQL = "update CT_KHOSO_DUTHUONG set serinumber = '" + Seri + "',status = '16',COMPANY = b.COMPANY,activeddatetime = getdate() from CT_KHOSO_DUTHUONG a, CT_PHIEU_DUTHUONG b where  b.serinumber = '" + Seri + "' and a.PK_SODUTHUONG in (select top " + CachBam + " PK_SODUTHUONG from CT_KHOSO_DUTHUONG where  status = '4' AND CCY = '" + ccy + "' and released = 0 order by newid())";
            }
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                objCmd.ExecuteNonQuery();
                err_sys = 1;
            }
            catch (Exception ex)
            {
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::CapNhatSoDuThuong_Seri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }

        public static int CapNhatSeriDuThuong(string Seri, string ccy, int TongTienThuong, string status, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "";
            if (ccy == "VND")
            {
                SQL = "update CT_PHIEU_DUTHUONG set Tong_tienThuong = '" + TongTienThuong + "',status = '" + status + "' where SERINUMBER = '" + Seri + "'";
            }
            else
            {
                SQL = "update CT_PHIEU_DUTHUONG set Tong_tienThuong = '" + TongTienThuong + "',status = '" + status + "' where SERINUMBER = '" + Seri + "'";
            }
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                objCmd.ExecuteNonQuery();
                err_sys = 1;
            }
            catch (Exception ex)
            {
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::CapNhatSoDuThuong_Seri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }

        /// <summary>
        /// Cap nhat trang thai phieu du thuong
        /// </summary>
        /// <param name="Seri"></param>
        /// <param name="ccy"></param>
        /// <param name="TongTienThuong"></param>
        /// <param name="status"></param>
        /// <param name="username"></param>
        /// <returns></returns>
        /// <author>Dungnt</author>
        /// <date>June 2010</date>
        public static int CapNhatSeriDuThuong(string Seri, string ccy, int TongTienThuong, string status, string username, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "";
            if (ccy == "VND")
            {
                SQL = "update CT_PHIEU_DUTHUONG set Tong_tienThuong = '" + TongTienThuong + "',status = '" + status + "',createdby='" + username + "' where SERINUMBER = '" + Seri + "'";
            }
            else
            {
                SQL = "update CT_PHIEU_DUTHUONG set Tong_tienThuong = '" + TongTienThuong + "',status = '" + status + "',createdby='" + username + "' where SERINUMBER = '" + Seri + "'";
            }
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                objCmd.ExecuteNonQuery();
                err_sys = 1;
            }
            catch (Exception ex)
            {
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::CapNhatSoDuThuong_Seri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        public static int SoPhieuDaBam_Seri(string serinumber, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "";
            
            SQL = "SELECT Count(1) FROM CT_KHOSO_DUTHUONG WHERE serinumber = '" + serinumber + "'";
           
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            objCmd.CommandTimeout = 900;
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
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KhoPhieuConLai()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        public static int KhoPhieuConLai(string CoCode, string Ccy, UserContext objUserContext)
        {
            int err_sys = 0;
            string SQL = "";
            if (Ccy == "VND")
            {
                SQL = "SELECT Count(1) FROM CT_KHOSO_DUTHUONG WHERE Company = '" + CoCode + "' and Status = '4' and Ccy = '" + Ccy + "' and released = (select max(released)  from CT_KHOSO_DUTHUONG where ccy = '" + Ccy + "')";

            }
            else
            {
                SQL = "SELECT Count(1) FROM CT_KHOSO_DUTHUONG WHERE Status = '4' and Ccy = '" + Ccy + "' and released = (select max(released)  from CT_KHOSO_DUTHUONG where ccy = '" + Ccy + "')";
            }
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            objCmd.CommandTimeout = 900;
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
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KhoPhieuConLai()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        public static long TongSoTienThuong(string Seri, UserContext objUserContext)
        {
            long err_sys = 0;
            string SQL = "SELECT case when SUM(AMOUNT) is not null then SUM(AMOUNT) else 0 end  FROM CT_KHOSO_DUTHUONG WHERE SERINUMBER = '" + Seri + "'";
            SqlConnection objConn = new SqlConnection(objUserContext.ConnectionString);
            SqlCommand objCmd = new SqlCommand(SQL, objConn);
            objCmd.CommandType = CommandType.Text;
            SqlDataAdapter ad = new SqlDataAdapter(objCmd);
            DataSet ds = new DataSet();
            try
            {
                objConn.Open();
                ad.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    err_sys = long.Parse(ds.Tables[0].Rows[0][0].ToString());
                }
                else
                {
                    err_sys = 0;
                }
            }
            catch (Exception ex)
            {
                err_sys = -1;
                VPB_CRM.Helper.FormHelper.FormWarning("Error::Function::KiemTraSeri()", ex.Message, "white");
            }
            finally
            {
                objConn.Close();
            }
            return err_sys;
        }
        public static string ConvertDate(DateTime dt)
        {
            string s = "";
            s += dt.Year.ToString();
            if (dt.Month < 10)
            {
                s += "0" + dt.Month.ToString();
            }
            else
            {
                s += dt.Month.ToString();
            }
            if (dt.Day < 10)
            {
                s += "0" + dt.Day.ToString();
            }
            else
            {
                s += dt.Day.ToString();
            }           
            
            return s;

        }
        public static void Message(String message, Control cntrl)
        {
            ScriptManager.RegisterStartupScript(cntrl, cntrl.GetType(), "alert", "alert('" + message + "');", true);
        }
        public static string Spell_VN(long Number, string ccy)
        {
            string vStringVN = "";
            string sFormat = "";
            string Dau = "";
            string[] sArray;
            if (Number < 0)
            {
                Dau = "Âm";
            }
            else
            {
                Dau = "";
            }
            sFormat = string.Format("{0:0,0}", Number);
            sArray = sFormat.Split(',');
            if (Number.ToString().Length > 9)
            {
                vStringVN += SubSpell_VND(sArray[0], "tỷ ");
                vStringVN += SubSpell_VND(sArray[1], "triệu ");
                vStringVN += SubSpell_VND(sArray[2], "nghìn ");
                vStringVN += SubSpell_VND(sArray[3], "");

            }
            else
            {
                if (Number.ToString().Length > 6)
                {
                    vStringVN += SubSpell_VND(sArray[0], "triệu ");
                    vStringVN += SubSpell_VND(sArray[1], "nghìn ");
                    vStringVN += SubSpell_VND(sArray[2], "");

                }
                else
                {
                    if (Number.ToString().Length > 3)
                    {
                        vStringVN += SubSpell_VND(sArray[0], "nghìn ");
                        vStringVN += SubSpell_VND(sArray[1], "");

                    }
                    else
                    {
                        if (Number.ToString().Length > 0)
                        {
                            vStringVN += SubSpell_VND(sArray[0], "");
                        }
                    }
                }
            }
            if (ccy == "VND")
            {
                if (vStringVN == "")
                {
                    vStringVN = "Không";
                }
                vStringVN = vStringVN + " đồng";
            }
            if (ccy == "USD")
            {
                vStringVN = vStringVN + " đô la Mỹ";
            }
            return Dau + vStringVN;

        }
        private static string SubSpell_VND(string _number, string donvi)
        {
            if (_number.Length == 1)
            {
                _number = "00" + _number;
            }
            if (_number.Length == 2)
            {
                _number = "0" + _number;
            }
            string sValue = "";
            //lay gia tri so dau tien
            string vSo = "";
            vSo = _number.Substring(0, 1);

            switch (vSo)
            {                
                case "1":
                    sValue = "một trăm ";
                    break;
                case "2":
                    sValue = "hai trăm ";
                    break;
                case "3":
                    sValue = "ba trăm ";
                    break;
                case "4":
                    sValue = "bốn trăm ";
                    break;
                case "5":
                    sValue = "năm trăm ";
                    break;
                case "6":
                    sValue = "sáu trăm ";
                    break;
                case "7":
                    sValue = "bảy trăm ";
                    break;
                case "8":
                    sValue = "tám trăm ";
                    break;
                case "9":
                    sValue = "chín trăm ";
                    break;
                default:
                    sValue = "";
                    break;
            }

            vSo = _number.Substring(1, 1);
            switch (vSo)
            {
                case "0":
                    if (_number.Substring(0, 1) != "0")
                    {
                        if (_number.Substring(2, 1) != "0")
                        {
                            sValue += "linh ";
                        }
                    }
                    break;
                case "1":
                    sValue += "mười ";
                    break;
                case "2":
                    sValue += "hai mươi ";
                    break;
                case "3":
                    sValue += "ba mươi ";
                    break;
                case "4":
                    sValue += "bốn mươi ";
                    break;
                case "5":
                    sValue += "năm mươi ";
                    break;
                case "6":
                    sValue += "sáu mươi ";
                    break;
                case "7":
                    sValue += "bảy mươi ";
                    break;
                case "8":
                    sValue += "tám mươi ";
                    break;
                case "9":
                    sValue += "chín mươi ";
                    break;
                default:
                    sValue += "";
                    break;
            }
            vSo = _number.Substring(2, 1);
            switch (vSo)
            {
                case "1":
                    if (_number.Substring(1, 1) == "0" || _number.Substring(1, 1) == "1")
                    {
                        sValue += "một ";
                    }
                    else
                    {
                        sValue += "mốt ";
                    }
                    break;
                case "2":
                    sValue += "hai ";
                    break;
                case "3":
                    sValue += "ba ";
                    break;
                case "4":
                    sValue += "bốn ";
                    break;
                case "5":
                    if (_number.Substring(1, 1) == "0")
                    {
                        sValue += "năm ";
                    }
                    else
                    {
                        sValue += "lăm ";
                    }
                    break;
                case "6":
                    sValue += "sáu ";
                    break;
                case "7":
                    sValue += "bảy ";
                    break;
                case "8":
                    sValue += "tám ";
                    break;
                case "9":
                    sValue += "chín ";
                    break;
                default:
                    sValue += "";
                    break;
            }
            if (sValue != "")
            {
                sValue = sValue.Substring(0, 1).ToUpper() + sValue.Substring(1);
                sValue += donvi;
            }
            return sValue;
        }
    }
}
