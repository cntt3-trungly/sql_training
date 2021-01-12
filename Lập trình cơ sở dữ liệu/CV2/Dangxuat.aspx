<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dangxuat.aspx.cs" Inherits="Dangxuat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
    alert('Bạn đã đăng xuất');
     function delayer()
    {
        window.location = "default.aspx"
    }
</script>
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
