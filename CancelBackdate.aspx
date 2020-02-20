<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="CancelBackdate.aspx.cs" Inherits="VPB_FX.Modules.DMS.CancelBackdate" %>

<%@ OutputCache Duration="1" NoStore="true" VaryByParam="None" %>
<%@ Import Namespace="vpb.app.business.FX.Definition.UMS" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg2">
        <legend class="divLegend">FX BRANCH DEALING</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 115px" class="lblCaption">
                    Chi Nhánh
                </td>
                <td style="width: 213px">
                    <asp:Label ID="lblCompanyName" runat="server" Text="Label" CssClass="lblNormal"></asp:Label>
                </td>
                <td style="width: 92px" class="lblCaption">
                    Mã CN
                </td>
                <td style="width: 418px">
                    <asp:Label ID="lblCompany" runat="server" Text="" CssClass="lblNormal"></asp:Label>
                    <asp:TextBox runat="server" ID="txtBook" Text="" Style="display: none"></asp:TextBox>
                   
                   
                </td>
                <td style="width: 197px" class="lblCaption" valign="top" align="right">
                    Trạng thái giao dịch
                </td>
                <td style="width: 197px" valign="top" align="right">
                    <asp:Label runat="server" ID="lblDealStatus" Style="text-transform: uppercase; font-weight: bold;"
                        EnableViewState="false" Text="Đổi kỳ hạn"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 85px" class="lblCaption">
                    FX.ID
                </td>
                <td style="width: 213px">
                    <asp:TextBox ID="txtDealID" runat="server" SkinID="TextBox" ReadOnly="true" Style="text-transform: uppercase"></asp:TextBox>
                </td>
                <td style="width: 92px" class="lblCaption">
                    Giao Dịch
                </td>
                <td style="width: 418px">
                    <asp:DropDownList ID="cboTxnType" runat="server" SkinID="DropDownListRequired" Enabled="false"
                        Font-Size="Larger">
                    </asp:DropDownList>
                </td>
                <td style="width: 197px;" class="lblCaption" align="right">
                    Trạng thái tỷ giá
                </td>
                <td align="right" valign="top">
                    <asp:Label runat="server" ID="lblG7State" Style="text-transform: uppercase; font-weight: bold;"
                        ForeColor="Blue" EnableViewState="false" Text="ONLINE"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 197px;" class="lblCaption" align="left">
                    FX Transtype
                </td>
                <td colspan="3">
                    <asp:Label runat="server" ID="lblDealID" CssClass="lblNormal" EnableViewState="false"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">CHI NHÁNH NHẬP LIỆU</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 115px">
                    Đối tượng&nbsp;
                </td>
                <td style="width: 213px">
                    <asp:DropDownList ID="cboObjectType" runat="server" Enabled="false" SkinID="DropDownListRequired"
                        Font-Size="Larger">
                    </asp:DropDownList>
                </td>
                <td style="width: 92px">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 115px">
                    Mua/Bán
                </td>
                <td style="width: 213px">
                    <asp:DropDownList ID="cboBuyOrSell" runat="server" SkinID="DropDownListRequired" Enabled="false"
                        Font-Size="Larger">
                    </asp:DropDownList>
                </td>
                <td style="width: 92px">
                    Ngày giao dịch
                </td>
                <td>
                    <asp:TextBox ID="txtDealDate" runat="server" SkinID="TextBoxRequired" Style="text-transform: uppercase" ReadOnly="true" Width="90px"
                        Font-Size="Larger"></asp:TextBox>
                    <asp:Label runat="server" ID="lblDescription" CssClass="lblCaption" ForeColor="Red" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Amt
                </td>
                <td style="width: 213px">
                    <cc1:C1WebNumericEdit ID="txtAmt" runat="server" SkinID="C1WebNumericRequired" Width="80%"
                        Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                        Value="0" SmartInputMode="false" MaxValue="100000000000" UpDownAlign="None" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 92px">
                    Ngày giá trị
                </td>
                <td>
                    <asp:TextBox ID="txtValueDate" runat="server" SkinID="TextBoxDateRequired" Style="text-transform: uppercase"
                        Font-Size="Larger"></asp:TextBox>
                    <div id="ValueDateErr" style="color: Red; display: none">
                        Ngày giá trị không hợp lệ</div>
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Đồng Mua
                </td>
                <td style="width: 213px">
                    <asp:DropDownList ID="cboCCYBuy" runat="server" SkinID="DropDownListRequired" Font-Size="Larger" Enabled="false">
                    </asp:DropDownList>
                </td>
                <td style="width: 92px">
                    Đồng Bán
                </td>
                <td>
                    <asp:DropDownList ID="cboCCYSell" runat="server" SkinID="DropDownListRequired" Font-Size="Larger" Enabled="false">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="lblCaption">
                    Thông tin khách hàng
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Mã CIF KH
                </td>
                <td style="width: 213px">
                    <asp:TextBox ID="txtCIF_ID" runat="server" SkinID="TextBox" Font-Size="Larger" Style="text-transform: uppercase" Enabled="false"
                        Width="156px"></asp:TextBox>
                    <asp:Image runat="server" ID="checkCIF" ImageUrl="~/Images/checkcif.png" ToolTip="Kiểm tra CIF"
                        Style="cursor: pointer" />
                </td>
                <td style="width: 92px">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Tên KH
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtCIF_Name" runat="server" SkinID="TextBox" Font-Size="Larger" Enabled="false"
                        Style="text-transform: uppercase" Width="99%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Phân khúc
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtSegment" runat="server" SkinID="TextBox" Font-Size="Larger" Style="text-transform: uppercase"
                        Width="99%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Xếp hạng
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtRank" runat="server" SkinID="TextBox" Font-Size="Larger" Style="text-transform: uppercase"
                        Width="99%"></asp:TextBox>
                </td>
            </tr>
            <tr id="tdCash">
                <td style="width: 87px">
                    Tỷ giá KH
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtCIF_Rate" runat="server" SkinID="TextBox" Font-Size="Larger"
                        Style="text-transform: uppercase" Width="99%"></asp:TextBox>
                </td>
            </tr>
            <tr runat="server" id="BranchCommand">
                <td style="width: 87px">
                    &nbsp;
                </td>
                <td style="width: 213px">
                    &nbsp;
                </td>
                <td style="width: 92px">
                    &nbsp;
                </td>
                <td align="right">
                    <asp:Button ID="btnQuesFW" runat="server" CssClass="Button" Text="1. Hỏi giá..."
                        Style="width: 30%;" OnClientClick="{fulfilmentDeal();return false;}" />
                    <asp:Button ID="btnAccept" runat="server" CssClass="Button" Text="1. Đồng ý giao dịch"
                        Style="width: 30%" OnClientClick="{fulfilmentDeal();return false;}" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">THÔNG TIN GIAO DỊCH</legend>
        <table style="width: 100%">
            <tr runat="server" id="trMessage" visible="false" style="height: 30px">
                <td colspan="4" align="center" valign="top">
                    <asp:Label runat="server" ID="lblMessage" EnableViewState="false" CssClass="lblCaption"
                        ForeColor="Teal" Font-Size="Larger"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 115px">
                    Đồng Mua&nbsp;
                </td>
                <td style="width: 198px">
                    <asp:TextBox ID="txtDongTienMua" runat="server" SkinID="TextBox" Style="text-transform: uppercase;
                        text-align: right" ReadOnly="True" Width="51px" Font-Size="Larger"></asp:TextBox>
                </td>
                <td style="width: 92px">
                    KL Mua
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtSoLuongMua" runat="server" Width="50%" Height="30px"
                        Text="0" Enabled="false" ThousandsSeparator="true" Value="0" SmartInputMode="false"
                        MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 99px">
                    Đồng Bán
                </td>
                <td style="width: 213px">
                    <asp:TextBox ID="txtDongTienBan" runat="server" SkinID="TextBox" Font-Size="Larger"
                        Style="text-transform: uppercase; text-align: right" ReadOnly="True" Width="51px"></asp:TextBox>
                </td>
                <td style="width: 92px">
                    KL Bán
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtSoLuongBan" runat="server" Width="50%" Height="30px"
                        Enabled="false" Text="0" ThousandsSeparator="true" Value="0" SmartInputMode="false"
                        MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 99px">
                    Đồng Base
                </td>
                <td style="width: 198px">
                    <asp:TextBox ID="txtDongTienCoSo" runat="server" SkinID="TextBox" Style="text-transform: uppercase;
                        text-align: right" ReadOnly="True" Width="51px" Font-Size="Larger"></asp:TextBox>
                    <asp:Label runat="server" ID="lblLimitType" Font-Italic="true" CssClass="lblTinVan2"></asp:Label>
                </td>
                <td style="width: 92px">
                    Tỷ giá
                    <div id="div_tick" class="lblTinVan2" style="font-weight: bold; font-size: large">
                    </div>
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtTyGia" runat="server" Width="50%" Font-Size="Large"
                        Height="30px" Text="0" Enabled="false" ThousandsSeparator="true" Value="0" SmartInputMode="false"
                        MaxValue="100000000" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td>
                    Lãi tối thiểu đề nghị
                </td>
                <td>
                    <asp:Label runat="server" ID="lbltoithieu"></asp:Label>
                </td>
                <td>
                    Margin tối thiểu
                </td>
                <td>
                    <asp:Label runat="server" ID="lblMargin"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 99px">
                    &nbsp;
                </td>
                <td style="width: 198px">
                    &nbsp;
                </td>
                <td style="width: 92px">
                    &nbsp;
                </td>
                <td align="right">
                    <asp:Button ID="btnProcess" runat="server" CssClass="Button" Visible="false" Text="2. Thực hiện giao dịch"
                        Style="width: 30%" OnClientClick="{processDeal();return false;}" />
                    <asp:Button ID="btnFinish" runat="server" CssClass="Button" Visible="false" Text="3. Xác nhận và hoàn tất"
                        Style="width: 30%" OnClientClick="{finishDeal();return false;}" />
                    <asp:Button ID="btnRequestion" runat="server" CssClass="Button" Visible="false" Text="Hỏi lại giá"
                        Style="width: 30%" OnClientClick="{requestRate();return false;}" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">SBV Quy định</legend>
        <table style="width: 100%;">
            <tr>
                <td style="width: 175px" class="lblCaption">
                    &nbsp; Spot USDVND Min
                </td>
                <td style="width: 213px">
                    <asp:Label ID="txtSpotMin" runat="server"></asp:Label>
                </td>
                <td style="width: 115px" class="lblCaption">
                    Spot USDVND Max
                </td>
                <td>
                    <asp:Label ID="txtSpotMax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="trFW">
                <td style="width: 175px" class="lblCaption">
                    &nbsp; Điểm USDVND SBV max/ngày
                </td>
                <td style="width: 213px">
                    <asp:Label ID="lblFWDay" runat="server"></asp:Label>
                </td>
                <td style="width: 115px" class="lblCaption">
                    Fwd USDVND Max
                </td>
                <td>
                    <asp:Label ID="lblFWMax" runat="server"></asp:Label>
                </td>
            </tr>
            <tr id="trFWS">
                <td style="width: 115px; height: 22px;" class="lblCaption">
                    &nbsp; Tỷ giá SPOT
                </td>
                <td style="height: 22px">
                    <asp:Label ID="lblSpotRate" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">CHỈ DẪN THANH TOÁN</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 115px">
                    TK Đồng Mua
                </td>
                <td style="width: 213px">
                    <asp:TextBox ID="txtccybuyAccount" runat="server" SkinID="TextBox" Font-Size="Larger"
                        Style="text-transform: uppercase" Enabled="false" Width="156px"></asp:TextBox>
                </td>
                <td style="width: 92px">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 115px">
                    TK Đồng Bán
                </td>
                <td style="width: 198px">
                    <asp:TextBox ID="txtccysellAccount" runat="server" SkinID="TextBox" Font-Size="Larger"
                        Style="text-transform: uppercase" Enabled="false" Width="156px"></asp:TextBox>
                </td>
                <td style="width: 92px">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">GHI CHÚ</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 115px">
                    Sprd M&nbsp;
                </td>
                <td style="width: 213px">
                    <cc1:C1WebNumericEdit ID="txtSprdM" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" MinValue="-10000" Font-Size="Large"
                        UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 92px">
                    PA
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtPA" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 115px">
                    Sprd B
                </td>
                <td style="width: 198px">
                    <cc1:C1WebNumericEdit ID="txtSprdB" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="0" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" MinValue="-10000" Font-Size="Large"
                        UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 92px">
                    RA
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtRA" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="0" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr style="display: none">
                <td style="width: 115px">
                    KH KBB
                </td>
                <td style="width: 198px">
                    <asp:TextBox ID="TextBox5" runat="server" SkinID="TextBox" Font-Size="Larger" Style="text-transform: uppercase"
                        Width="156px"></asp:TextBox>
                </td>
                <td style="width: 92px">
                    Tên KH KBB
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" SkinID="TextBox" Font-Size="Larger" Style="text-transform: uppercase"
                        Width="98%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <asp:Button runat="server" ID="btnTRANSFER" Text="Chuyển xử lý" SkinID="TransferButton"
                        Visible="false" />
                    <asp:Button runat="server" ID="btnReMail" Text="Gửi lại mail" SkinID="TransferButton"
                        Visible="false" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg" style="display: none">
        <legend class="divLegend">DÀNH CHO FX Dealer</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 115px">
                    USDVND*
                </td>
                <td style="width: 213px">
                    <asp:TextBox ID="txtUSDVND" runat="server" SkinID="TextBox" Style="text-align: right"
                        ReadOnly="True" Width="30%"></asp:TextBox>
                </td>
                <td style="width: 92px">
                    FCY/USD*
                </td>
                <td>
                    <asp:TextBox ID="txtFCYUSD" runat="server" SkinID="TextBox" Style="text-align: right"
                        ReadOnly="True" Width="156px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </fieldset>
    <div id="frmChangeBook" style="display: none; cursor: hand; background-color: gray">
        <table style="width: 100%" cellspacing="0">
            <tr class="TableHeader">
                <td id="tdComment" colspan="" style="color: white; width: 885px;">
                    Chuyển Book
                </td>
                <td colspan="" align="right" valign="top">
                    <img title="close" alt="" src="../../Images/set3/24/Close.png" style="cursor: pointer;
                        width: 22px; height: 22px" onclick="{$.unblockUI();}" />
                </td>
            </tr>
        </table>
        <div style="background-color: gray">
            <table style="width: 100%">
                <tr>
                    <td style="width: 96px" class="lblCaption">
                        Chuyển tới Book
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtCompany" runat="server" SkinID="TextBox" Style="text-transform: uppercase;
                            font-size: larger; width: 98%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 96px">
                        &nbsp;
                    </td>
                    <td align="left">
                        <asp:Button runat="server" ID="btnChange" CssClass="Button" Text="Chuyển" OnClientClick="{changeBook();return false;}" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="display: none">
        <asp:TextBox runat="server" ID="txtAmountLonNho" SkinID="TextBox" ReadOnly="true"
            Style="width: auto"></asp:TextBox>
        <asp:TextBox runat="server" ID="txtLimitType" SkinID="TextBox" ReadOnly="true" Style="width: auto"></asp:TextBox>
        TxnAmt:<asp:TextBox runat="server" ID="txtTxnAmt" SkinID="TextBox" ReadOnly="true"
            Style="width: auto"></asp:TextBox>
        LimitAmt:<asp:TextBox runat="server" ID="txtLimitAmt" SkinID="TextBox" ReadOnly="true"
            Style="width: auto"></asp:TextBox>
        <asp:TextBox runat="server" ID="txtAutoUpdateRate" SkinID="TextBox" ReadOnly="true"
            Style="width: auto"></asp:TextBox>
    </div>
    <script language="javascript" type="text/javascript">
        /*****************************************/
        var tick = new Number("<%=_clienttick %>");
        var _intervalID;
        var _intervalID_getResponseRate;
        var _dealstatus;
        var _act;
        var _objtype;
        var _g7connection_state = 2;
        var txnIs_SP_SME_USDVND = false;
        var book;
        var specialbook = new String("VN0010006;VN0010007");
        var loop = 4;
        /*****************************************/
        $(document).ready(function () {

            var _act = Qry["act"];
            if ("see.ques.conf".lastIndexOf(_act) != -1) {
                $(":text").attr("disabled", true);
            }
            if (Qry["txntype"] == "FW") {
                $('#trFW').show();
                $('#trFWS').show();
            } else {
                $('#trFW').hide();
                $('#trFWS').hide();
            }


            dohandler(_act);
            setCtl_CIF_info();

            $("#ctl00_FormContent_btnQuesFW").hide();
            _g7connection_state = new Number("<%=_g7connection_state %>");
            var _txntype = new String("<%=_txntype %>");
            _objtype = new String("<%=_objtype %>");
            //            if ((_g7connection_state == 2) & ) {
            //                $("#ctl00_FormContent_btnQuesFW").show();
            //                $("#ctl00_FormContent_btnAccept").hide();
            //            }

            if (_objtype != "CASH") {
                $('#tdCash').hide();
            }
            book = new String(GetSvrCtlValue("txtBook"));
            if (specialbook.lastIndexOf(book) == -1) {
                Set_CIF_Rate_Required();
            }
        });
        /*****************************************/
        function Set_CIF_Rate_Required() {
            //$("#ctl00_FormContent_txtCIF_Rate").attr("class", "TextBoxRequired");
            $("#ctl00_FormContent_txtCIF_ID").attr("class", "TextBoxRequired");
            $("#ctl00_FormContent_txtCIF_Name").attr("class", "TextBoxRequired");
        }
        /*****************************************/
        function Set_CIF_Rate_UnRequired() {
            $("#ctl00_FormContent_txtCIF_Rate").attr("class", "TextBox");
            $("#ctl00_FormContent_txtCIF_ID").attr("class", "TextBox");
            $("#ctl00_FormContent_txtCIF_Name").attr("class", "TextBox");
        }
        /*****************************************/
        function changeBook() {
            var company = new String(GetSvrCtlValue("txtCompany"));
            if (company.length == 0) {
                alert("Đề nghị nhập mã book");
                return false;
            }
            /**/
            if (specialbook.lastIndexOf(company.toUpperCase()) == -1)
                Set_CIF_Rate_Required();
            else
                Set_CIF_Rate_UnRequired();

            var url = "CancelBackdate.aspx";
            var query = "act=changebook";
            query += "&changeto=" + company;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (companyfullname) {
                    if ((new String(companyfullname)).toUpperCase().lastIndexOf("ERROR") < 0) {
                        $("#<%=lblCompany.ClientID %>").text(company.toUpperCase());
                        SetSvrCtlValue("txtBook", company.toUpperCase());
                        $("#<%=lblCompanyName.ClientID %>").text(companyfullname.toUpperCase());
                    }
                    else {
                        alert(companyfullname);
                    }
                }
            });
            $.unblockUI();
        }
        /*****************************************/
        function showchangeBook() {
            $.blockUI({
                message: $('#frmChangeBook'),
                css: {
                    top: '10%',
                    left: '30%',
                    width: '30%',
                    height: '30%'
                }
            });
        }

        /*****************************************/
        function getcifInfo() {

            var id = new String(GetSvrCtlValue("txtCIF_ID"));
            if (id.length == 0) return false;

            StartProcessingForm("");
            var url = "CancelBackdate.aspx";
            var query = "act=getcifinfo";
            query += "&cif=" + id;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (data) {
                    var acif = jQuery.parseJSON(data);
                    if (acif.Segment == "NOT") {
                        alert('Khách hàng này không được phép thực hiện trên chương trình');
                        return false;
                    }
                    SetSvrCtlValue("txtCIF_Name", acif.CIF_NAME);
                    SetSvrCtlValue("txtSegment", acif.Segment);
                    //SetSvrCtlValue("txtSegment", "SME");
                    SetSvrCtlValue("txtRank", acif.RANK);
                    DisableSvrCtl("txtCIF_Name");
                    DisableSvrCtl("txtSegment");
                    DisableSvrCtl("txtRank");
                    FinishProcessingForm();
                    var ccyBuy = GetSvrCtlValue("cboCCYBuy");
                    var ccySell = GetSvrCtlValue("cboCCYSell");
                    var ccyPair = ccyBuy + ccySell;
                    if ((_g7connection_state == 2) && !((ccyPair == "USDVND") || (ccyPair == "VNDUSD"))) {

                        $("#ctl00_FormContent_btnQuesFW").show();
                        $("#ctl00_FormContent_btnAccept").hide();

                    } else {

                        $("#ctl00_FormContent_btnQuesFW").hide();
                        $("#ctl00_FormContent_btnAccept").show();
                    }

                }
            });
        }
        /*****************************************/
        function getCCYBuy_Sell() {
            var ccyBuy = GetSvrCtlValue("cboCCYBuy");
            var ccySell = GetSvrCtlValue("cboCCYSell");
            var ccyPair = ccyBuy + ccySell;
            if (((ccyPair == "USDVND") || (ccyPair == "VNDUSD")) && (_g7connection_state == 2)) {
                $("#ctl00_FormContent_btnQuesFW").hide();
                $("#ctl00_FormContent_btnAccept").show();
                txnIs_SP_SME_USDVND = true;
            }
            else {
                $("#ctl00_FormContent_btnQuesFW").show();
                $("#ctl00_FormContent_btnAccept").hide();
                txnIs_SP_SME_USDVND = false;
            }

        }
        /*****************************************/
        function fulfilmentDeal() {

            if (!FormValidated())
                return false;

            /*kiem tra ty gia mua KH*/
            var css = new String($("#ctl00_FormContent_txtCIF_Rate").attr("class"));
            if (css == "TextBoxRequired") {
                var n = $("#ctl00_FormContent_txtCIF_Rate").val();
                n = new Number(replaceNumber(n, ",", ""));
                if (n == 0) {
                    alert("Please enter value to required field(s).");
                    $("#ctl00_FormContent_txtCIF_Rate").focus();
                    $("#ctl00_FormContent_txtCIF_Rate").attr("value", "");
                    return false;
                }
            }

            //if(txnType=="SP") {
            if (_objtype == "CASH") {
                if ("KHCN" != GetSvrCtlValue("txtSegment").toUpperCase()) {
                    if ("AF" != GetSvrCtlValue("txtSegment").toUpperCase()) {
                        alert('Phân khúc KH không thuộc phân quyền xử lý');
                        return false;
                    }
                }
            } else if (_objtype == "KNV") {
                if ("KNV" != GetSvrCtlValue("txtSegment").toUpperCase()) {
                    alert('Phân khúc KH không thuộc phân quyền xử lý');
                    return false;
                }
                if (GetSvrCtlValue("txtBook") != "VN0010004") {
                    if (GetSvrCtlValue("txtBook") != "VN0010007") {
                        if (GetSvrCtlValue("txtBook") != "VN0010011") {
                            if (GetSvrCtlValue("txtBook") != "VN0010010") {
                                alert('Chi nhánh hạch toán không được quyền xử lý');
                                return false;
                            }
                        }
                    }
                    // else {
                    //                        alert('Phân khúc KH không thuộc phân quyền xử lý');
                    //                        return false;
                    //                    }
                }
            } else if (_objtype == "KHCN") {
                if (GetSvrCtlValue("txtSegment").toUpperCase() != GetSvrCtlValue("cboObjectType").toUpperCase()) {
                    alert('Cần lựa chọn lại đối tượng thực hiện giao dịch');
                    return false;
                }
            } else {
                if (_objtype == "DIRECT SALES") {
                    if ("KHCN" == GetSvrCtlValue("txtSegment").toUpperCase()) {
                        alert('Phân khúc KH không thuộc phân quyền xử lý');
                        return false;
                    }
                    if (GetSvrCtlValue("txtSegment").toUpperCase() == "SME") {
                        if ("DIAMOND" != GetSvrCtlValue("txtRank").toUpperCase()) {
                            alert('Phân khúc KH không thuộc phân quyền xử lý');
                            return false;
                        }
                    } else {
                        if (GetSvrCtlValue("txtSegment").toUpperCase() != GetSvrCtlValue("txtRank").toUpperCase()) {
                            alert('Phân khúc KH không thuộc phân quyền xử lý');
                            return false;
                        }

                    }
                } else if (_objtype != GetSvrCtlValue("txtSegment").toUpperCase() && GetSvrCtlValue("txtSegment").toUpperCase() != "AF") {
                    alert('Phân khúc KH không thuộc phân quyền xử lý');
                    return false;
                } else {
                    if (_objtype == "SME") {
                        if (GetSvrCtlValue("txtRank") == '') {
                            alert('Phân khúc KH không thuộc phân quyền xử lý');
                            return false;
                        }
                        if ("PLATINUM.GOLD.SILVER".lastIndexOf(GetSvrCtlValue("txtRank").toUpperCase()) == -1) {
                            alert('Phân khúc KH không thuộc phân quyền xử lý');
                            return false;
                        }
                    }
                }
            }



            /*End of kiem tra ty gia mua KH*/
            if ('<%=Session["loopExpire"] %>' == '0')
                if (!confirm("Bạn chắc chắn thực hiện ?")) return false;


            var amt = new Number(replaceNumber(GetSvrCtlValue("txtAmt"), ',', ''));
            var txnType = GetSvrCtlValue("cboTxnType");
            var buyorsell = GetSvrCtlValue("cboBuyOrSell");
            var dealdate = GetSvrCtlValue("txtDealDate"); var t24_dealdate = new Number(convertVNDate2T24Date(dealdate));
            var valuedate = GetSvrCtlValue("txtValueDate"); var t24_valuedate = new Number(convertVNDate2T24Date(valuedate));
            var cur_date = GetCurrentDate(); cur_date = new Number(convertVNDate2T24Date(cur_date));
            var ccyBuy = GetSvrCtlValue("cboCCYBuy");
            var ccySell = GetSvrCtlValue("cboCCYSell");
            var cifrate = new Number(replaceNumber(GetSvrCtlValue("txtCIF_Rate"), ',', ''));
            var cif = GetSvrCtlValue("txtCIF_ID");
            var cifname = GetSvrCtlValue("txtCIF_Name");
            var objType = GetSvrCtlValue("cboObjectType");
            var book = GetSvrCtlValue("txtBook");
            var seg = GetSvrCtlValue("txtSegment");
            var rank = GetSvrCtlValue("txtRank");
            var dao = GetSvrCtlValue("txtDao");
            var daoname = GetSvrCtlValue("lblDaoName");
            var fw_dealer = "";
            if (amt <= 0) {
                alert("Amount không hợp lệ. Hãy kiểm tra lại.");
                $("#<%=txtAmt.ClientID %>").select();
                return false;
            }
            if (ccyBuy == ccySell) {
                alert('Đồng Mua và Đông Bán phải khác nhau. Hãy kiểm tra lại.');
                return false;
            }
            if ((buyorsell == "BUY") && (ccyBuy == "VND")) {
                alert('Không cho phép Mua/Bán ngược với chiều của đồng ngoại tệ. Hãy kiểm tra lại.');
                return false;
            }
            if ((buyorsell == "SELL") && (ccySell == "VND")) {
                alert('Không cho phép Mua/Bán ngược với chiều của đồng ngoại tệ. Hãy kiểm tra lại.');
                return false;
            }
            if (txnType == "SP") {
                if (t24_valuedate < t24_dealdate) {
                    alert('Ngày giao dịch và Ngày giá trị không hợp lệ. Hãy kiểm tra lại.');
                    $("#<%=txtValueDate.ClientID %>").select();
                    return false;
                }
                else if (_objtype == "CASH") {
                    //                    if ((t24_dealdate < cur_date) || (t24_valuedate < cur_date)) {
                    //                        alert('Ngày giao dịch và Ngày giá trị không hợp lệ. Hãy kiểm tra lại.');
                    //                        return false;
                    //                    }
                }
            }
            if (txnType == "FW") {
                if (t24_valuedate < t24_dealdate + 3) {
                    alert('Ngày giao dịch và Ngày giá trị không hợp lệ. Hãy kiểm tra lại.');
                    $("#<%=txtValueDate.ClientID %>").select();
                    return false;
                }


            }
            fulfilmentDealInfo(dealdate, valuedate, txnType, buyorsell, amt, ccyBuy, ccySell, cif, cifname, cifrate, objType, book, seg, rank, dao, daoname);
        }
        /*****************************************/
        function setCtl_CIF_info() {
            var objtype = Qry["objType"];
            if ((objtype == "CASH") || (objtype == "KHKBB")) {
                $("#ctl00_FormContent_txtCIF_Rate").attr("class", "TextBoxRequired");
            }
        }
        /*****************************************/
        function fulfilmentDealInfo(dealdate, valuedate, txnType, buyorsell, amt, ccyBuy, ccySell, cif, cifname, cifrate, objType, book, seg, rank, dao, daoname) {
            var url = "CancelBackdate.aspx";
            var query = "act=fulfilmentdeal";
            query += "&dealdate=" + dealdate;
            query += "&valuedate=" + valuedate;
            query += "&txntype=" + txnType;
            query += "&buyorsell=" + buyorsell;
            query += "&amt=" + amt;
            query += "&ccybuy=" + ccyBuy;
            query += "&ccysell=" + ccySell;
            query += "&cif=" + cif;
            query += "&cifname=" + cifname;
            query += "&cifrate=" + cifrate;
            query += "&objtype=" + objType;
            query += "&company=" + book;
            query += "&cifSeg=" + seg;
            query += "&cifRank=" + rank;
            query += "&dao=" + dao;
            query += "&daoname=" + daoname;
            query += "&dealid=" + '<%=_dealid %>';

            if (objType == "DIRECT SALES" || (seg + rank == "KHCNGOLD") && objType == "KHCN" || (seg + rank == "KHCNGOLD - SPECIAL") && objType == "KHCN" || seg == "KNV" || (seg == "AF" && objType == "KHCN")) {
                hoigia(url, query, txnType, objType);
            } else {
                if (ccyBuy + ccySell == "USDVND" || ccySell + ccyBuy == "USDVND")
                    txnIs_SP_SME_USDVND = true;
                if ((_g7connection_state == 2) && (txnIs_SP_SME_USDVND == false)) {
                    hoigia(url, query, txnType, objType);
                } else if ((txnType == "SP")) {
                    url += "?" + query;
                    window.location.href = url;
                } else if ((txnType == "FW")) {
                    url += "?" + query;
                    window.location.href = url;

                } else {
                    hoigia(url, query, txnType, objType);
                }
            }
        }
        /*****************************************/
        function hoigia(url, query, txnType, objType) {

            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errorMessage) {
                    if (errorMessage == "") {
                        alert('Đã chuyển giao dịch hỏi giá tới Dealer.');
                        window.location.href = "opennewdeal.aspx?txntype=" + txnType + "&objtype=" + objType;
                    } else if (errorMessage == "FxSale") {
                        alert('Khách hàng Priority cần phải được chuyển đến FxSale thực hiện.');
                        window.location.href = "opennewdeal.aspx?txntype=" + txnType + "&objtype=" + objType;
                    }
                    else if (errorMessage == "ĐVKD") {
                        alert('Khách hàng không thuộc Priority cần phải được chuyển đến nhân viên ĐVKD thực hiện.');
                        window.location.href = "opennewdeal.aspx?txntype=" + txnType + "&objtype=" + objType;
                    }
                    else {
                        alert(errorMessage);
                    }
                }
            });
        }
        /*****************************************/
        function dohandler(act) {
            if (act == "fulfilmentdeal") {
                var autoUpdateRate = GetSvrCtlValue("txtAutoUpdateRate");
                var txnLimit = GetSvrCtlValue("txtLimitType");
                if (autoUpdateRate != "0") {
                    $("#div_tick").html(tick);
                    _intervalID = window.setInterval(updatetick, 1000);
                }
            }
            else if (act == "ques") {
                _intervalID_getResponseRate = window.setInterval(getResponseRate, 1000);
            }
        }
        /*****************************************/
        function getResponseRate() {
            var url = "CancelBackdate.aspx";
            var query = "act=getresponserate";
            query += "&dealid=" + Qry["dealid"];
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (data) {
                    var a = data.split("#");
                    SetSvrCtlValue("txtTyGia", a[0]);
                    SetSvrCtlValue("txtSoLuongMua", a[1]);
                    SetSvrCtlValue("txtSoLuongBan", a[2]);
                }
            });
        }
        /*****************************************/
        function updatetick() {
            tick--;
            $("#div_tick").html(tick);
            if (tick == 0) {
                window.clearInterval(_intervalID);
                if ('<%=Session["loopExpire"] %>' == '0') {
                    $("#div_tick").html("EXPIRED!");
                    killSession();
                } else {
                    fulfilmentDeal();
                }
                $("#<%=btnProcess.ClientID %>").hide();

            }
        }
        /*****************************************/
        function getRate() {
            var url = "CancelBackdate.aspx";
            var query = "act=getrate";
            query += "&txntype=" + GetSvrCtlValue("cboTxnType");
            query += "&buyorsell=" + GetSvrCtlValue("cboBuyOrSell");
            query += "&ccybuy=" + GetSvrCtlValue("cboCCYBuy");
            query += "&ccysell=" + GetSvrCtlValue("cboCCYSell");
            query += "&ccycheck=" + GetSvrCtlValue("txtccyCheck");
            query += "&limit=" + GetSvrCtlValue("txtLimitType");
            query += "&amt=" + GetSvrCtlValue("txtTxnAmt");

            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (rate) {
                    SetSvrCtlValue("txtTyGia", rate);
                }
            });
        }
        /*****************************************/

        function getRateExpire() {

        }
        /*****************************************/
        function processDeal() {
            var url = "CancelBackdate.aspx";
            var query = "act=createfx";

            query += "&rate=" + replaceNumber(GetSvrCtlValue("txtTyGia"), ",", "");

            query += "&limit=" + GetSvrCtlValue("txtLimitType");
            query += "&amtbuy=" + GetSvrCtlValue("txtSoLuongMua");
            query += "&amtsell=" + GetSvrCtlValue("txtSoLuongBan");
            query += "&company=" + $("#<%=lblCompany.ClientID %>").text();
            query += "&dealid=" + '<%=_dealid %>';
            var role = '<%=_m_roleID %>';
            var group = '<%=_m_groupname %>';
            if (role != '<%=ROLES.FxSale_Staff %>') {
                if (group != $("#<%=lblCompany.ClientID %>").text()) {
                    alert('Phiên làm việc đã hết bạn đăng nhập lại');
                    return;
                }
            }


            window.clearInterval(_intervalID);
            HideSvrCtl("btnProcess");
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage.length == 36) {
                        killSession();
                        alert('Giao dịch đã thực hiện thành công.');
                        window.opener = null;
                        window.close(true);
                        if ('<%=_objtype %>' != 'CASH') {
                            opendetail("opendealcustomer.aspx?dealid=" + errormessage + "&txntype=" + '<%=_txntype %>' + "&objtype=" + '<%=_objtype %>', 'cu');
                        } else {
                            window.location.href = "opennewdeal.aspx?txntype=" + Qry["txntype"] + "&objtype=" + Qry["objtype"];
                        }
                    } else if (errormessage.length == 41) {
                        killSession();
                        alert('Giao dịch đã thực hiện thành công.');
                        window.opener = null;
                        window.close(true);
                        if ('<%=_objtype %>' != 'CASH') {
                            opendetail("opendealcustomer.aspx?dealid=" + errormessage.split(':')[1] + "&txntype=" + '<%=_txntype %>' + "&objtype=" + '<%=_objtype %>', "customer");
                        } else {
                            window.location.href = "opennewdeal.aspx?txntype=" + Qry["txntype"] + "&objtype=" + Qry["objtype"];
                        }
                    } else {
                        if (errormessage.toString().indexOf("opennewdeal.aspx?act=ques") != -1) {
                            alert('Đã chuyển giao dịch hỏi giá tới Dealer.');
                            window.location.href = "opennewdeal.aspx?txntype=" + Qry["txntype"] + "&objtype=" + Qry["objtype"];
                        } else {
                            alert(errormessage);
                        }
                        //window.location.href = "opendealcustomer.aspx?dealid=" + Qry["dealid"] + "&txntype=" + Qry["txntype"] + "&objtype=" + Qry["objtype"];
                    }

                }
            });
    }
    /*****************************************/
    function finishDeal() {
        var dealid = Qry["dealid"];
        var url = "CancelBackdate.aspx";
        var query = "act=branchconfirm";
        query += "&dealid=" + dealid;
        StartProcessingForm("");
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function (errormessage) {

                FinishProcessingForm();
                if (errormessage == "") {
                    killSession();
                    alert("Deal xác nhận thành công.");
                    window.opener = null;
                    window.close(true);
                    if ('<%=_objtype %>' != 'CASH') {
                            opendetail("opendealcustomer.aspx?dealid=" + dealid + "&txntype=" + '<%=_txntype %>' + "&objtype=" + '<%=_objtype %>', "customer");
                        } else {
                            window.location.href = "opennewdeal.aspx?txntype=" + '<%=_txntype %>' + "&objtype=" + '<%=_objtype %>';
                        }

                    }
                    else if (errormessage.length == 41) {
                        killSession();
                        alert("Deal này đã được gửi đến ABC để nhập trên T24 do hạch toán vào T24 có lỗi .");
                        window.opener = null;
                        window.close(true);
                        if ('<%=_objtype %>' != 'CASH') {
                            opendetail("opendealcustomer.aspx?dealid=" + dealid + "&txntype=" + '<%=_txntype %>' + "&objtype=" + '<%=_objtype %>', "customer");
                        } else {
                            window.location.href = "opennewdeal.aspx?txntype=" + '<%=_txntype %>' + "&objtype=" + '<%=_objtype %>';
                        }
                    } else {
                        alert(errormessage);
                    }
                }
            });
    }
    /*****************************************/
    function killSession() {
        var url = "CancelBackdate.aspx";
        var query = "act=killsession";
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function (errormessage) {
            }
        });
    }
    /*****************************************/
    function requestRate() {
        var dealid = Qry["dealid"];
        var url = "CancelBackdate.aspx";
        var query = "act=requestrate";
        query += "&dealid=" + dealid;
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function (errormessage) {
                if (errormessage == "") {
                    window.opener = null;
                    window.close(true);
                }
                else
                    alert(errormessage);
            }
        });
    }
    /*****************************************/
    function FXCustomer(id, txnType, object) {
        opendetail("opendealcustomer.aspx?dealid=" + id + "&txntype=" + txnType + "&objtype=" + object, "customer");
    }

    function PrintDeal(id) {
        openDialog("../Dialog/PrintDeals.aspx?act=LCN&dealid=" + id, '600', '600');

    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
