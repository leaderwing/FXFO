<%@ Page Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="DealInToday.aspx.cs" Inherits="VPB_FX.Modules.DMS.DealInToday" Title="Untitled Page" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <%--<asp:Timer ID="Timer1" runat="server" Interval="1000">
    </asp:Timer>--%>
    <table width="100%">
        <tr>
            <td style="width: 32%" valign="top">
               <%-- <asp:UpdatePanel runat="server" ID="PanelChoHG">
                    <ContentTemplate>--%>
                        <table style="width: 100%">
                            <tr>
                                <td align="left" valign="top">
                                    <fieldset class="fieldsetBg">
                                        <legend class="divLegend">Đang hỏi giá</legend>
                                        <C1WebGrid:C1WebGrid runat="server" ID="dataCtrlhg" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                                            OnItemDataBound="dataCtrlhg_OnItemDataBound">
                                            <Columns>
                                                <C1WebGrid:C1TemplateColumn>
                                                    <ItemStyle Width="4%" />
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
                                                        <asp:Label EnableViewState="false" runat="server" ID="TxnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="status" Text='<%# DataBinder.Eval(Container.DataItem,"status")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="Ngày" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}">
                                                    <ItemStyle Width="20%" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="G.dịch">
                                                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="type" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>&nbsp;
                                                        <asp:Label EnableViewState="false" runat="server" ID="object" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Buy_Or_Sell" HeaderText="M/B">
                                                    <ItemStyle Width="7%" HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1BoundColumn DataField="CCY_Buy" HeaderText="Đồng M">
                                                    <ItemStyle Width="9%" HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1BoundColumn DataField="CCY_Sell" HeaderText="Đồng B">
                                                    <ItemStyle Width="9%" HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                            </Columns>
                                        </C1WebGrid:C1WebGrid>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                    <%--</ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="tick" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </td>
            <td style="width: 68%" valign="top">
                <%--<asp:UpdatePanel ID="PanelChoXN" runat="server">
                    <ContentTemplate>--%>
                        <table style="width: 100%">
                            <tr>
                                <td align="left" valign="top">
                                    <fieldset class="fieldsetBg">
                                        <legend class="divLegend">chi nhánh chưa xác nhận</div></legend>
                                        <C1WebGrid:C1WebGrid runat="server" ID="dataCtrlxn" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                                            OnItemDataBound="dataCtrlxn_OnItemDataBound">
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
                                                        <asp:Label EnableViewState="false" runat="server" ID="Seconds" Text='<%# DataBinder.Eval(Container.DataItem,"Seconds")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BASE" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BASE")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="TxnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="statusFx" Text='<%# DataBinder.Eval(Container.DataItem,"status")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="MsgRefuse" Text='<%# DataBinder.Eval(Container.DataItem,"MsgRefuse")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="RateResponseDate" HeaderText="Ngày" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}">
                                                    <ItemStyle Width="14%" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="G.dịch">
                                                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="type" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>&nbsp;
                                                        <asp:Label EnableViewState="false" runat="server" ID="object" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Buy_Or_Sell" HeaderText="M/B">
                                                    <ItemStyle Width="6%" HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng M">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng B">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Mua">
                                                    <ItemStyle HorizontalAlign="Right" Width="12%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Bán">
                                                    <ItemStyle HorizontalAlign="Right" Width="14%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="T.giá">
                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="Rate" Text='<%# DataBinder.Eval(Container.DataItem,"Rate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="sprd" HeaderText="sprd" SortExpression="Value"
                                                    DataFormatString="{0:#,0}">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="lblTinVan2" Font-Bold="true" EnableViewState="false" runat="server"
                                                            ID="TimeDown"></asp:Label>
                                                        &nbsp;
                                                        <asp:Label EnableViewState="false" runat="server" ID="status"></asp:Label>
                                                        <asp:LinkButton runat="server" ID="lnkAccept"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                </C1WebGrid:C1TemplateColumn>
                                            </Columns>
                                        </C1WebGrid:C1WebGrid>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                    <fieldset class="fieldsetBg">
                                        <legend class="divLegend">chi nhánh chưa xác nhận hủy</div></legend>
                                        <C1WebGrid:C1WebGrid runat="server" ID="dataCtrlxnh" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                                            OnItemDataBound="dataCtrlxnh_OnItemDataBound">
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
                                                        <asp:Label EnableViewState="false" runat="server" ID="TxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"TxnFxID")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="Seconds" Text='<%# DataBinder.Eval(Container.DataItem,"Seconds")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BASE" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BASE")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="TxnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="statusFx" Text='<%# DataBinder.Eval(Container.DataItem,"status")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="Additiondata1" Text='<%# DataBinder.Eval(Container.DataItem,"Additiondata1")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="Ngày" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}">
                                                    <ItemStyle Width="14%" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1BoundColumn DataField="TxnFxID" HeaderText="FX.ID">
                                                    <ItemStyle Width="14%" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="G.dịch">
                                                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="type" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>&nbsp;
                                                        <asp:Label EnableViewState="false" runat="server" ID="object" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Buy_Or_Sell" HeaderText="M/B">
                                                    <ItemStyle Width="6%" HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng M">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng B">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Mua">
                                                    <ItemStyle HorizontalAlign="Right" Width="12%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Bán">
                                                    <ItemStyle HorizontalAlign="Right" Width="14%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="T.giá">
                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="Rate" Text='<%# DataBinder.Eval(Container.DataItem,"Rate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="sprd" HeaderText="sprd" DataFormatString="{0:#,0}">
                                                    <ItemStyle Width="14%" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="T.giá hủy">
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="RateReject"></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Sprd hủy">
                                                    <ItemStyle HorizontalAlign="Right" Width="7%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="sprdR"></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:Label CssClass="lblTinVan2" Font-Bold="true" EnableViewState="false" runat="server"
                                                            ID="TimeDown"></asp:Label>
                                                        &nbsp;
                                                        <asp:Label EnableViewState="false" runat="server" ID="statusReject"></asp:Label>
                                                        <asp:LinkButton runat="server" ID="lnkReject"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                </C1WebGrid:C1TemplateColumn>
                                            </Columns>
                                        </C1WebGrid:C1WebGrid>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <fieldset class="fieldsetBg">
                                        <legend class="divLegend">Giao dịch bị từ chối</legend>
                                        <C1WebGrid:C1WebGrid runat="server" ID="dataCtrltc" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                                            OnItemDataBound="dataCtrltc_OnItemDataBound">
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
                                                        <asp:Label EnableViewState="false" runat="server" ID="Seconds" Text='<%# DataBinder.Eval(Container.DataItem,"Seconds")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BASE" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BASE")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="TxnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="Ngày" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}">
                                                    <ItemStyle Width="14%" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="G.dịch">
                                                    <ItemStyle HorizontalAlign="Center" Width="8%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="type" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>&nbsp;
                                                        <asp:Label EnableViewState="false" runat="server" ID="object" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Buy_Or_Sell" HeaderText="M/B">
                                                    <ItemStyle Width="6%" HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng M">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng B">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Lý do từ chối">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="MsgRefuse" Text='<%# DataBinder.Eval(Container.DataItem,"MsgRefuse")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10%" HorizontalAlign="Right" />
                                                </C1WebGrid:C1TemplateColumn>
                                            </Columns>
                                        </C1WebGrid:C1WebGrid>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                   <%-- </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="tick" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" colspan="2">
               <%-- <asp:UpdatePanel ID="PanelNOTKH" runat="server">
                    <ContentTemplate>--%>
                        <table style="width: 100%">
                            <tr>
                                <td align="left" valign="top">
                                    <fieldset class="fieldsetBg">
                                        <legend class="divLegend">Giao dịch chưa thực hiện với KH</legend>
                                        <C1WebGrid:C1WebGrid runat="server" ID="dataCtrlnotKH" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                                            OnItemDataBound="dataCtrlnotKH_OnItemDataBound">
                                            <Columns>
                                                <C1WebGrid:C1TemplateColumn>
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="3%" />
                                                    <ItemTemplate>
                                                        <asp:Image runat="server" ID="imgDel" ImageUrl="~/App_Themes/Default/Images/delete.gif"
                                                            Style="cursor: pointer;" ToolTip="Xóa deal" />
                                                        <asp:Image runat="server" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                                            ToolTip="Xem chi tiết" ID="imgEdit" Style="cursor: pointer;" />
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="FinishedDate" HeaderText="Ngày" SortExpression="Value"
                                                    DataFormatString="{0:dd/MM/yyyy HH:mm:ss}">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="9%" />
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="FX.ID">
                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="TxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"TxnFxID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="PK_FX_DealID" Visible="false">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="PK_FX_DealID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_DealID")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BASE" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BASE")%>'
                                                            CssClass="lblCaption"></asp:Label>
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
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng M">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng B">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Mua">
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Bán">
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="PA" HeaderText="PA" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="9%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1BoundColumn DataField="RA" HeaderText="RA" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="9%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="T.giá">
                                                    <ItemStyle HorizontalAlign="Right" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="Rate" Text='<%# DataBinder.Eval(Container.DataItem,"Rate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Trade_Date" HeaderText="Ngày H.đồng" SortExpression="Value">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="8%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Value_Date" HeaderText="Ngày G.trị" SortExpression="Value">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                            </Columns>
                                        </C1WebGrid:C1WebGrid>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                    <%--</ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="tick" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" colspan="2">
               <%-- <asp:UpdatePanel ID="PanelHoanTat" runat="server">
                    <ContentTemplate>--%>
                        <table style="width: 100%">
                            <tr>
                                <td align="left" valign="top">
                                    <fieldset class="fieldsetBg">
                                        <legend class="divLegend">Giao dịch chờ duyệt trên T24</legend>
                                        <C1WebGrid:C1WebGrid runat="server" ID="dataCtrlht" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                                            OnItemDataBound="dataCtrl_OnItemDataBound">
                                            <Columns>
                                                <C1WebGrid:C1TemplateColumn>
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="3%" />
                                                    <ItemTemplate>
                                                        <asp:Image runat="server" ID="imgDel" ImageUrl="~/App_Themes/Default/Images/delete.gif"
                                                            Style="cursor: pointer;" ToolTip="Xóa deal" />
                                                        <asp:Image runat="server" ID="imgEdit" ImageUrl="~/App_Themes/Default/Images/EditOrderItem.gif"
                                                            Style="cursor: pointer;" ToolTip="chỉnh sửa deal" />
                                                        <asp:Image runat="server" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                                            ToolTip="Xem chi tiết" ID="imgView" Style="cursor: pointer;" />
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="FinishedDate" HeaderText="Ngày" SortExpression="Value"
                                                    DataFormatString="{0:dd/MM/yyyy HH:mm:ss}">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="9%" />
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="FX.ID">
                                                    <ItemStyle HorizontalAlign="Left" Width="7%" />
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="TxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"TxnFxID")%>'></asp:Label><br />
                                                        <asp:Label EnableViewState="false" runat="server" ID="T24InternalDeal" Text='<%# DataBinder.Eval(Container.DataItem,"T24InternalDeal")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="PK_FX_DealID" Visible="false">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="PK_FX_DealID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_DealID")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                                            CssClass="lblCaption"></asp:Label>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BASE" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BASE")%>'
                                                            CssClass="lblCaption"></asp:Label>
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
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng M">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="Đồng B">
                                                    <ItemStyle HorizontalAlign="Center" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="CCY_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Mua">
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_BUY")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="KL Bán">
                                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="AMT_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_SELL")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="PA" HeaderText="PA" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="9%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1BoundColumn DataField="RA" HeaderText="RA" SortExpression="Value" DataFormatString="{0:#,0.00}">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="9%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1TemplateColumn HeaderText="T.giá">
                                                    <ItemStyle HorizontalAlign="Right" Width="6%" />
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                    <ItemTemplate>
                                                        <asp:Label EnableViewState="false" runat="server" ID="Rate" Text='<%# DataBinder.Eval(Container.DataItem,"Rate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </C1WebGrid:C1TemplateColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Trade_Date" HeaderText="Ngày H.đồng" SortExpression="Value">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="8%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                                <C1WebGrid:C1BoundColumn DataField="Value_Date" HeaderText="Ngày G.trị" SortExpression="Value">
                                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </C1WebGrid:C1BoundColumn>
                                            </Columns>
                                        </C1WebGrid:C1WebGrid>
                                    </fieldset>
                                </td>
                            </tr>
                        </table>
                   <%-- </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="tick" />
                    </Triggers>
                </asp:UpdatePanel>--%>
            </td>
        </tr>
    </table>


    

    <script language="javascript" type="text/javascript">
        var _intervalID;
       

        $(document).ready(function () {
            dohandler('d');
            //notifications.client.updateDeals = function (data) {
            //    window.location.reload(true);
            //}
            //notifications.client.refreshForm = function (data) {
            //    window.location.reload(true);
            //}
        });
       

        function dohandler(act) {
           
            _intervalID = window.setInterval(updatetick, 1000);
        }

        function updatetick() {
            $(".lblTinVan2").each(function () {
                ctl = new String($(this).html());
                id = new String($(this).attr("id"));
                ctl--;
                if (ctl < 1) {
                    id_status = id.replace('TimeDown', 'Status');
                    $("#" + id).removeClass('lblTinVan2');
                    $("#" + id).text('Expired');
                    id_link = id.replace('TimeDown', 'lnkAccept');
                    $("#" + id_link).css("display", "none")
                    $("#" + id.replace('_TimeDown', '')).css("color", "red")
                } else {
                    $("#" + id).text(ctl);
                }
            });
        }

        function createTicket(fxid, dealid) {
            var url = "ProcessCancelDeal.aspx?dealid=" + dealid;
            opendetail(url, 'cancel');
        }
        function finishDeal(dealid, rid, txntype, objectype) {
            var url;
            if (objectype == "DIRECT SALES" || objectype == "FI") {
                url = "CreateDeal.aspx";
            } else {
                url = "opennewdeal.aspx";
            }
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
                        $("#" + rid).hide();
                        if (objectype == "CASH") {
                            alert('Đã xác nhận thành công');
                        } else
                            opendetail("opendealcustomer.aspx?dealid=" + dealid + "&txntype=" + txntype, 'cu');
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }

        function finishDealOP(dealid, rid, obtype) {
            var url;
            if (obtype == "OPS") {
                url = "../fxoption/FXOptionSell.aspx";
            } else {
                url = "../fxoption/FXOptionBuy.aspx";
            }

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
                        $("#" + rid).hide();
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }

        function AcceptRejectDeal(PK, type) {
            opendetail("AcceptRejectDeal.aspx?auto=F&dealid=" + PK + "&txntype=" + type, "customer");
        }

        function HoiGiaLai(PK, type) {
            var url = "DealInToday.aspx";

            var query = "act=hoilai";
            query += "&dealid=" + PK;
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage == "") {
                        alert('Đã chuyển tới Dealer để post lại giá hủy');
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }

        function EditCustomer(pk_dealid, txnType) {
            var url = "opendealcustomer.aspx?act=edit&dealid=" + pk_dealid + "&txntype=" + txnType;
            opendetail(url, "edit");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
