<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="ccy_holiday.aspx.cs" Inherits="VPB_FX.Modules.DMS.ccy_holiday" %>
<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">

<fieldset class="fieldsetBg">
    <legend class="divLegend">Ngày Nghỉ Giao Dịch</legend>
    <table style="width:100%">
        <tr>
            <td style="width: 95px">Loại tiền tệ</td>
            <td>
                <asp:DropDownList ID="drCcy" runat="server" SkinID="DropDownList" AutoPostBack="false" Font-Size="Large" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 95px">Ngày nghỉ</td>
            <td>
                <asp:TextBox ID="txtHolidayDate" runat="server" SkinID="TextBoxDate" Font-Size="Large"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 95px">&nbsp;</td>
            <td>
                <asp:Button ID="btnAddNew" runat="server" Text="Cập nhật" SkinID = "SaveButton" />
            </td>
        </tr>
    </table>
</fieldset>
<fieldset class="fieldsetBg">
    <legend class="divLegend">Các Ngày Nghỉ Giao Dịch</legend>
<table class="Table" style="width:100%">
        <tr>
            <td>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListHolidayDateCcy" TypeName="DataSource">
                    <SelectParameters>
                        <asp:Parameter Name="Ccy" Type = "String"/>
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
                                        <asp:Image runat="server" ID="imgDelete" ImageUrl="~/App_Themes/Default/Images/delete.gif" style="cursor:hand;" ToolTip="Xóa bản ghi" />
                                    </ItemTemplate>                    
                            </C1WebGrid:C1TemplateColumn>
                           <C1WebGrid:C1TemplateColumn HeaderText="CCY">
                                <ItemStyle HorizontalAlign="left" Font-Size="Large"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CCY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           
                           <C1WebGrid:C1TemplateColumn HeaderText="Date Of Holiday">
                                <ItemStyle HorizontalAlign ="Left" Font-Size="Large"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="HolidayDate" Text='<%# DataBinder.Eval(Container.DataItem,"HolidayDate")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn> 
                           <%--<C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                           </C1WebGrid:C1BoundColumn>    
                           <C1WebGrid:C1BoundColumn DataField="CreatedUser" HeaderText="CreatedUser" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                           </C1WebGrid:C1BoundColumn>  
                           <C1WebGrid:C1BoundColumn DataField="UpdatedDate" HeaderText="UpdatedDate" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                           </C1WebGrid:C1BoundColumn>    
                           <C1WebGrid:C1BoundColumn DataField="UpdatedUser" HeaderText="UpdatedUser" SortExpression="Value" >
                                <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" />
                           </C1WebGrid:C1BoundColumn> --%>                        
                        </Columns>
                </C1WebGrid:C1WebGrid>            
            </td>
        </tr>
    </table>
 </fieldset>
<script language="javascript" type="text/javascript">
    function ShowList() {
        var ccy = GetValue("ctl00_FormContent_drCcy")
        var url = "ccy_holiday.aspx";
        url += "?ccy=" + ccy;
        window.location.href = url;
    }
    function AddNew() {
        var ccy = GetValue("ctl00_FormContent_drCcy")
        var HolidayDate = GetValue("ctl00_FormContent_txtHolidayDate")
        var url = "ccy_holiday.aspx";
        var query = "act=addNew";
        query += "&ccy=" + ccy;
        query += "&HolidayDate=" + HolidayDate;
        if (HolidayDate == '') {
            alert("Phải nhập ngày nghỉ");
            return;
        }
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function(errormessage) {
                if (errormessage == "") {
                    alert("Đã thêm ngày Holiday " + HolidayDate + " cho loại tiền " + ccy);
                    url = "ccy_holiday.aspx" + "?ccy=" + ccy;
                    window.location.href = url
                }
                else {
                    alert(errormessage);
                }
            }
        });
    }
    function DeleteHolidayCcy(ccy, HolidayDate) {        
        var url = "ccy_holiday.aspx";
        var query = "act=delete";
        query += "&ccy=" + ccy;
        query += "&HolidayDate=" + HolidayDate;
        if (!confirm("Bạn chắc chắn muốn xóa bản ghi này?")) {
            return;
        }
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function(errormessage) {
                if (errormessage == "") {
                    alert("Đã xóa ngày nghỉ " + HolidayDate + " cho loại tiền " + ccy);
                    url = "ccy_holiday.aspx" + "?ccy=" + ccy;
                    window.location.href = url
                }
                else {
                    alert(errormessage);
                }
            }
        });
    }
</script>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
