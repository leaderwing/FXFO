<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="BOAcceptCancel.aspx.cs" Inherits="VPB_FX.Modules.DMS.BOAcceptCancel" %>
<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<fieldset class="fieldsetBg">
        <legend class="divLegend">&nbsp;Danh sách giao dịch hủy SP/FW</legend>
        <table class="Table" style="width: 100%">
            <tr>
                <td>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListTicketBO"
                        TypeName="DataSource">
                        <SelectParameters>
                           <asp:Parameter Name="Company" Type="String"/>
                           <asp:Parameter Name="roleid" Type="String"/>
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
                                        Style="cursor: pointer;" ToolTip="Xem ticket" Visible="false"  />
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn Visible="false">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="PK_FX_TicketID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_TicketID")%>'
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
                                    <asp:Label runat="server" ID="lblTxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"T24InternalDeal")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn Visible="false">
                                <ItemStyle HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="FXReject" EnableViewState="false" ></asp:Label>
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
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="Amt" HeaderText="Khối lượng" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="Rate" HeaderText="Tỷ giá gốc" SortExpression="Value"
                                DataFormatString="{0:#,0.0000}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="sprd" HeaderText="sprd" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="5%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                           <C1WebGrid:C1BoundColumn DataField="Description" HeaderText="Nội dung hủy" SortExpression="Value"
                                DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="20%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText=" ">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgAuthorize" ImageUrl="~/App_Themes/Default/Images/duyet.gif" style="cursor:hand;" ToolTip="Duyệt bản ghi" />
                                    <asp:Image runat="server" ID="imgReject" ImageUrl="~/App_Themes/Default/Images/delete.gif" style="cursor:hand;" ToolTip="Từ chối" />
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                        </Columns>
                    </C1WebGrid:C1WebGrid>
                </td>
            </tr>
        </table>
    </fieldset>

    <script language="javascript" type="text/javascript">
        function Accept(pk_deal, pk_ticket) {
            if (!confirm('Bạn đồng ý duyệt yêu cầu này không ?'))
                return false;
            var url = "BOAcceptCancel.aspx";
            var query = "act=Acc";
            query += "&ticketid=" + pk_ticket;
            query += "&fxid=" + pk_deal;
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage == "") {
                        alert("Đã duyệt yêu cầu thành công.");
                        window.location.reload();
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }

        function Reject(pk_deal, pk_ticket) {
            if (!confirm('Bạn từ chối duyệt yêu cầu này không ?'))
                return false;
            var url = "BOAcceptCancel.aspx";
            var query = "act=Del";
            query += "&ticketid=" + pk_ticket;
            query += "&fxid=" + pk_deal;
            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    FinishProcessingForm();
                    if (errormessage == "") {
                        alert("Đã từ chối yêu cầu.");
                        window.location.reload();
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }

        function seeticket() {
            function SeeTicket(objtype, txntype, dealid) {
                var url = "opennewdeal.aspx?act=see&objtype=" + objtype + "&txntype=" + txntype + "&dealid=" + dealid;
                opendetail(url, "viewHuy");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
