<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="XLCV.aspx.cs" Inherits="XLCV" Title="Untitled Page" %>

<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
 
    <script type="text/javascript">

    function displayalert_thanhcong()
    {
        alert('Lưu thành công');
    }
     function displayalert_thieu()
    {
        alert('Lưu thành công');
    }
  </script>
  <div class="pagecontent">
<div class="title" align="center">
        Danh sách công văn đến
    </div>
    <div class="tablecontent" align="center">
    <asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gvDanhsachCVXL" runat="server" AutoGenerateColumns="false" 

            BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="4" CellSpacing="2" ForeColor="Black"  >
                <HeaderStyle BackColor="#0066ff" />
                <FooterStyle BackColor="#CCCCCC" />
                <RowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Số Đến
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="tablecontent" align="center" style="width: 55px">
                                <asp:Label ID="lblsoden" Font-Size=Small runat="server" 
                            Text='<%# Eval("Soden") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Số CV
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="tablecontent" align="center" style="width: 55px">
                                <asp:Label ID="lblsoCV"  Font-Size=Small  runat="server" 
                            Text='<%# Eval("SoCV") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Loại CV
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="tablecontent" align="center" style="width: 55px">
                                <asp:Label ID="lblloaiCV"  Font-Size=Small  runat="server" 
                            Text='<%# Eval("TenLoaiCV") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Ngày Nhận
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="tablecontent"  align="center" style="width: 55px">
                                <asp:Label ID="lblngaynhan"  Font-Size=Small  runat="server" 
                            Text='<%# Eval("NgayNhan") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
            <asp:TemplateField>
                        <HeaderTemplate>
                            Tình Trạng
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="tablecontent"  align="center" style="width: 55px">
                                <asp:Label ID="lblTT"  Font-Size=Small  runat="server" 
                            Text='<%# Eval("tinhtrang") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Tải Về
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div  class="tablecontent" align="center" style="width: 55px">
                                <a href="<%#Eval("file_path")%>">
                                <img src="IMG/save.jpg" 
                    style="height: 15px; width: 16px" /></a>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Sửa
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div align="center" style="width: 55px">
                                <span class="art-button-wrapper"><span class="art-button-l"></span>
                                <span class="art-button-r"></span>
                                <asp:Button ID="btnUpdate" CommandArgument='<%# Eval("Soden") %>' 
                             runat="server" CssClass="art-button"
                                Text="Sửa"  onclick="btnsua_Click"></asp:Button>
                                </span>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
        </asp:UpdatePanel>
        </div>
  <asp:UpdatePanel ID="panel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
    <ContentTemplate>
    
    <div id="panel3" style="visibility:hidden">
    <table id="table_update">
        <tr>
        <td colspan="2">
        <div class="title">
            Cập nhật tình trạng
        </div>
        </td>
        </tr>
        <tr>
        <td><h2 style="width: 149px">Số đến: </h2></td>
         <td><h2><asp:Label ID="lblsoden1" runat="server"></asp:Label></h2></td>
         <td class="style5"><asp:Label ID="lblSoCV" runat="server">Số Công văn </asp:Label>
         <asp:HiddenField ID="hdfedit" runat="server" />
         </td>
         <td class="style1"> 
                <asp:DropDownList ID="cbTT" runat="server" 
                    Height="24px" Width="130px" /></td>
        </tr>
        <tr>
<td align="center">

</td>
<td>
<span class="art-button-wrapper">
            <span class="art-button-l"> </span>
            <span class="art-button-r"> </span>
            <asp:Button ID="btnluu"  runat="server" CssClass="art-button" Text="Lưu"  OnClick="btnluu_Click" />
            </span>
    	&nbsp;&nbsp;&nbsp;
            <span class="art-button-wrapper">
            <span class="art-button-l"> </span>
            <span class="art-button-r"> </span>
            <asp:Button ID="btnhuy"  runat="server" CssClass="art-button"  OnClick="btnhuy_Click" Text="Huỷ" />
            </span>
</td>
</tr>
     </table>
     </div>
     </ContentTemplate>
     </asp:UpdatePanel>
    </div>
</asp:Content>



