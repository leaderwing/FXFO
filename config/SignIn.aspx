<%@ Page Language="C#" AutoEventWireup="true" Inherits="SignIn" Title="" CodeBehind="SignIn.aspx.cs" %>

<%@ OutputCache NoStore="true" Duration="1" VaryByParam="None" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script language="javascript" type="text/javascript" src="Javascript/jquery-1.4.2.min.js"></script>
    <script language="javascript" type="text/javascript" src="Javascript/jquery.blockUI.js"></script>
    <script language="javascript" type="text/javascript" src="Javascript/BackEndProcess.js"></script>
    <script language="javascript" type="text/javascript" src="Javascript/getquerystring.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            var browsername = navigator.appName;

            //            if (browsername.indexOf("Microsoft") == -1) {
            //              
            //                $('#bro').text(browsername);
            //                $('#LoginButton').attr('disabled', 'false');
            //            } else {
            //                    alert('Bạn nên sử dụng FF để được hỗ trợ tốt nhất');
            //                    $('#LoginButton').attr('disabled', 'true');
            //               
            //            }
            $("#UserName").focus();
        });
    </script>
    <link rel="shortcut icon" href="Images/Icon/favicon.ico" type="image/x-icon" />
    <style type="text/css">
        .style1
        {
            height: 30px;
        }
        .style2
        {
            height: 50px;
        }
        .style3
        {
            height: 30px;
        }
        .style4
        {
            height: 29px;
        }
        .style5
        {
            height: 208px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table align="center">
            <tr>
                <td style="height: 70px">
                </td>
            </tr>
            <tr>
                <td valign="middle" align="center" style="width: 640px; height: 410px; background-image: url(Images/SignIn.png);">
                    <%--<table>
                        <tr style="padding-bottom:10px">
                            <td>
                                <marquee onmouseover="this.stop()" onmouseout="this.start()" height="20" scrollamount="2"
                                    scrolldelay="1"><STRONG><font color="red" size="5pt">Chào mừng bạn đến với website Hệ thống thu thuế trực tiếp cho Ngân hàng Việt Nam Thịnh Vượng</font></STRONG></marquee>
                            </td>
                        </tr>
                    </table>--%>
                    <table style="width: 100%; height: 100%">
                        <tr>
                            <td valign="bottom" align="center">
                                <table style="width: 50%; height: 20px;" border="0">
                                    <tr class="lblWhite">
                                        <td align="left" valign="top" class="style1" style="width: 30%">
                                            Tên đăng nhập
                                        </td>
                                        <td align="left" class="form-group">
                                            <asp:TextBox ID="UserName" runat="server" MaxLength="100" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvUserNameRequired" runat="server" Visible="true"
                                                ControlToValidate="UserName" Font-Bold="true" ErrorMessage="?"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="lblWhite">
                                        <td align="left" valign="top" class="style3">
                                            Mật khẩu
                                        </td>
                                        <td align="left" valign="top" class="form-group">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" MaxLength="100" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Visible="true"
                                                ControlToValidate="Password" Font-Bold="true" ErrorMessage="?"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="lblWhite">
                                        <td align="left" valign="top" class="style4">
                                        </td>
                                        <td align="left" valign="top" class="style4">
                                            <img alt='' id="wait" style="display: none" src="Images/indicator.gif" />
                                            <asp:Button runat="server" ID="LoginButton" SkinID="LoginButton" />
                                        </td>
                                    </tr>
                                    <tr class="lblWhite">
                                        <td align="left" valign="top" class="style2">
                                        </td>
                                        <td align="left" valign="top" class="style2">
                                            <asp:Label runat="server" ID="lblLoginFail" CssClass="lblTinVan2" EnableViewState="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="height: 50px">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="right" class="lblFooter" style="cursor: pointer">
                    <font onclick="dk();">Điều khoản | Cam kết người dùng</font>
                </td>
            </tr>
            <tr>
                <td valign="bottom" style="height: 130px" align="center" class="lblCopyRight">
                    Ngân hàng TMCP Việt Nam Thịnh Vượng<br />
                    Bản Quyền ngân hàng <b>VPBank ©2012</b>
                    <hr style="size: 1; width: 100%; color: Silver" />
                </td>
            </tr>
        </table>
    </div>
    <div id="MG" style="display: none;">
        <table style="width: 100%;" cellspacing="0">
            <thead class="GridHeader">
                <tr style="background-color: Blue; color: White">
                    <td id="tdcaption" align="left">
                        Chọn Đơn vị hoạt động
                    </td>
                </tr>
            </thead>
        </table>
        <br />
        <table style="width: 100%;" cellspacing="0">
            <tr>
                <td align="left" class="lblCaption">
                    Đơn vị:
                </td>
            </tr>
            <tr>
                <td style="width: 100%">
                    <asp:DropDownList runat="server" ID="cboGroups" SkinID="DropDownList" Width="100%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" id="btnAccept" name="btnAccept" class="Button" value="Đồng ý"
                        onclick="acceptRoleGroup()" style="width: 20%" />
                </td>
            </tr>
        </table>
    </div>
    <div id="frmChangeBook" style="display: none">
        <table style="width: 100%; background: none">
            <tr>
                <td id="tdComment" colspan="" style="color: Black; font-size: 19px; font-weight: bold;"
                    align="left">
                    Thông báo
                </td>
                <td colspan="" align="right" valign="top">
                    <a onclick="{$.unblockUI();}" style="font-size: 20pt; cursor: pointer">X </a>
                </td>
            </tr>
        </table>
        <table style="width: 100%">
            <tr>
                <td>
                    <img src="Images/Notify/<%=_notify %>" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
<script language="javascript" type="text/javascript">
    function dk() {
        openDialog('Modules/Dialog/Agreement.html', '600px', '600px');
    }
</script>
