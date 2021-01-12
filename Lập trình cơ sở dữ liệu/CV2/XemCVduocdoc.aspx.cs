using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class XemCVduocdoc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Danh sách CV đến được nhận";
        load_data();

    }
    private void load_data()
    {
        gvDanhsachCVden.DataSource = getDanhsachCVden(Session["Manv"].ToString());
        gvDanhsachCVden.DataBind();
    }
    private DataTable getDanhsachCVden(string manv)
    {
        DS_NhanVien.LayCV_DuocDocDataTable bangketnoi = new DS_NhanVien.LayCV_DuocDocDataTable();
        DS_NhanVienTableAdapters.LayCV_DuocDocTableAdapter bien = new DS_NhanVienTableAdapters.LayCV_DuocDocTableAdapter();
        bangketnoi.Reset();
        string a = Session["ID"].ToString();
        bien.Fill(bangketnoi,manv);
        return bangketnoi;
    }
}
