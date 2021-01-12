using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class dangnhap : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private DataTable kiemtradangnhap(string username, string userpass)
    {
        DataSet1.KiemTraDangNhapDataTable dt = new DataSet1.KiemTraDangNhapDataTable();
        DataSet1TableAdapters.KiemTraDangNhapTableAdapter da = new DataSet1TableAdapters.KiemTraDangNhapTableAdapter();
        dt.Reset();
        da.Fill(dt, username, userpass);
        return dt;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Page.Validate("check");
        if (Page.IsValid)
        {
            DataTable dt = kiemtradangnhap(txtUsername.Text.Trim(), txtPass.Text.Trim());
            if (dt.Rows[0]["errcode"].ToString() == "0")
            {
                Session["ID"] = Convert.ToInt16(dt.Rows[0]["ID"].ToString());
                Session["quyen"] = Convert.ToInt16(dt.Rows[0]["quyen"].ToString());
                Session["username"] = dt.Rows[0]["username"].ToString();
                Session["Manv"] = dt.Rows[0]["MaNV"].ToString();
                Response.Redirect("dangnhap_thanhcong.aspx");
                return;
            }
            else
            {
                Label lblDNKhongTT = new Label();
                lblDNKhongTT.ID = "lblDNKhongTT";
                lblDNKhongTT.Text = "Tài khoản hoặc password ko đúng";
                lblDNKhongTT.CssClass = "LoginError";
                frmLoginHienthiloi.Controls.Add(lblDNKhongTT);
                return;
            }

        }
    }
}
