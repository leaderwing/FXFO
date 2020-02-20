<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="MidRateT24.aspx.cs" Inherits="VPB_FX.Modules.DMS.MidRateT24" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <table width="100%">
        <tr>
            <td style="width: 100px" class="lblCaption">
                Từ ngày
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtFromDate" SkinID="TextBoxDateRequired"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 100px" class="lblCaption">
                Đến ngày
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtToDate" SkinID="TextBoxDateRequired"></asp:TextBox>
            </td>
        </tr>
        <%-- <tbody>
                 <asp:Repeater ID="rptCcy" runat="server">
                    <HeaderTemplate>
                        <tr class="TableHeader" >
                        <th style="font-size:large">Ccy</th>
                        <th style="font-size:large">Bid Rate</th>
                        <th style="font-size:large">Ask Rate</th>
                        <th style="font-size:large">Time</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr align ="left"> 
                        <td style="font-size:large; background-color:HighlightText" ><%#Eval("Ccy")%></td>2
                        <td style="font-size:large; background-color:HighlightText"><%#Eval("Bid_Rate")%></td>
                        <td style="font-size:large; background-color:HighlightText"><%#Eval("Ask_Rate") %></td>
                        <td style="font-size:large"><%#Eval("CreatedDate") %></td>
                        </tr>
                    </ItemTemplate>                    
                </asp:Repeater>
            </tbody>--%>
    </table>
     <div align="center">
       <asp:Button runat="server" ID="btnSave" SkinID="ExportExcel" />
    </div>
    <br />
    <br />
    <div align="center">
        <asp:Literal runat="server" ID="lit"></asp:Literal>
    </div>
    <script type="text/javascript" language="javascript">
        function ExportMidRate() {
            var fromdate = GetSvrCtlValue("txtFromDate");
            var todate = GetSvrCtlValue("txtToDate");
            if (fromdate == "" || todate == "") {
                alert('Bạn đang lấy tỷ giá trong ngày');
            }
            if (fromdate == "" && todate == "") {
                alert('Bạn cần chọn ngày lấy dữ liệu');
                return false;
            }

            window.location.href = "MidRateT24.aspx?act=export&f=" + fromdate + "&t=" + todate;


        }

        function download(filename, filepath) {

            var url = "../Download/" + filename;

            opendetail(url, "vpb_ce_download");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
