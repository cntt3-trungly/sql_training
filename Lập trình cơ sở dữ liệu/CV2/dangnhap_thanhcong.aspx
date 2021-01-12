<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dangnhap_thanhcong.aspx.cs" Inherits="dangnhap_thanhcong" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
    alert('Chúc mừng bạn đăng nhập thành công');
     function delayer()
    {
        window.location = "ThongTinTK.aspx"
    }
    </script>
</head>
<body onload="setTimeout('delayer()',0)">
    <form id="form1" runat="server">
    <div style="width: 100%; text-align: center;">
    <img src="IMG/loading-gif-animation.gif" align="middle"
            style="height: 308px; width: 336px" />
    </div>
    </form>
</body>
</html>
