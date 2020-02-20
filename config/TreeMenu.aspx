<%@ Page Language="C#" AutoEventWireup="true" Inherits="TreeMenu" Codebehind="TreeMenu.aspx.cs" %>
<%@ OutputCache Duration="1" NoStore="true" VaryByParam="None" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="Controls/Xmenu/Xmenu.css" rel="stylesheet" type="text/css" />
    <script src="Javascript/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="Controls/Xmenu/Xmenu.js"></script>
    <script>
        var itemclick;
    function selectingItem(obj) {
        itemclick = obj.id;
        $("div").attr("style", "color:Teal;");
        $("#" + obj.id).attr("style", "color:Blue;");
    }
    function overme() {
    }
    function outme(obj) {
        if (obj.id != itemclick)
            $("#" + obj.id).attr("style", "color:Teal;");
    }
    function movedme(obj) {
        $("#" + obj.id).attr("style", "color:Blue;");
    }
    </script>
</head>

<body style="background-color: white">
    <img id="loading" src="Images/indicator_big.gif" alt="" />
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {
            $("#loading").hide();
        });
        var ua = navigator.userAgent;
        var checker = {
            Windows: ua.match(/(windows|Windows)/),
            Firefox: ua.match(/(Firefox)/)
        };

        if (checker.Windows)
            if (checker.Firefox)
                document.documentElement.style.overflow = 'hidden';
            else
                document.body.scroll = 'no';
    </script>
    <form runat="server" id="main_menu">
        <asp:Literal runat="server" ID="ctxstatus"></asp:Literal>    
        <asp:Literal runat="server" ID="boxmenu"></asp:Literal>
    </form>
</body>
</html>
