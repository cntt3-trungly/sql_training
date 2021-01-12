<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NhanLuuCV.aspx.cs" Inherits="NhanLuuCV" Title="Untitled Page" %>


<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
 <script type="text/javascript">
  function  displayCalendar()  
    {  
         var  datePicker = document.getElementById( 'datePicker'); 
        datePicker.style.display =  'block'; 
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
      .style1
      {
          height: 41px;
      }
      .style2
      {
          width: 130px;
      }
      .style3
      {
          height: 41px;
          width: 130px;
      }
      .style4
      {
          width: 202px;
      }
      .style5
      {
          width: 130px;
          height: 39px;
      }
      .style6
      {
          height: 39px;
      }
      .style7
      {
          width: 130px;
          height: 45px;
      }
      .style8
      {
          height: 45px;
      }
   </style>
<asp:UpdatePanel ID="panel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<div class="pagecontent">
    <div class="title">
        Thêm Công văn mới
    </div>
    <div>
    <table>
        <tr>
            <td class="style5"><asp:Label ID="lblSoCV" runat="server">Số Công văn </asp:Label></td>
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
            <td class="style7"><asp:Label ID="lblNgayCV" runat="server">Ngày kí công văn</asp:Label></td>
            <td class="style8"><asp:TextBox ID="txtNgayCV" runat="server" ReadOnly="true" Text="Chọn ngày..." ></asp:TextBox>
            <img   src =  "IMG/DT.jpg" style="height: 15px; width: 16px"  onclick="displayCalendar()"  /> 
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtNgayCV" ErrorMessage="Nhập Ngày Tháng" 
                    Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style3"><asp:Label ID="Label3" runat="server">Loại Công Văn</asp:Label></td>
            <td class="style1"> 
                <asp:DropDownList ID="cbLoaiCV" runat="server" 
                    Height="24px" Width="130px" /></td>
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
<td>File đính kèm</td>
<td><asp:FileUpload  ID="FileUpload1"  runat ="server" Width ="286px"/></td>

</tr>
<tr>
<td colspan="2">
<asp:Button ID="btnFileUpload" runat="server" Text="UploadFile" onclick="btnFileUpload_Click" />
<br />
                <asp:Label ID="lblSaveResults" runat="server"></asp:Label>
                <asp:Label ID="lblTenFile" runat="server"></asp:Label><br />
                <asp:Label ID="lblfile_path" runat="server" Visible="false"></asp:Label>
                
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
</div>
</ContentTemplate>
<Triggers>
                <asp:PostBackTrigger ControlID="btnFileUpload" />

   </Triggers>
</asp:UpdatePanel>

</asp:Content>

