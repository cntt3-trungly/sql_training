<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QuanLyCongVanDen.aspx.cs" Inherits="QuanLyCongVanDen" Title="Untitled Page" %>


<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
<style  type="text/css"> 
         #datePicker 
        { 
            display:none;  
            position : absolute ; 
            border:solid   2px   black ; 
            background-color: white ; 
        } 
        #datePicker1
        { 
            display:none;  
            position : absolute ; 
            border:solid   2px   black ; 
            background-color: white ; 
        } 
       .panel
      {
          margin-left:auto;
      }
       .style1
    {
        width: 12px;
    }
    .style2
    {
        width: 37px;
    }
    .style3
    {
        width: 53px;
    }
    .style4
    {
        width: 269px;
    }
       </style>
 <script type="text/javascript">
    function  displayalert_del()  
    {  
         alert('Xoá thành công');
    }  
    function  displayCalendar()  
    {  
         var  datePicker = document.getElementById( 'datePicker'); 
        datePicker.style.display =  'block'; 
    } 
    function DeleteConfirm() 
    { 
    return confirm('Bạn chắc chắn muốn xoá'); 
    } 
    function  displayCalendar1()  
    {  
         var  datePicker = document.getElementById( 'datePicker1'); 
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
        Danh sách công văn đến
    </div>
    <div class="tablecontent" align="center">
    <asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <asp:GridView ID="gvDanhsachCVden" runat="server" AutoGenerateColumns="false" 

            BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="4" CellSpacing="2" ForeColor="Black"  >
            <HeaderStyle BackColor="#0066ff" />
            <FooterStyle BackColor="#CCCCCC" />
            <RowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField >
                    <HeaderTemplate>Số Đến</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblsoden" Font-Size=Small runat="server" Text='<%# Eval("Soden") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Số CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblsoCV"  Font-Size=Small  runat="server" Text='<%# Eval("SoCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>Loại CV</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lblloaiCV"  Font-Size=Small  runat="server" Text='<%# Eval("TenLoaiCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Ngày Phát hành</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblngaycongvan"   Font-Size=Small runat="server" Text='<%# Eval("NgayCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Ngày Nhận</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblngaynhan"  Font-Size=Small  runat="server" Text='<%# Eval("NgayNhan") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Cơ quan phát hành</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblcoquan" Font-Size=Small  runat="server" Text='<%# Eval("TenCQ") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Nội Dung</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblnoidung"  Font-Size=Small runat="server" Text='<%# Eval("Trichyeunoidung") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Trạng Thái</HeaderTemplate>
                    <ItemTemplate>
                    <div  class="tablecontent" align="center" style="width: 55px">
                        <asp:Label ID="lbltrangthai"  Font-Size=Small runat="server" Text='<%# Eval("Trangthai") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField>
                    <HeaderTemplate>Tải Về</HeaderTemplate>
                    <ItemTemplate>
                    <div  class="tablecontent" align="center" style="width: 55px">
                        
                        <a href="<%#Eval("file_path")%>"><img src="IMG/save.jpg" 
                    style="height: 15px; width: 16px" /></a>

                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                
                <asp:TemplateField>
                    <HeaderTemplate>Sửa</HeaderTemplate>
                    <ItemTemplate>
                     <div align="center" style="width: 55px">
                        <span class="art-button-wrapper">
                            <span class="art-button-l"> </span>
                            <span class="art-button-r"> </span>
                            <asp:Button ID="btnUpdate" CommandArgument='<%# Eval("Soden") %>' runat="server" CssClass="art-button"
                                Text="Sửa"  onclick="btnsua_Click"></asp:Button>
                        </span>
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
   <hr />
   
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
        <td><h2 style="width: 149px">Số đến: </h2></td>
         <td><h2><asp:Label ID="lblsoden1" runat="server"></asp:Label></h2></td>
        </tr>
        <tr>
            <td class="style5"><asp:Label ID="lblSoCV" runat="server">Số Công văn </asp:Label>
            <asp:HiddenField ID="hdfedit" runat="server" />
            </td>
            <td class="style6"><asp:TextBox ID="txtSoCV" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtSoCV" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
            
            <td class="style4" rowspan="2">
            <div   id="datePicker"> 
            <asp:Calendar id="calendar" Height="12" Width="12" OnSelectionChanged ="calEventDate_SelectionChanged" Runat ="server" /> 
            </div> 
            <div   id="datePicker1"> 
            <asp:Calendar id="calendar1"  OnSelectionChanged ="calEventDate1_SelectionChanged" Runat ="server" /> 
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
            
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtNgayCV" ErrorMessage="Nhập Ngày Tháng" 
                    Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
            
            </td>
        </tr>
        <tr>
            <td class="style3"><asp:Label ID="Label2" runat="server">Cơ quan phát hành</asp:Label></td>
            <td class="style1"> 
                <asp:DropDownList ID="cbCoQuan" runat="server" 
                    Height="24px" Width="130px" /></td>
        </tr>
        <tr>
            <td class="style3"><asp:Label ID="lblNgayNhan" runat="server">Ngày nhận</asp:Label></td>
            <td class="style1"><asp:TextBox ID="txtNgayNhan" runat="server" ReadOnly="true"  
                    Text="Chọn ngày..." ></asp:TextBox>
            <img   src =  "IMG/DT.jpg" style="height: 15px; width: 16px"  alt =""  onclick="displayCalendar1()"  /> 
            
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtNgayNhan" ErrorMessage="Nhập Ngày Tháng" 
                    Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
            
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
            <td colspan="2" align="center">
            
            </td>
            
            <td align="center" class="style4">
                &nbsp;</td>
            
        </tr>
        <tr>
<td>Bỏ file đính kèm <asp:CheckBox runat="server" ID="attach" /></td>
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
<span class="art-button-wrapper"  >
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

