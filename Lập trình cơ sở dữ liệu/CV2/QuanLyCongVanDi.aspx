<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuanLyCongVanDi.aspx.cs" Inherits="QuanLyCongVanDi" Title="Untitled Page" %>

<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
<style  type="text/css"> 
         #datePicker 
        { 
            display:none;  
            position : absolute ; 
            border:solid   2px   black ; 
            background-color: white ; 
        } 

       </style>
 <script type="text/javascript">
  function  displayCalendar()  
    {  
         var  datePicker = document.getElementById( 'datePicker'); 
        datePicker.style.display =  'block'; 
    }  

    function displayalert_thieu()
    {
        alert('Cần điên đủ thông tin');
    }
    function displayalert_thanhcong()
    {
        alert('Lưu thành công');
    }
  </script> 
<div class="pagecontent">
<div class="title" align="center">
        Danh sách công văn đi
    </div>
    <div class="tablecontent" align="center">
    <asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <asp:GridView ID="gvDanhsachCVdi" runat="server" AutoGenerateColumns="false" 
            BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="4" CellSpacing="2" ForeColor="Black"
            >
            <HeaderStyle BackColor="#0066ff" />
            <FooterStyle BackColor="#CCCCCC" />
            <RowStyle BackColor="White" />
            <Columns>
     
                <asp:TemplateField>
                    <HeaderTemplate>Số đi</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblSodi" Font-Size=Small runat="server" Text='<%# Eval("Sodi") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                       
             <asp:TemplateField>
                    <HeaderTemplate>Số CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblSocv"  Font-Size=Small  runat="server" Text='<%# Eval("SoCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>   
                 <asp:TemplateField>
                    <HeaderTemplate>Loại CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblloaicv"  Font-Size=Small  runat="server" Text='<%# Eval("TenLoaiCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField> 
                  <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Ngày Kí</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblngayki"   Font-Size=Small runat="server" Text='<%# Eval("NgayCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Trích yếu nội dung</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblNoidung"  Font-Size=Small  runat="server" Text='<%# Eval("Trichyeunoidung") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Tải Về</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <a href="<%#Eval("file_path")%>"><img src="IMG/save.jpg" style="height: 15px; width: 16px" /></a>

                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Sửa</HeaderTemplate>
                    <ItemTemplate>
                     <div align="center">

                            <asp:Button ID="btnUpdate" CommandArgument='<%# Eval("Sodi") %>'  runat="server" Text="Sửa" CssClass="art-button"  onclick="btnsua_Click" />

                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField Visible="false">
                    <HeaderTemplate>file_path</HeaderTemplate>
                    <ItemTemplate>
                     <div align="center" style="width: 55px">
                        <asp:Label ID="lblfile_path"  Font-Size=Small runat="server" Text='<%# Eval("file_path") %>'></asp:Label>
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
        Chỉnh sửa công văn
        </div>
        </td>
        </tr>
        <tr>
        <td><h2 style="width: 149px">Số đi: </h2></td>
         <td><h2><asp:Label ID="lblsodi" runat="server"></asp:Label></h2></td>
        </tr>
        <tr>
            <td class="style5"><asp:Label ID="lblSoCV" runat="server">Số Công văn </asp:Label>
            <asp:HiddenField ID="hdfedit" runat="server" />
            </td>
            <td class="style6"><asp:TextBox ID="txtSoCV" runat="server" ></asp:TextBox></td>
            
            <td class="style4" rowspan="2">
            <div   id="datePicker"> 
            <asp:Calendar id="calendar" Height="12" Width="12" OnSelectionChanged ="calEventDate_SelectionChanged" Runat ="server" /> 
            </div> 

            </td>
            
        </tr>
        <tr>
            <td class="style3"><asp:Label ID="Label4" runat="server">Loại Công Văn</asp:Label></td>
            <td class="style1"> 
                <asp:DropDownList ID="cbLoaiCV" runat="server" 
                    Height="24px" Width="130px" /></td>
        </tr>
        <tr>
            <td class="style7"><asp:Label ID="lblNgayCV" runat="server">Ngày kí công văn</asp:Label></td>
            <td class="style8"><asp:TextBox ID="txtNgayCV" runat="server" ReadOnly="true" Text="Chọn ngày..." ></asp:TextBox>
            <img   src =  "IMG/DT.jpg" style="height: 15px; width: 16px"  onclick="displayCalendar()"  /> 
            
            </td>
        </tr>
        
        
        <tr>
            <td class="style2"><asp:Label ID="Label1" runat="server">Trích yếu Nội Dung</asp:Label></td>
            <td><asp:TextBox ID="txtNoiDung" runat="server" Rows="5" Height="86px" 
                    Width="304px" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
        <td></td>
        <td align=left><asp:Label ID="lblfile_path" runat="server" Visible="false"></asp:Label> </td>
        </tr>

    <tr>
<td>File đính kèm</td>
<td><asp:FileUpload  ID="FileUpload1"  runat ="server" Width ="286px"/></td>
</tr>
<tr>
<td colspan="2">
<asp:Button ID="btnFileUpload" runat="server" Text="UploadFile" onclick="btnFileUpload_Click" />
<br />
                <asp:Label ID="lblSaveResults" runat="server"></asp:Label>
                <asp:Label ID="lblTenFile" runat="server"></asp:Label><br />
                <asp:Label ID="Label3" runat="server" Visible="false"></asp:Label>
                
</td>

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
     <Triggers>
                <asp:PostBackTrigger ControlID="btnFileUpload" />

   </Triggers>
   </asp:UpdatePanel>
    </div>
</asp:Content>

