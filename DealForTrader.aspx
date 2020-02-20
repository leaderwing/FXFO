<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="DealForTrader.aspx.cs" Inherits="VPB_FX.Modules.DMS.DealForTrader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <table id="tblMain" style="width: 100%">
        <tr>
            <td id="tdQueue" style="width: 25%" align="left" valign="top">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td align="left" valign="top">
                                     <fieldset class="fieldsetBg">
                                        <legend class="divLegend">HÀNG ĐỢI GIAO DỊCH DIRECT SALES</legend>
                                        <asp:ListBox runat="server" ID="lstDealsP" Rows="20" Width="100%" CssClass="divLegend"
                                            Style="cursor: pointer"></asp:ListBox>
                                    </fieldset>
                                </td>
                                <td align="left" valign="top">
                                <fieldset class="fieldsetBg">
                                        <legend class="divLegend">HÀNG ĐỢI GIAO DỊCH INDIRECT SALES</legend>
                                        <asp:ListBox runat="server" ID="lstDealsIN" Rows="10" Width="100%" CssClass="divLegend"
                                            Style="cursor: pointer"></asp:ListBox>
                                    </fieldset>
                                   
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="top">
                                <fieldset class="fieldsetBg">
                                        <legend class="divLegend">HÀNG ĐỢI GIAO DỊCH HỦY</legend>
                                        <asp:ListBox runat="server" ID="lstDealsC" Rows="20" Width="100%" CssClass="divLegend"
                                            Style="cursor: pointer"></asp:ListBox>
                                    </fieldset>
                                    
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="timer1" EventName="tick" />
                    </Triggers>
                </asp:UpdatePanel>
                <asp:Timer runat="server" ID="timer1" Interval="1000" OnTick="refreshDeals">
                </asp:Timer>
            </td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {          
            //notifications.client.updateDeals = function (data) {
            //    window.location.reload(true);
            //}

            //notifications.client.refreshForm = function (data) {            
            //    window.location.reload(true);
            //}
        });
        function showdealinfo(dealid, type) {
            var url = "";
            if (type == "P") {
                url = "PenddingDetailTrader.aspx?dealid="+dealid;
            } else {
                url = "CancelDetailTrader.aspx?dealid=" + dealid;
            }
            opendetail(url, 'Accep_deal')
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
