<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="quanlytaikhoan.aspx.cs" Inherits="quanlytaikhoan" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

    <asp:Repeater ID="Repeater1" runat="server">
    <HeaderTemplate>
    <table>
    <tr>
        <td>ID</td><td>taikhoan</td><td>nhanvien</td><td>quyen</td>
    </tr>
    
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td><%#DataBinder.Eval(Container.DataItem,"ID") %></td>
    <td><%#DataBinder.Eval(Container.DataItem,"Username") %></td>
    
    <td>
    
    </td>
    </tr>
    </ItemTemplate>
    <FooterTemplate></table></FooterTemplate>
    </asp:Repeater>

</asp:Content>

