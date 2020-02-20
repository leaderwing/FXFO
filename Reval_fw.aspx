<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="Reval_fw.aspx.cs" Inherits="VPB_FX.Modules.DMS.Reval_fw" %>

<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1Input" Assembly="C1.Web.C1Input.2, Version=2.0.20082.434, Culture=neutral, PublicKeyToken=96d8a77dc0c22f6b" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <table style="width: 100%">
        <tr>
            <td valign="top">
                <fieldset class="fieldsetBg2" style="width: 100%">
                    <legend class="divLegend">Nhập liệu</legend>
                    <table style="width: 100%">
                        <tr>
                            <td class="lblNormal" style="width: 100px">
                                CCYPAIR
                            </td>
                            <td colspan="2">
                                <asp:DropDownList runat="server" ID="cboCCYPAIR" SkinID="DropDownList">
                                </asp:DropDownList>
                            </td>
                        </tr>
                       
                    <tr>
                            <td colspan="3">
                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="getRevalFW"
                                    TypeName="DataSource">
                                    <SelectParameters>
                                        <asp:Parameter Name="CCY" Type="String" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                                <C1WebGrid:C1WebGrid runat="server" ID="C1WebGrid1" Width="100%" DataSourceID="ObjectDataSource2"
                                    OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound"
                                    AutoGenerateColumns="False">
                                    <Columns>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Kỳ hạn">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="Term" Text='<%# DataBinder.Eval(Container.DataItem,"Description")%>'></asp:Label>
                                                <asp:Label runat="server" ID="eTerm" Text='<%# DataBinder.Eval(Container.DataItem,"Term")%>' Visible="False"></asp:Label>
                                               </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Mua">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <cc1:C1WebNumericEdit ID="RateBuy" runat="server" SkinID="C1WebNumeric" Width="100%"
                                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                                    Value="0" MaxValue="10000000" UpDownAlign="Right">
                                                </cc1:C1WebNumericEdit>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn HeaderText="Bán">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <cc1:C1WebNumericEdit ID="RateSell" runat="server" SkinID="C1WebNumeric" Width="100%"
                                                    Height="30px" Text="0" Font-Size="Large" DecimalPlaces="2" Culture="en-US" ThousandsSeparator="true"
                                                    Value="0" MaxValue="10000000" UpDownAlign="Right">
                                                </cc1:C1WebNumericEdit>
                                            </ItemTemplate>
                                        </C1WebGrid:C1TemplateColumn>
                                        <C1WebGrid:C1TemplateColumn >
                                            <ItemStyle HorizontalAlign="Center" Width="4%" />
                                            <HeaderStyle HorizontalAlign="Center" />
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
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        var _viewState = "add";

        function ShowList() {
            var Ccy = GetSvrCtlValue("cboCCYPAIR");
            var url = "Reval_fw.aspx";
            url += "?ccy=" + Ccy;
            window.location.href = url;
        }
        
        function on_change(value) {
            var url = "Reval_sp.aspx";
            var query = "act=get";
            query += "&ccy=" + GetSvrCtlValue("cboCCYPAIR");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errorMessage) {
                    if (errorMessage != "") {
                        _viewState = "update";
                        var ar = errorMessage.split('^');
                        SetSvrCtlValue("RateBuy", ar[0]);
                        SetSvrCtlValue("RateSell", ar[1]);
                        SetSvrCtlValue("RateMid", ar[2]);
                        SetSvrCtlValue("Offmarket", ar[3]);
                    } else {
                        _viewState = "add";
                        SetSvrCtlValue("RateBuy", "0.00");
                        SetSvrCtlValue("RateSell", "0.00");
                        SetSvrCtlValue("RateMid", "0.00");
                        SetSvrCtlValue("Offmarket", "0.00");
                    }
                }
            });
        }
        function do_Save(buyclient,sellclient,term) {
            
            var url = "Reval_fw.aspx";
            var query = "act=add";
            if (_viewState == "update")
                query = "act=update";
            query += "&ccy=" + GetSvrCtlValue("cboCCYPAIR");
            query += "&term=" + term;
            query += "&buy=" + $("#" + buyclient).val();
            query += "&sell=" + $("#" + sellclient).val();

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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
