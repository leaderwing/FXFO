<%@ Page Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ListDeal.aspx.cs" Inherits="VPB_FX.Modules.DMS.ListDeal" Title="Untitled Page" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg2">
        <legend class="divLegend">&nbsp;Thông tin tìm kiếm&nbsp;</legend>
        <table width="100%">
            <tr>
                <td style="width: 80px">Segment
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="cboSegment">
                    </asp:DropDownList>
                </td>
                <td>CIF : </td>
                <td>
                    <asp:TextBox runat="server" ID="txtCif"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Deal.Date từ:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtDealFrom" SkinID="TextBoxDate"></asp:TextBox>

                    &nbsp;&nbsp; &nbsp;&nbsp;đến: &nbsp;&nbsp;
                
                    <asp:TextBox runat="server" ID="txtDealTo" SkinID="TextBoxDate"></asp:TextBox>
                </td>
                <td>FX.ID : </td>
                <td>
                    <asp:TextBox runat="server" ID="txtFxid"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Value.Date từ:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtValueFrom" SkinID="TextBoxDate"></asp:TextBox>

                    &nbsp;&nbsp; &nbsp;&nbsp;đến: &nbsp;&nbsp;
                
                    <asp:TextBox runat="server" ID="txtValueTo" SkinID="TextBoxDate"></asp:TextBox>
                </td>
                <td>Deal.Type : </td>
                <td>
                    <asp:DropDownList runat="server" ID="cboType" SkinID="DropDownList">
                        <asp:ListItem Value="SP" Text="SPOT"></asp:ListItem>
                        <asp:ListItem Value="FW" Text="FORWARD"></asp:ListItem>
                        <asp:ListItem Value="SW" Text="SWAP"></asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 80px">Cặp CCY
                </td>
                <td colspan="3">
                    <asp:DropDownList runat="server" ID="drCCYB" SkinID="DropDownList">
                    </asp:DropDownList>
                    &nbsp;/&nbsp;<asp:DropDownList runat="server" ID="drCCYM" SkinID="DropDownList">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 80px">UserID
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtUser" SkinID="TextBox"></asp:TextBox>
                </td>
                <td style="width: 80px">Xếp hạng
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="cboRank" SkinID="DropDownList">
                        <asp:ListItem Value="" Text="--Tất cả--"></asp:ListItem>
                        <asp:ListItem Value="GOLD" Text="GOLD"></asp:ListItem>
                        <asp:ListItem Value="PLATINUM" Text="PLATINUM"></asp:ListItem>
                        <asp:ListItem Value="SILVER" Text="SILVER"></asp:ListItem>
                        <asp:ListItem Value="DIAMOND" Text="DIAMOND"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 80px">Trạng thái
                </td>
                <td colspan="3">
                    <asp:DropDownList runat="server" ID="drStatus">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 80px"></td>
                <td colspan="3">
                    <asp:Button runat="server" ID="btnSearch" SkinID="SearchButton" OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Danh sách giao dịch</legend>
        <table class="Table" style="width: 100%">
            <tr>
                <td>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListDealNew"
                        TypeName="DataSource">
                        <SelectParameters>
                            <asp:Parameter Name="GROUPNAME" Type="String" />
                            <asp:Parameter Name="Condition" Type="String" />

                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" DataSourceID="ObjectDataSource1"
                        OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound">
                        <Columns>
                            <C1WebGrid:C1TemplateColumn>
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="7%" />
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgDel" ImageUrl="~/App_Themes/Default/Images/delete.gif"
                                        Style="cursor: pointer;" ToolTip="Xóa deal" />
                                    <asp:Image runat="server" ID="imgEdit"
                                        ImageUrl="~/App_Themes/Default/Images/EditOrderItem.gif" Style="cursor: pointer;"
                                        ToolTip="Điều chỉnh deal" />
                                    |
                                    <asp:Image runat="server" ID="imgView" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                        Style="cursor: pointer;" ToolTip="Xem chi tiết" />
                                    <asp:Image runat="server" ID="backdate" ImageUrl="~/App_Themes/Default/Images/delete.gif"
                                        Style="cursor: pointer;" ToolTip="hủy deal backdate" />
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1BoundColumn DataField="Key_t24" HeaderText="Legal Transtype">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" Width="4%" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="FX.ID HO/CN">
                                <ItemStyle HorizontalAlign="Left" Width="30px" />
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="FxID"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="PK_FX_DealID" Visible="false">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="PK_FX_DealID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_DealID")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="CCY_BASE" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BASE")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="CCY_TERM" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_TERM")%>'
                                        CssClass="lblCaption"></asp:Label>
                                    <asp:Label runat="server" ID="Status" Text='<%# DataBinder.Eval(Container.DataItem,"Status")%>'></asp:Label>
                                    <asp:Label runat="server" ID="TxnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>
                                     <asp:Label runat="server" ID="OptionStart" Text='<%# DataBinder.Eval(Container.DataItem,"OptionStart")%>'></asp:Label>
                                    <asp:Label runat="server" ID="ObjectType" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'></asp:Label>
                                    <asp:Label runat="server" ID="FinishedDate" Text='<%# DataBinder.Eval(Container.DataItem,"FinishedDate")%>'></asp:Label>
                                    <asp:Label runat="server" ID="T24InternalDeal" Text='<%# DataBinder.Eval(Container.DataItem,"T24InternalDeal")%>'></asp:Label>
                                    <asp:Label runat="server" ID="TxnFxID" Text='<%# DataBinder.Eval(Container.DataItem,"TxnFxID")%>'></asp:Label>
                                    <asp:Label runat="server" ID="CreatedUser" Text='<%# DataBinder.Eval(Container.DataItem,"CreatedUser")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1BoundColumn DataField="Description" HeaderText="Tên CN" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="G.dịch">
                                <ItemStyle HorizontalAlign="Center" Width="8%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label EnableViewState="false" runat="server" ID="type" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>&nbsp;
                                    <asp:Label EnableViewState="false" runat="server" ID="object" Text='<%# DataBinder.Eval(Container.DataItem,"ObjectType")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="M/B">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Buy_Or_Sell" Text='<%# DataBinder.Eval(Container.DataItem,"Buy_Or_Sell")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Đồng M">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CCY_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_BUY")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Đồng B">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CCY_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"CCY_SELL")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="KL Mua">
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="AMT_BUY" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_BUY")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="KL Bán">
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="AMT_SELL" Text='<%# DataBinder.Eval(Container.DataItem,"AMT_SELL")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1BoundColumn DataField="PA" HeaderText="PA" SortExpression="Value" DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="RA" HeaderText="RA" SortExpression="Value" DataFormatString="{0:#,0}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Tỷ giá">
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Rate" Text='<%# DataBinder.Eval(Container.DataItem,"Rate")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Ngày H.đồng">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Trade_Date" Text='<%# DataBinder.Eval(Container.DataItem,"Trade_Date")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Ngày G.trị">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Value_Date" Text='<%# DataBinder.Eval(Container.DataItem,"Value_Date")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>

                            <C1WebGrid:C1BoundColumn DataField="USDVND" HeaderText="USDVND" SortExpression="Value"
                                DataFormatString="{0:#,0.00}">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="CreatedUser" HeaderText="Người tạo " SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1BoundColumn DataField="timefinished" HeaderText="Giờ G.dịch" SortExpression="Value">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </C1WebGrid:C1BoundColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Trạng thái">
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="StatusFX"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                        </Columns>
                    </C1WebGrid:C1WebGrid>
                </td>
            </tr>
        </table>
    </fieldset>
    <div id="frmCancelBackdate" style="display: none; cursor: hand; ">
        <table style="width: 100%" cellspacing="0">
            <tr class="TableHeader">
                <td id="tdComment" colspan="" style="color: white; width: 885px;">Chọn phương thức hủy
                </td>
                <td colspan="" align="right" valign="top">
                    <img title="close" alt="" src="../../Images/set3/24/Close.png" style="cursor: pointer; width: 22px; height: 22px"
                        onclick="{$.unblockUI();}" />
                </td>
            </tr>
        </table>
        <div >
            <table style="width: 100%">
                <tr>
                    <td style="width: 96px" class="lblCaption" align="left">

                        <input type="radio" id="full" name="drone" value="full" checked="checked" />
                        <input type="hidden" id="pk_deal" />
                        <label for="full">Hủy deal</label>

                    </td>
                </tr>
                <tr>
                    <td style="width: 96px" class="lblCaption" align="left">

                        <input type="radio" id="change" name="drone" value="change"
                             />
                        <label for="change">Đổi kỳ hạn</label>

                    </td>
                </tr>
                <tr>
                    <td style="width: 96px">&nbsp;
                    </td>
                    <td align="left">
                        <asp:Button runat="server" ID="btnChange" CssClass="Button" Text="Chọn" OnClientClick="{CancelType();return false;}" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script language="javascript" type="text/javascript">
        function createTicket(fxid, dealid) {
            var url = "ProcessCancelDeal.aspx?dealid=" + dealid;
            popup(url);
        }
        function Do_Search() {
            var fxid = GetValue("ctl00_FormContent_textSearchDeal");
            var date = GetValue("ctl00_FormContent_txtDate");
            var url = "ListDeal.aspx?act=search&d=" + date + "&pk_deal=" + fxid;
            window.location = url;

        }

        function AcceptCB(fxid) {

            if (!confirm('Bạn đồng cân bằng cho giao dịch này không ?'))
                return false;
            var url = "ListDeal.aspx";
            var query = "act=accept&pk_deal=" + fxid;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    if (errormessage == "") {
                        alert('giao dịch đã được cân bằng');
                    }
                    else {
                        alert(errormessage);
                    }
                    window.location.reload(true);
                }
            });

        }
        function EditCustomer(pk_dealid, txnType) {
            var url;
            if (txnType == "SW") {
                url = "../fxswap/SwapOpenDeal.aspx?act=edit&dealid=" + pk_dealid + "&txnType=" + txnType;
            }
            else
                url = "opendealcustomer.aspx?act=edit&dealid=" + pk_dealid + "&txnType=" + txnType;
            opendetail(url, "edit");
        }
        function ShowOption(pk_dealid) {
            $('#pk_deal').val(pk_dealid)
            $.blockUI({
                message: $('#frmCancelBackdate'),
                css: {
                    top: '10%',
                    left: '30%',
                    width: '30%',
                    height: '30%'
                }
            });
        }

        function CancelType() {
            if (!confirm('Bạn có chắc chắn muốn hủy giao dịch không?')) {
                $.unblockUI();
                return false;
            }
            $.unblockUI();
            var url = "";//"ProcessCancelDeal.aspx?isBack=true&dealid=" + $('#pk_deal').val() + "&type=" + $('input[name=drone]:checked').val();
            var type = $('input[name=drone]:checked').val();            
            if (type == "change") {
                url = "CancelBackdate.aspx?txntype=FW&isBack=true&dealid=" + $('#pk_deal').val() + "&type=" + $('input[name=drone]:checked').val();
            } else {
                url = "ProcessCancelDeal.aspx?isBack=true&dealid=" + $('#pk_deal').val() + "&type=" + $('input[name=drone]:checked').val();
            }
            popup(url);
                          
        }

        function CancelSwap(fxid, dealid) {
            var url = "../fxswap/TicketInfoSW.aspx?fx=" + fxid + "&deal=" + dealid;
            popup(url);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
