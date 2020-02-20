using System;
using CORE.CoreObjectContext;
using ldapif;
using System.Data;
using System.Text;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI.WebControls;
using VPB_CRM.Helper;
using VPB_FX.ldap;
using System.IO;
using System.Drawing;

public partial class SignIn : PageBase
{
    #region initiation page variables
    private UserContext objUserContext = null;
    string _userName = string.Empty;
    string _password = string.Empty;
    private string _action = string.Empty;
    protected string _notify = string.Empty;
    #endregion

    #region page init & load
    /// <summary>
    /// OnInit
    /// </summary>
    /// <param name="e"></param>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        #region get data submit
        _action = Request["act"];
        _userName = Request.Form["UserName"];
        _password = Request.Form["Password"];
        #endregion

        #region action handler
        if (!string.IsNullOrEmpty(_action))
        {
            if (_action == "out") signOut();
        }
        else
        {
            if (!string.IsNullOrEmpty(_password))
            {
                if (!string.IsNullOrEmpty(_userName))
                    if (System.Configuration.ConfigurationManager.AppSettings["LDAP"] == "1")
                    {
                        if (LDAPlogin(_userName, _password))
                            AuthorizeUser(_userName);
                        else
                            this.lblLoginFail.Text = "Bạn kiểm tra lại tên và mật khẩu.";
                    }
                    else
                        AuthorizeUser(_userName);
            }
        }
        #endregion
    }
    /// <summary>
    /// Page_Load
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = ConfigurationManager.AppSettings["ProjectName"];
        //this.LoginButton.Attributes.Add("onclick", "{do_login(); return false;}");
        string pathNotify = ConfigurationManager.AppSettings["Notifycation"];
        int countFile = FileHelper.CountFilesOnFolder(pathNotify);
        if (countFile > 0)
        {
            DirectoryInfo dir = new DirectoryInfo(pathNotify);
            Bitmap g = new Bitmap(dir.GetFiles()[0].FullName);
            //g.Width
            _notify = dir.GetFiles()[0].Name;
            string strjavascript = string.Empty; // "<script language='javascript' type='text/javascript'> ";
            strjavascript +=
                " $(document).ready(function() {$('#UserName').focus();showchangeBook();}); function showchangeBook() {$.blockUI({message: $('#frmChangeBook'),css: {";
            strjavascript += "top: '20%',";
            strjavascript += "left: '20%',";
            strjavascript += "right: '20%',";
            strjavascript += "width: '" + g.Width + "',";
            strjavascript += "height: '"+g.Height+"'";
            strjavascript += "}";
            strjavascript += "});";
            strjavascript += "}";
            //strjavascript += "</script>";
            dir.GetAccessControl();
            if (!ClientScript.IsStartupScriptRegistered("alert"))
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),
                                                        "alert", strjavascript, true);
            }
        }
    }
    #endregion

    #region page helper processing
    private void authorizeUser(string username)
    {
        objUserContext = new UserContext();
        //string passworddefault = CORE.Helper.Constant.UMS.PASSWORD_DEFAULT;
        if (objUserContext.Authenticate(username, "", Session.SessionID))
        {
            Session["objUserContext"] = objUserContext;
            Response.Redirect("default.aspx");
        }
        else
        {
            showMessageError("Bạn chưa được cấp quyền truy cập dịch vụ.");
        }
    }

    private void showMessageError(string ErrorMessage)
    {
        Response.Write("<center><strong><font color='red'>" + ErrorMessage + "</font></strong></center>");
        Response.Flush();
        Response.End();
    }

    /// <summary>
    /// 
    /// </summary>
    private void processValidToken(string username)
    {
        authorizeUser(username);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="Token"></param>
    private void processToken(string Token)
    {
        if (string.IsNullOrEmpty(Token))
            showMessageError("Không xác định được Token.");
        else
        {
            CORE.UMS.CoreBusiness.bus_Token vpbToken = CORE.UMS.CoreBusiness.bus_Token.Instance();
            double ConsumedTimeOnToken = vpbToken.getConsumedTimeOnToken(Token);
            if (ConsumedTimeOnToken >= 15)
                showMessageError("Token đã hết hạn sử dụng");
            else
            {
                processValidToken(vpbToken.getUser(Token));
            }
        }
    }
    #endregion

    #region Login

    private bool LDAPlogin(string user, string password)
    {
        string isAuthen;
        IldapClient ldap = new IldapClient();
        isAuthen = ldap.ldapLogin(user, password);
        if (string.IsNullOrEmpty(isAuthen))
            return true;
        else
            return false;
    }

    private bool LDAPlogin_OLD(string user, string password)
    {
        string lConnection;
        string lServerName;
        int lport = 389;

        #region get LDAP info config
        string sql = "select name,value from t_project_parameter where name in ('ldap_server','ldap_conn','ldap_port')";
        System.Data.SqlClient.SqlConnection sqlCon = new System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.AppSettings["ConnectionString"]);
        sqlCon.Open();
        System.Data.SqlClient.SqlCommand sqlCmd = new System.Data.SqlClient.SqlCommand(sql, sqlCon);
        System.Data.SqlClient.SqlDataAdapter sqlAdap = new System.Data.SqlClient.SqlDataAdapter(sqlCmd);
        DataSet ds = new DataSet();
        sqlAdap.Fill(ds, "Params");
        if (ds == null)
        {
            sqlCon.Close();
            return false;
        }
        DataRow[] Rs;
        Rs = ds.Tables[0].Select("name='ldap_server'");
        lServerName = Rs[0]["value"].ToString();

        Rs = null;
        Rs = ds.Tables[0].Select("name='ldap_port'");
        lport = Convert.ToInt16(Rs[0]["value"].ToString());

        Rs = null;
        Rs = ds.Tables[0].Select("name='ldap_conn'");
        lConnection = Rs[0]["value"].ToString();

        sqlCon.Close();

        #endregion

        LdapError error = new LdapError();
        string name = "";

        //name = "uid=" + user + lConnection;

        LDAPUSER._ldapServerName = lServerName;
        LDAPUSER._port = lport;
        string isAuthen;

        try
        {
            IldapClient ldap = new IldapClient();
            isAuthen = ldap.ldapLogin(user, password);
            //isAuthen = LDAPUSER.IsAuthenticate(name, password);
        }
        catch (Exception ex)
        {
            return false;
        }
        if (isAuthen.Equals(error.openWith["0"].ToString()))
            return true;
        else
            return false;
    }
    protected void AuthorizeUser(string username)
    {
        UserContext objUserContext = new UserContext();
        if (objUserContext.Authenticate(username, "", Session.SessionID))
        {
            Session["objUserContext"] = objUserContext;
            string rolename = ((Role)objUserContext.Roles[0]).RoleName;
            string groupname = ((Group)objUserContext.Groups[0]).GroupName;
            Response.Redirect("default.aspx");
        }
        else
        {
            showMessageError("Bạn chưa được cấp quyền truy cập dịch vụ.");
        }
    }
    private void signOut()
    {
        Session.Abandon();
        Response.Redirect("SignIn.aspx");
    }
    #endregion
}

