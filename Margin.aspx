<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="Margin.aspx.cs" Inherits="VPB_FX.Modules.DMS.Margin" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2, Version=2.1.20082.117, Culture=neutral, PublicKeyToken=589f1fc067ff4031" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1Input" Assembly="C1.Web.C1Input.2, Version=2.0.20082.434, Culture=neutral, PublicKeyToken=96d8a77dc0c22f6b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <table style="width: 100%">
        <tr>
            <td valign="top">
                <fieldset class="fieldsetBg2" style="width: 100%">
                    <legend class="divLegend">Nhập liệu</legend>
                    <table style="width: 100%">
                        <tr>
                            <td class="lblNormal">
                                Segment
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="cboSegment" SkinID="DropDownList" OnSelectedIndexChanged="seg_OnSelectedIndexChanged"
                                    AutoPostBack="True">
                                    <asp:ListItem Value="CIB" Text="CIB"></asp:ListItem>
                                    <asp:ListItem Value="CMB" Text="CMB"></asp:ListItem>
                                    <asp:ListItem Value="SMEDIAMOND" Text="SME-diamond"></asp:ListItem>
                                    <asp:ListItem Value="SMEPLATINUM" Text="SME-platinum"></asp:ListItem>
                                    <asp:ListItem Value="SMEGOLD" Text="SME-gold"></asp:ListItem>
                                    <asp:ListItem Value="SMESILVER" Text="SME-silver"></asp:ListItem>
                                    <asp:ListItem Value="FI" Text="FI"></asp:ListItem>
                                    <asp:ListItem Value="KNV" Text="KNV"></asp:ListItem>
                                    <asp:ListItem Value="AF" Text="AF"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="lblNormal">
                                Dealtype
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="cboType" SkinID="DropDownList" OnSelectedIndexChanged="ty_OnSelectedIndexChanged"
                                    AutoPostBack="True">
                                    <asp:ListItem Value="SP" Text="Spot"></asp:ListItem>
                                    <asp:ListItem Value="FW" Text="forward"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr style="width: 100%">
                            <td colspan="3">
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListMargin"
                                                TypeName="DataSource">
                                                <SelectParameters>
                                                    <asp:Parameter Name="Segment" Type="String" />
                                                    <asp:Parameter Name="Type" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" DataSourceID="ObjectDataSource1"
                                                OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound"
                                                GroupIndent="30">
                                                <Columns>
                                                    <C1WebGrid:C1TemplateColumn HeaderText="Tiêu chí">
                                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="Title" Text='<%# DataBinder.Eval(Container.DataItem,"Title")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </C1WebGrid:C1TemplateColumn>
                                                    <C1WebGrid:C1TemplateColumn HeaderText="Margin Mua">
                                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <cc1:C1WebNumericEdit ID="MarginSell" runat="server" SkinID="C1WebNumeric" Width="80%"
                                                                Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                                                Value='<%# DataBinder.Eval(Container.DataItem,"MarginBuy")%>' MinValue="-100"
                                                                MaxValue="100" UpDownAlign="Right" OnClientBlur="Calcular();">
                                                            </cc1:C1WebNumericEdit>
                                                        </ItemTemplate>
                                                    </C1WebGrid:C1TemplateColumn>
                                                    <C1WebGrid:C1TemplateColumn HeaderText="Margin Bán">
                                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <cc1:C1WebNumericEdit ID="MarginBuy" runat="server" SkinID="C1WebNumeric" Width="80%"
                                                                Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                                                Value='<%# DataBinder.Eval(Container.DataItem,"MarginSell")%>' MinValue="-100"
                                                                MaxValue="100" UpDownAlign="Right" OnClientBlur="Calcular();">
                                                            </cc1:C1WebNumericEdit>
                                                        </ItemTemplate>
                                                    </C1WebGrid:C1TemplateColumn>
                                                </Columns>
                                            </C1WebGrid:C1WebGrid>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td valign="top" style="width: 40%">
                <fieldset class="fieldsetBg2" style="width: 100%;">
                    <legend class="divLegend">Bảng hiển thị</legend>
                    <table style="width: 100%">
                        <tr>
                            <td><asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="getCCYThapphan"
                                                TypeName="DataSource">
                                                <SelectParameters>
                                                   <asp:Parameter Name="Segment" Type="String" />
                                                    <asp:Parameter Name="Type" Type="String" />
                                                </SelectParameters>
                                            </asp:ObjectDataSource>
                                            <C1WebGrid:C1WebGrid runat="server" ID="C1WebGrid1" Width="100%" DataSourceID="ObjectDataSource2"
                                                OnItemCreated="dataCtrl_OnItemCreated" 
                                                GroupIndent="30">
                                                <Columns>
                                                    <C1WebGrid:C1TemplateColumn HeaderText="Margin sales">
                                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="Title" Text='<%# DataBinder.Eval(Container.DataItem,"CCYPair")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </C1WebGrid:C1TemplateColumn>
                                                    <C1WebGrid:C1TemplateColumn HeaderText="Mua">
                                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="Mua" Text='<%# DataBinder.Eval(Container.DataItem,"Mua")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </C1WebGrid:C1TemplateColumn>
                                                    <C1WebGrid:C1TemplateColumn HeaderText="Bán">
                                                        <ItemStyle HorizontalAlign="Center" Width="4%" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="Ban" Text='<%# DataBinder.Eval(Container.DataItem,"Ban")%>'></asp:Label>
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
    <script language="javascript" type="text/javascript">
        function do_handler() {
            var index = 0;
            var usdbuy;
            var usdsell;
            var fcybuy;
            var fcysell;
            var segment = GetSvrCtlValue("cboSegment");
            var cbotype = GetSvrCtlValue("cboType");
            $(":text").each(function () {
                index = index + 1;
                var svalue = $(this).val();
                if (index == 1) {
                    usdbuy = svalue;
                } else if (index == 2) {
                    usdsell = svalue;
                } else if (index == 3) {
                    fcybuy = svalue;
                } else if (index == 4) {
                    fcysell = svalue;
                }

            });
            if(new Number(usdbuy) >0 ) {
                alert('Margin Mua phải nhỏ hơn không');
            }
            if (new Number(usdsell) < 0 || new Number(fcybuy)<0 || new Number(fcysell)<0 ) {
                alert('Margin Mua phải nhỏ hơn không');
            }
            var url = "Margin.aspx";
            var query = "act=update";
            query += "&ub=" + usdbuy + "&us=" + usdsell + "&fb=" + fcybuy + "&fs=" + fcysell + "&seg=" + segment + "&ty=" + cbotype;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errorMessage) {
                    if (errorMessage == "") {
                        alert('Đã cập nhật thành công');
                        window.location.reload(true);
                    } else {
                        alert(errorMessage);
                    }
                }
            });
        }

        function Calcular() {
            
            var index = 0;
            var usdbuy;
            var usdsell;
            var fcybuy;
            var fcysell;
            $(":text").each(function () {
                index = index + 1;
                var svalue = $(this).val();
                if (index == 1) {
                    usdbuy = svalue;
                } else if (index == 2) {
                    usdsell = svalue;
                } else if (index == 3) {
                    fcybuy = svalue;
                } else if (index == 4) {
                    fcysell = svalue;
                }
                else if (index == 5) {
                    //$(this).val(usdbuy * fcybuy);
                    $(this).val(roundToTwo(usdbuy * fcybuy));
                } else if (index == 6) {
                    //$(this).val(usdsell * fcysell);
                    $(this).val(roundToTwo(usdsell * fcysell));
                }
            });

        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
