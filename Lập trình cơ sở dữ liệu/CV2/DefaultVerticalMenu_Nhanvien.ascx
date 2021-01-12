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
	<li><a class="active" href="ThongTinTK.aspx"><span class="l"></span><span class="r"></span><span class="t">Thông tin TK</span></a></li>
    <li><a class="active" href="#"><span class="l"></span><span class="r"></span><span class="t">Đổi mật khẩu</span></a></li>
    <li class="active">
		<a class="active" href="XemCVduocdoc.aspx"><span class="l"></span><span class="r"></span><span class="t">Công văn đến</span></a>
		<ul class="active">
			<li><a href="XLCV.aspx">Công văn xử lý</a></li>
		</ul>
	</li>
    <li><a class="active" href=Dangxuat.aspx><span class="l"></span><span class="r"></span><span class="t" >Đăng xuất</span></a></li>
    
		<div class="cleared">
        </div>
    </div>
</div>

		<div class="cleared"></div>
    </div>
</div>
