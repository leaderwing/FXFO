<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="CheckDealsEndDay.aspx.cs" Inherits="VPB_FX.Modules.DMS.CheckDealsEndDay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Đối chiếu cuối ngày</legend>
        <table width="100%">
            <tr>
                <td class="lblNormal" style="width: 100px">
                    Chọn file :
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button runat="server" ID="btnCheckDeals" SkinID="ApproveButton" 
                        onclick="btnCheckDeals_Click" />
                </td>
            </tr>
            <tr >
                <td colspan="2">
                    <table width="100%">
                        <tr>
                            <td>
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
