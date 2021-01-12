<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="taobaocao.aspx.cs" Inherits="taobaocao" Title="Untitled Page" %>


<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
<div class="pagecontent">
<div class="title" align="center">
        Báo Cáo Công Văn
    </div>
    <table>
    <tr><td>Công văn đến nhận theo tháng</td></tr>
    <tr>
    <td>
<asp:DropDownList ID="cbthang" runat="server" 
                    Height="24px" Width="130px" >
                    <asp:ListItem Text="Tháng 1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Tháng 2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Tháng 3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Tháng 4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Tháng 5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Tháng 6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Tháng 7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Tháng 8" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Tháng 9" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Tháng 10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Tháng 11" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Tháng 12" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td>
<asp:Button ID="btn_baocao" CssClass="art-button" runat="server" Text="Xembaocao" onclick="baocao_Click" />
                    </td>
                    </tr>
                    <tr><td>Công văn đến theo cơ quan gửi</td></tr>
                    <tr>
                    <td>
<asp:DropDownList ID="cbCoQuan" runat="server" 
                    Height="24px" Width="130px" />
                    </td>
                    <td>
 <asp:Button ID="btn_baocao1" runat="server" CssClass="art-button" Text="Xembaocao" onclick="baocao1_Click" />                   
                    </TD>
                    </tR>
                    <tr><td>Công văn đi gửi theo tháng</td></tr>
                    <tr>
                    <td>
<asp:DropDownList ID="cbthang1" runat="server" 
                    Height="24px" Width="130px" >
                    <asp:ListItem Text="Tháng 1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Tháng 2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Tháng 3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Tháng 4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Tháng 5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Tháng 6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Tháng 7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Tháng 8" Value="8"></asp:ListItem>
                    <asp:ListItem Text="Tháng 9" Value="9"></asp:ListItem>
                    <asp:ListItem Text="Tháng 10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="Tháng 11" Value="11"></asp:ListItem>
                    <asp:ListItem Text="Tháng 12" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td>
<asp:Button ID="Button1" runat="server" CssClass="art-button" Text="Xembaocao" onclick="baocao2_Click" />                   
                    </td>
                    </tr>
                    </table>
</asp:Content>

