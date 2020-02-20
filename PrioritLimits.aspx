<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="PrioritLimits.aspx.cs" Inherits="VPB_FX.Modules.DMS.PrioritLimits" %>

<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <table width="100%">
        <tr>
            <td>
                <label>
                    Đối tượng</label>
            </td>
            <td colspan="2">
                <asp:DropDownList runat="server" ID="cboSegment" OnSelectedIndexChanged="seg_OnSelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="AF" Text="AF"></asp:ListItem>
                <asp:ListItem Value="KHCN" Text="KHCN"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    CCY</label>
            </td>
            <td colspan="2">
                <asp:DropDownList runat="server" ID="cboCCY">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    Amount</label>
            </td>
            <td>
                <cc1:C1WebNumericEdit ID="txtAmt_Min" runat="server" SkinID="C1WebNumericRequired"
                    Width="250px" Height="30px" Text="0" Font-Size="Large" DecimalPlaces="4" Culture="en-US"
                    ThousandsSeparator="true" Value="0" SmartInputMode="false" MaxValue="100000000000"
                    UpDownAlign="None">
                </cc1:C1WebNumericEdit>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button runat="server" ID="btnAccept" SkinID="SaveButton" OnClientClick="{javascript:Do_Save(); return false; }" />
            </td>
        </tr>
    </table>
    <div class="table-responsive">
        <literal runat="server" id="tbl"></literal>
    </div>
    <script language="javascript" type="text/javascript">
        function viewhist(ccy,type) {
            opendetail("ViewCcyPriority.aspx?seg="+type+"&ccy=" + ccy, "Priority");
        }

        function Do_Save() {
            var url = "PrioritLimits.aspx";
            var query = "act=update";
            if (GetSvrCtlValue("cboCCY") == "") {
                alert('Cần nhập CCY');
                return false;
            }
            query += "&seg=" + GetSvrCtlValue("cboSegment") + "&ccy=" + GetSvrCtlValue("cboCCY") + "&amount=" + new Number(replaceNumber(GetSvrCtlValue("txtAmt_Min"), ',', ''));
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errorMessage) {
                    if (errorMessage == "" || errorMessage == "1") {
                        alert('Đã cập nhật thành công');
                        window.location.reload(true);
                    } else {
                        alert(errorMessage);
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
