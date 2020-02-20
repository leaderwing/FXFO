<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true"
    CodeBehind="usdvnd_spot.aspx.cs" Inherits="VPB_FX.Modules.DMS.usdvnd_spot" %>

<%@ Register TagPrefix="C1WebGrid" Namespace="C1.Web.C1WebGrid" Assembly="C1.Web.C1WebGrid.2" %>
<%@ Register Assembly="C1.Web.C1Input.2" Namespace="C1.Web.C1Input" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Tỷ Giá Qui Đổi Trong Ngày</legend>
        <table style="width: 50%">
            <tr>
                <td style="width: 150px">
                    Ngày giao dịch
                </td>
                <td colspan="3">
                    <asp:TextBox ID="txtBusinessDate" runat="server" SkinID="TextBoxDate" Font-Size="Medium"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 150px">
                    SBV QD
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtSBV_QD" runat="server" Text='' DecimalPlaces="0" ThousandsSeparator="true"
                        Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000" Font-Size="Medium" Height="30px"
                        OnClientTextChanged="SetVPBRateMaxBuySell()">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 130px">
                    SPRD(%)
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtSPRD" runat="server" Text='' DecimalPlaces="2" ThousandsSeparator="true"
                        Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100" MaxValue="100" Height="30px"
                        Font-Size="Medium" OnClientTextChanged ="SetVPBRateMaxBuySell()">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px"> SBV Rate (%)
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtSBV_Rate" runat="server" Text='' DecimalPlaces="2" ThousandsSeparator="true"
                        Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100" MaxValue="100" Height="30px"
                        Font-Size="Medium" >
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 100px">Fed Rate (%)
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtFedRate" runat="server" Text='' DecimalPlaces="2" ThousandsSeparator="true"
                        Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100" MaxValue="100" Height="30px"
                        Font-Size="Medium" >
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    Tỷ giá sàn
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtSBV_MAX_MUA" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000"
                        Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td style="width: 100px">
                    Tỷ giá trần
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtSBV_MAX_BAN" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000"
                        Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
        </table>
    </fieldset>
    <fieldset class="fieldsetBg">
        <legend class="divLegend">Tỷ Giá USDVND-SPOT</legend>
        <table style="width: 50%">
            <tr>
                <td style="width: 100px" class="lblCaption">
                    DEALER YẾT
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerYet" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000"
                        Font-Size="Medium" OnClientTextChanged="SetValueForRate()">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    SPOT
                </td>
                <td style="width: 100px">
                    MUA
                </td>
                <td>
                    BÁN
                </td>
            </tr>
            <tr>
                <td style="width: 100px" class="lblCaption">
                    DEALER RATE
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    SPRD Amt lớn
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerSPRDlonMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000"
                        Font-Size="Medium" OnClientTextChanged="SetValueForRateMua()">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerSPRDlonBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000"
                        Font-Size="Medium" OnClientTextChanged="SetValueForRateBan()">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    SPRD Amt nhỏ
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerSPRDnhoMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" OnClientTextChanged="SetValueForRateMua()">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerSPRDnhoBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" OnClientTextChanged="SetValueForRateBan()">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    RATE Amt lớn
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerRATElonMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerRATElonBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    RATE Amt nhỏ
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerRATEnhoMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtDealerRATEnhoBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td style="width: 100px" class="lblCaption">
                    BRANCH RATE
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    RATE Amt lớn
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchRATElonMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000"
                        Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchRATElonBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MaxValue="100000"
                        Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    RATE Amt nhỏ
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchRATEnhoMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchRATEnhoBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    SPRD Amt lớn
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchSPRDlonMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchSPRDlonBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    SPRD Amt nhỏ
                </td>
                <td style="width: 95px">
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchSPRDnhoMua" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
                <td>
                    <cc1:C1WebNumericEdit UpDownAlign="None" ID="txtBranchSPRDnhoBan" runat="server" Text='' DecimalPlaces="0" Height="30px"
                        ThousandsSeparator="true" Culture="en-US" Value="0" SmartInputMode="true" MinValue="-100000"
                        MaxValue="100000" Font-Size="Medium" Enabled="false">
                    </cc1:C1WebNumericEdit>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td colspan="2">
                    <asp:Button ID="btnUpdate" runat="server" Text="Button" SkinID="SaveButton" />
                </td>
            </tr>
        </table>
    </fieldset>
    <table class="Table" style="width: 100%">
        <tr>
            <td>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="getListUSDVND"
                    TypeName="DataSource">
                    <SelectParameters>
                        <asp:Parameter Name="txnType" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
                <asp:GridView ID="dataCtrl" runat="server" DataSourceID="ObjectDataSource1" OnRowCreated='dataCtrl_OnRowCreate'
                    HeaderStyle-BackColor="#01a050" HeaderStyle-BorderWidth="1px" AllowSorting="false" OnRowDataBound="dataCtrl_OnDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="PK_TxnID" Visible="false">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="PK_TxnID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_TxnID")%>'
                                    CssClass="lblCaption" EnableViewState ="true"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Business_Date" HeaderText="Ngày" >
                            <ItemStyle HorizontalAlign="Right" Width="5%" Font-Size="Small" />
                            <HeaderStyle BackColor="Teal" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sbv_QD" HeaderText="SBV QĐ" DataFormatString="{0:#,0}">
                            <ItemStyle HorizontalAlign="Right" Font-Size="Small" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                         <asp:BoundField DataField="Sbv_Rate" HeaderText="Sbv Rate" DataFormatString="{0:#,0}" >
                            <HeaderStyle BackColor="Teal" ForeColor="White" />
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Fed_Rate" HeaderText="Fed Rate" DataFormatString="{0:#,0}" >
                            <HeaderStyle BackColor="Teal"  ForeColor="White"/>
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="5%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Sprd" HeaderText="Sprd" DataFormatString="{0:#,0}" >
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Dealer Yet">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="DealerYet" EnableViewState ="false"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:TemplateField>
                       
                        <%-- Dealer Mua--%>
                        <asp:TemplateField HeaderText="Sprd  Nhỏ " >
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Bid_Sprd_Dealer_Nho" Text='<%# DataBinder.Eval(Container.DataItem,"Bid_Sprd_Dealer_Nho")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Bid_Sprd_Dealer_Lon" HeaderText="Sprd  Lớn" DataFormatString="{0:#,0}">
                        <HeaderStyle BackColor="Teal" ForeColor="White"/>
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Rate  Nhỏ " >
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                            <ItemTemplate >
                                <asp:Label runat="server" EnableViewState ="false" ID="Bid_Rate_Dealer_Nho" Text='<%# DataBinder.Eval(Container.DataItem,"Bid_Rate_Dealer_Nho")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Bid_Rate_Dealer_Lon" HeaderText="Rate  Lớn " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White" />
                        </asp:BoundField>
                         <%-- Dealer Bán--%>
                        <asp:BoundField HeaderText="Sprd  Nhỏ" DataField="Ask_Sprd_Dealer_Nho" DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                            
                        </asp:BoundField>
                        <asp:BoundField DataField="Ask_Sprd_Dealer_Lon" HeaderText="Sprd  Lớn " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Ask_Rate_Dealer_Nho" HeaderText="Rate  Nhỏ " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Ask_Rate_Dealer_Lon" HeaderText="Rate  Lớn " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <%-- Branch Mua--%>
                        <asp:BoundField DataField="Bid_Sprd_Branch_Nho" HeaderText="Sprd  Nhỏ " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Bid_Sprd_Branch_Lon" HeaderText="Sprd  Lớn " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Bid_Rate_Branch_Nho" HeaderText="Rate  Nhỏ" DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Bid_Rate_Branch_Lon" HeaderText="Rate  Lớn " DataFormatString="{0:#,0}" >
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                          <%-- Branch Bán--%>
                        <asp:BoundField DataField="Ask_Sprd_Branch_Nho" HeaderText="Sprd  Nhỏ " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Ask_Sprd_Branch_Lon" HeaderText="Sprd  Lớn" DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Ask_Rate_Branch_Nho" HeaderText="Rate  Nhỏ " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="Ask_Rate_Branch_Lon" HeaderText="Rate Lớn " DataFormatString="{0:#,0}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="3%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White"/>
                        </asp:BoundField>
                        <asp:BoundField DataField="CreatedDate" HeaderText="Giờ"  DataFormatString="{0:HH:mm:ss}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <HeaderStyle BackColor="Teal" ForeColor="White" />
                        </asp:BoundField>
                        <%--<asp:BoundField DataField="CreatedUser" HeaderText="CreatedUser" >
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                        </asp:BoundField>--%>
                    </Columns>
                </asp:GridView>
                <%--<C1WebGrid:C1WebGrid runat="server" ID="dataCtrl1" Width="100%" DataSourceID="ObjectDataSource1"
                    OnItemCreated="dataCtrl_OnItemCreated" OnItemDataBound="dataCtrl_OnItemDataBound" >
                    <Columns>
                        <C1WebGrid:C1TemplateColumn HeaderText="PK_TxnID" Visible="false">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="PK_TxnID" Text='<%# DataBinder.Eval(Container.DataItem,"PK_TxnID")%>'
                                    CssClass="lblCaption"></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1BoundColumn DataField="Business_Date" HeaderText="Ngày" SortExpression="Value">
                            <ItemStyle HorizontalAlign="Right" Width="5%" Font-Size="Small" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Sbv_QD" HeaderText="SBV QĐ" SortExpression="Value">
                            <ItemStyle HorizontalAlign="Right" Font-Size="Small" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Sprd" HeaderText="Sprd" SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Dealer Yet">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="DealerYet"></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1BoundColumn DataField="Sbv_Rate" HeaderText="Sbv_Rate" SortExpression="Value"
                            Visible="false">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Fed_Rate" HeaderText="Fed_Rate" SortExpression="Value"
                            Visible="false">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Sprd Mua (Amt Nhỏ)" SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Ask_Sprd_Dealer_Nho" Text='<%# DataBinder.Eval(Container.DataItem,"Ask_Sprd_Dealer_Nho")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Sprd_Dealer_Nho" HeaderText="Sprd Bán (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Ask_Sprd_Dealer_Lon" HeaderText="Sprd Mua (Amt Lớn)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Sprd_Dealer_Lon" HeaderText="Sprd Bán (Amt Lớn)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1TemplateColumn HeaderText="Rate Mua (Amt Nhỏ)" SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                            <ItemTemplate>
                                <asp:Label runat="server" ID="Ask_Rate_Dealer_Nho" Text='<%# DataBinder.Eval(Container.DataItem,"Ask_Rate_Dealer_Nho")%>'></asp:Label>
                            </ItemTemplate>
                        </C1WebGrid:C1TemplateColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Rate_Dealer_Nho" HeaderText="Rate Bán (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Ask_Rate_Dealer_Lon" HeaderText="Rate Mua (Amt Lớn)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Rate_Dealer_Lon" HeaderText="Rate Bán (Amt Lớn)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Ask_Sprd_Branch_Nho" HeaderText="Sprd Mua (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Sprd_Branch_Nho" HeaderText="Sprd Bán (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Ask_Sprd_Branch_Lon" HeaderText="Sprd Mua (Amt Lớn)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="10%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Sprd_Branch_Lon" HeaderText="Sprd Bán (Amt Lớn)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Ask_Rate_Branch_Nho" HeaderText="Sprd Mua (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Rate_Branch_Nho" HeaderText="Sprd Mua (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Ask_Rate_Branch_Lon" HeaderText="Sprd Mua (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="Bid_Rate_Branch_Lon" HeaderText="Sprd Mua (Amt Nhỏ)"
                            SortExpression="Value">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="CreatedDate" HeaderText="Giờ" SortExpression="Value"
                            DataFormatString="{0:HH:mm:ss}">
                            <ItemStyle Font-Size="Small" HorizontalAlign="Right" Width="5%" />
                        </C1WebGrid:C1BoundColumn>
                        <C1WebGrid:C1BoundColumn DataField="CreatedUser" HeaderText="CreatedUser" SortExpression="Value">
                            <ItemStyle VerticalAlign="Middle" HorizontalAlign="Center" Width="10%" />
                        </C1WebGrid:C1BoundColumn>
                    </Columns>
                </C1WebGrid:C1WebGrid>--%>
            </td>
        </tr>
    </table>

    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            initform();
        });
        function initform() {
            SetVPBRateMaxBuySell();
        }
        function SetValueForRate() {

            var DealerYet = GetValue("ctl00_FormContent_txtDealerYet");
            DealerYet = Number(DealerYet.replace(',', ''));
            var DealerSPRDlonMua = GetValue("ctl00_FormContent_txtDealerSPRDlonMua");
            DealerSPRDlonMua = Number(DealerSPRDlonMua.replace(',', ''));
            var DealerSPRDnhoMua = GetValue("ctl00_FormContent_txtDealerSPRDnhoMua");
            DealerSPRDnhoMua = Number(DealerSPRDnhoMua.replace(',', ''));
            var DealerSPRDlonBan = GetValue("ctl00_FormContent_txtDealerSPRDlonBan");
            DealerSPRDlonBan = Number(DealerSPRDlonBan.replace(',', ''));
            var DealerSPRDnhoBan = GetValue("ctl00_FormContent_txtDealerSPRDnhoBan");
            DealerSPRDnhoBan = Number(DealerSPRDnhoBan.replace(',', ''));
            var VPBMaxBuy = GetValue("ctl00_FormContent_txtSBV_MAX_MUA");
            VPBMaxBuy = Number(VPBMaxBuy.replace(',', ''));
            var VPBMaxSell = GetValue("ctl00_FormContent_txtSBV_MAX_BAN");
            VPBMaxSell = Number(VPBMaxSell.replace(',', ''));

            /* dealer */
            var V_Rate_Nho_Mua = Math.round(DealerYet - DealerSPRDnhoMua);
            SetValue("ctl00_FormContent_txtDealerRATEnhoMua", FormatNumber(V_Rate_Nho_Mua));
            var V_Rate_Lon_Mua = Math.round(DealerYet - DealerSPRDlonMua);
            SetValue("ctl00_FormContent_txtDealerRATElonMua", FormatNumber(V_Rate_Lon_Mua));
            var V_Rate_Nho_Ban = Math.round(DealerYet + DealerSPRDnhoBan);

            SetValue("ctl00_FormContent_txtDealerRATEnhoBan", FormatNumber(V_Rate_Nho_Ban));
            var V_Rate_Lon_Ban = Math.round(DealerYet + DealerSPRDlonBan);

            SetValue("ctl00_FormContent_txtDealerRATElonBan", FormatNumber(V_Rate_Lon_Ban));
            /* cho Rate branch*/
            /* rate nho*/

            var V_RateBranch_Nho_Mua = V_Rate_Nho_Mua;

            if (V_Rate_Nho_Mua < VPBMaxBuy)
                V_RateBranch_Nho_Mua = VPBMaxBuy;
            else {
                if (V_Rate_Nho_Mua > VPBMaxSell)
                    V_RateBranch_Nho_Mua = VPBMaxSell;
                else
                    V_RateBranch_Nho_Mua = V_Rate_Nho_Mua;
            }

            SetValue("ctl00_FormContent_txtBranchRATEnhoMua", FormatNumber(V_RateBranch_Nho_Mua));
            /* rate lon*/
            var V_RateBranch_Lon_Mua = V_Rate_Lon_Mua;
            if (V_Rate_Lon_Mua < VPBMaxBuy)
                V_RateBranch_Lon_Mua = VPBMaxBuy;
            else {
                if (V_Rate_Lon_Mua > VPBMaxSell)
                    V_RateBranch_Lon_Mua = VPBMaxSell;
                else
                    V_RateBranch_Lon_Mua = V_Rate_Lon_Mua;
            }
            SetValue("ctl00_FormContent_txtBranchRATElonMua", FormatNumber(V_RateBranch_Lon_Mua));
            /* SPRD nho */

            SetValue("ctl00_FormContent_txtBranchSPRDnhoMua", FormatNumber(V_Rate_Nho_Mua - V_RateBranch_Nho_Mua));
            /* SPRD lon */

            SetValue("ctl00_FormContent_txtBranchSPRDlonMua", FormatNumber(V_Rate_Lon_Mua - V_RateBranch_Lon_Mua));

            /* ban*/

            /* cho Rate branch*/
            /* rate nho*/
            var V_RateBranch_Nho_Ban = V_Rate_Nho_Ban
            if (V_Rate_Nho_Ban < VPBMaxBuy)
                V_RateBranch_Nho_Ban = VPBMaxBuy;
            else {
                if (V_Rate_Nho_Ban > VPBMaxSell)
                    V_RateBranch_Nho_Ban = VPBMaxSell;
                else
                    V_RateBranch_Nho_Ban = V_Rate_Nho_Ban;
            }
            SetValue("ctl00_FormContent_txtBranchRATEnhoBan", FormatNumber(V_RateBranch_Nho_Ban));
            /* rate lon*/
            var V_RateBranch_Lon_Ban = V_Rate_Lon_Ban;
            if (V_Rate_Lon_Ban < VPBMaxBuy)
                V_RateBranch_Lon_Ban = VPBMaxBuy;
            else {
                if (V_Rate_Lon_Ban > VPBMaxSell)
                    V_RateBranch_Lon_Ban = VPBMaxSell;
                else
                    V_RateBranch_Lon_Ban = V_Rate_Lon_Ban;
            }
            SetValue("ctl00_FormContent_txtBranchRATElonBan", FormatNumber(V_RateBranch_Lon_Ban));
            /* SPRD nho */

            SetValue("ctl00_FormContent_txtBranchSPRDnhoBan", FormatNumber(V_Rate_Nho_Ban - V_RateBranch_Nho_Ban));
            /* SPRD lon */

            SetValue("ctl00_FormContent_txtBranchSPRDlonBan", FormatNumber(V_Rate_Lon_Ban - V_RateBranch_Lon_Ban));

        }
        function SetValueForRateMua() {
            /******get value*****/
            var DealerYet = GetValue("ctl00_FormContent_txtDealerYet");
            DealerYet = Number(DealerYet.replace(',', ''));
            var DealerSPRDlonMua = GetValue("ctl00_FormContent_txtDealerSPRDlonMua");
            DealerSPRDlonMua = Number(DealerSPRDlonMua.replace(',', ''));
            var DealerSPRDnhoMua = GetValue("ctl00_FormContent_txtDealerSPRDnhoMua");
            DealerSPRDnhoMua = Number(DealerSPRDnhoMua.replace(',', ''));
            var VPBMaxBuy = GetValue("ctl00_FormContent_txtSBV_MAX_MUA");
            VPBMaxBuy = Number(VPBMaxBuy.replace(',', ''));
            var VPBMaxSell = GetValue("ctl00_FormContent_txtSBV_MAX_BAN");
            VPBMaxSell = Number(VPBMaxSell.replace(',', ''));

            /***set value ***/
            /* cho RATE dealer*/
            var V_Rate_Nho = Math.round(DealerYet - DealerSPRDnhoMua);
            SetValue("ctl00_FormContent_txtDealerRATEnhoMua", FormatNumber(V_Rate_Nho));
            var V_Rate_Lon = Math.round(DealerYet - DealerSPRDlonMua);
            SetValue("ctl00_FormContent_txtDealerRATElonMua", FormatNumber(V_Rate_Lon));
            /* cho Rate branch*/
            /* rate nho*/
            var V_RateBranch_Nho = V_Rate_Nho;
            if (V_Rate_Nho < VPBMaxBuy)
                V_RateBranch_Nho = VPBMaxBuy;
            else {
                if (V_Rate_Nho > VPBMaxSell)
                    V_RateBranch_Nho = VPBMaxSell;
                else
                    V_RateBranch_Nho = V_Rate_Nho;
            }
            SetValue("ctl00_FormContent_txtBranchRATEnhoMua", FormatNumber(V_RateBranch_Nho));
            /* rate lon*/
            var V_RateBranch_Lon = V_Rate_Lon;
            if (V_Rate_Lon < VPBMaxBuy)
                V_RateBranch_Lon = VPBMaxBuy;
            else {
                if (V_Rate_Lon > VPBMaxSell)
                    V_RateBranch_Lon = VPBMaxSell;
                else
                    V_RateBranch_Lon = V_Rate_Lon;
            }
            SetValue("ctl00_FormContent_txtBranchRATElonMua", FormatNumber(V_RateBranch_Lon));
            /* SPRD nho */

            SetValue("ctl00_FormContent_txtBranchSPRDnhoMua", FormatNumber(V_Rate_Nho - V_RateBranch_Nho));
            /* SPRD lon */

            SetValue("ctl00_FormContent_txtBranchSPRDlonMua", FormatNumber(V_Rate_Lon - V_RateBranch_Lon));

        }
        function SetValueForRateBan() {
            /******get value*****/
            var DealerYet = GetValue("ctl00_FormContent_txtDealerYet");
            DealerYet = Number(DealerYet.replace(',', ''));
            var DealerSPRDlonBan = GetValue("ctl00_FormContent_txtDealerSPRDlonBan");
            DealerSPRDlonBan = Number(DealerSPRDlonBan.replace(',', ''));
            var DealerSPRDnhoBan = GetValue("ctl00_FormContent_txtDealerSPRDnhoBan");
            DealerSPRDnhoBan = Number(DealerSPRDnhoBan.replace(',', ''));
            var VPBMaxBuy = GetValue("ctl00_FormContent_txtSBV_MAX_MUA");
            VPBMaxBuy = Number(VPBMaxBuy.replace(',', ''));
            var VPBMaxSell = GetValue("ctl00_FormContent_txtSBV_MAX_BAN");
            VPBMaxSell = Number(VPBMaxSell.replace(',', ''));

            /***set value ***/
            /* cho RATE dealer*/
            var V_Rate_Nho = Math.round(DealerYet + DealerSPRDnhoBan);
            SetValue("ctl00_FormContent_txtDealerRATEnhoBan", FormatNumber(V_Rate_Nho));
            var V_Rate_Lon = Math.round(DealerYet + DealerSPRDlonBan);
            SetValue("ctl00_FormContent_txtDealerRATElonBan", FormatNumber(V_Rate_Lon));
            /* cho Rate branch*/
            /* rate nho*/
            var V_RateBranch_Nho = V_Rate_Nho;
            if (V_Rate_Nho < VPBMaxBuy)
                V_RateBranch_Nho = VPBMaxBuy;
            else {
                if (V_Rate_Nho > VPBMaxSell)
                    V_RateBranch_Nho = VPBMaxSell;
                else
                    V_RateBranch_Nho = V_Rate_Nho;
            }
            SetValue("ctl00_FormContent_txtBranchRATEnhoBan", FormatNumber(V_RateBranch_Nho));
            /* rate lon*/
            var V_RateBranch_Lon = V_Rate_Lon;
            if (V_Rate_Lon < VPBMaxBuy)
                V_RateBranch_Lon = VPBMaxBuy;
            else {
                if (V_Rate_Lon > VPBMaxSell)
                    V_RateBranch_Lon = VPBMaxSell;
                else
                    V_RateBranch_Lon = V_Rate_Lon;
            }
            SetValue("ctl00_FormContent_txtBranchRATElonBan", FormatNumber(V_RateBranch_Lon));
            /* SPRD nho */

            SetValue("ctl00_FormContent_txtBranchSPRDnhoBan", FormatNumber(V_Rate_Nho - V_RateBranch_Nho));
            /* SPRD lon */

            SetValue("ctl00_FormContent_txtBranchSPRDlonBan", FormatNumber(V_Rate_Lon - V_RateBranch_Lon));


        }
        function SetVPBRateMaxBuySell() {
            var SBVQD = GetValue("ctl00_FormContent_txtSBV_QD");
            SBVQD = Number(SBVQD.replace(',', ''));
            var SPRD = GetValue("ctl00_FormContent_txtSPRD");
            SPRD = Number(SPRD.replace(',', ''));
            var VPBMaxBuy = Math.round(SBVQD - (SBVQD * SPRD) / 100);
            SetValue("ctl00_FormContent_txtSBV_MAX_MUA", FormatNumber(VPBMaxBuy));
            var VPBMaxSell = Math.round(SBVQD + (SBVQD * SPRD) / 100);
            SetValue("ctl00_FormContent_txtSBV_MAX_BAN", FormatNumber(VPBMaxSell));
        }
        function CheckVPBRateSell() {
            var DealerYetBan = Number(GetValue("ctl00_FormContent_txtDealerYetBan").replace(',', ''));
            var VPBRateSell = Number(GetValue("ctl00_FormContent_txtSBV_MAX_BAN").replace(',', ''));
            if (DealerYetBan > VPBRateSell) {
                alert("Tỷ giá bán ra không được lớn hơn tỷ giá(bán) trần.");
                SetValue("ctl00_FormContent_txtDealerYetBan", "0.00");
            }
        }
        function CheckVPBRateBuy() {
            var DealerYetMua = Number(GetValue("ctl00_FormContent_txtDealerYetMua").replace(',', ''));
            var VPBRateBuy = Number(GetValue("ctl00_FormContent_txtSBV_MAX_MUA").replace(',', ''));
            if (DealerYetMua < VPBRateBuy) {
                alert("Tỷ giá mua vào không được nhỏ hơn tỷ giá(mua) trần.");
                SetValue("ctl00_FormContent_txtDealerYetMua", "0.00");
            }
        }
        function AddNew() {
            var BusinessDate = GetValue("ctl00_FormContent_txtBusinessDate");
            var SBV_QD = Number(GetValue("ctl00_FormContent_txtSBV_QD").replace(',', ''));
            var SBV_Rate = GetValue("ctl00_FormContent_txtSBV_Rate");
            var SPRD = GetValue("ctl00_FormContent_txtSPRD");
            var FedRate = GetValue("ctl00_FormContent_txtFedRate");
            var DealerYet = Number(GetValue("ctl00_FormContent_txtDealerYet").replace(',', ''));
            /* dealer*/
            var DealerRateMuaLon = Number(GetValue("ctl00_FormContent_txtDealerRATElonMua").replace(',', ''));
            var DealerRateMuaNho = Number(GetValue("ctl00_FormContent_txtDealerRATEnhoMua").replace(',', ''));
            var DealerRateBanLon = Number(GetValue("ctl00_FormContent_txtDealerRATElonBan").replace(',', ''));
            var DealerRateBanNho = Number(GetValue("ctl00_FormContent_txtDealerRATEnhoBan").replace(',', ''));
            var DealerSPRDMuaLon = Number(GetValue("ctl00_FormContent_txtDealerSPRDlonMua").replace(',', ''));
            var DealerSPRDMuaNho = Number(GetValue("ctl00_FormContent_txtDealerSPRDnhoMua").replace(',', ''));
            var DealerSPRDBanLon = Number(GetValue("ctl00_FormContent_txtDealerSPRDlonBan").replace(',', ''));
            var DealerSPRDBanNho = Number(GetValue("ctl00_FormContent_txtDealerSPRDnhoBan").replace(',', ''));
            /* branch*/
            var BranchRateMuaLon = Number(GetValue("ctl00_FormContent_txtBranchRATElonMua").replace(',', ''));
            var BranchRateMuaNho = Number(GetValue("ctl00_FormContent_txtBranchRATEnhoMua").replace(',', ''));
            var BranchRateBanLon = Number(GetValue("ctl00_FormContent_txtBranchRATElonBan").replace(',', ''));
            var BranchRateBanNho = Number(GetValue("ctl00_FormContent_txtBranchRATEnhoBan").replace(',', ''));
            var BranchSPRDMuaLon = Number(GetValue("ctl00_FormContent_txtBranchSPRDlonMua").replace(',', ''));
            var BranchSPRDMuaNho = Number(GetValue("ctl00_FormContent_txtBranchSPRDnhoMua").replace(',', ''));
            var BranchSPRDBanLon = Number(GetValue("ctl00_FormContent_txtBranchSPRDlonBan").replace(',', ''));
            var BranchSPRDBanNho = Number(GetValue("ctl00_FormContent_txtBranchSPRDnhoBan").replace(',', ''));

            var VPBRateSell = Number(GetValue("ctl00_FormContent_txtSBV_MAX_BAN").replace(',', ''));
            var VPBRateBuy = Number(GetValue("ctl00_FormContent_txtSBV_MAX_MUA").replace(',', ''));

            if (DealerYet <= 0) {
                alert("Dealer Yet không được nhỏ hơn hoặc bằng 0.");
                return;
            }
            if (DealerSPRDMuaLon <= 0) {
                alert("SPRD mua lớn không được nhỏ hơn hoặc bằng 0.");
                return;
            }
            if (DealerSPRDMuaNho <= 0) {
                alert("SPRD mua nhỏ không được nhỏ hơn hoặc bằng 0.");
                return;
            }
            if (DealerSPRDBanLon <= 0) {
                alert("SPRD bán lớn không được nhỏ hơn hoặc bằng 0.");
                return;
            }
            if (DealerSPRDBanNho <= 0) {
                alert("SPRD bán nhỏ không được nhỏ hơn hoặc bằng 0.");
                return;
            }
            if (SBV_QD <= 0) {
                alert("SBV_QD không được nhỏ hơn hoặc bằng 0.");
                return;
            }
            if (SPRD <= 0) {
                alert("SPRD không được nhỏ hơn hoặc bằng 0.");
                return;
            }

            var url = "usdvnd_spot.aspx";
            var query = "act=addNew";
            query += "&BusinessDate=" + BusinessDate;
            query += "&SBV_QD=" + SBV_QD;
            query += "&SBV_Rate=" + SBV_Rate;
            query += "&SPRD=" + SPRD;
            query += "&FedRate=" + FedRate;
            query += "&SprdMua=" + VPBRateBuy;
            query += "&SprdBan=" + VPBRateSell;

            query += "&DealerYet=" + DealerYet;
            /*branch*/
            query += "&BRML=" + BranchRateMuaLon;
            query += "&BRMN=" + BranchRateMuaNho;
            query += "&BRBL=" + BranchRateBanLon;
            query += "&BRBN=" + BranchRateBanNho;
            query += "&BSML=" + BranchSPRDMuaLon;
            query += "&BSMN=" + BranchSPRDMuaNho;
            query += "&BSBL=" + BranchSPRDBanLon;
            query += "&BSBN=" + BranchSPRDBanNho;
            /* dealer*/
            query += "&DRML=" + DealerRateMuaLon;
            query += "&DRMN=" + DealerRateMuaNho;
            query += "&DRBL=" + DealerRateBanLon;
            query += "&DRBN=" + DealerRateBanNho;
            query += "&DSML=" + DealerSPRDMuaLon;
            query += "&DSMN=" + DealerSPRDMuaNho;
            query += "&DSBL=" + DealerSPRDBanLon;
            query += "&DSBN=" + DealerSPRDBanNho;

            $.ajax({
                type: "POST",
                url: url,
                data: query,
                success: function(errormessage) {
                    if (errormessage == "") {
                        alert("Đã thêm cập nhật thêm tỷ giá USDVND");
                        url = "usdvnd_spot.aspx";
                        window.location.href = url;
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
