<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ApprovedRate.aspx.cs" Inherits="VPB_FX.Modules.DMS.ApprovedRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">    
    <div class="panel-body">
        <div class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label text-center ">
                    Tỷ giá bình quân liên ngân hàng do NHNN công bố</label>
                <div class="col-sm-2">
                    <input class="form-control" value="" type="text" runat="server" id="Rate1" readonly />
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label text-center ">
                    Tỷ giá trần của VND so với USD do NHNN công bố</label>
                <div class="col-sm-2">
                    <input class="form-control" value="" type="text" runat="server" id="Rate2" readonly />
                </div>
            </div>
        </div>
        <div class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label text-center ">
                    Tỷ giá sàn của VND so với USD do NHNN công bố</label>
                <div class="col-sm-2">
                    <input class="form-control" value="" type="text" runat="server" id="Rate3" readonly />
                </div>
            </div>
        </div>
    </div>
    <div class="well">
        <div class="tabbable">
            <ul class="nav nav-tabs">
                <li class="active"><a href="ApprovedRate.aspx#original" data-toggle="tab"><i class="icon-accessibility">
                </i>Bảng tỷ giá gốc</a></li>
                <li><a href="ApprovedRate.aspx#currency" data-toggle="tab"><i class="icon-stack"></i>Bảng
                    Currency Rate</a></li>
                <li><a href="ApprovedRate.aspx#cash" data-toggle="tab"><i class="icon-stack"></i>Bảng
                    Cash Exchange Rate</a></li>
            </ul>
            <div class="tab-content with-padding">
                <div class="tab-pane fade in active" id="original">
                    <!-- Begin Tabs Open !-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ApprovedRate.aspx#tab1">
                                    Thông tin tỷ giá gốc</a></h6>
                        </div>
                        <div id="tab1" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="datatable-tools">
                                    <asp:Literal runat="server" ID="update"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Tabs Open !-->
                </div>
                <div class="tab-pane fade" id="currency">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ApprovedRate.aspx#tab11">
                                    Bảng Currency Rate</a></h6>
                        </div>
                        <div id="tab11" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="datatable-tools">
                                    <asp:Literal runat="server" ID="CurrencyRate"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Tabs Open !-->
                </div>
                <div class="tab-pane fade" id="cash">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ApprovedRate.aspx#tab3">
                                    Cash Exchange Rate</a></h6>
                        </div>
                        <div id="tab3" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="datatable-tools">
                                    <asp:Literal runat="server" ID="ExchangeRate"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Tabs Open !-->
                </div>
            </div>
        </div>
    </div>
    <div class="panel-body" style="width: auto; margin: 0 auto">
        <div class="form-horizontal">
            <div class="form-group" align="center">
                <asp:Button ID="btnReject" runat="server" Text="Từ chối" SkinID="RemoveButton" OnClick="RejectData"
                    OnClientClick="return SomeMethod(this.id,'R');" />
                <asp:Button ID="btnSave" runat="server" Text="Duyệt" SkinID="Resolve" OnClick="saveData"
                    OnClientClick="return SomeMethod(this.id,'A');" />
            </div>
        </div>
    </div>
    <script language="javascript" type="text/javascript">

        function SomeMethod(id, act) {
            var mess;
            if (act == "A") {
                mess = "Bạn có đồng ý duyệt Tỷ giá này không ?";
            }
            else {
                mess = "Bạn có đồng ý từ chối tỷ giá này không ?";
            }
            if (confirm(mess)) {
                $("#" + id).attr("value", "Đang xử lý");
                $("#" + id).attr("style", "width:100px");
                $("#" + id).prop('onclick', null);

                return true;
            } else {
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
