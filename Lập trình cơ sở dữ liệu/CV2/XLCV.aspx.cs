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

public partial class XLCV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Danh sách CV đến Xử Lý";
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load_data();
                load_cbTT();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), UniqueID, "document.getElementById('panel3').style.visibility = 'visible';", true);
            }
        }
        else Response.Redirect("default.aspx");

    }
    private void load_data()
    {

        gvDanhsachCVXL.DataSource = getCVxuly(Session["Manv"].ToString());
        gvDanhsachCVXL.DataBind();
    }
    private DataTable getCVxuly(string manv)
    {
        DS_NhanVien.LayCV_DuocXuLyDataTable bangketnoi = new DS_NhanVien.LayCV_DuocXuLyDataTable();
        DS_NhanVienTableAdapters.LayCV_DuocXuLyTableAdapter bien = new DS_NhanVienTableAdapters.LayCV_DuocXuLyTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,manv);
        return bangketnoi;
    }
    private DataTable getTT()
    {
        DS_NhanVien.LayTinhTrangDataTable bangketnoi = new DS_NhanVien.LayTinhTrangDataTable();
        DS_NhanVienTableAdapters.LayTinhTrangTableAdapter bien = new DS_NhanVienTableAdapters.LayTinhTrangTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi);
        return bangketnoi;
    }
    private DataTable capnhat(int soden,int tt)
    {
        DS_NhanVien.CapNhatTinhTrangCongVanDataTable bangketnoi = new DS_NhanVien.CapNhatTinhTrangCongVanDataTable();
        DS_NhanVienTableAdapters.CapNhatTinhTrangCongVanTableAdapter bien = new DS_NhanVienTableAdapters.CapNhatTinhTrangCongVanTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,soden,tt);
        return bangketnoi;
    }
    private void load_cbTT()
    {
        cbTT.DataTextField = "Noidung";
        cbTT.DataValueField = "Matientrinh";
        cbTT.DataSource = getTT();
        cbTT.DataBind();
    }
    /*
    protected ListItemCollection ddlItems()
    {

        DataTable dt = getLCV();
        ListItem li = null;
        ListItemCollection liC = new ListItemCollection();
        for (int i = 0; i < 10; i++)
        {
            li = new ListItem();
            li.Value = dt.Rows[i]["MaloaiCV"].ToString();
            li.Text = dt.Rows[i]["TenLoaiCV"].ToString();
            liC.Add(li);
            li = null;

        }
        liC.
        return liC;
    }
     */
    protected int getrowinGV(int soden)
    {
        DataTable dt = getCVxuly(Session["Manv"].ToString());
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["Soden"].ToString() == soden.ToString())
                return i;
        }
        return 0;
    }
    protected int get_TT_index_cbinGV(string tt)
    {
        DataTable dt = getTT();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["Noidung"].ToString() == tt)
                return Convert.ToInt32(dt.Rows[i]["MaTientrinh"]);
        }
        return 0;
    }
    protected void btnsua_Click(object sender, EventArgs e)
    {

        var editButton = ((Button)sender);
        int index = getrowinGV(Convert.ToInt32(editButton.CommandArgument));
        hdfedit.Value = ((Label)gvDanhsachCVXL.Rows[index].FindControl("lblsoden")).Text;
        lblsoden1.Text = ((Label)gvDanhsachCVXL.Rows[index].FindControl("lblsoden")).Text;
        cbTT.SelectedValue = get_TT_index_cbinGV(((Label)gvDanhsachCVXL.Rows[index].FindControl("lblTT")).Text).ToString();
        
        panel1.Update();
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "document.getElementById('panel3').style.visibility = 'visible';", true);

    }
    protected void btnhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("QuanLyCongVanDen.aspx");
    }
    protected void btnluu_Click(object sender, EventArgs e)
    {
            /*
            EditCongVan(int.Parse(hdfedit.Value.ToString()), cbLoaiCV.SelectedValue, txtSoCV.Text, txtNgayCV.Text, txtNgayNhan.Text, cbCoQuan.SelectedValue, txtNoiDung.Text, lblfile_path.Text);

            string alert = "displayalert_thanhcong();";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Thay đổi thành công');</script>");
            load_data();
            panel.Update();

             */
            capnhat(int.Parse(lblsoden1.Text),int.Parse(cbTT.SelectedValue.ToString()));
            string alert = "displayalert_thanhcong()";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            load_data();
            panel.Update();
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Bạn cần điền đủ thông tin ');</script>");


    }


}
