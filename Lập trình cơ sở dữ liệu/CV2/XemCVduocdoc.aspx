<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="XemCVduocdoc.aspx.cs" Inherits="XemCVduocdoc" Title="Untitled Page" %>


<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
<div class="pagecontent">
<div class="title" align="center">
        Danh sách công văn đến<br />
    </div>
    <div class="tablecontent" align="center">
    <asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <asp:GridView ID="gvDanhsachCVden" runat="server" AutoGenerateColumns="false" 
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
                        <asp:Label ID="lblSTT" Font-Size=Small runat="server" Text='<%# Eval("Soden") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Số CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblSTT"  Font-Size=Small  runat="server" Text='<%# Eval("SoCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Loại CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT" Font-Size=Small  runat="server" Text='<%# Eval("TenLoaiCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                   <asp:TemplateField>
                    <HeaderTemplate>Thao Tác</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT" Font-Size=Small  runat="server" Text='<%# Eval("ThaoTac") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Ngày Phát hành</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT"   Font-Size=Small runat="server" Text='<%# Eval("NgayCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Ngày Nhận</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT"  Font-Size=Small  runat="server" Text='<%# Eval("Ngaynhan") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
               
                  <asp:TemplateField>
                    <HeaderTemplate>Tải Về</HeaderTemplate>
                    <ItemTemplate>
                    <div  class="tablecontent" align="center" style="width: 55px">
                                <a href="<%#Eval("file_path")%>">
                                <img src="IMG/save.jpg" 
                    style="height: 15px; width: 16px" /></a>
                            </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                </asp:GridView>
                </ContentTemplate>
    </asp:UpdatePanel>
  
</div>
<div style="height: 94px">

</div>
    </div>
</asp:Content>

