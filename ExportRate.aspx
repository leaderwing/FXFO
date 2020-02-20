<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ExportRate.aspx.cs" Inherits="VPB_FX.Modules.DMS.ExportRate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <div align="center">
       
        <asp:Literal runat="server" ID="lit"></asp:Literal>
    </div>

    <script language="javascript" type="text/javascript">
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
