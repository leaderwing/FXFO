<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="opendealcustomer.aspx.cs" Inherits="VPB_FX.Modules.DMS.opendealcustomer" %>

<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Thông tin giao dịch HO</legend>
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
                    &nbsp;
                </td>
                <td style="width: 197px" class="lblCaption" valign="top" align="right">
                    Trạng thái giao dịch
                </td>
                <td style="width: 197px" valign="top" align="right">
                    <asp:Label runat="server" ID="lblDealStatus" Style="text-transform: uppercase; font-weight: bold;"
                        EnableViewState="false" Text="Đã hoàn tất"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 85px" class="lblCaption">
                    FX.ID HO/CN
                </td>
                <td style="width: 213px">
                    <asp:Label runat="server" ID="txtDealID"></asp:Label>
                </td>
                <td style="width: 92px" class="lblCaption">
                    Giao Dịch
                </td>
                <td style="width: 418px">
                    <asp:DropDownList ID="cboTxnType" runat="server" SkinID="DropDownListRequired" Enabled="false">
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
                    Mã CIF KH
                </td>
                <td align="left">
                    <asp:Label runat="server" ID="CIF" EnableViewState="false"></asp:Label>
                </td>
                <td style="width: 197px;" class="lblCaption" align="left">
                    Tên KH
                </td>
                <td align="left">
                    <asp:Label runat="server" ID="Cif_Name" EnableViewState="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 197px;" class="lblCaption" align="left">
                    PHân khúc
                </td>
                <td align="left">
                    <asp:Label runat="server" ID="lblSegment" EnableViewState="false"></asp:Label>
                </td>
                <td style="width: 197px;" class="lblCaption" align="left">
                    Xếp hạng
                </td>
                <td align="left">
                    <asp:Label runat="server" ID="lblRank" EnableViewState="false"></asp:Label>
                </td>
            </tr>
            <tr runat="server" id="target">
                <td style="width: 197px;" class="lblCaption" align="left">
                    Dịch vụ
                </td>
                <td>
                    Private banking
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
    <div align="center">
        <span id="lblMessage" style="font-size: 14pt; color: red;"></span>
    </div>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Nhập liệu giao dịch với KH</legend>
        <table style="width: 100%;">
            <tr>
                <td style="width: 115px" class="lblCaption">
                    &nbsp; Tỷ giá FXtrader
                </td>
                <td style="width: 213px">
                    <asp:Label ID="txtFXtrader" runat="server"></asp:Label>
                </td>
                <td style="width: 115px" class="lblCaption">
                    <span id="tdKHCN1">Lãi tối thiểu đề nghị </span>
                </td>
                <td>
                    <asp:Label ID="txtLTT" runat="server"></asp:Label>&nbsp;&nbsp;<span runat="server"
                        id="spanccy"></span>
                </td>
                <td>
                    <asp:Label ID="quydoiVNDtoithieu" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 119px" class="lblCaption">
                    &nbsp; Sprd DL
                </td>
                <td>
                    <asp:Label ID="txtSprd" runat="server"></asp:Label>
                </td>
                <td class="lblCaption">
                    Lãi lỗ thực tế
                </td>
                <td>
                    <asp:Label ID="txtLLTT" runat="server"></asp:Label>
                    &nbsp;&nbsp;<span runat="server" id="spanccyLLTT"></span>
                </td>
                <td>
                    <asp:Label ID="quydoiVNDTT" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 119px" class="lblCaption">
                    &nbsp; Margin thực tế
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="SaleMargin" runat="server" Width="50%" Height="30px" SkinID=""
                        Text="0" Value="0" DecimalPlaces="2" MinValue="-1000" MaxValue="1000" Font-Size="Large"
                        UpDownAlign="None" OnClientTextChanged="SaleMargin()">
                    </cc1:C1WebNumericEdit>
                </td>
                <td class="lblCaption" id="tdKHCN2">
                    Margin tối thiểu
                </td>
                <td>
                    <asp:Label ID="txtMarginTT" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 119px">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 119px" class="lblCaption">
                    &nbsp;Mục đích
                </td>
                <td>
                    <asp:DropDownList runat="server" SkinID="DropDownList" ID="cboMucdich">
                        <asp:ListItem Value="QT" Text="KH mua để thanh toán TTR trong ngày"></asp:ListItem>
                        <asp:ListItem Value="TTROTHER" Text="KH mua một phần để thanh toán hoặc thanh toán TTR khác ngày"></asp:ListItem>
                        <asp:ListItem Value="PH" Text="KH mua để phát hành, sửa LC bảo lãnh tại VPB "></asp:ListItem>
                        <asp:ListItem Value="TT" Text="KH mua để thanh toán (LC, nhờ thu hoặc TTTM khác) tại VPB"></asp:ListItem>
                        <asp:ListItem Value="NOVPB" Text="KH mua trả nợ vay tại VPB "></asp:ListItem>
                        <asp:ListItem Value="NOTCTD" Text="KH mua trả nợ vay tại TCTD khác "></asp:ListItem>
                        <asp:ListItem Value="TTTCTD" Text="KH mua thanh toán tại TCTD khác "></asp:ListItem>
                        <asp:ListItem Value="OTHERB" Text="KH mua với mục đích khác"></asp:ListItem>
                        <asp:ListItem Value="BANVPB" Text="KH bán từ giải ngân tại VPB"></asp:ListItem>
                        <asp:ListItem Value="CHUYENVPB" Text="KH bán từ ngân hàng khác chuyển về"></asp:ListItem>
                        <asp:ListItem Value="OTHER" Text="KH bán với mục đích khác"></asp:ListItem>
                        <asp:ListItem Value="CASH" Text="KH Mua / Bán Tiền Mặt"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 119px" class="lblCaption">
                    &nbsp;Mục đích cho TT11
                </td>
                <td>
                    <asp:DropDownList runat="server" SkinID="DropDownList" ID="ddlPURPOSE">
                        <asp:ListItem Value="MUA NTE TU NGUON THU XUAT KHAU" Text="Mua ngoại tệ từ nguồn thu xuất khẩu"></asp:ListItem>
                        <asp:ListItem Value="CHUYEN TIEN MOT CHIEU MUA" Text="Chuyển tiền một chiều mua" disabled></asp:ListItem>
                        <asp:ListItem Value="MUA NTE GIAI NGAN VON FDI" Text="Mua ngoại tệ giải ngân vốn đầu tư trực tiếp nước ngoài ( FDI)"></asp:ListItem>
                        <asp:ListItem Value="MUA NTE TT THUONG VU M&A, THOAI VON" Text="Mua ngoại tệ để thanh toán thương vụ M&A, thoái vốn"></asp:ListItem>
                        <asp:ListItem Value="MUA NTE DTU GIAN TIEP CO PHIEU" Text="Mua ngoại tệ đầu tư gián tiếp ( cổ phiếu)"></asp:ListItem>
                        <asp:ListItem Value="MUA NTE DTU GIAN TIEP TRAI PHIEU" Text="Mua ngoại tệ đầu tư gián tiếp (trái phiếu)"></asp:ListItem>
                        <asp:ListItem Value="MUA NTE GIAI NGAN VON VAY NUOC NGOAI" Text="Mua ngoại tệ giải ngân vốn vay nước ngoài"></asp:ListItem>
                        <asp:ListItem Value="MUA NTE GN VON VAY TN BG NGOAI TE" Text="Mua ngoại tệ giải ngân vốn vay trong nước bằng ngoại tệ"></asp:ListItem>
                        <asp:ListItem Value="MUA NGOAI TE KHAC" Text="Mua ngoại tệ khác"></asp:ListItem>
                        <asp:ListItem Value="BAN NTE THANH TOAN HANG NHAP KHAU" Text="Bán ngoại tệ thanh toán hàng nhập khẩu"></asp:ListItem>
                        <asp:ListItem Value="CHUYEN TIEN MOT CHIEU BAN" Text="Chuyển tiền một chiều bán"  disabled></asp:ListItem>
                        <asp:ListItem Value="BAN NTE CTIEN TNHAP TU FDI VN RA NN" Text="Bán ngoại tệ chuyển thu nhập từ hoặt đồng đầu tư trực tiếp (FDI) vào Việt Nam ra nước ngoài"></asp:ListItem>
                        <asp:ListItem Value="BAN NTE CTIEN DO GIAM FDI VAO VN" Text="Bán ngoại tệ chuyển tiền khi được phép giảm vốn đầu tư trực tiếp (FDI) vào Việt Nam"></asp:ListItem>
                        <asp:ListItem Value="BAN NTE CTIEN FDI VN RA NUOC NGOAI" Text="Bán ngoại tệ chuyển tiền đầu tư trực tiếp của Việt Nam ra nước ngoài"></asp:ListItem>
                        <asp:ListItem Value="BAN NTE CHUYEN TNHAP TU FII RA NN" Text="Bán ngoại tệ chuyển thu nhập từ hoặt đồng đầu tư gián tiếp (FII) ra nước ngoài"></asp:ListItem>
                        <asp:ListItem Value="BAN NTE TT LAI GOC VAY NUOC NGOAI" Text="Bán ngoại tệ thanh toán tiền lãi và trả nợ gốc các khoản vay nước ngoài"></asp:ListItem>
                        <asp:ListItem Value="BAN NTE TT LAI GOC VAY TRONG NUOC" Text="Bán ngoại tệ thanh toán tiền lãi và trả nợ gốc các khoản vay trong nước"></asp:ListItem>
                        <asp:ListItem Value="BAN NGOAI TE KHAC" Text="Bán ngoại tệ khác"></asp:ListItem>
                        <asp:ListItem Value="Thu doi ngoai te mat voi KH vanglai" Text="Thu đổi ngoại tệ mặt với KH vãng lai"> </asp:ListItem>
                        <asp:ListItem Value="Cong tac du lich tham vieng" Text="Công tác Du lịch Thăm viếng"></asp:ListItem>
                        <asp:ListItem Value="Hoc tap chua benh" Text="Du học Chữa bệnh"></asp:ListItem>
                        <asp:ListItem Value="Thua ke" Text="Thừa kế"></asp:ListItem>
                        <asp:ListItem Value="Dinh cu" Text="Định cư"></asp:ListItem>
                        <asp:ListItem Value="Tra phi le phi" Text="Trả phí" disabled></asp:ListItem>
                        <asp:ListItem Value="Tro cap vien tro" Text="Trợ cấp cho tặng biếu"></asp:ListItem>
                        <asp:ListItem Value="Thanh toan theo HD ngoai thuong" Text="Thanh toán theo hợp đồng ngoại thương" disabled></asp:ListItem>
                        <asp:ListItem Value="Vay tra no NN ngan han" Text="Trả nợ nước ngoài ngắn hạn" disabled></asp:ListItem>
                        <asp:ListItem Value="Vay tra no NN trung dai han" Text="Trả nợ nước ngoài trung dài hạn" disabled></asp:ListItem>
                        <asp:ListItem Value="Muc dich khac" Text="Dịch vụ khác" disabled></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 119px" class="lblCaption">
                    &nbsp;Tỷ lệ ký quỹ (%)
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="TLKQ" runat="server" Width="50%" Height="30px" Text="0"
                        ThousandsSeparator="true" Value="0" SmartInputMode="false" DecimalPlaces="2"
                        MaxValue="100" Font-Size="Large" UpDownAlign="None" OnClientTextChanged="TLKQ()">
                    </cc1:C1WebNumericEdit>
                </td>
                <td class="lblCaption">
                    Số tiền ký quỹ
                </td>
                <td>
                    <asp:Label ID="txtSTKQ" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Chỉ dẫn thanh toán</legend>
        <table style="width: 100%;">
            <tr>
                <td style="width: 119px" class="lblCaption">
                    &nbsp; TK Đồng tiền mua
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtTKM" SkinID="TextBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 119px" class="lblCaption">
                    &nbsp; TK Đồng tiền bán
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtTKB" SkinID="TextBox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 119px" valign="top" class="lblCaption">
                    &nbsp; Ghi chú
                </td>
                <td>
                    <asp:TextBox runat="server" TextMode="MultiLine" Rows="2" ID="txtNote" Width="50%"></asp:TextBox>
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
            <tr id="SPFW">
                <td style="width: 115px" class="lblCaption">
                    Tỷ giá Spot
                </td>
                <td>
                    <asp:Label ID="SPRATE" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Thông tin giao dịch</legend>
        <table style="width: 100%;">
            <tr>
                <td style="width: 115px" class="lblCaption">
                    &nbsp;Đồng tiền Mua&nbsp;
                </td>
                <td style="width: 198px">
                    <asp:TextBox ID="txtDongTienMua" runat="server" SkinID="TextBox" Style="text-transform: uppercase;
                        text-align: right" ReadOnly="True" Width="51px" Font-Size="Larger"></asp:TextBox>
                </td>
                <td style="width: 115px" class="lblCaption">
                    Số lượng Mua
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtSoLuongMua" runat="server" Width="70%" Height="30px"
                        Text="0" Enabled="false" ThousandsSeparator="true" Value="0" SmartInputMode="false"
                        MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 99px" class="lblCaption">
                    &nbsp;Đồng tiền Bán
                </td>
                <td style="width: 213px">
                    <asp:TextBox ID="txtDongTienBan" runat="server" SkinID="TextBox" Font-Size="Larger"
                        Style="text-transform: uppercase; text-align: right" ReadOnly="True" Width="51px"
                        UpDownAlign="true"></asp:TextBox>
                </td>
                <td style="width: 92px" class="lblCaption">
                    Số lượng Bán
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtSoLuongBan" runat="server" Width="70%" Height="30px"
                        Enabled="false" Text="0" ThousandsSeparator="true" Value="0" SmartInputMode="false"
                        MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 99px" class="lblCaption">
                    &nbsp;Đồng tiền cơ sở
                </td>
                <td style="width: 198px">
                    <asp:TextBox ID="txtDongTienCoSo" runat="server" SkinID="TextBox" Style="text-transform: uppercase;
                        text-align: right" ReadOnly="True" Width="51px" Font-Size="Larger"></asp:TextBox>
                </td>
                <td style="width: 92px" class="lblCaption">
                    Tỷ giá KH
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtTyGia" runat="server" Width="70%" Font-Size="Large"
                        Height="30px" Text="0" Enabled="false" ThousandsSeparator="true" Value="0" SmartInputMode="false"
                        MaxValue="100000000" UpDownAlign="None" MinValue="-1" DecimalPlaces="6">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Ghi chú</legend>
        <table style="width: 100%;">
            <tr>
                <td style="width: 115px" class="lblCaption">
                    &nbsp;Sprd M&nbsp;
                </td>
                <td style="width: 213px">
                    <cc1:C1WebNumericEdit ID="txtSprdM" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" MinValue="-10000" Font-Size="Large"
                        UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 115px" class="lblCaption">
                    PA
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtPA" runat="server" Width="50%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 115px" class="lblCaption">
                    &nbsp;Sprd B
                </td>
                <td style="width: 213px">
                    <cc1:C1WebNumericEdit ID="txtSprdB" runat="server" Width="30%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" MinValue="-10000" Font-Size="Large"
                        UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 92px" class="lblCaption">
                    RA
                </td>
                <td>
                    <cc1:C1WebNumericEdit ID="txtRA" runat="server" Width="50%" Height="30px" Text="0"
                        Enabled="false" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true" Value="0"
                        SmartInputMode="false" MaxValue="900000000000000" Font-Size="Large" UpDownAlign="None">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 87px" class="lblCaption">
                    DAO
                </td>
                <td style="width: 213px">
                    <asp:TextBox ID="txtDao" runat="server" SkinID="TextBox" Font-Size="Larger" Style="text-transform: uppercase"
                        Width="156px"></asp:TextBox>
                    <asp:Image runat="server" ID="imgDao" ImageUrl="~/Images/checkcif.png" ToolTip="Kiểm tra DAO"
                        Style="cursor: pointer" />
                </td>
                <td colspan="2" class="lblCaption">
                    <asp:Label runat="server" ID="lblDaoName"></asp:Label>
                </td>
            </tr>
            <tr id="trPDNL">
                <td class="lblCaption">
                    Email PDNL
                </td>
                <td>
                    <asp:TextBox runat="server" ID="emailPDNL"></asp:TextBox>
                </td>
                <td>
                    Note: Đơn vị không cần nhập @vpbank.com.vn
                </td>
            </tr>
            <tr>
                <td colspan="4" align="right">
                    <asp:Button runat="server" Text="Thực hiện giao dịch" CssClass="Button" ID="btnSubmit" />
                    <asp:Button runat="server" Text="Điều chỉnh" CssClass="Button" ID="btnEdit" />
                    <asp:Button runat="server" ID="btnReMail" Text="Gửi lại mail" SkinID="TransferButton"
                        Visible="false" />
                    <asp:Button runat="server" Text="Giao dịch cân bằng" CssClass="Button" ID="btnReject" />
                    <asp:HiddenField runat="server" ID="decCCY" />
                </td>
            </tr>
        </table>
    </fieldset>
    <script language="javascript" type="text/javascript">
        /*****************************************/
        $(document).ready(function () {
            var num = 5.565;
            var n = num.toFixed(2);

            if (Qry["txntype"] == "FW") {
                $('#trFW').show();
                $('#SPFW').show();
            } else {
                $('#trFW').hide();
                $('#SPFW').show();
            }

            if (Qry["objtype"] == "KHCN") {
                $('#tdKHCN1').hide();
                $('#tdKHCN2').hide();
                $('#ctl00_FormContent_txtLTT').hide();
                $('#ctl00_FormContent_spanccy').hide();
                $('#ctl00_FormContent_txtMarginTT').hide();


            }

        });

        /*****************************************/
        function roundToTwo(num) {
            return +(Math.round(num + "e+2") + "e-2");
        }

        function roundTo(num, de) {
            num = num * Math.pow(10, de);
            num = Math.round(num);
            return +(num / Math.pow(10, de));
        }

        function roundAmountTo(num1, num2, de) {

            var denum1 = num1.toString().split(".").length == 2 ? num1.toString().split(".")[1] : "";
            var denum2 = num2.toString().split(".").length == 2 ? num2.toString().split(".")[1] : "";

            var intNum1 = (num1.toString().replace('.', ''));
            var intNum2 = (num2.toString().replace('.', ''));
            var A = (Number(intNum1) * Number(intNum2));           
            A = (A / (Math.pow(10, denum1.length) * Math.pow(10, denum2.length)))
            return +roundTo(A, de);
        }

        function roundToZero(num) {
            return +(Math.round(num, 0));
        }

        function getDaoInfo() {
            var id = new String(GetSvrCtlValue("txtDao"));
            if (id.length == 0) return false;

            StartProcessingForm("");
            var url = "opendealcustomer.aspx";
            var query = "act=getdaoinfo";
            query += "&dao=" + id;
            query += "&dealid=" + Qry["dealid"];
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (data) {
                    if (data == "") {
                        alert('Mã DAO không tồn tại');
                        SetSvrCtlValue("txtDao", "");
                    }

                    $("#ctl00_FormContent_lblDaoName").text(data);

                    FinishProcessingForm();
                }
            });
        }
        function SaleMargin() {

            var dechide = '<%=_decccyPair %>';
            var saleMargin = new Number(replaceNumber(GetSvrCtlValue("SaleMargin"), ',', ''));
            var tygia = new Number(replaceNumber(GetSvrCtlValue("txtTyGia"), ',', ''));
            var fxtrader = new Number(replaceNumber($("#ctl00_FormContent_txtFXtrader").text(), ',', ''));
            var MarginMin = new Number(replaceNumber($("#ctl00_FormContent_txtMarginTT").text(), ',', ''));
            var sqrd = new Number(replaceNumber($("#ctl00_FormContent_txtSprd").text(), ',', ''));
            var base = GetSvrCtlValue("txtDongTienCoSo");
            var mua = GetSvrCtlValue("txtDongTienMua");
            var ban = GetSvrCtlValue("txtDongTienBan");
            var TrenTran;
            var PARA;
            var newrate = 0;

            if (mua + ban == "USDVND" || mua + ban == "VNDUSD") {
                if (saleMargin == 0) {
                    newrate = fxtrader + sqrd;
                }
                else {
                    newrate = saleMargin * dechide + fxtrader + sqrd;
                }

                var spotmax = new Number(replaceNumber($("#ctl00_FormContent_txtSpotMax").text(), ',', ''));
                var spotmin = new Number(replaceNumber($("#ctl00_FormContent_txtSpotMin").text(), ',', ''));
                if (Qry["txntype"] == "FW") {
                    spotmax = new Number(replaceNumber($("#ctl00_FormContent_lblFWMax").text(), ',', ''));
                    spotmin = 0;
                }
                if (newrate > spotmax) {
                    TrenTran = "1";
                    PARA = newrate - spotmax;
                    newrate = spotmax;
                } else if (newrate < spotmin) {
                    TrenTran = "-1";
                    PARA = newrate - spotmin;
                    newrate = spotmin;
                }
            } else {
                newrate = saleMargin * dechide + fxtrader;
            }

            SetSvrCtlValue("txtTyGia", addCommas(roundTo(newrate, '<%=_RateDecimal %>')));
            newrate = roundTo(newrate, '<%=_RateDecimal %>');

            var amt_ban = new Number(replaceNumber(GetSvrCtlValue("txtSoLuongBan"), ',', ''));
            var amt_mua = new Number(replaceNumber(GetSvrCtlValue("txtSoLuongMua"), ',', ''));
            var amt = new Number('<%=_amt %>');
            var r = new Number('<%=_rate %>');
            if ('<%=_IsUSDVND %>' == "True" || ban == "VND" || mua == "VND") {
                /************cảnh báo margin**************/
                if ($('#ctl00_FormContent_lblSegment').text() != "KHCN") {
                    if (mua == base) {
                        if (saleMargin > MarginMin) {
                            $('#lblMessage').text("Margin mua lớn hơn margin tối đa. Xin phê duyệt ngoại lệ");
                            $('#trPDNL').show();
                        } else {
                            $('#lblMessage').text("");
                            $('#trPDNL').hide();
                        }
                    } else {
                        if (saleMargin >= MarginMin) {
                            $('#lblMessage').text("");
                            $('#trPDNL').hide();
                        } else {
                            $('#lblMessage').text("Margin bán nhỏ hơn margin tối thiểu. Xin phê duyệt ngoại lệ");
                            $('#trPDNL').show();
                        }
                    }
                }

                /*********************Tính lãi thực tế***************/
                if (mua == base) {
                    $("#ctl00_FormContent_txtLLTT").text(addCommas(-roundTo(amt_mua * saleMargin * dechide, 2)));
                } else {
                    $("#ctl00_FormContent_txtLLTT").text(addCommas(roundTo(amt_ban * saleMargin * dechide, 2)));
                }

                /********************Tính khối lượng mua bán***********************************/
               
                if (mua == base) {
                    //parseInt(amt_mua) * parseFloat(newrate)
                    SetSvrCtlValue("txtSoLuongBan", addCommas((roundAmountTo(amt_mua , newrate, '<%=_KLBDecimal %>'))));
                } else {

                    SetSvrCtlValue("txtSoLuongMua", addCommas((roundAmountTo(amt_ban * newrate, '<%=_KLMDecimal %>'))));
                }

            } else {
                if ($('#ctl00_FormContent_lblSegment').text() != "KHCN") {
                    if (mua == base) {
                        if (saleMargin > MarginMin) {
                            $('#lblMessage').text("Margin mua lớn hơn margin mua tối đa. Xin phê duyệt ngoại lệ");
                            $('#trPDNL').show();
                        } else {
                            $('#lblMessage').text("");
                            $('#trPDNL').hide();
                        }
                    } else {
                        if (saleMargin >= MarginMin) {
                            $('#lblMessage').text("");
                            $('#trPDNL').hide();
                        } else {
                            $('#lblMessage').text("Margin bán nhỏ hơn margin tối thiểu. Xin phê duyệt ngoại lệ");
                            $('#trPDNL').show();
                        }
                    }

                }

                if ('<%=_buyorsell %>' == "BUY") {
                    if (ban == base) {
                        SetSvrCtlValue("txtSoLuongMua", addCommas(roundTo(amt * newrate, '<%=_KLMDecimal %>')));
                    } else {
                        SetSvrCtlValue("txtSoLuongMua", addCommas(roundTo(amt / newrate, '<%=_KLMDecimal %>')));
                    }
                } else {
                    if (ban == base) {
                        SetSvrCtlValue("txtSoLuongBan", addCommas(roundTo(amt / newrate, '<%=_KLBDecimal %>')));

                    } else {

                        SetSvrCtlValue("txtSoLuongBan", addCommas(roundTo(amt * newrate, '<%=_KLBDecimal %>')));


                    }
                }

                if ('<%=_rateBuyorSell %>' == "Mua") {
                    if ("EUR.AUD.GBP".lastIndexOf(base) != -1) {
                        if ('<%=_buyorsell %>' == "SELL") {
                            //                            var n = ((amt * (-(r + saleMargin * dechide) + r)));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * (-(r + saleMargin * dechide) + r)).round('<%=_PnlDecimal %>')));
                        } else {
                            //                            var n = (amt * (-1 / r + 1 / (r + saleMargin * dechide)));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * (-1 / r + 1 / (r + saleMargin * dechide))).round('<%=_PnlDecimal %>')));
                        }
                    } else {
                        if (('<%=_buyorsell %>' == "BUY" && ban == "USD")) {
                            //                            var n = ((amt * ((r + saleMargin * dechide) - r)));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * ((r + saleMargin * dechide) - r)).round('<%=_PnlDecimal %>')));
                        } else if ('<%=_buyorsell %>' == "SELL") {
                            //                            var n = ((amt * (-(r + saleMargin * dechide) + r)));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * (-(r + saleMargin * dechide) + r)).round('<%=_PnlDecimal %>')));
                        } else {
                            //                            var n = ((amt * (-1 / r + 1 / (r + saleMargin * dechide))));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * (-1 / r + 1 / (r + saleMargin * dechide))).round('<%=_PnlDecimal %>')));
                        }
                    }
                } else {

                    if ("EUR.AUD.GBP".lastIndexOf(base) != -1) {
                        if ('<%=_buyorsell %>' == "SELL") {
                            //                            var n = ((amt * (1 / r - 1 / (r + saleMargin * dechide))));
                            //                            alert(n.round(2));
                            // $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * saleMargin * dechide).toFixed(2)));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * (1 / r - 1 / (r + saleMargin * dechide))).round('<%=_PnlDecimal %>')));
                        } else {
                            //                            var n = ((amt * ((r + saleMargin * dechide) - r)));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * ((r + saleMargin * dechide) - r)).round('<%=_PnlDecimal %>')));
                        }
                    } else {
                        if (('<%=_buyorsell %>' == "SELL" && ban != "USD")) {
                            //                            var n = ((amt * (-(r + saleMargin * dechide) + r)));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * (-(r + saleMargin * dechide) + r)).round('<%=_PnlDecimal %>')));
                        } else if (('<%=_buyorsell %>' == "BUY")) {
                            //                            var n = ((amt * ((r + saleMargin * dechide) - r)));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * ((r + saleMargin * dechide) - r)).round('<%=_PnlDecimal %>')));
                        } else {
                            //                            var n = ((amt * (1 / r - 1 / (r + saleMargin * dechide))));
                            //                            alert(n.round(2));
                            $("#ctl00_FormContent_txtLLTT").text(addCommas((amt * (1 / r - 1 / (r + saleMargin * dechide))).round('<%=_PnlDecimal %>')));
                        }
                    }

                }

            }

            var ccyLL = $("#ctl00_FormContent_spanccyLLTT").text();


            if (ccyLL != "VND ") {

                $("#ctl00_FormContent_quydoiVNDTT").text("Lãi lỗ thực tế quy VND: " + addCommas((new Number(replaceNumber($("#ctl00_FormContent_txtLLTT").text(), ',', '')) * '<%=_MidRate %>').toFixed(0)));
            }

            if (ban + mua == "USDVND" || ban + mua == "VNDUSD") {
                if (TrenTran == "1") {
                    if (mua == base) {
                        SetSvrCtlValue("txtSprdM", PARA);
                        SetSvrCtlValue("txtSprdB", 0);
                        SetSvrCtlValue("txtPA", addCommas(PARA * amt_mua));
                        SetSvrCtlValue("txtRA", 0);
                    } else {
                        SetSvrCtlValue("txtSprdB", PARA);
                        SetSvrCtlValue("txtSprdM", 0);
                        SetSvrCtlValue("txtRA", addCommas(PARA * amt_ban));
                        SetSvrCtlValue("txtPA", 0);
                    }
                } else if (TrenTran == "-1") {
                    if (mua == base) {
                        SetSvrCtlValue("txtSprdM", PARA);
                        SetSvrCtlValue("txtSprdB", 0);
                        SetSvrCtlValue("txtPA", addCommas(PARA * amt_mua));
                        SetSvrCtlValue("txtRA", 0);
                    } else {
                        SetSvrCtlValue("txtSprdB", PARA);
                        SetSvrCtlValue("txtSprdM", 0);
                        SetSvrCtlValue("txtPA", 0);
                        SetSvrCtlValue("txtRA", addCommas(PARA * amt_ban));
                    }
                } else {
                    SetSvrCtlValue("txtSprdB", 0);
                    SetSvrCtlValue("txtSprdM", 0);
                    SetSvrCtlValue("txtPA", 0);
                    SetSvrCtlValue("txtRA", 0);
                }

            }
            TLKQ();
        }




        function TLKQ() {
            var base = GetSvrCtlValue("txtDongTienCoSo");
            var buy = GetSvrCtlValue("txtDongTienMua");
            var amt_sell = new Number(replaceNumber(GetSvrCtlValue("txtSoLuongBan"), ',', ''));
            var amt_buy = new Number(replaceNumber(GetSvrCtlValue("txtSoLuongMua"), ',', ''));
            var TLKQ = new Number(replaceNumber(GetSvrCtlValue("TLKQ"), ',', ''));

            if (base == buy) {
                $("#ctl00_FormContent_txtSTKQ").text(addCommas(roundTo(amt_sell * TLKQ / 100, '<%=_KLBDecimal %>')));
            } else {
                $("#ctl00_FormContent_txtSTKQ").text(addCommas(roundTo(amt_buy * TLKQ / 100, '<%=_KLMDecimal %>')));
            }

        }

        function EditFxDeal() {
            SaleMargin();

            var lolaitthucte = new Number(replaceNumber($("#ctl00_FormContent_txtLLTT").text(), ',', ''));

            if (lolaitthucte < 0 && GetSvrCtlValue("emailPDNL") == "") {
                if ('<%=_m_roleID %>' != 'B1AD14F4-DBA8-4CE9-A78D-B1E587640798') {
                    alert('Do Lỗ lãi thực tế < 0 cần phải nhập email phê duyệt ngoại lệ');
                    return false;
                }
            }

            if (!FormValidated())
                return false;
            if (!confirm('Bạn có đồng ý thực hiện giao dịch này không?'))
                return false;
            var dealid = Qry["dealid"];
            var url = "opendealcustomer.aspx";
            var query = "act=EditDeal";
            query += "&dealid=" + dealid;
            query += "&sale=" + new Number(replaceNumber(GetSvrCtlValue("SaleMargin"), ',', ''));
            query += "&tlkq=" + new Number(replaceNumber(GetSvrCtlValue("TLKQ"), ',', ''));
            query += "&md=" + GetSvrCtlValue("cboMucdich");
            query += "&pur=" + GetSvrCtlValue("ddlPURPOSE");
            query += "&base=" + GetSvrCtlValue("txtDongTienCoSo");
            query += "&ccySell=" + GetSvrCtlValue("txtDongTienBan");
            query += "&ccybuy=" + GetSvrCtlValue("txtDongTienMua");
            query += "&amtBuy=" + new Number(replaceNumber(GetSvrCtlValue("txtSoLuongMua"), ',', ''));
            query += "&amtSell=" + new Number(replaceNumber(GetSvrCtlValue("txtSoLuongBan"), ',', ''));
            query += "&rate=" + new Number(replaceNumber(GetSvrCtlValue("txtTyGia"), ',', ''));
            query += "&marginmin=" + new Number(replaceNumber($("#ctl00_FormContent_txtMarginTT").text(), ',', ''));
            query += "&tkMua=" + GetSvrCtlValue("txtTKM");
            query += "&tkBan=" + GetSvrCtlValue("txtTKB");
            query += "&note=" + GetSvrCtlValue("txtNote");
            query += "&dao=" + GetSvrCtlValue("txtDao");
            query += "&daoName=" + $("#ctl00_FormContent_lblDaoName").text();
            query += "&interesMin=" + new Number(replaceNumber($("#ctl00_FormContent_txtLTT").text(), ',', ''));
            query += "&interesAct=" + new Number(replaceNumber($("#ctl00_FormContent_txtLLTT").text(), ',', ''));
            query += "&PnLU=" + $("#ctl00_FormContent_spanccyLLTT").text();
            query += "&pa=" + new Number(replaceNumber(GetSvrCtlValue("txtPA"), ',', ''));
            query += "&ra=" + new Number(replaceNumber(GetSvrCtlValue("txtRA"), ',', ''));
            query += "&email=" + GetSvrCtlValue("emailPDNL");
            var sprdm = new Number(replaceNumber(GetSvrCtlValue("txtSprdM"), ',', ''));
            var sprdb = new Number(replaceNumber(GetSvrCtlValue("txtSprdB"), ',', ''));
            if (sprdb > 0)
                query += "&sprd=" + sprdb;
            else {
                query += "&sprd=" + sprdm;
            }
            var lblMes = $('#lblMessage').text();
            if (lblMes != "" && GetSvrCtlValue("emailPDNL") == "") {
                alert('Cần phải nhập email phê duyệt ngoại lệ')
                return false;
            }

            StartProcessingForm("");

            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage == "") {
                        alert('Bạn đã thực hiện thành công');
                        window.close();
                    }
                    else
                        alert(errormessage);
                }
            });
        }

        function DealCustomer() {

            var lolaitthucte = new Number(replaceNumber($("#ctl00_FormContent_txtLLTT").text(), ',', ''));

            if (lolaitthucte < 0 && GetSvrCtlValue("emailPDNL") == "") {
                if ('<%=_m_roleID %>' != 'B1AD14F4-DBA8-4CE9-A78D-B1E587640798') {
                    alert('Do Lỗ lãi thực tế < 0 cần phải nhập email phê duyệt ngoại lệ');
                    return false;
                }
            } else if (lolaitthucte < 0 && '<%=_m_roleID %>' != 'B1AD14F4-DBA8-4CE9-A78D-B1E587640798') {
                alert('Không được thực hiện khi lỗ lãi thực tế < 0');
                return false;
            }
            if (!FormValidated())
                return false;
            if (!confirm('Bạn có đồng ý thực hiện giao dịch này không?'))
                return false;
            var dealid = Qry["dealid"];
            var url = "opendealcustomer.aspx";
            var query = "act=CusAccept";
            query += "&dealid=" + dealid;
            query += "&sale=" + new Number(replaceNumber(GetSvrCtlValue("SaleMargin"), ',', ''));
            query += "&tlkq=" + new Number(replaceNumber(GetSvrCtlValue("TLKQ"), ',', ''));
            query += "&md=" + GetSvrCtlValue("cboMucdich");
            query += "&pur=" + GetSvrCtlValue("ddlPURPOSE");
            query += "&base=" + GetSvrCtlValue("txtDongTienCoSo");
            query += "&ccySell=" + GetSvrCtlValue("txtDongTienBan");
            query += "&ccybuy=" + GetSvrCtlValue("txtDongTienMua");
            query += "&amtBuy=" + new Number(replaceNumber(GetSvrCtlValue("txtSoLuongMua"), ',', ''));
            query += "&amtSell=" + new Number(replaceNumber(GetSvrCtlValue("txtSoLuongBan"), ',', ''));
            query += "&rate=" + new Number(replaceNumber(GetSvrCtlValue("txtTyGia"), ',', ''));
            query += "&marginmin=" + new Number(replaceNumber($("#ctl00_FormContent_txtMarginTT").text(), ',', ''));
            query += "&tkMua=" + GetSvrCtlValue("txtTKM");
            query += "&tkBan=" + GetSvrCtlValue("txtTKB");
            query += "&note=" + GetSvrCtlValue("txtNote");
            query += "&dao=" + GetSvrCtlValue("txtDao");
            query += "&daoName=" + $("#ctl00_FormContent_lblDaoName").text();
            query += "&interesMin=" + new Number(replaceNumber($("#ctl00_FormContent_txtLTT").text(), ',', ''));
            query += "&interesAct=" + new Number(replaceNumber($("#ctl00_FormContent_txtLLTT").text(), ',', ''));
            query += "&PnLU=" + $("#ctl00_FormContent_spanccyLLTT").text();
            query += "&pa=" + new Number(replaceNumber(GetSvrCtlValue("txtPA"), ',', ''));
            query += "&ra=" + new Number(replaceNumber(GetSvrCtlValue("txtRA"), ',', ''));
            query += "&email=" + GetSvrCtlValue("emailPDNL");
            var sprdm = new Number(replaceNumber(GetSvrCtlValue("txtSprdM"), ',', ''));
            var sprdb = new Number(replaceNumber(GetSvrCtlValue("txtSprdB"), ',', ''));
            if (sprdb > 0)
                query += "&sprd=" + sprdb;
            else {
                query += "&sprd=" + sprdm;
            }
            var lblMes = $('#lblMessage').text();
            if (lblMes != "" && GetSvrCtlValue("emailPDNL") == "") {
                alert('Cần phải nhập email phê duyệt ngoại lệ')
                return false;
            }

            StartProcessingForm("");

            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage == "") {
                        alert('Bạn đã thực hiện thành công');
                        window.location.reload(true);
                    } else if (errormessage.length > 30) {
                        alert("Lỗi kết nối đến T24, Giao dịch cần được hạch toán thủ công .");
                        window.location.reload(true);
                    } else {
                        alert(errormessage);
                    }
                }
            });
        }

        function RejectFxDeal() {
            var url = "AcceptRejectDeal.aspx?dealid=" + Qry["dealid"] + "&txntype=" + GetSvrCtlValue("cboTxnType");
            opendetail(url, "huy");

        }
        function PrintDeal(id) {
            var SLB = GetSvrCtlValue("txtSoLuongBan");
            var SLM = GetSvrCtlValue("txtSoLuongMua");
            openDialog("../Dialog/PrintDeals.aspx?act=KH&dealid=" + id + "&amtB=" + SLB + "&amtM=" + SLM, '600', '600');

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
