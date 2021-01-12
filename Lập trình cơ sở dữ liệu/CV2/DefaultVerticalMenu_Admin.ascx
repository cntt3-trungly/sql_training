<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DefaultVerticalMenu_Admin.ascx.cs" Inherits="VMenu" %>

<div class="art-vmenublock">
    <div class="art-vmenublock-body">
    <div class="art-vmenublockheader">
    <%
        string chao;
        if (Session["ID"] == null) chao = "";
        else chao = "Xin chào:" + Session["username"].ToString();
	%>	
    <h3 class="t"><%=chao %></h3>
    </div>
<div class="art-vmenublockcontent">
    <div class="art-vmenublockcontent-body">

<ul class="art-vmenu">
		
	

	<li><a class="active" href="quanlynguoidung.aspx"><span class="l"></span><span class="r"></span><span class="t">Quan ly tai khoan</span></a></li>
    <li><a class="active" href="#"><span class="l"></span><span class="r"></span><span class="t">Đổi Mật Khẩu</span></a></li>
    <li><a class="active" href="quanlytaikhoan.aspx"><span class="l"></span><span class="r"></span><span class="t">QL TK</span></a></li>
    <li><a class="active" href="#"><span class="l"></span><span class="r"></span><span class="t">Xóa TK</span></a></li>
    <li><a class="active" href="#"><span class="l"></span><span class="r"></span><span class="t">Sửa thông tin</span></a></li>
    <li><a class="active" href=Dangxuat.aspx><span class="l"></span><span class="r"></span><span class="t" >Đăng xuất</span></a></li>
		<div class="cleared">
        </div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
