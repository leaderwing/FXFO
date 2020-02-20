<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="DoiChieuCuoiNgay.aspx.cs" Inherits="VPB_FX.Modules.DMS.DoiChieuCuoiNgay" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <table>
        <tr>
            <td class="lblCaption">Ngày đối chiếu</td>
            <td>
                <asp:TextBox runat="server" ID="dateCompare" SkinID="TextBoxDateRequired" Width="100px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="lblCaption">Chọn file import
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:HiddenField runat="server" ID="FileName" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" SkinID="UploadButton" ID="btnImport" OnClick="btnImport_OnClick" />
                <asp:Button runat="server" SkinID="ClearButton" ID="btnClear" OnClientClick="{ClearData();return false;}" />
            </td>
        </tr>
        <tr>
            <td colspan="2"><span runat="server" id="er"></span></td>
        </tr>
    </table>
    <asp:Literal runat="server" ID="update"></asp:Literal>
    <table class="Table" style="width: 100%">
        <tr>
            <td colspan="3">
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource" SelectMethod="GetDealError"
                    TypeName="DataSource">
                    <SelectParameters>
                        <asp:Parameter Name="dateCompare" Type="String" />

                    </SelectParameters>
                </asp:ObjectDataSource>
                <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl" Width="100%" DataSourceID="ObjectDataSource"
                    OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound"
                    AutoGenerateColumns="False">
                    <Columns>
                        <C1WebGrid:C1TemplateColumn HeaderText="STT">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="STT"></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Chi Nhánh">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Branch" Text='<%# DataBinder.Eval(Container.DataItem,"CPARTY ID")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Mã giao dịch FXFO">
                            <ItemStyle HorizontalAlign="Center" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="IDFX" Text='<%# DataBinder.Eval(Container.DataItem,"ID FXFO")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Mã giao dịch T24">
                            <ItemStyle HorizontalAlign="Center" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="IDT24" Text='<%# DataBinder.Eval(Container.DataItem,"ID T24")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1BoundColumn DataField="DEAL.TYPE" HeaderText="Loại giao dịch" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="CCY.BOUGHT" HeaderText="Đồng tiền mua" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="CCY.SOLD" HeaderText="Đồng tiền bán" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="DEAL.DATE" HeaderText="Ngày hợp đồng" SortExpression="Value"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="VALUE.DATE.SELL" HeaderText="Ngày giá trị" SortExpression="Value"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="AMOUNT.SOLD" HeaderText="Khối lượng bán" SortExpression="Value"
                            DataFormatString="{0:#,0}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="AMOUNT.BOUGHT" HeaderText="Khối lượng mua" SortExpression="Value"
                            DataFormatString="{0:#,0}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="DISP.RATE" HeaderText="Tỷ giá" SortExpression="Value"
                            DataFormatString="{0:#,0}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="LegalTranstype" HeaderText="LegalTranstype" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="10%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Nội dung lỗi">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Msg" Text='<%# DataBinder.Eval(Container.DataItem,"Msg")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText='Hủy trên T24'>
                            <ItemStyle HorizontalAlign="Center" Width="3%" />
                            <HeaderStyle HorizontalAlign="Center" />

                            <ItemTemplate>

                                <input type='checkbox' id='Cancel' runat="server" />
                                <asp:HiddenField ID="cancelID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Key_R")%>' />
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText='Tạo mới trên T24'>
                            <ItemStyle HorizontalAlign="Center" Width="3%" />
                            <HeaderStyle HorizontalAlign="Center" />

                            <ItemTemplate>

                                <input type='checkbox' id='Created' runat="server" />
                                <asp:HiddenField ID="createID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Key_I")%>' />
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText='Cập nhật FXLCN'>
                            <ItemStyle HorizontalAlign="Center" Width="3%" />
                            <HeaderStyle HorizontalAlign="Center" />

                            <ItemTemplate>

                                <input type='checkbox' id='Update' runat="server" />
                                <asp:HiddenField ID="UpdateID" runat="server" Value='<%# DataBinder.Eval(Container.DataItem,"Key_D")%>' />
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText='Kết quả' Visible="false">
                            <ItemStyle HorizontalAlign="Center" Width="3%" />
                            <HeaderStyle HorizontalAlign="Center" />

                            <ItemTemplate>
                               <asp:Label runat="server" ID="Result" Text=''></asp:Label>
                                
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                    </Columns>
                </C1WebGrid:C1WebGrid>
            </td>
        </tr>
        <tr>
            <td align="center">Tổng số deal lỗi: <%=System.Web.HttpContext.Current.Session["CompareError"] %>
             <input id="path" type="hidden" value="<%=System.Web.HttpContext.Current.Session["path"] %>"/>
            </td>
        </tr>
        <tr>
            <td align="center">
                <input type="hidden" id="lstTran" runat="server" />

            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="btnCreated" runat="server"  OnClientClick="{CreatedDeal();return false;}" SkinID="ApproveButton" Text="Tạo mới T24" Visible="true" />
                <asp:Button ID="btnCancel" runat="server" OnClientClick="{CancelDeal();return false;}" SkinID="BackButton" Text="Hủy Deal" Visible="true"/>
                <asp:Button ID="btnUpdate" runat="server" OnClientClick="{UpdateDeal();return false;}" SkinID="SaveButton" Text="Cập nhật FXLCN" Visible="true" />
            </td>
        </tr>
    </table>
    <table class="Table" style="width: 100%">
        <tr>
            <td colspan="3">
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="GetDealSucess"
                    TypeName="DataSource">
                    <SelectParameters>
                        <asp:Parameter Name="dateCompare" Type="String" />

                    </SelectParameters>
                </asp:ObjectDataSource>
                <C1WebGrid:C1WebGrid runat="server" ID="dataCtrl1" Width="100%" DataSourceID="ObjectDataSource1"
                    OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound1"
                    AutoGenerateColumns="False">
                    <Columns>
                         <C1WebGrid:C1TemplateColumn HeaderText="STT">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="STT"></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Chi Nhánh">
                            <ItemStyle HorizontalAlign="Center" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Branch" Text='<%# DataBinder.Eval(Container.DataItem,"CPARTY ID")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Mã giao dịch FXFO">
                            <ItemStyle HorizontalAlign="Center" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="ID" Text='<%# DataBinder.Eval(Container.DataItem,"ID FXFO")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Mã giao dịch T24">
                            <ItemStyle HorizontalAlign="Center" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="T24ID" Text='<%# DataBinder.Eval(Container.DataItem,"ID T24")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1BoundColumn DataField="DEAL.TYPE" HeaderText="Loại giao dịch" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="CCY.BOUGHT" HeaderText="Đồng tiền mua" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="CCY.SOLD" HeaderText="Đồng tiền bán" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="DEAL.DATE" HeaderText="Ngày hợp đồng" SortExpression="Value"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="VALUE.DATE.SELL" HeaderText="Ngày giá trị" SortExpression="Value"
                            DataFormatString="{0:dd/MM/yyyy}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="AMOUNT.SOLD" HeaderText="Khối lượng bán" SortExpression="Value"
                            DataFormatString="{0:#,0}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="AMOUNT.BOUGHT" HeaderText="Khối lượng mua" SortExpression="Value"
                            DataFormatString="{0:#,0}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="DISP.RATE" HeaderText="Tỷ giá" SortExpression="Value"
                            DataFormatString="{0:#,0}">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="LegalTranstype" HeaderText="LegalTranstype" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Right" Width="7%" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </C1WebGrid:C1BoundColumn>
                    </Columns>
                </C1WebGrid:C1WebGrid>
            </td>
        </tr>
        <tr>
            <td align="center">Tổng số deal : <%=System.Web.HttpContext.Current.Session["CompareSucess"] %>
             
            </td>
        </tr>
    </table>

    <table class="Table" style="width: 100%">
        <tr>
            <td align="center"><asp:Button runat="server" SkinID="ExportExcel" ID="btnExport" OnClick="btnExcel_OnClick" /></td>
        </tr>
    </table>
    <script language="javascript" type="text/javascript">
        function CreatedDeal() {
            $("#ctl00_FormContent_btnCreated").prop("disabled", true);
            var grid = document.getElementById("<%=dataCtrl.ClientID%>");
            var lsData = "";
            $('input:checkbox[id$=Created]:checked', grid).each(function (item, index) {
                var id = $(this).next('input:hidden[id$=createID]').val();
                lsData += id.trim() + "#";
            });
            if (lsData == "") {
                alert('Chưa chọn giao dịch cần thực hiện');
                return false;
            }
            var url = "DoiChieuCuoiNgay.aspx";
            StartProcessingFormBootstrap("btnCreated");
            $.ajax({
                type: "POST",
                url: url,
                datatype: "json",
                data: { action: "Create", key: lsData, path: $('#path').val() },
                success: function (data) {
                    FinishProcessingFormBootstrap("btnCreated", "Đã Tạo xong");
                   alert(data);
                       
                   
                    //window.location.reload(true);
                }
            });

        }


        function CancelDeal() {
            $("#ctl00_FormContent_btnCancel").prop("disabled", true);
            var grid = document.getElementById("<%=dataCtrl.ClientID%>");
            var lsData = "";
            $('input:checkbox[id$=Cancel]:checked', grid).each(function (item, index) {
                var id = $(this).next('input:hidden[id$=cancelID]').val();
                lsData += id.trim() + "#";
            });
            if (lsData == "") {
                alert('Chưa chọn giao dịch cần thực hiện');
                return false;
            }
            var url = "DoiChieuCuoiNgay.aspx";
            StartProcessingFormBootstrap("btnCancel");
            $.ajax({
                type: "POST",
                url: url,
                datatype: "json",
                data: { action: "Cancel", key: lsData, path: $('#path').val() },
                success: function (data) {
                    FinishProcessingFormBootstrap("btnCancel", "Đã hủy xong");
                    alert(data)
                    window.location.reload(true);
                }
            });
        }

        function UpdateDeal() {
            $("#ctl00_FormContent_btnUpdate").prop("disabled", true);
            var grid = document.getElementById("<%=dataCtrl.ClientID%>");
            var lsData = "";
            $('input:checkbox[id$=Update]:checked', grid).each(function (item, index) {
                var id = $(this).next('input:hidden[id$=UpdateID]').val();
                lsData += id.trim() + "#";
            });
            if (lsData == "") {
                alert('Chưa chọn giao dịch cần thực hiện');
                return false;
            }
            var url = "DoiChieuCuoiNgay.aspx";
            StartProcessingFormBootstrap("btnUpdate");
            $.ajax({
                type: "POST",
                url: url,
                datatype: "json",
                data: { action: "Update", key: lsData, path: $('#path').val() },
                success: function (data) {
                    FinishProcessingFormBootstrap("btnUpdate", "Đã cập nhật xong");
                    alert(data)
                    window.location.reload(true);
                }
            });
        }

        function ClearData() {          
            var url = "DoiChieuCuoiNgay.aspx";
            StartProcessingFormBootstrap("btnClear");
            $.ajax({
                type: "POST",
                url: url,
                datatype: "json",
                data: { action: "Clear"},
                success: function (data) {
                    FinishProcessingFormBootstrap("btnClear", "Đã clear xong");
                    if (data == "") {
                        alert('Đã clear dữ liệu')
                    } else {
                        alert(data);
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
