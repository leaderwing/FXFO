<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="SprdSemiAutoLimit.aspx.cs" Inherits="VPB_FX.Modules.DMS.SprdSemiAutoLimit" %>
<%@ OutputCache Duration="1" NoStore="true" VaryByParam="None" %>
<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<fieldset class="fieldsetBg">
<legend class="divLegend">Biên Độ Bán Tự Động</legend>
<table style="width:100%">  
    <tr>
        <td style="width: 100px">Loại tiền tệ</td>
        <td>
            <asp:DropDownList ID="drCcy" runat="server" Width="100px" SkinID="DropDownList" Font-Size="Large">
            </asp:DropDownList>                
        </td>            
    </tr>        
    <tr>
        <td style="width: 100px">Sprd Mua</td>
        <td><cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBid_Sprd" runat="server" Font-Size="Large" Text='' DecimalPlaces="4"  ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="0" MaxValue = "100" ></cc1:C1WebNumericEdit></td>             
    </tr>
    <tr>
        <td style="width: 100px">Sprd Bán</td>
        <td><cc1:C1WebNumericEdit UpDownAlign="None" ID="txtAsk_Sprd" runat="server" Font-Size="Large" Text='' DecimalPlaces="4"  ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="0" MaxValue = "100"></cc1:C1WebNumericEdit></td>
    </tr>
    <tr>
        <td style="width: 100px"></td>
        <td><asp:Button ID="btnUpdate" runat="server" Text="Button" SkinID="UpdateButton"/></td>
    </tr>
</table>
</fieldset>
<fieldset class="fieldsetBg">
<legend class="divLegend">Các Biên Độ Bán Tự Động Theo Đồng Tiền</legend>
<table class="Table" style="width:100%">
        <tr>
            <td>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListSprdSemiAutoLimit" TypeName="DataSource">
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
                                        <asp:Image runat="server" ID="imgEdit" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif" style="cursor:hand;" ToolTip="Sửa bản ghi" />
                                    </ItemTemplate>                    
                            </C1WebGrid:C1TemplateColumn>
                           <C1WebGrid:C1TemplateColumn HeaderText="Loại tiền tệ" Visible="true" AllowGroup="true">
                                <ItemStyle HorizontalAlign="Left" Font-Size="Large"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CCY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           
                           <C1WebGrid:C1TemplateColumn HeaderText="Sprd Mua" Visible="true">
                                <ItemStyle HorizontalAlign="Right" Font-Size="Large"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Bid_Sprd" Text='<%# DataBinder.Eval(Container.DataItem,"Bid_Sprd")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           
                           <C1WebGrid:C1TemplateColumn HeaderText="Sprd Bán" Visible="true">
                                <ItemStyle HorizontalAlign="Right" Font-Size="Large"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Ask_Sprd" Text='<%# DataBinder.Eval(Container.DataItem,"Ask_Sprd")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                          
                           <%--<C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="Value" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}" >
                                <ItemStyle HorizontalAlign="Right" />
                           </C1WebGrid:C1BoundColumn>
                              
                            <C1WebGrid:C1BoundColumn DataField="CreatedUser" HeaderText="CreatedUser" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                           </C1WebGrid:C1BoundColumn>   
                           
                           <C1WebGrid:C1BoundColumn DataField="UpdatedDate" HeaderText="UpdatedDate" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                           </C1WebGrid:C1BoundColumn>   
                           
                            <C1WebGrid:C1BoundColumn DataField="UpdatedUser" HeaderText="UpdatedUser" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                           </C1WebGrid:C1BoundColumn>--%>   
                                          
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
        var Bid_Sprd = Number(GetValue("ctl00_FormContent_txtBid_Sprd").replace(',', ''));
        var Ask_Sprd = Number(GetValue("ctl00_FormContent_txtAsk_Sprd").replace(',', ''));
        var url = "SprdSemiAutoLimit.aspx";
        var query = "act=addNew";
        if (_viewmode == "edit") {
            query = "act=update";
        }
        else {
            if (!window.confirm("Hệ thống sẽ bỏ giá trị biên độ tại phần hạn mức tự động, bạn chắc chắn muốn thực hiện ?"))
                return false;
        }
        query += "&Ccy=" + Ccy;
        query += "&Bid_Sprd=" + Bid_Sprd;
        query += "&Ask_Sprd=" + Ask_Sprd;
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
    function See(Ccy, Bid_Sprd, Ask_Sprd) {
        _viewmode = "edit";
        SetValue("ctl00_FormContent_drCcy", Ccy);
        
        SetValue("ctl00_FormContent_txtBid_Sprd", 0);
        SetValue("ctl00_FormContent_txtBid_Sprd", Bid_Sprd);

        SetValue("ctl00_FormContent_txtAsk_Sprd", 0);
        SetValue("ctl00_FormContent_txtAsk_Sprd", Ask_Sprd);
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
