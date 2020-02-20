<%@ Page Title="" Language="C#" MasterPageFile="~/Share/Wsp.master" AutoEventWireup="true" CodeBehind="ccy_rate_reuter.aspx.cs" Inherits="VPB_FX.Modules.DMS.ccy_rate_reuter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FormContent" runat="server">
<asp:Literal ID="litFullLoad" runat="server" Visible = "false"></asp:Literal><br />
  <asp:ScriptManager ID="scManager" runat="server" />
   <div>
        <asp:Timer ID="IntervalTimer" OnTick="IntervalTimer_Tick" runat="server" Interval="1000">
        </asp:Timer>
    </div>
 <asp:UpdatePanel ID="upPanel" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="IntervalTimer" EventName="Tick" />
        </Triggers>
        <ContentTemplate><b style="font-size:large">
            <asp:Literal ID="litrptRefresh" runat="server" Text="">
            </asp:Literal>
            </b>
            <br />
            <br />
            <table border="1px" width="100%" class="TableBorder" cellpadding="0">
              <tbody>
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
                        <td style="font-size:large; background-color:HighlightText" ><%#Eval("Ccy")%></td>
                        <td style="font-size:large; background-color:HighlightText"><%#Eval("Bid_Rate")%></td>
                        <td style="font-size:large; background-color:HighlightText"><%#Eval("Ask_Rate") %></td>
                        <td style="font-size:large"><%#Eval("CreatedDate") %></td>
                        </tr>
                    </ItemTemplate>                    
                </asp:Repeater>
            </tbody>
            </table>
     </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ButtonExtendBefore" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ButtonExtend" runat="server">
</asp:Content>
