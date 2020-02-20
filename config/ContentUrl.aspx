<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentUrl.aspx.cs" Inherits="VPB_DASHBOARD.ContentUrl" %>
<%@ Register Assembly="DevExpress.Web.v9.2, Version=9.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.2, Version=9.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <input type="button" id="btnPopUp" value="Click me" />
    <input type="button" id="Button1" value="Alert me" onclick="alert('Hi')" />
    <%--<dxpc:aspxpopupcontrol ID="popupStatistic" runat="server"
         Width="600px" Height="400px"
         ContentUrl="PlanExecutionStatistic.aspx"
         PopupHorizontalAlign="OutsideRight" 
         PopupVerticalAlign="TopSides"
         PopupElementID="btnStatistic"
         HeaderImage-Url="~/Images/preferences.gif"
         HeaderText="Thống kê thực hiện kế hoạch">
    </dxpc:aspxpopupcontrol>--%>

    </div>
    </form>
</body>
</html>
