<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="AutoRejectByTrader.aspx.cs" Inherits="VPB_FX.Modules.DMS.AutoRejectByTrader" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2, Version=2.1.20082.117, Culture=neutral, PublicKeyToken=589f1fc067ff4031" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1Input" Assembly="C1.Web.C1Input.2, Version=2.0.20082.434, Culture=neutral, PublicKeyToken=96d8a77dc0c22f6b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">ĐIỀU KIỆN QUÉT</legend>
        <table width="100%">
            <tr>
                <td class="lblNormal">
                    Đơn vị
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="cboCompany" SkinID="DropDownList">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="lblNormal" style="width: 90px">
                    Loại giao dịch
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="cboTxnType" SkinID="DropDownList">
                        <asp:ListItem Text="--Tất cả--" Value=""></asp:ListItem>
                        <asp:ListItem Text="SP" Value="SP"></asp:ListItem>
                        <asp:ListItem Text="FW" Value="FW"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button runat="server" ID="btnSearch" SkinID="SearchButton" OnClientClick="{Search();return false;}" />
                </td>
            </tr>
        </table>
    </fieldset>
    <table width="100%">
        <tr>
            <td style="width: 100%">
                <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                    OnItemDataBound="dataCtrl_OnItemDataBound">
                    <Columns>
                        <C1WebGrid:C1TemplateColumn>
                            <ItemStyle Width="3%" />
                            <ItemTemplate>
                                <asp:Image runat="server" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                    ToolTip="Xem chi tiết" ID="imgEdit" Style="cursor: pointer;" />
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn Visible="false">
                            <ItemStyle Width="5%" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="PK_FX_DealID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_DealID")%>'
                                    CssClass="lblCaption"></asp:Label>
                                <asp:Label EnableViewState="false" runat="server" ID="CCY_BASE" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BASE")%>'
                                    CssClass="lblCaption"></asp:Label>
                                <asp:Label EnableViewState="false" runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                    CssClass="lblCaption"></asp:Label>
                                <asp:Label EnableViewState="false" runat="server" ID="status" Text='<%# DataBinder.Eval(Container.DataItem,"status")%>'
                                    CssClass="lblCaption"></asp:Label>
                                
                               
                                <asp:Label EnableViewState="false" runat="server" ID="rate" Text='<%# DataBinder.Eval(Container.DataItem,"rate")%>'
                                    CssClass="lblCaption"></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="FX.ID">
                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="TxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"TxnFxID")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Company">
                            <ItemStyle HorizontalAlign="Left" Width="10%" />
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="TxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"Company")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="G.dịch">
                            <ItemStyle HorizontalAlign="Center" Width="8%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="TxnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>&nbsp;
                                <asp:Label EnableViewState="false" runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="M/B">
                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="Buy_Or_Sell" Text='<%# DataBinder.Eval(Container.DataItem,"Buy_Or_Sell")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Đồng B">
                            <ItemStyle HorizontalAlign="Center" Width="6%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="CCY_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BUY")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Đồng M">
                            <ItemStyle HorizontalAlign="Center" Width="6%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="CCY_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_SELL")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="KL Bán">
                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="AMT_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_BUY")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="KL Mua">
                            <ItemStyle HorizontalAlign="Right" Width="10%" />
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemTemplate>
                                <asp:Label EnableViewState="false" runat="server" ID="AMT_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_SELL")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                       
                        <C1WebGrid:C1BoundColumn DataField="rate" HeaderText="Tỷ giá FXLCN" SortExpression="Value" >
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="9%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                         <C1WebGrid:C1BoundColumn DataField="sprd" HeaderText="sprd" SortExpression="Value" >
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="9%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Tỷ giá hủy">
                            <ItemStyle HorizontalAlign="Center" Width="20%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <cc1:C1WebNumericEdit ID="txtRate" runat="server" SkinID="C1WebNumericRequired" Width="80%"
                                    Height="30px" Text="0" Font-Size="Large" Culture="en-US" ThousandsSeparator="true"
                                    Value="0" SmartInputMode="false" MaxValue="100000000000" UpDownAlign="None" Enabled="False">
                                </cc1:C1WebNumericEdit>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Cùng giá/khác giá">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Literal runat="server" ID="abc"></asp:Literal>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                    </Columns>
                </C1WebGrid:C1WebGrid>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button runat="server" ID="btnSubmit" SkinID="ApproveButton" OnClick="btnSubmit_Click" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function ChangeValue(idNumeric, idCheck, rate) {
            if ($('#' + idCheck).attr('checked')) {
                SetValue(idNumeric, rate);
                $('#' + idNumeric).attr('disabled', 'true');
            } else {

                $('#' + idNumeric).removeAttr('disabled');
            }
        }

        function viewDeal(PK_FX_DealID, ObjectType, TxnType) {
            opendetail("opennewdeal.aspx?end=true&act=see&objtype=" + ObjectType + "&txntype=" + TxnType + "&dealid=" + PK_FX_DealID, "DealSee");
          
        }


        function Search() {
            window.location.href = "AutoRejectByTrader.aspx?txnType=" + GetSvrCtlValue("cboTxnType") + "&Company=" + GetSvrCtlValue("cboCompany");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
