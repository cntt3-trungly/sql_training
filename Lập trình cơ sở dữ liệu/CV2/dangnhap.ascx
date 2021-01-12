<%@ Control Language="C#" AutoEventWireup="true" CodeFile="dangnhap.ascx.cs" Inherits="dangnhap" %>
<asp:Panel ID="PanelLogin" runat="server" DefaultButton="btnLogin">

    <div class="art-block" style="width: 188px">
        <div class="art-block-body">
            <div class="art-blockheader">
                <div class="l"></div>
                <div class="r"></div>
                <h3 class="t">Đăng nhập</h3>
            </div>
            <div class="art-blockcontent">
                <div class="art-blockcontent-tl"></div>
                <div class="art-blockcontent-tr"></div>
                <div class="art-blockcontent-bl"></div>
                <div class="art-blockcontent-br"></div>
                <div class="art-blockcontent-tc"></div>
                <div class="art-blockcontent-bc"></div>
                <div class="art-blockcontent-cl"></div>
                <div class="art-blockcontent-cr"></div>
                <div class="art-blockcontent-cc"></div>
                <div class="art-blockcontent-body">
                    <fieldset class="input">
                        <p id="form-login-username">
                            <label for="modlgn_username">Tài khoản</label><br />
                            <asp:TextBox ID="txtUsername" CssClass="inputbox" runat="server" MaxLength="30" 
                                Width="140px" />
                            <asp:RequiredFieldValidator ID="reqUsername" runat="server"
                                ControlToValidate="txtUsername"
                                ValidationGroup="check"
                                ErrorMessage="<br />Không được phép để trống" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="regUsername" runat="server"
                                ControlToValidate="txtUsername"
                                ErrorMessage="<br />Chỉ được phép nhập <b>chữ cái, số và dấu gạch dưới</b>"
                                ValidationExpression="[0-9a-zA-Z_]+"
                                ValidationGroup="check"
                                Display="Dynamic" />
                        </p>
                        <p id="form-login-password">
                            <label for="modlgn_passwd">Mật khẩu</label><br />
                            <asp:TextBox ID="txtPass" CssClass="inputbox" runat="server" MaxLength="50" 
                                TextMode="Password" Width="140px" />
                            <asp:RequiredFieldValidator ID="reqPass" runat="server"
                                ControlToValidate="txtPass"
                                ValidationGroup="check"
                                ErrorMessage="<br />Không được phép để trống" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="regPass" runat="server"
                                ControlToValidate="txtPass"
                                ErrorMessage="<br />Không được phép nhập ký tự <b>' và &quot;</b>"
                                ValidationExpression="[^'&quot;]+"
                                ValidationGroup="check"
                                Display="Dynamic" />
                        </p>
                     
          	            <span class="art-button-wrapper">
          		            <span class="art-button-l"> </span>
          		            <span class="art-button-r"> </span>
                            <asp:Button ID="btnLogin" runat="server" class="art-button" Text="Đăng nhập" onclick="btnLogin_Click" />
          	            </span><br />
          	            <asp:PlaceHolder ID="frmLoginHienthiloi" runat="server">
                              
                        </asp:PlaceHolder>
                    </fieldset>
                    
      		        <div class="cleared"></div>
                </div>
            </div>
	        <div class="cleared"></div>
        </div>
    </div>
</asp:Panel>