<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ListdealForDealer.aspx.cs" Inherits="VPB_FX.Modules.DMS.ListdealForDealer" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2, Version=2.1.20082.117, Culture=neutral, PublicKeyToken=589f1fc067ff4031" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap.min.css"></link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-datetimepicker.css">
    </link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-responsive.css">
    </link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-responsive.min.css">
    <%--<script language="javascript" type="text/javascript" src="../../Javascript/jquery.min.js"></script>--%>
    <script language="javascript" type="text/javascript" src="../../Javascript/jquery.min.getvalue.js"></script>
    <%--<script language="javascript" type="text/javascript" src="../../Javascript/bootstrap.js" ></script>--%>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap-datetimepicker.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap-datepicker.js"></script>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-multiselect.css">
    </link>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap-multiselect.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/jquery.dataTables.min.js"></script>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h6 class="panel-title">
                Thông tin tìm kiếm</h6>
        </div>
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
    </div>
   
    <script language="javascript" type="text/javascript">
        var selected;
        $(document).ready(function () {
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
            $('#ctl00_FormContent_TxtFromTrade').datepicker('update', new Date());
            $('#ctl00_FormContent_TxtToTrade').datepicker('update', new Date());
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
