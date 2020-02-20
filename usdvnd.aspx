<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="usdvnd.aspx.cs" Inherits="VPB_FX.Modules.DMS.usdvnd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <table style="width: 50%">
            <tr>
                <td style="width: 100px">
                    Loại giao dịch
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="drTxnType" runat="server">
                    </asp:DropDownList>
                </td>
               
            </tr>
        </table>
        <iframe id="ifTxn" src="" width="100%" height="550px" style="border: 0"></iframe>
    </fieldset>
    <script language="javascript" type="text/javascript">
        var va;
        $(document).ready(function () {
            initform();
        });
        function initform() {
            var url = "";
            url = "usdvnd_spot.aspx";
            $("#ifTxn").attr("src", url);
        }
        function drTxnType_click(obj) {
            var url = "";
            var doctype = new String(obj.value).toUpperCase();
            if (doctype == 'SP')
                url = "usdvnd_spot.aspx";
            else if (doctype == 'FW') {
                $.ajax({
                    type: "POST",
                    url: "usdvnd.aspx",
                    data: "act=check",
                    success: function (errormessage) {
                       if (errormessage == "0") {

                            alert("Chưa cập nhật tỷ giá USDVND spot");
                            SetSvrCtlValue("drTxnType", "SP");
                            url = "usdvnd_spot.aspx";
                            $("#ifTxn").attr("src", url);
                        }
                        else {
                            url = "usdvnd_forward.aspx";
                            $("#ifTxn").attr("src", url);
                        }
                    }
                });
            }
            if (url != "")
                $("#ifTxn").attr("src", url);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
