<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="ccy_holiday_year.aspx.cs" Inherits="VPB_FX.Modules.DMS.ccy_holiday_year" %>
<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">

<fieldset class="fieldsetBg">
    <legend class="divLegend">Thông tin truy vấn</legend>
    <table style="width:100%">
        <tr>
            <td style="width: 95px">Loại tiền tệ</td>
            <td>
                <asp:DropDownList ID="drCcy" runat="server" SkinID="DropDownList" AutoPostBack="false" Font-Size="Large" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 95px">Năm</td>
            <td>
                <asp:TextBox ID="txtHolidayDate" MaxLength ="4" runat="server" SkinID="TextBox" Font-Size="Large"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 95px">&nbsp;</td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Cập nhật" SkinID = "SearchButton" />
            </td>
        </tr>
    </table>
</fieldset>

<fieldset class="fieldsetBg">
    <legend class="divLegend">Cập nhật ngày nghỉ</legend>
<table class="Table" style="width:100%">
        <tr>
            <td>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="GetListHoliday" TypeName="DataSource">
                    <SelectParameters>
                        <asp:Parameter Name="Year" Type = "String"/>
                        <asp:Parameter Name="Ccy" Type = "String"/>
                    </SelectParameters>
                </asp:ObjectDataSource>
                <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" 
                  DataSourceID="ObjectDataSource1" 
                  OnItemCreated="dataCtrl_OnItemCreated"
                  OnItemDataBound="dataCtrl_OnItemDataBound" AllowColMoving="false">
                        <Columns>
                           <C1WebGrid:C1TemplateColumn HeaderText="Loại tiền tệ">
                                <ItemStyle  HorizontalAlign="left" Font-Size="Large" Width="10%"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Ccy" Text='<%# DataBinder.Eval(Container.DataItem,"Ccy")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           <C1WebGrid:C1TemplateColumn HeaderText="Năm">
                                <ItemStyle HorizontalAlign="left" Font-Size="Large" Width="10%"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Year" Text='<%# DataBinder.Eval(Container.DataItem,"Year")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn>
                           
                           <C1WebGrid:C1TemplateColumn HeaderText="Tháng">
                                <ItemStyle HorizontalAlign ="Left" Font-Size="Large" Width="10%"/>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Month" Text='<%# DataBinder.Eval(Container.DataItem,"Month")%>'></asp:Label>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn> 
                           
                           <C1WebGrid:C1TemplateColumn HeaderText="Ngày">
                                <ItemStyle HorizontalAlign ="Left" Font-Size="XX-Large"/>
                                <ItemTemplate>
                                    <asp:TextBox runat="server" ID="Day" Width="95%" BackColor="LightYellow" BorderStyle="None" Font-Bold="true" Text='<%# DataBinder.Eval(Container.DataItem,"Day")%>' ></asp:TextBox>
                                </ItemTemplate>
                           </C1WebGrid:C1TemplateColumn> 
                           <C1WebGrid:C1TemplateColumn>
                                    <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width = "2%"/>
                                    <ItemTemplate>
                                        <asp:Image runat ="server" ID="imgSave" ImageUrl="~/App_Themes/Default/Images/Save001.gif" style="cursor:hand;" ToolTip="Lưu lại" />
                                    </ItemTemplate>                    
                            </C1WebGrid:C1TemplateColumn>
                        </Columns>
                </C1WebGrid:C1WebGrid>            
            </td>
        </tr>
    </table>
 </fieldset>
 <script language="javascript" type="text/javascript">
    function ShowList() {
        var Ccy = GetValue("ctl00_FormContent_drCcy")
        var Year = GetValue("ctl00_FormContent_txtHolidayDate")
        var url = "ccy_holiday_year.aspx";
        url += "?Ccy=" + Ccy;
        url += "&Year=" + Year;
        window.location.href = url;
    }
    function do_Save(Ccy, Year, Month, DayClientID) {
        if (!FormValidated()) return false;
        var Day = $("#" + DayClientID).val();
        var url = "ccy_holiday_year.aspx";
        var query = "act=Save";
        query += "&Ccy=" + Ccy;
        query += "&Year=" + Year;
        query += "&Month=" + Month;
        query += "&Day=" + Day;
        StartProcessingForm("");
        $.ajax({
            type: "POST",
            url: url,
            data: query,
            success: function(msg) {
                FinishProcessingForm();
                if (msg != "")
                    alert(msg);
                else {
                    alert("Đã cập nhật danh sách ngày nghỉ.");
//                    var url = "ccy_holiday_year.aspx";
//                    url += "?Ccy=" + Ccy;
//                    url += "&Year=" + Year;
//                    window.location.href = url;
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
