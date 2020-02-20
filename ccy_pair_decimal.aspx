<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ccy_pair_decimal.aspx.cs" Inherits="VPB_FX.Modules.DMS.ccy_pair_decimal" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2, Version=2.1.20082.117, Culture=neutral, PublicKeyToken=589f1fc067ff4031" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1Input" Assembly="C1.Web.C1Input.2, Version=2.0.20082.434, Culture=neutral, PublicKeyToken=96d8a77dc0c22f6b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg2" style="width: 100%;">
        <legend class="divLegend">CCY PAIR Thập phân</legend>
        <table style="width: 100%">
            <tr>
                <td>
                    <C1WebGrid:C1WebGrid runat="server" ID="C1WebGrid1" Width="100%" OnItemCreated="dataCtrl_OnItemCreated"
                        OnItemDataBound="dataCtrl_OnItemDataBound" AutoGenerateColumns="False">
                        <Columns>
                            <C1WebGrid:C1TemplateColumn HeaderText="CCY">
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CCYPair" Text='<%# DataBinder.Eval(Container.DataItem,"CCYPair")%>'></asp:Label>
                                    <asp:Label runat="server" ID="decimal" Text='<%# DataBinder.Eval(Container.DataItem,"decimal")%>'
                                        Visible="False"></asp:Label>
                                         <asp:Label runat="server" ID="status" Text='<%# DataBinder.Eval(Container.DataItem,"status")%>'
                                        Visible="False"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Giá trị">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <cc1:C1WebNumericEdit ID="RateBuy" runat="server" SkinID="C1WebNumeric" Width="100%"
                                        Height="30px" Text="0" Font-Size="Large" DecimalPlaces="0" Culture="en-US" Value="0"
                                        MaxValue="10" UpDownAlign="Right">
                                    </cc1:C1WebNumericEdit>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="">
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgSave" ImageUrl="~/App_Themes/Default/Images/Save001.gif"
                                        Style="cursor: hand;" ToolTip="Lưu lại" />&nbsp;&nbsp;
                                    <asp:Image runat="server" ID="imgAccept" ImageUrl="~/App_Themes/Default/Images/duyet.gif"
                                        Style="cursor: hand;" ToolTip="Duyệt" Visible="false" />
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                        </Columns>
                    </C1WebGrid:C1WebGrid>
                </td>
            </tr>
        </table>
    </fieldset>
    <script language="javascript" type="text/javascript">
        function do_Save(val, ccy) {
            var url = "ccy_pair_decimal.aspx";
            var query = "act=update";
            query += "&ccy=" + ccy;
            query += "&dec=" + $('#' + val).val();
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    if (errormessage == "") {
                        alert("Đã thêm cập nhật thêm tỷ giá giá trị cho " + ccy);

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
