<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="themnguoidung.aspx.cs" Inherits="themnguoidung" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 191px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

    <table class="style1">
        <tr>
            <td class="style2">
                Username</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Password</td>
                                                    <td>
                                                        <asp:TextBox TextMode="Password" ID="TextBox2" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        MaNV</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="style2">
                                                        Quyen</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Them" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

