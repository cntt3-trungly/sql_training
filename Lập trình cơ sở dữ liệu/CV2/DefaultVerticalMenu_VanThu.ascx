<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVerticalMenu_Admin.ascx.cs" Inherits="VMenu" %>

  <script type="text/javascript">
 
  function  display_welcome()
  {
  alert('Chúc mừng bạn đăng nhập thành công');
  }  

 
 </script>
<div class="art-vmenublock">
    <div class="art-vmenublock-body">
    <div class="art-vmenublockheader">
    <%
        string chao;
        if (Session["ID"] == null) chao = "";
        else chao = "Xin chào: " + Session["username"].ToString();
	%>	
    <h3 class="t"><%=chao %></h3>
    </div>
<div class="art-vmenublockcontent">
    <div class="art-vmenublockcontent-body">

<ul class="art-vmenu">
		
	

	<li><a class="active"  href="ThongtinTK.aspx"><span class="l"></span><span class="r"></span><span class="t">Thông tin TK</span></a></li>
	<li><a class="active"  href="doimatkhau.aspx"><span class="l"></span><span class="r"></span><span class="t">Đổi mật khẩu</span></a></li>
    <li >
		<a class="active"  href="QuanLyCongVanDen.aspx"><span class="l"></span><span class="r"></span><span class="t">Công văn đến</span></a>
		<ul class="active">
			<li><a href="NhanLuuCV.aspx">Nhận và lưu</a></li>
			<li><a href="PhanPhoiCV.aspx">Chuyển công văn</a></li>
			<li><a href="XoaPhanPhoiCV.aspx">Huỷ chuyển CV</a></li>

		</ul>
	</li>
    
     <li >
		<a  class="active" href="QuanLyCongVanDi.aspx"><span class="l"></span><span class="r"></span><span class="t">Công văn đi</span></a>
		<ul class="active">
			<li><a href="GuiLuuCV.aspx">Gửi và lưu</a></li>


		</ul>
	</li>
	<li><a class="active" href=taobaocao.aspx><span class="l"></span><span class="r"></span><span class="t" >Báo cáo</span></a></li>
    <li><a class="active" href=Dangxuat.aspx><span class="l"></span><span class="r"></span><span class="t" >Đăng xuất</span></a></li>
		<div class="cleared">
        </div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
