<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="CcyAutoLimit.aspx.cs" Inherits="VPB_FX.Modules.DMS.CcyAutoLimit" %>
<%@ OutputCache Duration="1" NoStore="true" VaryByParam="None" %>
<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<fieldset class="fieldsetBg">
<legend class="divLegend">Hạn Mức Giao Dịch Tự Động</legend>
<table style="width:100%">  
    <tr>
        <td style="width: 100px">Loại tiền tệ</td>
        <td>
            <asp:DropDownList ID="drCcy" runat="server" SkinID="DropDownList" Font-Size="Large" Width="200px">
            </asp:DropDownList>                
        </td>            
    </tr>        
    <tr>
        <td style="width: 100px">Loại giao dịch</td>
        <td>
            <asp:DropDownList ID="drtxnType" runat="server" SkinID="DropDownList" Font-Size="Large" Width="200px">
            </asp:DropDownList>                
        </td> 
    </tr>
    <tr>
        <td style="width: 100px">Hạn mức</td>
        <td><cc1:C1WebNumericEdit ID="txtAmount" runat="server" Text='' DecimalPlaces="0" Font-Size="Large" Width="200px"  ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="0"></cc1:C1WebNumericEdit></td>
    </tr>
    <tr>
        <td style="width: 100px"></td>
        <td><asp:Button ID="btnUpdate" runat="server" Text="Button" SkinID="UpdateButton"/></td>
    </tr>
</table>
</fieldset>
<fieldset class="fieldsetBg">
<legend class="divLegend">Các Hạn Mức Giao Dịch Tự Động</legend>
<table class="Table" style="width:100%">
        <tr>
            <td>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListCcyAutoLimit" TypeName="DataSource">
                    <SelectParameters>
                    </SelectParameters>
                </asp:ObjectDataSource>
                <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" 
                  DataSourceID="ObjectDataSource1" 
                  OnItemCreated="dataCtrl_OnItemCreated"
                  OnItemDataBound="dataCtrl_OnItemDataBound">
                        <Columns>
                            <C1WebGrid:C1TemplateColumn>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width = "2%" />
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imgAuthorize" ImageUrl="~/App_Themes/Default/Images/duyet.gif" style="cursor:hand;" ToolTip="Duyệt bản ghi" />
                                    </ItemTemplate>                    
                            </C1WebGrid:C1TemplateColumn>
                            
                            <C1WebGrid:C1TemplateColumn >
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width = "2%"/>
                                    <ItemTemplate>
                                        <asp:Image runat="server" ID="imgEdit" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif" style="cursor:hand;" ToolTip="Sửa bản ghi" />
                                    </ItemTemplate>                    
                            </C1WebGrid:C1TemplateColumn>
                            
                           <C1WebGrid:C1TemplateColumn HeaderText="Loại tiền tệ" Visible="true" AllowGroup="true">
                                <ItemStyle HorizontalAlign="Left" Font-Size="Medium"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CCY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           <C1WebGrid:C1TemplateColumn HeaderText="Loại giao dịch" Visible="true">
                                <ItemStyle HorizontalAlign="Left" Font-Size="Medium"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="TxnType" Text='<%# DataBinder.Eval(Container.DataItem,"TxnType")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           <C1WebGrid:C1TemplateColumn HeaderText="Hạn mức" Visible="true">
                                <ItemStyle HorizontalAlign="Right" Font-Size="Medium"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Amt" Text='<%# DataBinder.Eval(Container.DataItem,"Amt")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                          
                           <C1WebGrid:C1TemplateColumn HeaderText="Trạng thái" Visible="false">
                                <ItemStyle HorizontalAlign="Right" Font-Size="Medium"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Status" Text='<%# DataBinder.Eval(Container.DataItem,"Status")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           <C1WebGrid:C1TemplateColumn HeaderText="Trạng thái" Visible="true">
                                <ItemStyle HorizontalAlign="Right" Font-Size="Medium"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Status_Text" Text='<%# DataBinder.Eval(Container.DataItem,"Status_Text")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           <C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="Ngày nhập" SortExpression="Value" Visible="true">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"/>
                           </C1WebGrid:C1BoundColumn>   
                            <C1WebGrid:C1BoundColumn DataField="CreatedUser" HeaderText="Người nhập" SortExpression="Value" Visible="true">
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"/>
                           </C1WebGrid:C1BoundColumn>   
                           
                           <C1WebGrid:C1BoundColumn DataField="AuthorizedDate" HeaderText="Ngày duyệt" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"/>
                           </C1WebGrid:C1BoundColumn>   
                            <C1WebGrid:C1BoundColumn DataField="AuthorizedUser" HeaderText="Người duyệt" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Font-Size="Medium"/>
                           </C1WebGrid:C1BoundColumn>
                                          
                        </Columns>
                </C1WebGrid:C1WebGrid>            
            </td>
        </tr>
</table>
</fieldset>
<script language="javascript" type="text/javascript">
    var _viewmode = "";
    $(document).ready(function() {
        initform();
    });
    function initform() {

    }
    function AddNew() {
        var Ccy = GetValue("ctl00_FormContent_drCcy")
        //var Amount = Number(GetValue("ctl00_FormContent_txtAmount").replace(',', ''));
        var Amount = Number(replaceNumber(GetValue("ctl00_FormContent_txtAmount"), ",", ""));
        
        var txnType = GetValue("ctl00_FormContent_drtxnType")
        var url = "CcyAutoLimit.aspx";
        var query = "act=addNew";
        if (_viewmode == "edit") {
            query = "act=update";
        }
        query += "&Ccy=" + Ccy;
        query += "&Amount=" + Amount;
        query += "&txnType=" + txnType;
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function(errormessage) {
                if (errormessage == "") {
                    if (_viewmode == "edit") {
                        alert("Đã cập nhật lại hạn mức");
                    }
                    else {
                        alert("Đã cập nhật thêm hạn mức");
                    }
                    url = "CcyAutoLimit.aspx";
                    query = "Ccy=" + Ccy;
                    query += "&txnType=" + txnType;
                    url += "?" + query
                    window.location.href = url;
                }
                else {
                    alert(errormessage);
                }
            }
        });
    }
    function Authorize(Ccy, txnType) {
        var url = "CcyAutoLimit.aspx";
        var query = "act=Authorize";
        query += "&Ccy=" + Ccy;
        query += "&txnType=" + txnType;
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function(errormessage) {
                if (errormessage == "") {
                    alert("Đã duyệt hạn mức tự động.");
                    window.location.reload();
                }
                else {
                    alert(errormessage);
                }
            }
        });
    }
    function ChangeValue(obj) {
        SetValue(obj.id, "0");
        alert(obj.id);
    }
    function See(Ccy, txnType, Amount) {
        _viewmode = "edit";
        SetValue("ctl00_FormContent_drCcy", Ccy);
        SetValue("ctl00_FormContent_drtxnType", txnType);
        SetValue("ctl00_FormContent_txtAmount", 0);
        SetValue("ctl00_FormContent_txtAmount", Amount);
        SetValue("ctl00_FormContent_btnUpdate", "Cập nhật");
    }
    function drChange() {
        _viewmode = "new";
        SetValue("ctl00_FormContent_btnUpdate", "Thêm mới");
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
