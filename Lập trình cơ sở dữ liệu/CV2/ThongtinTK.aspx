<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThongtinTK.aspx.cs" Inherits="ThongtinTK" Title="Untitled Page" %>



<asp:Content ID="Content1" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
   
    <div align="center"><h3>Thông tin Tài Khoản</h3></div>
    <div>
    <table border=0>
    <tr>
    <td><b>Tên</b></td>
    <td class="style1"><b>Chức vụ</b></td>
    <td class="style2"><b>Ngày sinh</b> </td>
    <td><b>Ngày bắt đầu làm</b></td>
    </tr>
    <tr>
    <td><asp:Label ID="lblten" runat="server"></asp:Label></td>
    <td class="style1"><asp:Label ID="lblchucvu" runat="server"></asp:Label></td>
    <td class="style2"><asp:Label ID="lblngaysinh" runat="server"></asp:Label></td>
    <td><asp:Label ID="lblngaylam" runat="server"></asp:Label></td>
    </tr>
    </table>
    
    
    
    
    
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="ScriptIncludePlaceHolder">

  <script type="text/javascript" src="<%= ResolveUrl("~/jquery.js") %>"></script>
  <script type="text/javascript" src="<%= ResolveUrl("~/script.js") %>"></script>
    <style type="text/css">
        .style1
        {
            width: 69px;
        }
        .style2
        {
            width: 85px;
        }
    </style>

</asp:Content>


