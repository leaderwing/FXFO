<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="CancelAuto.aspx.cs" Inherits="VPB_FX.Modules.DMS.CancelAuto" %>
<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1Input" Assembly="C1.Web.C1Input.2, Version=2.0.20082.434, Culture=neutral, PublicKeyToken=96d8a77dc0c22f6b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<fieldset class="fieldsetBg">
        <legend class="divLegend">CHI NHÁNH NHẬP LIỆU</legend>
        <table style="width: 100%">
             <tr>
                <td style="width: 115px">
                    FX&nbsp;
                </td>
                <td style="width: 213px" colspan="3">
                    <asp:Label ID="lblfx" runat="server" Enabled="true" 
                        Font-Size="Larger">
                    </asp:Label><asp:HiddenField runat="server" ID="fxlcn" ></asp:HiddenField>
                </td>
                
            </tr>
            <tr>
                <td style="width: 115px">
                    Đối tượng&nbsp;
                </td>
                <td style="width: 213px">
                    <asp:Label ID="cboObjectType" runat="server" Enabled="true" 
                        Font-Size="Larger">
                    </asp:Label>
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
                    <asp:Label ID="cboBuyOrSell" runat="server"  Enabled="true"
                        Font-Size="Larger">
                    </asp:Label>
                </td>
                <td style="width: 92px">
                    Ngày giao dịch
                </td>
                <td>
                    <asp:TextBox ID="txtDealDate" runat="server" SkinID="TextBoxDateRequired" Style="text-transform: uppercase" Enabled="true"
                        Font-Size="Larger"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Amt
                </td>
                <td style="width: 213px">
                    <cc1:C1WebNumericEdit ID="txtAmt" runat="server" SkinID="C1WebNumericRequired" Width="80%" Enabled="true"
                        Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                        Value="0" SmartInputMode="false" MaxValue="100000000000" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 92px">
                    Ngày giá trị
                </td>
                <td>
                    <asp:TextBox ID="txtValueDate" runat="server" SkinID="TextBoxDateRequired" Style="text-transform: uppercase" Enabled="true"
                        Font-Size="Larger"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td style="width: 87px">
                    Đồng Mua
                </td>
                <td style="width: 213px">
                    <asp:Label ID="cboCCYBuy" runat="server"  Font-Size="Larger" Enabled="true">
                    </asp:Label>
                </td>
                <td style="width: 92px">
                    Đồng Bán
                </td>
                <td>
                    <asp:Label ID="cboCCYSell" runat="server"  Font-Size="Larger" Enabled="true">
                    </asp:Label>
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
                    <asp:TextBox ID="txtCIF_ID" runat="server" SkinID="TextBox" Font-Size="Larger" Style="text-transform: uppercase"
                        Width="156px" Enabled="true"></asp:TextBox>
                    
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
                    <asp:TextBox ID="txtCIF_Name" runat="server" SkinID="TextBox" Font-Size="Larger"
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
            
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Thông tin Fxdealer đồng ý hủy giao dịch</legend>
        <table width="100%">
            
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
                </td>
                <td style="width: 92px">
                    Tỷ giá CB
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
                <td style="width: 115px">
                    Sprd M&nbsp;
                </td>
                <td style="width: 213px">
                    <cc1:C1WebNumericEdit ID="txtSprdMHO" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" MinValue="-10000" Font-Size="Large"
                        UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 92px">
                    PA
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtPAHO" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="0" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 115px">
                    Sprd B
                </td>
                <td style="width: 198px">
                    <cc1:C1WebNumericEdit ID="txtSprdBHO" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" MinValue="-10000" Font-Size="Large"
                        UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 92px">
                    RA
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtRAHO" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="0" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr><td colspan="4"><hr/></td></tr>
            
            <tr>
                
                <td>
                    Tỷ giá hủy
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtRateReject" runat="server" Width="50%" Font-Size="Large"
                        Height="30px" Text="0" Enabled="false" ThousandsSeparator="true" Value="0" SmartInputMode="false"
                        MaxValue="100000000" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                </td>
                <td>
                </td>
            </tr>
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
                        Enabled="false" DecimalPlaces="0" Culture="en-US" ThousandsSeparator="true" Value="0"
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
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
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
            <tr> <td class="lblCaption">Lãi lỗ của giao dịch
                </td>
                <td>
                </td>
                <td>
                    
                </td>
                <td><span runat="server" ID="lbllailoigd" ></span><span runat="server" ID="spanPnlUnit" ></span></td></tr>
        </table>
    </fieldset>
    <script language="javascript" type="text/javascript">
        function AcceptReject() {
            if (!confirm('Bạn có đồng ý hủy deal này không?'))
                return false;

            var rate = new Number(replaceNumber(GetSvrCtlValue("txtRateReject"), ',', ''));
            var sprdM = new Number(replaceNumber(GetSvrCtlValue("txtSprdM"), ',', ''));
            var sprdB = new Number(replaceNumber(GetSvrCtlValue("txtSprdB"), ',', ''));
            var PA = new Number(replaceNumber(GetSvrCtlValue("txtPA"), ',', ''));
            var RA = new Number(replaceNumber(GetSvrCtlValue("txtRA"), ',', ''));
            var pnl = new Number(replaceNumber($("#ctl00_FormContent_lbllailoigd").text(), ',', ''));
            var query = "dealid=" + '<%=_dealid %>' + "&txntype=" + '<%=_type %>' + "&act=Accept&rate=" + rate;
            query += "&sprdM=" + sprdM + "&sprdB=" + sprdB + "&pa=" + PA + "&ra=" + RA;
            query += "&pnl=" + pnl + "&fxlcn=" + $("#ctl00_FormContent_fxlcn").val();
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: "AcceptRejectDeal.aspx",
                data: query,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage == "") {
                        if (errormessage == "lock") {
                            alert('Giao dịch đã được xác nhận hủy');
                            window.location.reload(true);
                        } else if (errormessage == "Expired") {
                            alert('Giao dịch đã hủy đã bị expired');
                            window.location.reload(true);
                        }
                        alert('Đã hủy thành công');
                        window.location.reload(true);
                    }
                    else
                        alert(errormessage);
                }
            });
            // window.location.href = "AcceptRejectDeal.aspx?dealid=" + '<%=_dealid %>' + "&txntype=" + '<%=_type %>' + "act=Accept";
        }

        function CancelReject() {
            if (!confirm('Bạn có muốn từ chối hủy deal này không?'))
                return false;


            $.ajax({
                type: "POST",
                url: "AcceptRejectDeal.aspx",
                data: "dealid=" + '<%=_dealid %>' + "&txntype=" + '<%=_type %>' + "&act=Cancel",
                success: function (errormessage) {
                    if (errormessage == "") {
                        alert('Đã xác nhận không hủy ');
                        window.location.reload(true);
                    }
                    else
                        alert(errormessage);
                }
            });

        }
        function PrintDeal(id) {
            openDialog("../Dialog/PrintDeals.aspx?act=HUY&dealid=" + id, '600', '600');

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
