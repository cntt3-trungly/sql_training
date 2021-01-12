<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PhanPhoiCV.aspx.cs" Inherits="PhanPhoiCV" Title="Untitled Page" %>

<asp:Content ID="Content3" ContentPlaceHolderID="SheetContentPlaceHolder" Runat="Server">
<script type="text/javascript">
  function  displayCalendar()  
    {  
         var  datePicker = document.getElementById( 'datePicker'); 
        datePicker.style.display =  'block'; 
    }  
  function  display_thanhcong()
  {
  alert('Chuyển thành công');
  }  
  function  display_thieu()
  {
  alert('Cần điền đủ thông tin');
  show_hide_time();
  }  
 function  show_hide_time()
  {
  document.getElementById('zone_time1').style.visibility = 'visible';
  document.getElementById('zone_time2').style.visibility = 'visible';
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
</style>
<div class="pagecontent">
    <div class="title" align="center">
        Công văn đến chưa chuyển
    </div>
    <div class="tablecontent" align="center">
    <asp:UpdatePanel ID="panel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
    <asp:GridView ID="gvCVdenchuachuyen" runat="server" AutoGenerateColumns="false" 
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
                  <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Ngày Phát hành</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT"   Font-Size=Small runat="server" Text='<%# Eval("NgayCV") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField ItemStyle-Width="120">
                    <HeaderTemplate>Ngày Nhận</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT"  Font-Size=Small  runat="server" Text='<%# Eval("NgayNhan") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Cơ quan phát hành</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT" Font-Size=Small  runat="server" Text='<%# Eval("TenCQ") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  <asp:TemplateField>
                    <HeaderTemplate>Nội Dung</HeaderTemplate>
                    <ItemTemplate>
                    <div class="tablecontent"  align="center" style="width: 55px">
                        <asp:Label ID="lblSTT"  Font-Size=Small runat="server" Text='<%# Eval("Trichyeunoidung") %>'></asp:Label>
                    </div>
                    </ItemTemplate>
                </asp:TemplateField>
                  
            </Columns>
                </asp:GridView>
                </ContentTemplate>
    </asp:UpdatePanel>
  
</div>
</div>
<hr />
<div>
<asp:UpdatePanel ID="pnCV" runat="server" UpdateMode="Conditional">
<ContentTemplate>

<table style="width: 572px">
    <caption>
        <tdcolspan="3"><h4>Chuyển Công Văn</h4></td></tdcolspan="3">
    </caption>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <asp:Label ID="Label1" runat="server" Text="Chọn công văn"></asp:Label>
        </td>
        <td class="style1">
            <asp:DropDownList ID="cbCV" runat="server" Height="24px" Width="130px" />
        </td>
        <td class="style1">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <asp:Label ID="Label2" runat="server" Text="Chọn người đọc văn bản"></asp:Label>
        </td>
        <td >

    
        </td>
        <td>
         <div   id="datePicker"> 
            <asp:Calendar id="calendar" Height="12" Width="12" OnSelectionChanged ="calEventDate_SelectionChanged" Runat ="server" /> 
        </div> 
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2" >
        <asp:DropDownList ID="cbNV" runat="server" Height="24px" Width="130px">
         <asp:ListItem Value="-1"> --Chọn-- </asp:ListItem>
        </asp:DropDownList>
        <br />
        
        </td>
        <td rowspan="2" class="style1">
                <asp:TextBox ID="txtNV" runat="server" Height="29px" ReadOnly="true" 
                    Width="304px"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtManv" runat="server" Height="29px" ReadOnly="true" 
                    Width="304px" Visible="false"></asp:TextBox>
        </td>
        <td class="style1" rowspan="2">
       
        </td>
    </tr>
    <tr>
        <td align="center"><span class="art-button-wrapper">
            <span class="art-button-l"> </span>
            <span class="art-button-r"> </span>
            
            <asp:Button ID="btnthem" runat="server"  CssClass="art-button" 
                OnClick="btnthem_Click" Text="Thêm" 
                Width="60px" /> </span> 
        </td>
        <td align="center">   
        <span class="art-button-wrapper">
        <span class="art-button-l"> </span>
        <span class="art-button-r"> </span>
            <asp:Button ID="btnxoa" runat="server" CssClass="art-button" OnClick="btnxoa_Click" Text="Xoá" Width="56px" /> </span>
        </td>
    </tr>
    <tr>
    <td colspan="2">
    Chọn người xử lý chính văn bản
    </td>
    <td>
    <asp:DropDownList ID="cbNV2" runat="server" Height="24px" Width="130px" AutoPostBack="true" OnSelectedIndexChanged="cbNV2_SelectedIndexChanged">
    <asp:ListItem Value="1">--Chọn--</asp:ListItem>
    </asp:DropDownList>
    </td>
        <td rowspan="2">
        
        </td>
    </tr>
    
    <tr>
       
        <td colspan="2">
        <div id="zone_time1" style="visibility:hidden">
            Hạn xử lý
        </div>
        </td>
        <td>
        <div id="zone_time2" style="visibility:hidden">
           <asp:TextBox ID="txthanxl" runat="server" Height="28px" ReadOnly="true" 
                Width="271px" Text="Chọn thời gian ..."></asp:TextBox>
           <img src =  "IMG/DT.jpg" =""  onclick="displayCalendar()" 
                style="height: 15px; width: 16px"/>
        </div>
        </td>
        
    </tr>
    
    <tr>
        <td colspan="2">
        </td>
        <td>
        <span class="art-button-wrapper">
            <span class="art-button-l"> </span>
            <span class="art-button-r"> </span>
            <asp:Button ID="btndongy" runat="server" CssClass="art-button" onclick="btndongy_Click" Text="Đồng ý" Width="71px" />
            </span>
            &nbsp;&nbsp;
            <span class="art-button-wrapper">
            <span class="art-button-l"> </span>
            <span class="art-button-r"> </span>
            <asp:Button ID="btnhuy" runat="server" CssClass="art-button"  Text="Huỷ Bỏ" 
                Width="73px" onclick="btnhuy_Click" /> 
            </span>   
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</ContentTemplate>
</asp:UpdatePanel>
</div>
</asp:Content>


<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="ScriptIncludePlaceHolder">

  <script type="text/javascript" src="<%= ResolveUrl("~/jquery.js") %>"></script>
  <script type="text/javascript" src="<%= ResolveUrl("~/script.js") %>"></script>
    <style type="text/css">
        .style1
        {
            width: 74px;
        }
        .style2
        {
            width: 92px;
        }
        .style3
        {
            width: 105px;
        }
    </style>

</asp:Content>



