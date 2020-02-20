<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="usdvnd_forward.aspx.cs" Inherits="VPB_FX.Modules.DMS.usdvnd_forward" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Tỷ Giá Qui Đổi Trong Ngày</legend>
        <table style="width: 80%">
            <tr>
                <td style="width: 100px">
                    Ngày giao dịch
                </td>
                <td colspan="5">
                    <asp:TextBox ID="txtBusinessDate" runat="server" SkinID="TextBoxDate" Font-Size="Medium"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 200px">
                    Điểm kỳ hạn SBV tối đa/ngày
                </td>
                <td>
                    <asp:TextBox ID="txtSBV" runat="server" SkinID="TextBox" Font-Size="Medium" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </fieldset>
    
    <table class="Table" style="width: 100%">
        <tr>
            <td colspan="3">
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="getRevalFW"
                    TypeName="DataSource">
                    <SelectParameters>
                        <asp:Parameter Name="CCY" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <C1WebGrid:C1WebGrid runat="server" ID="C1WebGrid1" Width="100%" DataSourceID="ObjectDataSource2"
                    OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound"
                    AutoGenerateColumns="False">
                    <Columns>
                        <C1WebGrid:C1TemplateColumn HeaderText="Kỳ hạn">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Term" Text='<%# DataBinder.Eval(Container.DataItem,"Description")%>'></asp:Label>
                                <asp:Label runat="server" ID="eTerm" Text='<%# DataBinder.Eval(Container.DataItem,"Term")%>'
                                    Visible="False"></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Mua">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <cc1:C1WebNumericEdit ID="RateBuy" runat="server" SkinID="C1WebNumeric" Width="100%"
                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                    Value="0" MaxValue="10000000" UpDownAlign="Right">
                                </cc1:C1WebNumericEdit>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Bán">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <cc1:C1WebNumericEdit ID="RateSell" runat="server" SkinID="C1WebNumeric" Width="100%"
                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                    Value="0" MaxValue="10000000" UpDownAlign="Right">
                                </cc1:C1WebNumericEdit>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn>
                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Image runat="server" ID="imgSave" ImageUrl="~/App_Themes/Default/Images/Save001.gif"
                                    Style="cursor: hand;" ToolTip="Lưu lại" />
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                         <C1WebGrid:C1TemplateColumn>
                            <ItemStyle HorizontalAlign="Center" Width="10%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lblExits"></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                    </Columns>
                </C1WebGrid:C1WebGrid>
            </td>
        </tr>
        <tr><td align="center"><asp:Button runat="server" ID="btnSaveAll" 
                SkinID="SaveButton" /></td></tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            initform();
        });
        function initform() {
            //viewTerm();
        }

        function do_Save(buy,sell,term) {
            var url = "usdvnd_forward.aspx";
            var query = "act=addNew";
            query += "&Term=" + term;
            query += "&SprdMua=" + $("#" + buy).val();
            query += "&SprdBan=" + $("#" + sell).val();
            if (new Number($("#" + buy).val()) > new Number($("#" + sell).val())) {
                alert('chiều mua luôn phải nhỏ hơn chiều bán');
                return false;
            }
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    if (errormessage == "") {
                        alert("Đã thêm cập nhật thêm tỷ giá USDVND");
                        window.location.reload(true);
                    }
                    else {
                        alert(errormessage);
                        window.location.reload(true);
                    }
                }
            });
        }

        function viewTerm() {
            var Term = GetValue("ctl00_FormContent_drTerm");
            var url = "usdvnd_forward.aspx";
            var query = "act=view&Term=" + Term;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (data) {
                    if (data != "") {
                        var dataview = JSON.parse(data);
                        SetSvrCtlValue("txtBusinessDate", dataview.BusinessDate);
                        SetSvrCtlValue("txtSBV_QD", dataview.SBV_QD);
                        SetSvrCtlValue("txtSBV_Rate", dataview.SBV_Rate);
                        SetSvrCtlValue("txtSPRD", dataview.SPRD);
                        SetSvrCtlValue("txtFedRate", dataview.FedRate);
                        SetSvrCtlValue("txtTermBuy", dataview.TermBuy);
                        SetSvrCtlValue("txtTermSell", dataview.TermSell);
                    } else {
                        SetSvrCtlValue("txtBusinessDate", GetCurrentDate());
                        SetSvrCtlValue("txtSBV_QD", 0);
                        SetSvrCtlValue("txtSBV_Rate", 0);
                        SetSvrCtlValue("txtSPRD", 0);
                        SetSvrCtlValue("txtFedRate", 0);
                        SetSvrCtlValue("txtTermBuy", 0);
                        SetSvrCtlValue("txtTermSell", 0);
                    }
                }
            });
        }
        function AddNew() {
            var BusinessDate = GetValue("ctl00_FormContent_txtBusinessDate")
            var SBV_QD = Number(GetValue("ctl00_FormContent_txtSBV_QD").replace(',', ''));
            var SBV_Rate = Number(GetValue("ctl00_FormContent_txtSBV_Rate"));
            var SPRD = Number(GetValue("ctl00_FormContent_txtSPRD"));
            var FedRate = Number(GetValue("ctl00_FormContent_txtFedRate"));

            var Term = GetValue("ctl00_FormContent_drTerm");
            var SprdMua = Number(GetValue("ctl00_FormContent_txtTermBuy").replace(',', ''));
            var SprdBan = Number(GetValue("ctl00_FormContent_txtTermSell").replace(',', ''));

            if (BusinessDate == "") {
                alert('Hãy nhập ngày giao dịch');
                return;
            }

            if (SBV_QD <= 0) {
                alert('SBV_QD cần phải lớn hơn 0');
                return;
            }
            if (SBV_Rate <= 0) {
                alert('SBV_Rate cần phải lớn hơn 0');
                return;
            }
            if (SPRD <= 0) {
                alert('SPRD cần phải lớn hơn 0');
                return;
            }
            if (FedRate <= 0) {
                alert('FedRate cần phải lớn hơn 0');
                return;
            }
            if (SprdMua <= 0) {
                alert('SprdMua cần phải lớn hơn 0');
                return;
            }
            if (SprdBan <= 0) {
                alert('SprdBan cần phải lớn hơn 0');
                return;
            }
            var url = "usdvnd_forward.aspx";
            var query = "act=addNew";
            query += "&BusinessDate=" + BusinessDate;
            query += "&SBV_QD=" + SBV_QD;
            query += "&SBV_Rate=" + SBV_Rate;
            query += "&SPRD=" + SPRD;
            query += "&FedRate=" + FedRate;
            query += "&Term=" + Term;
            query += "&SprdMua=" + SprdMua;
            query += "&SprdBan=" + SprdBan;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    if (errormessage == "") {
                        alert("Đã thêm cập nhật thêm tỷ giá USDVND");
                        url = "usdvnd_forward.aspx";
                        query = "SBV_QD=" + SBV_QD;
                        query += "&SBV_Rate=" + SBV_Rate;
                        query += "&SPRD=" + SPRD;
                        query += "&FedRate=" + FedRate;
                        url += "?" + query;
                        window.location.href = url;
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }

        function SaveAll() {
//           
            
            var sendInfo ="";
            for (var i = 2; i <= 9; i++) {
                var valueItemMua = GetValue("ctl00_FormContent_C1WebGrid1_ctl0" + i + "_RateBuy");
                var valueItemBan = GetValue("ctl00_FormContent_C1WebGrid1_ctl0" + i + "_RateSell");
                sendInfo += valueItemBan +"|"+valueItemMua+"^";
                
            }
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: "usdvnd_forward.aspx",
                data: "act=all&para=" + sendInfo,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage == "") {
                        alert("Đã thêm tỷ giá FW USDVND");
                    } else {
                        alert(errormessage);
                    }
                    window.location.reload(true);
                   
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
