<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="ccy_cutoftime.aspx.cs" Inherits="VPB_FX.Modules.DMS.ccy_cutoftime" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Giờ Kết Thúc Giao Dịch Của Đồng Tiền</legend>
        <table style="width: 100%">
            <tr>
                <td style="width: 154px">
                    Loại tiền tệ
                </td>
                <td>
                    <asp:TextBox ID="txtCCY" runat="server" SkinID="TextBox" Font-Size="Large"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    Giờ kết thúc ngày thường
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="cboHH" SkinID="DropDownList" Font-Size="Medium">
                    </asp:DropDownList>
                    :
                    <asp:DropDownList runat="server" ID="cboMM" SkinID="DropDownList" Font-Size="Medium">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    Giờ kết thúc thứ bảy
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="cboHSat" SkinID="DropDownList" Font-Size="Medium">
                    </asp:DropDownList>
                    :
                    <asp:DropDownList runat="server" ID="cboMSat" SkinID="DropDownList" Font-Size="Medium">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    Nghỉ thứ bảy
                </td>
                <td>
                    <asp:CheckBox runat="server" CssClass="CheckBoxList" ID="Sat" />
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    Nghỉ chủ nhật
                </td>
                <td>
                    <asp:CheckBox ID="Sun" runat="server" CssClass="CheckBoxList" checked />
                </td>
            </tr>
            <tr>
                <td style="width: 154px">
                    &nbsp;
                </td>
                <td>
                    <input type="button" class="SaveButton" value="Lưu lại" onclick="addnewCOT()" />
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Giờ Kết Thúc Giao Dịch Của Các Đồng Tiền</legend>
        <table class="table" style="width: 100%">
            <tr>
                <td>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListCCY"
                        TypeName="DataSource">
                        <SelectParameters>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" DataSourceID="ObjectDataSource1"
                        OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound" >
                        <Columns>
                            <C1WebGrid:C1TemplateColumn>
                                <ItemStyle Width="5%" />
                                <ItemTemplate>
                                    <asp:Image runat="server" ImageUrl="~/App_Themes/Default/Images/delete.gif" ID="imgDel"
                                        ToolTip="Xóa" style="cursor:hand;"/>
                                    |
                                    <asp:Image runat="server" ImageUrl="~/App_Themes/Default/Images/PriceDetail.gif"
                                        ToolTip="Xem chi tiết" ID="imgEdit" style="cursor:hand;"/>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="CCY">
                                <ItemStyle Width="5%" Font-Size="Large" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CCY" Text='<%# DataBinder.Eval(Container.DataItem,"CCY")%>'></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Ngày thường">
                                <ItemStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="CutOfTime" Text='<%# DataBinder.Eval(Container.DataItem,"CutOfTime")%>'
                                        Font-Size="Large"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                            <C1WebGrid:C1TemplateColumn HeaderText="Thứ bảy">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Saturday" Text='<%# DataBinder.Eval(Container.DataItem,"CutOfTimeOnSat")%>'
                                        Font-Size="Large"></asp:Label>
                                </ItemTemplate>
                            </C1WebGrid:C1TemplateColumn>
                        </Columns>
                    </C1WebGrid:C1WebGrid>
                </td>
            </tr>
        </table>
    </fieldset>

    <script language="javascript" type="text/javascript">
        function deletecot(ccy, rowid) {
            if (!confirm("Bạn chắc chắn hủy bỏ giờ đóng cửa của CCY này ?"))
                return false;

            var url = "ccy_cutoftime.aspx";
            var query = "act=delete";
            query += "&ccy=" + ccy;

            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(errormessage) {
                    FinishProcessingForm("");
                    if (errormessage == "") {
                        $("#" + rowid).hide();
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }
        function addnewCOT() {
            var ccy = GetSvrCtlValue("txtCCY");
            var h = GetSvrCtlValue("cboHH");
            var m = GetSvrCtlValue("cboMM");
            var hS = GetSvrCtlValue("cboHSat");
            var mS = GetSvrCtlValue("cboMSat");
            if (m.length == 1) m = "0" + m;
            var cot = h + m;
            var chkSat = 0;
            var chkSun = 0;
            if ($('#ctl00_FormContent_Sat').attr('checked')) {
                hS = "";
                mS = "";
                chkSat = 1;
            }
            else {
                if (hS.length == 0 || mS.length == 0) {
                    alert('hãy chọn thời gian kết thúc ngày thứ bảy');
                    return;
                }
            }
            if ($('#ctl00_FormContent_Sun').attr('checked')) {

                chkSun = 1;
            }
            var sat = hS + mS;
            if (ccy.length == 0) {
                alert('hãy chọn loại tiền tệ');
                return;
            }
            var url = "ccy_cutoftime.aspx";
            var query = "act=addnew";
            query += "&ccy=" + ccy;
            query += "&cot=" + cot;
            query += "&sat=" + sat;
            query += "&chkSat=" + chkSat + "&chkSun=" + chkSun;

            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(errormessage) {
                    FinishProcessingForm("");
                    if (errormessage == "") {
                        window.location.reload(true);
                    }
                    else {
                        alert(errormessage);
                    }
                }
            });
        }
        function viewCCY(CCY) {
            var url = "ccy_cutoftime.aspx";
            var query = "act=view&ccy=" + CCY;
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(data) {
                    FinishProcessingForm();
                    var ar = JSON.parse(data);
                    SetSvrCtlValue("txtCCY", ar.CCY);
                    SetSvrCtlValue("cboHH", ar.HH);
                    SetSvrCtlValue("cboMM", ar.MM);
                    if (ar.Sun == "1") {

                        $('#ctl00_FormContent_Sun').attr('checked', true);
                    }
                    else {

                        $('#ctl00_FormContent_Sun').attr('checked', false);
                    }
                    if (ar.Sat == "1") {
                        
                        $("#ctl00_FormContent_cboHSat").attr("disabled", "disabled");
                        $("#ctl00_FormContent_cboMSat").attr("disabled", "disabled");
                        SetSvrCtlValue("cboHSat", ar.HHS);
                        SetSvrCtlValue("cboMSat", ar.MMS);
                        $('#ctl00_FormContent_Sat').attr('checked', true);

                    } else {
                       
                        $('#ctl00_FormContent_cboHSat').removeAttr('disabled');
                        $('#ctl00_FormContent_cboMSat').removeAttr('disabled');
                        SetSvrCtlValue("cboHSat", ar.HHS);
                        SetSvrCtlValue("cboMSat", ar.MMS);
                        $('#ctl00_FormContent_Sat').attr('checked', false);
                    }
                }
            });
            
        }

        function CheckedSaturday() {

            if ($('#ctl00_FormContent_Sat').attr('checked')) {
                $("#ctl00_FormContent_cboHSat").attr("disabled", "disabled");
                $("#ctl00_FormContent_cboMSat").attr("disabled", "disabled");
                
            }
            else {
                $("#ctl00_FormContent_cboHSat").removeAttr("disabled");
                $("#ctl00_FormContent_cboMSat").removeAttr("disabled");
            }
        }
        function updatecot(ccy, hhid, mmid, cotid) {
            var h = $("#" + hhid).val();
            var m = $("#" + mmid).val();
            var cot = h + m;

            var url = "ccy_cutoftime.aspx";
            var query = "act=update";
            query += "&ccy=" + ccy;
            query += "&cot=" + cot;

            StartProcessingForm("");
            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(errormessage) {
                    FinishProcessingForm("");
                    if (errormessage == "") {
                        getlastestCOT(ccy, cotid);
                    }
                }
            });
        }
        function getlastestCOT(ccy, cotid) {
            var url = "ccy_cutoftime.aspx";
            var query = "act=getcot";
            query += "&ccy=" + ccy;

            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(cot) {
                    $("#" + cotid).attr("innerHTML", cot);
                }
            });
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
