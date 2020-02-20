<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="WBSC_Enq.aspx.cs" Inherits="VPB_FX.Modules.DMS.WBSC_Enq" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2, Version=2.1.20082.117, Culture=neutral, PublicKeyToken=589f1fc067ff4031" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap.min.css"></link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-datetimepicker.css">
    </link>
    <%--<script language="javascript" type="text/javascript" src="../../Javascript/jquery.min.js"></script>--%>
    <script language="javascript" type="text/javascript" src="../../Javascript/jquery.min.getvalue.js"></script>
    <%--<script language="javascript" type="text/javascript" src="../../Javascript/bootstrap.js" ></script>--%>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap-datetimepicker.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap-datepicker.js"></script>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-multiselect.css">
    </link>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap-multiselect.js"></script>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                Ngày giao dịch từ &nbsp</label>
            <div class="col-sm-10">
                <input type="text" id="TxtFromTrade" runat="server" placeholder="DD/MM/YYYY" />
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                Đến&nbsp</label>
            <div class="col-sm-10">
                <input type="text" id="TxtToTrade" runat="server" placeholder="DD/MM/YYYY" />
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                Ngày giá trị từ &nbsp</label>
            <div class="col-sm-10">
                <input type="text" id="TxtFromValue" runat="server" placeholder="DD/MM/YYYY" />
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                đến &nbsp</label>
            <div class="col-sm-10">
                <input type="text" id="TxtToValue" runat="server" placeholder="DD/MM/YYYY" />
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                CCY&nbsp</label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" ID="drCCYB" SkinID="DropDownList">
                </asp:DropDownList>
                &nbsp;/&nbsp;<asp:DropDownList runat="server" ID="drCCYM" SkinID="DropDownList">
                </asp:DropDownList>
            </div>
            <div>
            </div>
            <div>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                ID FXT24</label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="FXHO" SkinID="TextBox"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                FX transtype
            </label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="transtype" SkinID="TextBox"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                Loại giao dịch</label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" ID="objecttype">
                    <asp:ListItem Value="ALL" Text="--Tất cả --"></asp:ListItem>
                    <asp:ListItem Value="SP" Text="Spot"></asp:ListItem>
                    <asp:ListItem Value="FW" Text="Forward"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                Mục đích
            </label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" SkinID="DropDownList" ID="cboMucdich">
                    <asp:ListItem Value="" Text="Tất cả"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                CIF khách hàng
            </label>
            <div class="col-sm-10">
                <asp:TextBox runat="server" ID="CIF" SkinID="TextBox"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                Trạng thái giao dịch</label>
            <div class="col-sm-10">
                <asp:DropDownList runat="server" ID="cboTrangthai">
                    <%-- <asp:ListItem Value="All" Text="--Tất cả--"></asp:ListItem>
                    <asp:ListItem Value="16" Text="Thành công"></asp:ListItem>
                    <asp:ListItem Value="256" Text="Hủy"></asp:ListItem>
                    <asp:ListItem Value="NONE" Text="Chưa thực hiện KH"></asp:ListItem>--%>
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">
                Đơn vị &nbsp
            </label>
            <div class="col-sm-12">
                <asp:ListBox ID="cboChiNhanh" runat="server" SelectionMode="Multiple"></asp:ListBox>
            </div>
        </div>
    </div>
    <div class="form-horizontal">
        <div class="btn-group">
            <div class="col-sm-2 control-label">
            </div>
            <asp:Button runat="server" class="btn btn-primary active" ID="btnReport" Text="Xuất báo cáo" />
        </div>
    </div>
    <table width="100%">
        <tr>
            <td>
                <fieldset class="fieldsetBg">
                    <legend class="divLegend">Danh sách giao dịch</legend>
                    <table class="Table" style="width: 100%">
                        <tr>
                            <td>
                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SaoKe_SPFW"
                                    TypeName="DataSource">
                                    <SelectParameters>
                                        <asp:Parameter Name="FTrade" Type="String" />
                                        <asp:Parameter Name="TTrade" Type="String" />
                                        <asp:Parameter Name="FValue" Type="String" />
                                        <asp:Parameter Name="TValue" Type="String" />
                                        <asp:Parameter Name="Pair" Type="String" />
                                        <asp:Parameter Name="dealid" Type="String" />
                                        <asp:Parameter Name="type" Type="String" />
                                        <asp:Parameter Name="fxho" Type="String" />
                                        <asp:Parameter Name="cif" Type="String" />
                                        <asp:Parameter Name="company" Type="String" />
                                        <asp:Parameter Name="segment" Type="string" />
                                        <asp:Parameter Name="Purpose" Type="string" />
                                        <asp:Parameter Name="status" Type="string" />
                                        <asp:Parameter Name="roleID" Type="string" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" DataSourceID="ObjectDataSource1"
                                    OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound">
                                    <Columns>
                                        <C1WebGrid:C1TemplateColumn>
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="7%" />
                                            <ItemTemplate>
                                                <asp:Image runat="server" ID="imgView" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                                    Style="cursor: pointer;" ToolTip="Xem chi tiết" />
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="PK_FX_DealID" Visible="false">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="PK_FX_DealID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_FX_DealID")%>'
                                                    CssClass="lblCaption"></asp:Label>
                                                <asp:Label runat="server" ID="sprdMHO" Text='<%# DataBinder.Eval(Container.DataItem,"SPRDM HO")%>'
                                                    CssClass="lblCaption"></asp:Label>
                                                <asp:Label runat="server" ID="sprdBHO" Text='<%# DataBinder.Eval(Container.DataItem,"SPRDB HO")%>'
                                                    CssClass="lblCaption"></asp:Label>
                                                <asp:Label runat="server" ID="sprdMKH" Text='<%# DataBinder.Eval(Container.DataItem,"SPRDM CUST")%>'
                                                    CssClass="lblCaption"></asp:Label>
                                                <asp:Label runat="server" ID="sprdBKH" Text='<%# DataBinder.Eval(Container.DataItem,"SPRDB CUST")%>'
                                                    CssClass="lblCaption"></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="G.dịch">
                                            <ItemStyle HorizontalAlign="Center" Width="8%" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label EnableViewState="false" runat="server" ID="type" Text='<%# DataBinder.Eval(Container.DataItem,"Loại giao dịch")%>'></asp:Label>&nbsp;
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="M/B">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="Buy_Or_Sell" Text='<%# DataBinder.Eval(Container.DataItem,"Chiều giao dịch")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Đồng cơ sở">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="CCY_Base" Text='<%# DataBinder.Eval(Container.DataItem,"Base CCY")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Đồng term">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="CCY_Term" Text='<%# DataBinder.Eval(Container.DataItem,"Term CCY")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Ngày hợp đồng">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="DEAL_DATE" Text='<%# DataBinder.Eval(Container.DataItem,"DEAL DATE")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Ngày giá trị">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="VALUE_DATE" Text='<%# DataBinder.Eval(Container.DataItem,"VALUE DATE")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1BoundColumn DataField="ID FX ĐVKD-HO" HeaderText="FX HO" SortExpression="Value"
                                            Visible="false">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="FX_FO HO rate" HeaderText="Tỷ giá (HO)" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Sprd HO">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="sprdho"></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1BoundColumn DataField="ID FX ĐVKD-KH" HeaderText="FX KH" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="FX_FO Customer rate" HeaderText="Tỷ giá (KH)"
                                            SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="sprd KH">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="sprdkh"></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="CIF">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="CIF" Text='<%# DataBinder.Eval(Container.DataItem,"CIF")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1BoundColumn DataField="Customer Name" HeaderText="Tên KH" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="Base amount" HeaderText="Base amount" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="Term amount" HeaderText="Term amount" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="FX_FO TOI (NGUYÊN TỆ)" HeaderText="Pnl" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="Trạng thái" HeaderText="Trạng thái" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1BoundColumn DataField="Người tạo" HeaderText="Người tạo" SortExpression="Value">
                                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </C1WebGrid:C1BoundColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Mục địch">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="Purpose" Text='<%# DataBinder.Eval(Container.DataItem,"Mục đích")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="PD Ngoại lệ">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblPDNL" Text='<%# DataBinder.Eval(Container.DataItem,"PDNL")%>'></asp:Label>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                    </Columns>
                                </C1WebGrid:C1WebGrid>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td align="center">
                <asp:Button runat="server" SkinID="PrintReportButton" Width="80px" ID="btnExport"
                    OnClick="btnReport_Click" />
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        var selected;
        $(document).ready(function () {
            if (Qry["cn"] == undefined) {
                selected = '<%=_m_groupname %>';
            } else if (Qry["cn"] != "") {
                selected = Qry["cn"];
                var ar = selected.split(',');
                var i = 0, size = ar.length;
                for (i; i < size; i++) {
                    // filter the options with the specific value and select them
                    if (ar[i] != "")
                        $("#ctl00_FormContent_cboChiNhanh option[value='" + ar[i] + "']").attr("selected", 1);
                }
            }
            $('#ctl00_FormContent_TxtFromTrade').datepicker({
                format: "dd/mm/yyyy",
                isRTL: false,
                autoclose: true
            });

            $('#ctl00_FormContent_TxtToTrade').datepicker({
                format: "dd/mm/yyyy",
                isRTL: false,
                autoclose: true
            });

            $('#ctl00_FormContent_TxtFromValue').datepicker({
                format: "dd/mm/yyyy",
                isRTL: false,
                autoclose: true
            });

            $('#ctl00_FormContent_TxtToValue').datepicker({
                format: "dd/mm/yyyy",
                isRTL: false,
                autoclose: true
            });
            $('#ctl00_FormContent_TxtFromTrade').datepicker('update', new Date());
            $('#ctl00_FormContent_TxtToTrade').datepicker('update', new Date());
            $('#<%=cboChiNhanh.ClientID%>').multiselect({
                nonSelectedText: 'Chọn chi nhánh',
                maxHeight: 400,
                onDropdownShow: function (event) {
                    $(this).closest('select').css('width', '700px')
                },
                onChange: function (element, checked) {
                    var brands = $('#ctl00_FormContent_cboChiNhanh option:selected');
                    selected = '';
                    var selecteds = [];
                    $(brands).each(function (index, brand) {
                        selecteds.push([$(this).val()]);
                    });
                    selected = selecteds;
                }
            });

        });



        function ViewItem(pk_fx, type, object) {
            if (object == "DIRECT SALES" || object == "FI") {
                opendetail("../fxsales/CreateDeal.aspx?act=see&dealid=" + pk_fx + "&txntype=" + type + "&objtype=" + object, "viewitem");
            } else {
                opendetail("../dms/opennewdeal.aspx?act=see&dealid=" + pk_fx + "&txntype=" + type + "&objtype=" + object, "viewitem");
            }
        }
        function report() {
            var FromTrade = GetValue("ctl00_FormContent_TxtFromTrade");
            var ToTrade = GetValue("ctl00_FormContent_TxtToTrade");
            var FromValue = GetValue("ctl00_FormContent_TxtFromValue");
            var ToValue = GetValue("ctl00_FormContent_TxtToValue");
            var objecttype = GetValue("ctl00_FormContent_objecttype");
            var company = selected; // GetValue("ctl00_FormContent_cboChiNhanh");
            var Purpose = GetValue("ctl00_FormContent_cboMucdich");
            var status = GetValue("ctl00_FormContent_cboTrangthai");
            var CCYPair;
            if (GetValue("ctl00_FormContent_drCCYB") != "" && GetValue("ctl00_FormContent_drCCYM") != "") {
                CCYPair = GetValue("ctl00_FormContent_drCCYB") + GetValue("ctl00_FormContent_drCCYM"); ;
            } else if (GetValue("ctl00_FormContent_drCCYB") == "" && GetValue("ctl00_FormContent_drCCYM") == "") {
                CCYPair = "";
            } else {
                if ((GetValue("ctl00_FormContent_drCCYB") == "" || GetValue("ctl00_FormContent_drCCYM") == "")) {
                    alert('Hãy lựa chọn cặp đồng tiền');
                    return false;
                }
            }

            var CIF = GetValue("ctl00_FormContent_CIF");
            var FXHO = GetValue("ctl00_FormContent_FXHO");
            var transtype = GetValue("ctl00_FormContent_transtype");
            if (FromTrade == "") {
                if (ToTrade != "") {
                    alert('Hãy lựa chọn ngày giao dịch cần truy vấn');
                    return false;
                }
            } else if (FromTrade != "") {
                if (ToTrade == "") {
                    alert('Hãy lựa chọn ngày giao dịch cần truy vấn');
                    return false;
                }
            } else if (FromValue == "") {
                if (ToToValue != "") {
                    alert('Hãy lựa chọn ngày giao dịch cần truy vấn');
                    return false;
                }
            } else {
                if (ToValue == "") {
                    alert('Hãy lựa chọn ngày giao dịch cần truy vấn');
                    return false;
                }
            }
            if (FromTrade == "" && ToTrade == "" && FromValue == "" && ToValue == "") {
                alert('Hãy lựa chọn ngày giao dịch/ngày giá trị cần truy vấn');
                return false;
            }
            
            //segment = segment.toString().replace(',', "'',''");
            var url = "WBSC_Enq.aspx";
            var query = "act=report";
            query += "&status=" + status;
            query += "&fromTrade=" + FromTrade + "&toTrade=" + ToTrade;
            query += "&fromValue=" + FromValue + "&toValue=" + ToValue;
            query += "&CCYPair=" + CCYPair + "&dealid=" + transtype + "&FXHO=" + FXHO + "&cn=" + company + "&type=" + objecttype + "&cif=" + CIF + "&Purpose=" + Purpose;
            
            window.location.href = url + "?" + query;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
