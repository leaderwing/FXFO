<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="xauvnd.aspx.cs" Inherits="VPB_FX.Modules.DMS.xauvnd" %>
<%@ OutputCache Duration="1" NoStore="true" VaryByParam="None" %>
<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<fieldset class="fieldsetBg">
<legend class="divLegend"><b>CẬP NHẬT GIÁ VÀNG SJC</b></legend>
<table style="width:100%">
    <tr>
        <td style="width:15%">Ngày giao dịch</td>
        <td style="width:120px">
            <asp:TextBox ID="txtDate" runat="server" SkinID="TextBoxDate"></asp:TextBox>       
        </td> 
        <td>
                <asp:Button ID="btnSearch" runat="server" Text="Tìm kiếm" SkinID="SearchButton"/>
        </td>           
    </tr>

    <tr>
        <td style="width:15%">Giá mua</td>
        <td colspan="2">
            <cc1:C1WebNumericEdit ID="txtBidRate" runat="server" Text='' DecimalPlaces="2" Height="30px"
                ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="9999999"
                Width="120px" Font-Size="Medium" UpDownAlign="None">
            </cc1:C1WebNumericEdit>    
        </td>
              
    </tr>

    <tr>
        <td style="width:15%">Giá bán</td>
        <td colspan="2">
            <cc1:C1WebNumericEdit ID="txtAskRate" runat="server" Text='' DecimalPlaces="2" Height="30px"
                ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="9999999"
                Width="120px" Font-Size="Medium" UpDownAlign="None">
            </cc1:C1WebNumericEdit>   
        </td>            
    </tr>
    <tr>
        <td style="width:15%"></td>        
        <td colspan="2">
                <asp:Button ID="btnSave" runat="server" Text="Lưu lại" SkinID="SaveButton"/>
        </td>            
    </tr>
    
</table>
</fieldset>
<fieldset class="fieldsetBg">
<legend class="divLegend"><b>Danh sách tỷ giá vàng</b></legend>
    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListXAUVND" TypeName="DataSource">
        <SelectParameters>
            <asp:Parameter Name="Business_Date" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" 
        DataSourceID="ObjectDataSource1" 
        OnItemCreated="dataCtrl_OnItemCreated"
        OnItemDataBound="dataCtrl_OnItemDataBound">
            <Columns>
                <C1WebGrid:C1TemplateColumn HeaderText="Ngày giao dịch" Visible="true" AllowGroup="true">
                    <ItemStyle HorizontalAlign="Left" Font-Size="Large" Width="15%"/>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Business_Date" Text='<%# DataBinder.Eval(Container.DataItem,"Business_Date")%>'></asp:Label>
                    </ItemTemplate>
                </C1WebGrid:C1TemplateColumn>
                <C1WebGrid:C1TemplateColumn HeaderText="Giá mua" Visible="true">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" Font-Size="Large" Width="12%"/>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Bid_Rate" Text='<%# DataBinder.Eval(Container.DataItem,"Bid_Rate")%>'></asp:Label>
                    </ItemTemplate>
                </C1WebGrid:C1TemplateColumn>
                           
                <C1WebGrid:C1TemplateColumn HeaderText="Giá bán" Visible="true">
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" Font-Size="Large" Width="12%"/>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="Ask_Rate" Text='<%# DataBinder.Eval(Container.DataItem,"Ask_Rate")%>'></asp:Label>
                    </ItemTemplate>
                </C1WebGrid:C1TemplateColumn>
                           
                <C1WebGrid:C1TemplateColumn HeaderText="Người nhập" Visible="true">
                    <HeaderStyle HorizontalAlign = "Center" />
                    <ItemStyle HorizontalAlign="Center" Font-Size="Large"/>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="CreatedUser" Text='<%# DataBinder.Eval(Container.DataItem,"CreatedUser")%>'></asp:Label>
                    </ItemTemplate>
                </C1WebGrid:C1TemplateColumn>
                           
                <C1WebGrid:C1TemplateColumn HeaderText="Thời gian thực hiện" Visible="true">
                    <ItemStyle HorizontalAlign="Left" Font-Size="Large"/>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="CreatedDate" Text='<%# DataBinder.Eval(Container.DataItem,"CreatedDate")%>'></asp:Label>
                    </ItemTemplate>
                </C1WebGrid:C1TemplateColumn>
            </Columns>
    </C1WebGrid:C1WebGrid>
</fieldset>

<script language="javascript" type="text/javascript">
    var _viewmode = "";
    $(document).ready(function() {
        initform();
    });
    function initform() {

    }
    function AddNew() {
        var BusinessDate = GetValue("ctl00_FormContent_txtDate")
        var BidRate = Number(GetValue("ctl00_FormContent_txtBidRate").replace(/,/g, ""));
        var AskRate = Number(GetValue("ctl00_FormContent_txtAskRate").replace(/,/g, ""));
        var url = "xauvnd.aspx";
        var query = "act=addNew";
        query += "&BusinessDate=" + BusinessDate;
        query += "&BidRate=" + BidRate;
        query += "&AskRate=" + AskRate;
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function (errormessage) {
                if (errormessage == "") {
                    alert("Đã cập nhật thêm tỷ giá");
                    window.location.reload();
                }
                else {
                    alert(errormessage);
                }
            }
        });
    }
    function Search() {
        var BusinessDate = GetValue("ctl00_FormContent_txtDate")
        var url = "xauvnd.aspx?BusinessDate=" + BusinessDate;
        window.location.href = url;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
