<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="quanlynguoidung.aspx.cs" Inherits="quanlynguoidung" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContentPlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptIncludePlaceHolder" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">


   <center>
          
                <table ID="tablequanlynguoidung"> 
                <tr>
                 <td class="tdheader" colspan=5 >
                     Quan Ly Nguoi Dung
                 </td>
                </tr>
                 <tr  >
                        <td class="tdthuong" >
                            <asp:HyperLink ID="addUser" runat="server" NavigateUrl="~/ThemNguoiDung.aspx">Tạo 
                            mới</asp:HyperLink>
                            &nbsp;|
                        </td>
                        <td class="tdthuong"  >
                            <asp:Button ID="btXoa" runat="server" Text="Xóa người dùng" onclick="btXoa_Click"  
                               />
                        </td>

         
                      
                    </tr>
                
          
        <tr>
            <td colspan="5">
                <asp:Repeater ID="rptnguoidung" runat="server" 
                >
                <HeaderTemplate>
        <table class="DataTable">
        <tr>
            <td   align="center" style=" text-align:center; font-weight: bold; width: 100px">
                UserID</td>
            <td align="center" style="text-align:center; font-weight: bold; width: 100px">
                UserName</td>
            <td align="center" style="text-align:center; font-weight: bold; width: 100px">
                Nhan vien</td>
            <td align="center" style="text-align:center; font-weight: bold; width: 100px">
                Systemright</td>
           
            <td align="center" style="text-align:center; font-weight: bold; width: 100px">
                Delete</td>
            <td align="center" style="text-align:center; font-weight: bold; width: 100px">
                Edit</td>
        </tr>
                
                </HeaderTemplate> 
         <ItemTemplate > 
        <tr >
            <td style="text-align:center; width: 100px"><%# DataBinder.Eval(Container.DataItem, "ID") %>    </td>
            <td style="text-align:center; width: 100px"> <%#DataBinder.Eval(Container.DataItem,"Username")%>   </td>
               <td style="text-align:center; width: 100px"> <%#DataBinder.Eval(Container.DataItem,"MaNV")%>   </td>
            <td style="text-align:center; width: 100px"><%#DataBinder.Eval(Container.DataItem,"Quyen")%> </td>
           
                                           
            </td>
            <td style="text-align:center; width: 100px"> 
             <input type="checkbox" name="chon" value="<%#DataBinder.Eval(Container.DataItem,"ID")%> " /> 
            </td>            
            <td style="text-align:center; width: 100px"><a href="Suaquanlynguoidung.aspx?edit=<%#DataBinder.Eval(Container.DataItem,"ID")%>">
                sua</a></td>
        </tr>
       </ItemTemplate>
       <FooterTemplate>
    </table>
    </FooterTemplate>
    </asp:Repeater>
      </td>
      </tr>
      </table>
   
</center>
</asp:Content>

