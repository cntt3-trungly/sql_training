<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Nodownload.aspx.cs" Inherits="NoDL" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<script type="text/javascript">
    alert('Không có file đính kèm');
    function delayer()
    {
        window.location = "ThongTinTK.aspx"
    }
</script>
    <title>Untitled Page</title>
</head>
<body onload="setTimeout('delayer()',0)">
    <form id="form1" runat="server">
    <div>
       <div style="width: 100%; text-align: center;">
    <img src="IMG/loading-gif-animation.gif" align="middle"
            style="height: 308px; width: 336px" />
    </div>
    </div>
    </form>
</body>
</html>
