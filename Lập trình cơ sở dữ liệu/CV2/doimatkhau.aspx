<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="doimatkhau.aspx.cs" Inherits="doimatkhau" Title="Untitled Page" %>

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
            width: 193px;
        }
        .style3
        {
            width: 199px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">

    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="lblmsg" runat="server" ForeColor="red"></asp:Label>
            </td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                Password cũ</td>
            <td class="style3">
                <asp:TextBox TextMode="Password" ID="txtcu" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtcu" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Password mới</td>
            <td class="style3">
                <asp:TextBox TextMode="Password"  ID="txtmoi" runat="server" 
                    ValidationGroup="a"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtmoi" ErrorMessage="*"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="txtmoi"
                                ErrorMessage="<br />Không được phép nhập ký tự <b>' và &quot;</b>"
                                ValidationExpression="[^'&quot;]+"
                            
                                Display="Dynamic" />   
            </td>
        </tr>
        <tr>
            <td class="style2">
                Password mới nhâp lại</td>
            <td class="style3">
                <asp:TextBox TextMode="Password" ID="txtmoinhaplai" runat="server"></asp:TextBox>
                
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtmoinhaplai" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtmoi" ControlToValidate="txtmoinhaplai" 
                    ErrorMessage="Password nhập lại không khớp"></asp:CompareValidator>
                           <asp:RegularExpressionValidator ID="regPass" runat="server"
                                ControlToValidate="txtmoinhaplai"
                                ErrorMessage="<br />Không được phép nhập ký tự <b>' và &quot;</b>"
                                ValidationExpression="[^'&quot;]+"
                            
                                Display="Dynamic" />
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="txtmoi" ControlToValidate="txtmoinhaplai" 
                    ErrorMessage="password nhap lai k dung" ValidationGroup="a"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnok" runat="server" Text="OK" onclick="btnok_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>

