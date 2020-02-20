<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="Reval_sp.aspx.cs" Inherits="VPB_FX.Modules.DMS.Reval_sp" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2, Version=2.1.20082.117, Culture=neutral, PublicKeyToken=589f1fc067ff4031" %>
<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1Input" Assembly="C1.Web.C1Input.2, Version=2.0.20082.434, Culture=neutral, PublicKeyToken=96d8a77dc0c22f6b" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <table style="width: 100%">
        <tr>
            <td valign="top">
                <fieldset class="fieldsetBg2" style="width: 100%">
                    <legend class="divLegend">Nhập liệu</legend>
                    <table style="width: 100%">
                        <tr>
                            <td class="lblNormal">
                                CCYPAIR
                            </td>
                            <td style="width: 220px">
                                <asp:DropDownList runat="server" ID="cboCCYPAIR" SkinID="DropDownList" >
                                </asp:DropDownList>
                            </td>
                            <td style="width: 30%">
                            </td>
                        </tr>
                        <tr>
                            <td class="lblNormal">
                                Tỷ giá mua
                            </td>
                            <td>
                                <cc1:C1WebNumericEdit ID="RateBuy" runat="server" SkinID="C1WebNumeric" Width="100%"
                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                    Value="0" MaxValue="10000000" UpDownAlign="Right">
                                </cc1:C1WebNumericEdit>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblNormal">
                                Tỷ giá bán
                            </td>
                            <td>
                                <cc1:C1WebNumericEdit ID="RateSell" runat="server" SkinID="C1WebNumeric" Width="100%"
                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                    Value="0" MaxValue="10000000" UpDownAlign="Right">
                                </cc1:C1WebNumericEdit>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblNormal">
                                Tỷ giá mid
                            </td>
                            <td>
                                <cc1:C1WebNumericEdit ID="RateMid" runat="server" SkinID="C1WebNumeric" Width="100%"
                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                    Value="0" MaxValue="10000000" UpDownAlign="Right">
                                </cc1:C1WebNumericEdit>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblNormal">
                                Off market
                            </td>
                            <td>
                                <cc1:C1WebNumericEdit ID="Offmarket" runat="server" SkinID="C1WebNumeric" Width="100%"
                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                    Value="0" MaxValue="100" UpDownAlign="Right">
                                </cc1:C1WebNumericEdit>
                                &nbsp;
                            </td>
                            <td class="lblCaption">
                                %
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" align="center">
                                <asp:Button runat="server" ID="btnSave" SkinID="SaveButton" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td valign="top" style="width: 55%">
                <fieldset class="fieldsetBg2" style="width: 100%;">
                    <legend class="divLegend">Bảng hiển thị</legend>
                    <table style="width: 100%">
                        <tr>
                            <td>
                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getReval"
                                    TypeName="DataSource">
                                    <SelectParameters>
                                        <asp:Parameter Name="txnType" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <C1WebGrid:C1WebGrid runat="server" ID="C1WebGrid1" Width="100%" DataSourceID="ObjectDataSource1"
                                    OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound"
                                    GroupIndent="30">
                                    <Columns>
                                        <C1WebGrid:C1BoundColumn DataField="CCY_Pair" HeaderText="CCYPAIR" SortExpression="Value" >
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="Rate_Buy" HeaderText="TỶ GIÁ MUA" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                         <C1WebGrid:C1BoundColumn DataField="Rate_Sell" HeaderText="TỶ GIÁ BÁN" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                         <C1WebGrid:C1BoundColumn DataField="Rate_Mid" HeaderText="TỶ GIÁ MID" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                         <C1WebGrid:C1BoundColumn DataField="Off_Market" HeaderText="Chênh lệch" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        
                                        
                                    </Columns>
                                </C1WebGrid:C1WebGrid>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        var _viewState = "add";
        function on_change(value) {
            var url = "Reval_sp.aspx";
            var query = "act=get";
            query += "&ccy=" + GetSvrCtlValue("cboCCYPAIR");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errorMessage) {
                    if (errorMessage != "") {
                        _viewState = "update";
                        var ar = errorMessage.split('^');
                        SetSvrCtlValue("RateBuy", ar[0]);
                        SetSvrCtlValue("RateSell", ar[1]);
                        SetSvrCtlValue("RateMid", ar[2]);
                        SetSvrCtlValue("Offmarket", ar[3]);
                    } else {
                        _viewState = "add";
                        SetSvrCtlValue("RateBuy", "0.00");
                        SetSvrCtlValue("RateSell", "0.00");
                        SetSvrCtlValue("RateMid", "0.00");
                        SetSvrCtlValue("Offmarket", "0.00");
                    }
                }
            });
        }
        function do_save() {
            var url = "Reval_sp.aspx";
            var query = "act=add";
            if (_viewState == "update")
                query = "act=update";
            query += "&rb=" + GetSvrCtlValue("RateBuy") + "&rs=" + GetSvrCtlValue("RateSell") + "&rm=" + GetSvrCtlValue("RateMid") + "&ccy=" + GetSvrCtlValue("cboCCYPAIR") + "&off=" + GetSvrCtlValue("Offmarket");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errorMessage) {
                    if (errorMessage == "") {
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
