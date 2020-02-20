<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="DoneDealT24.aspx.cs" Inherits="VPB_FX.Modules.DMS.DoneDealT24" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<link type="text/css" rel="Stylesheet" href="../../Css/bootstrap.css"></link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap.min.css"></link>
    <link type="text/css" rel="Stylesheet" href="../../Css/jquery.dataTables.min.css">
    </link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-responsive.css">
    </link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-responsive.min.css">
    </link>
    <link type="text/css" rel="Stylesheet" href="../../Css/bootstrap-3.3.2.min.css">
    </link>
    <script language="javascript" type="text/javascript" src="../../Javascript/jquery.min.getvalue.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/bootstrap.min.js"></script>
    <script language="javascript" type="text/javascript" src="../../Javascript/jquery.dataTables.min.js"></script>
    <div class="datatable">
        <literal runat="server" id="tbl"></literal>
    </div>
     <script type="text/javascript" language="javascript" >
         $(document).ready(function () {
             $('#myTable').dataTable();
             //$('#myTable_filter').attr('style', 'display:none')

         });


         function view(pk, txntype, objtype) {
         if (objtype == "DIRECT SALES" || object == "FI") {
                opendetail("../fxsales/CreateDeal.aspx?act=see&dealid=" + pk + "&txntype=" + type + "&objtype=" + objtype, "detail");
            } else {
             opendetail("../DMS/opennewdeal.aspx?act=see&objtype=" + objtype + "&txntype=" + txntype + "&dealid=" + pk, "detail")
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
