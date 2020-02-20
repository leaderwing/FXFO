<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="CcyLimit.aspx.cs" Inherits="VPB_FX.Modules.DMS.CcyLimit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<fieldset class="fieldsetBg">
<table style="width:100%">
    <tr>
        <td style="width: 50%"><iframe id="ifCcyAutoLimit" src="CcyAutoLimit.aspx" width="100%" height="550px" style="border:0"></iframe></td>  
        <td><iframe id="ifCcySemiAutoLimit" src="CcySemiAutoLimit.aspx" width="100%" height="550px" style="border:0"></iframe></td>          
    </tr>
</table>
</fieldset>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
