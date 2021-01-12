<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="XoaPhanPhoiCV.aspx.cs" Inherits="XoaPhanPhoiCV" Title="Untitled Page" %>


<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
<script type="text/javascript">
    function  displayalert_del()  
    {  
         alert('Xoá thành công');
    }  
    function DeleteConfirm() 
    { 
    return confirm('Bạn chắc chắn muốn xoá'); 
    } 
 </script>
<div class="pagecontent">
    <div class="title" align="center">
        Công văn đến đã chuyển
    </div>
    <div class="tablecontent" align="center">
    <asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <asp:GridView ID="gvCVdendachuyen" runat="server" AutoGenerateColumns="false" 
            BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="4" CellSpacing="2" ForeColor="Black">
            <HeaderStyle BackColor="#0066ff" />
            <FooterStyle BackColor="#CCCCCC" />
            <RowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>Số Đến</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblSoden" Font-Size=Small runat="server" Text='<%# Eval("Soden") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Số CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblSoCV"  Font-Size=Small  runat="server" Text='<%# Eval("SoCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Ngày Phát hành</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblNgayCV"   Font-Size=Small runat="server" Text='<%# Eval("NgayCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Ngày Nhận</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblNgaynhan"  Font-Size=Small  runat="server" Text='<%# Eval("NgayNhan") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Cơ quan phát hành</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblCoquan" Font-Size=Small  runat="server" Text='<%# Eval("TenCQ") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Nội Dung</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblNoidung"  Font-Size=Small runat="server" Text='<%# Eval("Trichyeunoidung") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Xóa</HeaderTemplate>
                    <ItemTemplate>
                     <div align="center" style="width: 55px">
                        <span class="art-button-wrapper">
                            <span class="art-button-l"> </span>
                            <span class="art-button-r"> </span>
                            <asp:Button ID="btndel" CommandArgument='<%# Eval("Soden") %>' runat="server" CssClass="art-button"
                                Text="Xóa"  OnClientClick="return DeleteConfirm();" onclick="btndel_Click"></asp:Button>
                        </span>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  
            </Columns>
                </asp:GridView>
                </ContentTemplate>
    </asp:UpdatePanel>
  
</div>
</div>


</asp:Content>

