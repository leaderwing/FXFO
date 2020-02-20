<%@ Page Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="TicketInfo.aspx.cs" Inherits="VPB_FX.Modules.DMS.TicketInfo" Title="Untitled Page" %>
    <%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Thông tin ticket</legend>
        <table style="width: 100%;">
            <tr>
                <td style="width: 100px; vertical-align: top">
                    Nội dung yêu cầu
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtDes" TextMode="MultiLine" Rows="2" SkinID="TextBoxRequired"
                        Width="90%"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr id="rejectmess" runat="server">
                <td style="width: 100px; vertical-align: top">
                    Lý do từ chối 
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtReject" TextMode="MultiLine" Rows="2" SkinID="TextBoxRequired"
                        Width="90%"></asp:TextBox>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
             <tr id="Tr1" runat="server">
                <td style="width: 100px; vertical-align: top">
                    Tỷ giá hủy 
                </td>
                <td>
                    <cc1:c1webnumericedit ID="txtRateCancel"  runat="server" Height="30px" Font-Size="Medium"
                        Text="0" DecimalPlaces="4" Culture="en-US"
                                                                ThousandsSeparator="true" 
                        Value="0" SmartInputMode="false" MaxValue="500000"
                                                                UpDownAlign="None" >
                                                            </cc1:c1webnumericedit>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    &nbsp;
                </td>
                <td>
                    <asp:Button runat="server" ID="btnTicket" CssClass="Button" Text="Gửi yêu cầu" Width="96px" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg" runat="server" id="dealinfo">
        <legend class="divLegend">Chi tiết Deal</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 118px" class="lblCaption">
                    Chi Nhánh
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdCompany" EnableViewState="false"></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    FX ID<asp:HiddenField runat="server" ID="type" />
                </td>
                <td>
                    &nbsp;<asp:Label runat="server" ID="tdFxID" EnableViewState="false"/>
                </td>
            </tr>
            <tr runat="server" id="trOP">
                <td style="width: 118px" class="lblCaption">
                    Kiểu quyền chọn
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdtypeOfObject" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    OP.Type
                </td>
                <td >
                    &nbsp;<asp:Label runat="server" ID="tdOPType" EnableViewState="false" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 118px" class="lblCaption">
                    Mua/Bán
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdBuyorSell" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px">
                    &nbsp;
                </td>
                <td align="right" class="lblCaption">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 118px" class="lblCaption">
                    Ngày giao dịch
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdTradeDate" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    Ngày giá trị
                </td>
                <td>
                    &nbsp;<asp:Label runat="server" ID="tdValueDate" EnableViewState="false" ></asp:Label>
                </td>
            </tr>
            <tr runat="server" id="trOption">
                <td style="width: 118px" class="lblCaption">
                    Option Start
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdOptionStart" EnableViewState="false" ></asp:Label>
                </td>
                
            </tr>
            <tr>
                <td style="width: 118px" class="lblCaption">
                    Ðồng Mua
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdccyBuy" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    KL Mua
                </td>
                <td>
                    &nbsp;<asp:Label runat="server" ID="tdamtBuy" EnableViewState="false" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 118px" class="lblCaption">
                    Ðồng Bán
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdccySell" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    KL Bán
                </td>
                <td>
                    &nbsp;<asp:Label runat="server" ID="tdamtSell" EnableViewState="false" ></asp:Label>
                </td>
            </tr>
             <tr runat="server" id="trRate">
                <td style="width: 118px" class="lblCaption">
                    Tỷ Giá
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdRate" EnableViewState="false" ></asp:Label>
                </td>
                
            </tr>
            <tr runat="server" id="trOR">
                <td style="width: 118px" class="lblCaption">
                    Option Rate
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdOR" EnableViewState="false" ></asp:Label>
                </td>
                
            </tr>
            <tr runat="server" id="trRateO">
                <td style="width: 118px" class="lblCaption">
                    Tỷ Giá Striket
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdStriket" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    Tỷ Giá Spot
                </td>
                <td>
                    &nbsp;<asp:Label runat="server" ID="tdSpot" EnableViewState="false" ></asp:Label>
                </td>
            </tr>
             <tr>
                <td style="width: 118px" class="lblCaption">
                    TK Đồng Mua
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdAccountBuy" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    TK Đồng Bán
                </td>
                <td>
                    &nbsp;<asp:Label runat="server" ID="tdAccountSell" EnableViewState="false" ></asp:Label>
                </td>
            </tr>
             <tr runat="server" id="trP">
                <td style="width: 118px" class="lblCaption">
                    PA
                </td>
                <td style="width: 188px">
                    &nbsp;<asp:Label runat="server" ID="tdPA" EnableViewState="false" ></asp:Label>
                </td>
                <td style="width: 100px" class="lblCaption">
                    RA
                </td>
                <td>
                    &nbsp;<asp:Label runat="server" ID="tdRA" EnableViewState="false" ></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>

    <script language="javascript" type="text/javascript">
        function sendTicket() {
            var fxid = '<%=_fxid %>';
            var ticketid = '<%=_fxTicketID %>';
            var dealid = '<%=_dealid %>';
            var description = GetValue("ctl00_FormContent_txtDes");
            if (description == "") {
                alert('Hãy nhập vào nội dung yêu cầu');
                return false;
            }
            if (!confirm('Bạn đồng ý gửi yêu cầu này không ?'))
                return false;
            var url = "TicketInfo.aspx";
            var query = "act=send&fx=" + fxid + "&deal=" + dealid + "&des=" + description + "&ticket=" + ticketid + "&BO=" + '<%=_BO %>';
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    if (errormessage == "") {
                        if ('<%=_BO %>' == "NO") {
                            alert('Đã gửi thành công đề nghị hủy deal đến FXdealer');
                        } else {
                            alert('Đã gửi thành công đề nghị hủy deal đến BO');
                        }
                    }
                    else {
                        alert(errormessage);
                    }
                    window.close();
                }
            });
        }
        function saveTicket() {
            var fxid = '<%=_fxid %>';
            var ticketid = '<%=_fxTicketID %>';
            var dealid = '<%=_dealid %>';
            var description = GetValue("ctl00_FormContent_txtDes");

            var url = "TicketInfo.aspx";
            var query = "act=save&fx=" + fxid + "&deal=" + dealid + "&des=" + description + "&ticket=" + ticketid + "&BO=" + '<%=_BO %>';
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(errormessage) {
                    if (errormessage == "") {
                        alert('Đã lưu thành công yêu cầu xóa deal');
                    }
                    else {
                        alert(errormessage);
                    }
                    window.close();
                }
            });
        }
        function showdealinfo(dealid) {
            var url = "TicketInfo.aspx";
            var query = "act=getdealinfo";
            query += "&dealid=" + dealid;
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(data) {
                    FinishProcessingForm();
                    var adeal = JSON.parse(data);
                    //                    $("#tdCompany").html(adeal.company);
                    //                    $("#tdBuyorSell").html(adeal.buyOrsell);
                    //                    $("#tdTradeDate").html(adeal.dealDate);
                    //                    $("#tdValueDate").html(adeal.valueDate);
                    //                    $("#tdccyBuy").html(adeal.ccyBuy);
                    //                    $("#tdccySell").html(adeal.ccySell);
                    //                    $("#tdamtBuy").html(FormatNumber(adeal.amt_buy));
                    //                    $("#tdamtSell").html(FormatNumber(adeal.amt_sell));

                }
            });
        }
        function AceptDel() {
            var fxid = '<%=_fxid %>';
            var ticketid = '<%=_fxTicketID %>';
            var dealid = '<%=_dealid %>';
            var description = GetValue("ctl00_FormContent_txtDes");
            var type = GetValue("ctl00_FormContent_type");
            var rate = new Number(replaceNumber(GetSvrCtlValue("txtRateCancel"),',',''));
            var url = "TicketInfo.aspx";
            var query = "act=acept&type=" + type + "&fx=" + fxid + "&deal=" + dealid + "&des=" + description + "&ticket=" + ticketid+"&rate="+rate;
            if (!confirm('Bạn có đồng ý xóa deal này không ?'))
                return false;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(errormessage) {
                    if (errormessage == "") {
                        alert('Đã xóa deal');
                    }
                    else {
                        alert(errormessage);
                    }
                    window.close();
                }
            });
        }
        function AbortDel() {
            var fxid = '<%=_fxid %>';
            var ticketid = '<%=_fxTicketID %>';
            var dealid = '<%=_dealid %>';
            var description = GetValue("ctl00_FormContent_txtReject");
            if (description == "") {
                alert('Hãy nhập vào lý do từ chối');
                return false;
            }
            var url = "TicketInfo.aspx";
            var query = "act=abort&fx=" + fxid + "&deal=" + dealid + "&reject=" + description + "&ticket=" + ticketid;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(errormessage) {
                    if (errormessage == "") {
                        alert('Đã từ chối yêu cầu xóa deal');
                    }
                    else {
                        alert(errormessage);
                    }
                    window.close();
                }
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
