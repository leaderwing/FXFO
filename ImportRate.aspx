<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ImportRate.aspx.cs" Inherits="VPB_FX.Modules.DMS.ImportRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <div class="panel panel-info">
        <div class="panel-heading">
        </div>
        <div class="panel-body">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label text-left ">
                        Chọn file import</label>
                    <div class="col-md-6">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:HiddenField runat="server" ID="FileName" />
                    </div>
                </div>
            </div>
            <div class="form-horizontal" style="text-align: center">
                <div class="form-group">
                    <div class="text-center">
                        <asp:Button runat="server" SkinID="UploadButton" ID="btnImport" OnClick="btnImport_OnClick" />
                    </div>
                </div>
            </div>
            <div class="form-horizontal" style="text-align: center">
                <div class="form-group">
                    <div class="text-center">
                        <span runat="server" id="er"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="well">
        <div class="tabbable">
            <ul class="nav nav-tabs">
                <li class="active"><a href="ImportRate.aspx#original" data-toggle="tab"><i class="icon-accessibility">
                </i>Bảng tỷ giá gốc</a></li>
                <li><a href="ImportRate.aspx#currency" data-toggle="tab"><i class="icon-stack"></i>Bảng
                    Currency Rate</a></li>
                <li><a href="ImportRate.aspx#cash" data-toggle="tab"><i class="icon-stack"></i>Bảng
                    Cash Exchange Rate</a></li>
            </ul>
            <div class="tab-content with-padding">
                <div class="tab-pane fade in active" id="original">
                    <!-- Begin Tabs Open !-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ImportRate.aspx#tab1">
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
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ImportRate.aspx#tab11">
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
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ImportRate.aspx#tab3">
                                    Thông tin tỷ giá gốc</a></h6>
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
                <%--<div class="tab-pane fade" id="iconified-tab2">
                    <!-- Begin Tabs Close !-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ImportRate.aspx#tab2">
                                    Thông tin Currencyrate </a>
                            </h6>
                        </div>
                        <div id="tab2" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="datatable-tools">
                                    <asp:Literal runat="server" ID="CurrencyRate"></asp:Literal>
                                </div>
                            </div>
                        </div>
                       
                        <!-- End Tabs Close !-->
                    </div>
                </div>
                <div class="tab-pane fade" id="iconified-tab3">
                    <!-- Begin Tabs Close !-->
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h6 class="panel-title">
                                <i class="icon-accessibility"></i><a data-toggle="collapse" href="ImportRate.aspx#tab3">
                                    Thông tin ExchangeRate </a>
                            </h6>
                        </div>
                        <div id="tab3" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="datatable-tools">
                                    <asp:Literal runat="server" ID="ExchangeRate"></asp:Literal>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Tabs Close !-->
                
                
            </div>
            </div><--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
