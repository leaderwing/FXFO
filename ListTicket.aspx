<%@ Page Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ListTicket.aspx.cs" Inherits="VPB_FX.Modules.DMS.ListTicket" Title="Untitled Page" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">&nbsp;Danh sách giao dịch hủy SP/FW</legend>
        <table class="Table" style="width: 100%">
            <tr>
                <td>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListTicket"
                        TypeName="DataSource">
                        <SelectParameters>
                            <asp:Parameter Name="CreateUser" Type="String" />
                            <asp:Parameter Name="TxnType" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" DataSourceID="ObjectDataSource1"
                        OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound"
                        GroupIndent="30">
                        <Columns>
                            <C1WebGrid:C1BoundColumn HeaderText="" DataField="statusName" Visible="false" AllowSizing="true">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="10%" />
                                <GroupInfo Position="Header" OutlineMode="StartCollapsed" HeaderText="{0}" HeaderStyle-CssClass="GridHeader"
                                    HeaderStyle-ForeColor="Black" GroupSingleRow="true">
                                </GroupInfo>
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="6%" />
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgEdit" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                        Style="cursor: pointer;" ToolTip="Xem ticket" /> |
                                    <asp:Image runat="server" ID="imgAccept" ImageUrl="~/App_Themes/Default/Images/duyet.gif"
                                        Style="cursor: pointer;" ToolTip="Xem ticket" />
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn Visible="false">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="PK_FX_TicketID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_TicketID")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="Trade_Date" Text='<%# DataBinder.Eval(Container.DataItem,"Trade_Date")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="PK_FX_DealID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_DealID")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="status" Text='<%# DataBinder.Eval(Container.DataItem,"status")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="Additiondata1" Text='<%# DataBinder.Eval(Container.DataItem,"Additiondata1")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="txnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'
                                        CssClass="lblCaption"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="STT">
                                <ItemStyle HorizontalAlign="Center" Width="4%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="STT"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="FX.ID" Visible="true">
                                <ItemStyle HorizontalAlign="Center" Width="6%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="lblTxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"TxnFxID")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn>
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="FXReject" EnableViewState="false"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1BoundColumn DataField="CIF" HeaderText="CIF KH" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="Ngày gửi yêu cầu" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="CreatedUser" HeaderText="Người gửi yêu cầu" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="UpdatedUser" HeaderText="Người xử lý" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="CCY_Base" HeaderText="CCY cơ sơ" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="CCY_TERM" HeaderText="CCY term" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="Buy_or_Sell" HeaderText="Chiều GD" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="Amt" HeaderText="Khối lượng" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="Rate" HeaderText="Tỷ giá gốc" SortExpression="Value"
                                DataFormatString="{0:#,0.0000}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="sprd" HeaderText="sprd" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Tỷ giá hủy">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RateReject" EnableViewState="false" Text=''></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="sprd hủy ">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="sprdHuy" EnableViewState="false" Text=''></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                        </Columns>
                    </C1WebGrid:C1WebGrid>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg" runat="server" id="TicketNotSend">
        <legend class="divLegend">&nbsp;Danh sách giao dịch hủy SW&nbsp;</legend>
        <table class="Table" style="width: 100%">
            <tr>
                <td>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="getListTicket"
                        TypeName="DataSource">
                        <SelectParameters>
                            <asp:Parameter Name="CreateUser" Type="String" />
                            <asp:Parameter Name="TxnType" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <C1WebGrid:C1WebGrid runat="server" ID="dataCtrlSW" Width="100%" DataSourceID="ObjectDataSource2"
                        OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrlSW_OnItemDataBound">
                        <Columns>
                            <C1WebGrid:C1BoundColumn HeaderText="" DataField="statusName" Visible="false" AllowSizing="true">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="10%" />
                                <GroupInfo Position="Header" OutlineMode="StartCollapsed" HeaderText="{0}" HeaderStyle-CssClass="GridHeader"
                                    HeaderStyle-ForeColor="Black" GroupSingleRow="true">
                                </GroupInfo>
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="6%" />
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgEdit" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                        Style="cursor: pointer;" ToolTip="Xem ticket" />
                                     <asp:Image runat="server" ID="imgAccept" ImageUrl="~/App_Themes/Default/Images/duyet.gif"
                                        Style="cursor: pointer;" ToolTip="Xem ticket" />
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn Visible="false">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="PK_FX_TicketID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_TicketID")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="Trade_Date" Text='<%# DataBinder.Eval(Container.DataItem,"Trade_Date")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="CCY_Base" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_Base")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="PK_FX_DealID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_DealID")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="status" Text='<%# DataBinder.Eval(Container.DataItem,"status")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="AdditionalInfo" Text='<%# DataBinder.Eval(Container.DataItem,"AdditionalInfo")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="Additiondata1" Text='<%# DataBinder.Eval(Container.DataItem,"Additiondata1")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="txnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'
                                        CssClass="lblCaption"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="STT">
                                <ItemStyle HorizontalAlign="Center" Width="4%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="STT"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="FX.ID" Visible="true">
                                <ItemStyle HorizontalAlign="Center" Width="6%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TxnFxID" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem,"TxnFxID")%>'></asp:Label>
                                    <asp:Label runat="server" ID="lblFX"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="FX hủy ">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="FXReject" EnableViewState="false" Text=''></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1BoundColumn DataField="CIF" HeaderText="CIF KH" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="CreatedUser" HeaderText="Người gửi yêu cầu" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Người xử lý ">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="UpdatedUser" EnableViewState="false" Text='<%# DataBinder.Eval(Container.DataItem,"UpdatedUser")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1BoundColumn DataField="CCY_Base" HeaderText="CCY cơ sơ" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="CCY_TERM" HeaderText="CCY term" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="Amt" HeaderText="Khối lượng" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="RateSW1" HeaderText="Tỷ giá Swap 1" SortExpression="Value"
                                DataFormatString="{0:#,0.0000}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="RateSW2" HeaderText="Tỷ giá Swap 2" SortExpression="Value"
                                DataFormatString="{0:#,0.0000}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="PA1" HeaderText="PA swap 1" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="RA1" HeaderText="RA swap 1" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="PA2" HeaderText="PA swap 2" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="RA2" HeaderText="RA swap 2" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="Buy_or_Sell_SW" HeaderText="Chiều GD" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Tỷ giá hủy Swap 1">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RateReject1" EnableViewState="false" Text=''></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="sprd hủy Swap 1">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="sprdHuy1" EnableViewState="false" Text=''></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Tỷ giá hủy Swap 2">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RateReject2" EnableViewState="false" Text=''></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="sprd hủy Swap 2">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="sprdHuy2" EnableViewState="false" Text=''></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                        </Columns>
                    </C1WebGrid:C1WebGrid>
                </td>
            </tr>
        </table>
    </fieldset>
    <script language="javascript" type="text/javascript">
        function SeeTicket(objtype, txntype, dealid) {
            var url;
            if (objtype == "DIRECT SALES" || objtype == "FI") {
                url = "../fxsales/CreateDeal.aspx?act=see&dealid=" + dealid + "&txntype=" + txntype + "&objtype=" + objtype;
            } else {
                url = "opennewdeal.aspx?act=see&objtype=" + objtype + "&txntype=" + txntype + "&dealid=" + dealid;
            }
            opendetail(url, "viewHuy");
        }

        function DeleteTicket(objTicket, objFxID) {

            if (!confirm('Bạn có chắc muốn xóa ticket này không ?'))
                return false;

            $.ajax({
                type: "POST",
                url: "ListTicket.aspx",
                data: "act=Del&ticketid=" + objTicket + "&fxid=" + objFxID,
                success: function (errormessage) {
                    if (errormessage == "") {
                        alert('Đã xóa ticket');
                    }
                    else {
                        alert(errormessage);
                    }
                    window.location.reload(true);
                }
            });

        }

        function Reject(PK, type,backdate) {
            if (type == "SW") {
                opendetail("../fxswap/RejectSwapDeal.aspx?back="+backdate+"&dealid=" + PK + "&txntype=" + type, "customer");
            } else
                opendetail("AcceptRejectDeal.aspx?back=" + backdate + "&dealid=" + PK + "&txntype=" + type, "customer");
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
