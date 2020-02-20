<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="PenddingDetailTrader.aspx.cs" Inherits="VPB_FX.Modules.DMS.PenddingDetailTrader" %>

<%@ OutputCache Duration="1" NoStore="true" VaryByParam="None" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <table id="tblMain" style="width: 100%">
        <tr>
            <td id="tdForm" style="width: 75" align="left" valign="top">
                <table style="width: 100%">
                    <tr>
                        <td align="left" valign="top">
                            <fieldset class="fieldsetBg">
                                <legend class="divLegend">THÔNG TIN GIAO DỊCH</legend>
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 118px" class="lblCaption">
                                            Chi Nhánh
                                        </td>
                                        <td style="width: 188px" id="tdCompany">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            Giao dịch
                                        </td>
                                        <td id="tdtxnType" style="width: 279px">
                                        </td>
                                        <td id="tdtuchoi" rowspan="8" align="left" valign="top">
                                            <fieldset>
                                                <legend class="divLegend">Từ chối</legend>Lý do:
                                                <br />
                                                <asp:TextBox runat="server" ID="txtTuChoi" SkinID="TextBox" Width="99%" TextMode="MultiLine"
                                                    Rows="2"></asp:TextBox>
                                                <br />
                                                <asp:Button runat="server" ID="btnTuChoi" CssClass="Button" Text="Từ Chối" OnClientClick="{tuchoi();return false;}" />
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px" class="lblCaption">
                                            Mua/Bán
                                        </td>
                                        <td style="width: 188px" id="tdBuyorSell">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            Amt
                                        </td>
                                        <td id="tdAmt" style="width: 279px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px" class="lblCaption">
                                            Ngày giao dịch
                                        </td>
                                        <td style="width: 188px; color:red; font-weight:bold" id="tdTradeDate">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                           Ngày giá trị
                                        </td>
                                        <td id="tdValueDate" style="width: 279px; color:red ; font-weight:bold">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="trFW">
                                        <td style="width: 118px" class="lblCaption">
                                            Ngày forward
                                        </td>
                                        <td style="width: 188px" id="tdForwardDate">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px" class="lblCaption">
                                            <span id="spanCCYBuy">Đồng Mua</span>
                                        </td>
                                        <td style="width: 188px" id="tdccyBuy">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            KL Mua
                                        </td>
                                        <td id="tdamtBuy" style="width: 279px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px" class="lblCaption">
                                            <span id="spanCCYSell">Đồng Bán</span>
                                        </td>
                                        <td style="width: 188px" id="tdccySell">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            KL Bán
                                        </td>
                                        <td id="tdamtSell" style="width: 279px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px" class="lblCaption">
                                            Tỷ giá mua KH
                                        </td>
                                        <td style="width: 188px" id="tdcif_rate">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            Tên KH
                                        </td>
                                        <td id="tdcif_name" style="width: 279px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px; font-style: italic;" class="lblNormal">
                                            Created by
                                        </td>
                                        <td style="width: 188px; font-style: italic;" class="lblNormal" id="tdCreatedBy">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            &nbsp;
                                        </td>
                                        <td id="" style="width: 279px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px; font-style: italic;" class="lblNormal">
                                            Created date
                                        </td>
                                        <td style="width: 188px; font-style: italic;" class="lblNormal" id="tdCreatedDate">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            &nbsp;
                                        </td>
                                        <td id="" style="width: 279px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 118px; font-style: italic;" class="lblNormal">
                                           Ghi Chú
                                        </td>
                                        <td style="width: 188px; font-style: italic;" class="lblNormal" id="tdComment">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            &nbsp;
                                        </td>
                                        <td  style="width: 279px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr id="trRate">
                                        <td style="width: 118px; font-style: italic;" class="lblNormal">
                                           Tỷ giá hủy
                                        </td>
                                        <td style="width: 188px; font-style: italic; color:red ; font-weight:bold " class="lblNormal" id="tdRate">
                                            &nbsp;
                                        </td>
                                        <td style="width: 100px" class="lblCaption">
                                            &nbsp;
                                        </td>
                                        <td  style="width: 279px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <fieldset class="fieldsetBg">
                                <legend class="divLegend">DEALER NHẬP GIÁ</legend>
                                <table style="width: 100%;">
                                    <tr id="RateSPFW">
                                        <td style="width: 50%" align="center" valign="top" colspan="2">
                                            <fieldset>
                                                <legend>TỶ GIÁ</legend>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td class="lblCaption" align="right">
                                                            Tỷ Giá
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <cc1:C1WebNumericEdit ID="txtTyGia" OnClientBlur="calculateUSDVND();" runat="server"
                                                                Width="100%" Height="40px" Font-Size="Large" Text="0" DecimalPlaces="4" Culture="en-US"
                                                                ThousandsSeparator="true" Value="0" SmartInputMode="false" MaxValue="500000"
                                                                UpDownAlign="None">
                                                            </cc1:C1WebNumericEdit>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                        <td style="width: 50%; display: none" align="center" valign="top" colspan="2">
                                            <fieldset id="FCYUSD_USDVND">
                                                <legend>FCYUSD/USDVND</legend>
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="width: 50%" align="right" valign="top" class="lblCaption">
                                                            FCYUSD
                                                        </td>
                                                        <td style="width: 50%" align="right" valign="top" class="lblCaption">
                                                            USDVND
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 50%" align="center" valign="top">
                                                            <cc1:C1WebNumericEdit ID="txtfcyusd" OnClientBlur="calculateUSDVND();" runat="server"
                                                                Width="100%" Height="40px" Font-Size="Large" Text="0" DecimalPlaces="4" Culture="en-US"
                                                                ThousandsSeparator="true" Value="0" SmartInputMode="false" MaxValue="500000"
                                                                UpDownAlign="None">
                                                            </cc1:C1WebNumericEdit>
                                                        </td>
                                                        <td style="width: 50%" align="center" valign="top">
                                                            <cc1:C1WebNumericEdit ID="txtusdvnd" OnClientBlur="{return false;}" runat="server"
                                                                Width="100%" Height="40px" Font-Size="Large" Text="0" DecimalPlaces="4" Culture="en-US"
                                                                ThousandsSeparator="true" Value="0" SmartInputMode="false" MaxValue="500000000000"
                                                                UpDownAlign="None" Enabled="false">
                                                            </cc1:C1WebNumericEdit>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr id="RateSW">
                                        <td style="width: 118px">
                                            SPOT RATE
                                        </td>
                                        <td style="width: 279px">
                                            <cc1:C1WebNumericEdit ID="spRate" runat="server" Width="100%" Height="40px" Font-Size="Large"
                                                Text="0" DecimalPlaces="4" Culture="en-US" ThousandsSeparator="true" Value="0"
                                                SmartInputMode="false" MaxValue="500000000000" UpDownAlign="None">
                                            </cc1:C1WebNumericEdit>
                                        </td>
                                        <td style="width: 118px">
                                            FORWARD RATE
                                        </td>
                                        <td style="width: 279px">
                                            <cc1:C1WebNumericEdit ID="fwRate" runat="server" Width="100%" Height="40px" Font-Size="Large"
                                                Text="0" DecimalPlaces="4" Culture="en-US" ThousandsSeparator="true" Value="0"
                                                SmartInputMode="false" MaxValue="500000000000" UpDownAlign="None">
                                            </cc1:C1WebNumericEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="middle" align="center" colspan="4">
                                            <asp:Button ID="btnSave" runat="server" SkinID="SaveButton" OnClientClick="{responseRate(); return false;}" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr id="TR_Tygiachan" style="display: none;">
                        <td align="left" valign="top">
                            <fieldset>
                                <legend class="lblCaption" style="color: teal">SP/FW</legend>
                                <table style="width: 100%">
                                    <tr class="lblCaption">
                                        <td style="width: 192px" align="right">
                                            SP/Tỷ giá chặn
                                        </td>
                                        <td style="width: 217px" align="right">
                                            FW/Điểm kỳ hạn tối đa
                                        </td>
                                        <td align="right" style="width: 249px">
                                            FW/Tỷ giá kỳ hạn tối đa
                                        </td>
                                        <td align="right">
                                            FW/Tỷ giá sàn
                                        </td>
                                    </tr>
                                    <tr class="lblTinVan2">
                                        <td style="width: 192px" align="right">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <asp:TextBox runat="server" ID="txtTyGiaChan" SkinID="TextBox" Style="text-align: right;
                                                        width: 40%; font-size: larger"></asp:TextBox>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="timer2" EventName="tick" />
                                                </Triggers>
                                            </asp:UpdatePanel>
											<asp:Timer runat="server" ID="timer2" Interval="1000" OnTick="refreshTyGia">
                                            </asp:Timer>
                                        </td>
                                        <td style="width: 217px" align="right">
                                            <input type="text" id="txtDiemKyHanToiDa" class="TextBox" style="text-align: right;
                                                width: 30%; font-size: larger" readonly="readonly" />
                                        </td>
                                        <td align="right" style="width: 249px">
                                            <input type="text" id="txtTyGiaKyHanToiDa" class="TextBox" style="text-align: right;
                                                width: 30%; font-size: larger" readonly="readonly" />
                                        </td>
                                        <td align="right">
                                            <input type="text" id="txtTyGiaSan" class="TextBox" style="text-align: right; width: 30%;
                                                font-size: larger" readonly="readonly" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--Additional info-->
    <div style="display: none">
        Dealer post giá:
        <input type="text" id="txtQuoteGiaMB" />
    </div>
    <!--End of Additional info-->
    <script language="javascript" type="text/javascript">
        var _ccyBase = "";
        var _ccyTerm = "";
        var _dealid = "";
        var _txntype = "";
        var _objtype = "";
        var tick = 10;
        /***********************************************/
        $(document).ready(function () {
            showfirstDeal();
        });
        /***********************************************/
        function showfirstDeal() {

            var dealid = Qry["dealid"];
            
            if (dealid.length == 36) {
                showdealinfo(dealid);
            } else {
                $("#RateSW").hide();
            }
        }
        /***********************************************/
        function showdealinfo(dealid) {
            _dealid = dealid;
           
            var url = "dealpendingforrate.aspx";
            var query = "act=getdealinfo";
            query += "&dealid=" + dealid;
            StartProcessingForm("");
            resetDealerInput();
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (data) {
                    FinishProcessingForm();
                    var adeal = JSON.parse(data);                   
                    if (adeal.Status != '2') {
                        alert('Giao dịch này đã được trả lời giá');
                        window.location.close();
                    }
                    $("#tdCompany").html(adeal.company);

                    displayCompanyFullName(adeal.company);

                    $("#tdtxnType").html(adeal.txnType + "/" + adeal.objType);
                    _txntype = adeal.txnType;
                    _objtype = adeal.objType;
                    if (adeal.pk_deal_cancel != '') {
                        $("#trRate").show();
                        $("#tdRate").html(adeal.rateBackdate);
                    } else {
                        $("#trRate").hide();
                    }
                    $("#tdBuyorSell").html(adeal.buyOrsell_Branch);
                    $("#tdAmt").html(addCommas(adeal.amt));
                    $("#tdTradeDate").html(adeal.dealDate);
                    $("#tdValueDate").html(adeal.valueDate);
                    $("#tdccyBuy").html(adeal.ccyBuy);
                    $("#tdccySell").html(adeal.ccySell);
                    $("#tdamtBuy").html(FormatNumber(adeal.amt_buy));
                    $("#tdamtSell").html(FormatNumber(adeal.amt_sell));
                    $("#tdCreatedBy").html(adeal.createdUser);
                    $("#tdCreatedDate").html(adeal.createdDate);
                    $("#tdcif_rate").html(adeal.cif_rate);
                    $("#tdcif_name").html(adeal.cif_name);
                    $("#tdComment").html(adeal.comment);
                    if (adeal.txnType == "SW") {
                        $("#RateSW").show();
                        $("#RateSPFW").hide();
                        $("#TR_Tygiachan").hide();
                        $("#trFW").show();
                        $("#tdForwardDate").html(adeal.ForwardDate);
                        $("#spanCCYSell").html("CCY Term");
                        $("#spanCCYBuy").html("CCY Base");
                        if (adeal.buyOrsell_Branch == "BUY")
                            $("#tdBuyorSell").html("BUY/SELL");
                        else {
                            $("#tdBuyorSell").html("SELL/BUY");
                        }
                    } else {
                        $("#trFW").hide();
                        $("#RateSW").hide();
                        $("#RateSPFW").show();
                        $("#TR_Tygiachan").show();
                        $("#<%=txtTyGia.ClientID %>").focus();
                        $("#spanCCYSell").html("Đồng Bán");
                        $("#spanCCYBuy").html("Đồng Mua");
                        _ccyBase = adeal.ccyBase;
                        if (adeal.ccyBase == adeal.ccyBuy) {
                            _ccyTerm = adeal.ccySell;
                            $("#txtQuoteGiaMB").attr("value", "SELL");
                        } else {
                            _ccyTerm = adeal.ccyBuy;
                            $("#txtQuoteGiaMB").attr("value", "BUY");
                        }

                        if (((adeal.ccyBuy == "USD") && (adeal.ccySell == "VND"))
                            || ((adeal.ccyBuy == "VND") && (adeal.ccySell == "USD"))) {

                            $("#FCYUSD_USDVND").hide();
                        } else {
                            $("#FCYUSD_USDVND").show();
                        }

                        if (adeal.txnType == "FW") {
                            $("#txtDiemKyHanToiDa").attr("value", adeal.DiemKyHanToiDa);
                            $("#txtTyGiaKyHanToiDa").attr("value", adeal.TyGiaKyHanToiDa);
                            $("#txtTyGiaSan").attr("value", adeal.TyGiaSan);
                            SetSvrCtlValue("txtTyGiaChan", "0");
                        } else {
                            $("#txtDiemKyHanToiDa").attr("value", "0");
                            $("#txtTyGiaKyHanToiDa").attr("value", "0");
                            $("#txtTyGiaSan").attr("value", "0");
                        }
                    }

                }
            });
        }
        function displayCompanyFullName(company) {
            var url = "dealpendingforrate.aspx";
            var query = "act=getcompanyfullname";
            query += "&company=" + company;
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (CompanyFullName) {
                    FinishProcessingForm();
                    if (CompanyFullName != "") {
                        $("#tdCompany").html(company + " -" + CompanyFullName);
                    }
                }
            });
        }
        /***********************************************/
        function calculateUSDVND() {
            var tygia = new Number(replaceNumber(GetSvrCtlValue("txtTyGia"), ",", ""));
            var fcyusd = new Number(replaceNumber(GetSvrCtlValue("txtfcyusd"), ",", ""));
            var usdvnd = 0;

            SetSvrCtlValue("txtusdvnd", "");

            if (("EUR.GBP.AUD".lastIndexOf(_ccyBase) != -1) && (_ccyTerm == "VND"))
                usdvnd = tygia / fcyusd;
            else if (("EUR.GBP.AUD.USD".lastIndexOf(_ccyBase) == -1) && (_ccyTerm == "VND"))
                usdvnd = tygia * fcyusd;
            else if (_ccyTerm == "USD")
                usdvnd = tygia / fcyusd;
            else if (_ccyBase == "USD")
                usdvnd = tygia * fcyusd;

            if (!isFinite(usdvnd) || usdvnd == 0)
                SetSvrCtlValue("txtusdvnd", "0.0000");
            else
                SetSvrCtlValue("txtusdvnd", FormatNumber(usdvnd));
        }
        /***********************************************/
        function resetDealerInput() {
            SetSvrCtlValue("txtTyGia", "0.0000");
            SetSvrCtlValue("txtfcyusd", "0.0000");
            SetSvrCtlValue("txtusdvnd", "");
        }
        /***********************************************/
        function responseRate() {
            var ccyPair = _ccyBase + _ccyTerm;
            var fcyusd = 0;
            var usdvnd = 0;
            if (ccyPair != "USDVND") {
                calculateUSDVND();
                if (!FormValidated())
                    return false;
                fcyusd = replaceNumber(GetSvrCtlValue("txtfcyusd"), ",", "");
                usdvnd = replaceNumber(GetSvrCtlValue("txtusdvnd"), ",", "");
            }


            var tygia = $("#ctl00_FormContent_txtTyGia").val();
            tygia = replaceNumber(tygia, ",", "");

            var tygiakyhantoida = 0;
            var tygiasan = 0;

            if ((_txntype == "SP") && (_objtype == "SME")) {
                var tygiachan = replaceNumber(GetSvrCtlValue("txtTyGiaChan"), ",", "");
                var chieu_post_gia_dealer = $("#txtQuoteGiaMB").val();
                if (chieu_post_gia_dealer == "BUY") {
                    //if (tygia > tygiachan) {
                    if (1 == 2) {
                        alert("Không được nhập tỷ giá cao hơn tỷ giá chặn.");
                        return false;
                    }
                }
                else {
                    //if (tygia < tygiachan) {
                    if (1 == 2) {
                        alert("Không được nhập tỷ giá thấp hơn tỷ giá chặn.");
                        return false;
                    }
                }
            }
            else if ((_txntype == "FW") && (ccyPair == "USDVND")) {
                tygiakyhantoida = new Number($("#txtTyGiaKyHanToiDa").val());
                tygiasan = new Number($("#txtTyGiaSan").val());
            }

            if (!confirm("Bạn đã chắc chắc chắn với tỷ giá ?"))
                return false;

            var url = "dealpendingforrate.aspx";
            var query = "act=responserate";
            query += "&dealid=" + _dealid;
            query += "&rate=" + tygia;
            query += "&fcyusd=" + fcyusd;
            query += "&usdvnd=" + usdvnd;
            query += "&tygiakyhantoida=" + tygiakyhantoida;
            query += "&tygiasan=" + tygiasan;
            query += "&txntype=" + _txntype;
            query += "&sprate=" + new Number(replaceNumber(GetSvrCtlValue("spRate"), ",", ""));
            query += "&fwrate=" + new Number(replaceNumber(GetSvrCtlValue("fwRate"), ",", ""));

            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (data) {
                    FinishProcessingForm();
                    if (data == "") {
                        alert('Nhập giá cho CN thành công.');
                        //window.location.reload(true);
                        //window.location.close();
                    }
                    else {
                        alert(data);
                    }
                    window.close(true);
                }
            });
        }
        /***********************************************/
        function tuchoi() {
            if (_dealid.length != 36) {
                alert("Không xác định giao dịch, thao tác không thành công.");
                return false;
            }
            var lydo = new String($("#ctl00_FormContent_txtTuChoi").val());
            if (lydo.trim().length == 0) {
                alert("Bạn chưa nhập lý do từ chối, thao tác không thành công.");
                $("#ctl00_FormContent_txtTuChoi").focus();
                return false;
            }
            var url = "dealpendingforrate.aspx";
            var query = "act=refusedeal";
            query += "&dealid=" + _dealid;
            query += "&msgrefuse=" + lydo.trim();
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (data) {
                    FinishProcessingForm();
                    if (data == "") {
                        alert('Từ chối giao dịch thành công.');
                        
                    }
                    else {
                        alert(data);
                    }
                    window.close(true);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
