<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="Ccy_amplitude.aspx.cs" Inherits="VPB_FX.Modules.DMS.Ccy_amplitude" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2, Version=2.1.20082.117, Culture=neutral, PublicKeyToken=589f1fc067ff4031" %>
<%@ Register Assembly="C1.Web.C1WebGrid.2" Namespace="C1.Web.C1WebGrid" TagPrefix="C1WebGrid" %>
<%@ Register TagPrefix="cc1" Namespace="C1.Web.C1Input" Assembly="C1.Web.C1Input.2, Version=2.0.20082.434, Culture=neutral, PublicKeyToken=96d8a77dc0c22f6b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<fieldset class="fieldsetBg2" style="width: 100%;">
        <legend class="divLegend">Biên độ tỷ giá</legend>
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
                                    <asp:Label runat="server" ID="CCY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY")%>'></asp:Label>
                                   <asp:Label runat="server" ID="AMPLITUDE" Text='<%# DataBinder.Eval(Container.DataItem,"AMPLITUDE")%>' Visible="False"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Biên độ tỷ giá">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <cc1:C1WebNumericEdit ID="RateBuy" runat="server" SkinID="C1WebNumeric" Width="100%"
                                        Height="30px" Text="0" Font-Size="Large" DecimalPlaces="4" Culture="en-US" Value="0"
                                        MaxValue="100" UpDownAlign="Right">
                                    </cc1:C1WebNumericEdit>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1BoundColumn DataField="UPDATE_TIME" HeaderText="Ngày cập nhật" DataFormatString="{0:dd/MM/yyyy HH:mm:ss}"/>
                            <C1WebGrid:C1BoundColumn DataField="UPDATE_USER" HeaderText="Người cập nhật" />
                            <C1WebGrid:C1TemplateColumn HeaderText="">
                                <ItemStyle HorizontalAlign="Center" Width="10%" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <asp:Image runat="server" ID="imgSave" ImageUrl="~/App_Themes/Default/Images/Save001.gif"
                                        Style="cursor: hand;" ToolTip="Lưu lại" />&nbsp;&nbsp;
                                    
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
            var url = "Ccy_amplitude.aspx";
            var query = "act=update";
            query += "&ccy=" + ccy;
            query += "&dec=" + $('#' + val).val();

            if ($('#' + val).val() > 100) {
                alert('Biên độ không được lớn hơn 100%')
                return;
            } else if ($('#' + val).val() < 0) {
                alert('Biên độ không được nhỏ hơn  0%')
                return;
            }
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function (errormessage) {
                    if (errormessage == "1") {
                        alert("Đã thêm biên độ cho " + ccy);

                    }
                    else {
                        alert(errormessage);
                    }
                    window.location.reload(true);
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
