<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print.aspx.cs" Inherits="print" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
 function PrintConfirm()
 {    
     if (window.confirm("will you print his page?"))
        {
            window.print();
        }
     else
        {
            window.close();
        }
}
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Button ID="printButton" runat="server" Text="Print" OnClientClick="PrintConfirm();" />
    </div>
    </form>
</body>
</html>
