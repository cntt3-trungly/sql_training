<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Baocao2.aspx.cs" Inherits="Baocao2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Công văn đến</title>
    <style type="text/css">
        .name
        {
             padding-left:20;
             
        }
           #date
        {
             position:relative;
             top:0px;
             left:60px;
            width: 699px;
        } 
        .address
        {
             padding-left:20;
             font-style:italic;	
        }
.title
{
	display: block;
	font-size: x-large;
	color: Blue;
	float: none;
	margin-top: 20px;
	margin-bottom: 30px;
}
@media print {
 .hideme {display: none;}
 }
        .style1
        {
            width: 317px;
        }
        .style2
        {
            width: 373px;
        }
    </style>

    <script  type="text/javascript" src="codemenu.js" language="JavaScript1.2"></script>
    
</head>
<body>
<div class="hideme">

 <script  type="text/javascript" src="menu.js" language="JavaScript1.2"></script>

</div>
    <form id="form1" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager"></asp:ScriptManager>
    <div class="name"><b>Trường Cao Đẳng Công Nghệ & Quản Trị Sonadezi</b></div>
    <div class="address">Số 1, đường 6A, KCN Biên Hòa II, Biên Hòa Đồng Nai</div>
    <div align="center">
        <h1>Công Văn Đi Theo Tháng </h1>
    </div>
    <div align="center"><i>Tháng :<%=thang%></i> <br /></div>


    
    
    <div align="center">
    <asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <asp:GridView ID="gvbaocao" runat="server" AutoGenerateColumns="false" 
             BackColor="#CCCCCC"  BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="10" ForeColor="Black" 
            style="margin-left: 0px; margin-right: 104px"  >
            <HeaderStyle BackColor="#0066ff" />
            <FooterStyle BackColor="#CCCCCC" />
            <RowStyle BackColor="White" />
            <Columns>
            <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Số Đi</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblsoden" Font-Size=Small runat="server" Text='<%# Eval("Sodi") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Số CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblsoCV"  Font-Size=Small  runat="server" Text='<%# Eval("SoCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Ngày kí</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblsoCV"  Font-Size=Small  runat="server" Text='<%# Eval("ngayki") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
            </ContentTemplate>
            </asp:UpdatePanel>
    </div>
    <div align="center">
    <br />
 <div style="padding-left:200px">

        Tổng Số: <%=tong%>
    </div>
    </div>
  <div id="Div1">
    <table><tr><td class="style1">Ngày: <%=ngay %></td></tr>
    <tr>
    <td class="style2">Người in: <%=nguoiin %></td></tr>
    </table>
    </div>
    </form>
</body>
</html>
