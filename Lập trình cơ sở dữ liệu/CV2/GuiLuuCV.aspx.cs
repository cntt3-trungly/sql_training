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
using System.IO;

public partial class GuiLuuCV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load_cbLoaiCV();

            }
        }
        else Response.Redirect("default.aspx");
    }
    protected void calEventDate_SelectionChanged(object sender, EventArgs e)
    {
        txtNgayCV.Text = calendar.SelectedDate.ToShortDateString();

    }
    private DataTable getLCV()
    {
        DS_VanThu.LayLoaiCongVanDataTable bangketnoi = new DS_VanThu.LayLoaiCongVanDataTable();
        DS_VanThuTableAdapters.LayLoaiCongVanTableAdapter bien = new DS_VanThuTableAdapters.LayLoaiCongVanTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi);
        return bangketnoi;
    }
    private void load_cbLoaiCV()
    {
        cbLoaiCV.DataTextField = "TenLoaiCV";
        cbLoaiCV.DataValueField = "MaLoaiCV";
        cbLoaiCV.DataSource = getLCV();
        cbLoaiCV.DataBind();
    }
    private DataTable getDanhsachCVdi()
    {
        DS_VanThu.LayCongVanDiDataTable bangketnoi = new DS_VanThu.LayCongVanDiDataTable();
        DS_VanThuTableAdapters.LayCongVanDiTableAdapter bien = new DS_VanThuTableAdapters.LayCongVanDiTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi);
        return bangketnoi;
    }
    private int lastCV()
    {
        DataTable a = getDanhsachCVdi();
        int max = int.Parse(a.Rows[0]["Sodi"].ToString());
        for (int i = 1; i < a.Rows.Count; i++)
        {
            if (max < int.Parse(a.Rows[i]["Sodi"].ToString())) max = int.Parse(a.Rows[i]["Sodi"].ToString());
        }
        return max;
    }
    bool CheckFileType(string fileName)
    {
        string ext = Path.GetExtension(fileName);
        switch (ext.ToLower())
        {
            case ".doc":
                return true;
            case ".pdf":
                return true;
            default:
                return false;
        }
    }


    protected void btnluu_Click(object sender, EventArgs e)
    {


        if (txtSoCV.Text != "" && txtNgayCV.Text!="Chọn ngày...")
        {

            ThemCongVan(txtSoCV.Text, int.Parse(cbLoaiCV.SelectedValue), txtNgayCV.Text, int.Parse(Session["Manv"].ToString()), txtNoiDung.Text, lblfile_path.Text);
            string alert = "displayalert_thanhcong();";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Lưu thành công');</script>");
        }
        else
        {
            string alert = "displayalert_thieu()";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Cần điền đủ thông tin');</script>");

        }

    }
    protected void btnhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("GuiLuuCV.aspx");
    }

    private void ThemCongVan(string socv,int LoaiCV, string ngayCV,int nguoiluu, string ND,string FB)
    {
        DS_VanThu.ThemCongVanDiDataTable bangketnoi = new DS_VanThu.ThemCongVanDiDataTable();
        DS_VanThuTableAdapters.ThemCongVanDiTableAdapter bien = new DS_VanThuTableAdapters.ThemCongVanDiTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi, socv,LoaiCV, Convert.ToDateTime(ngayCV),nguoiluu, ND,FB);

    }

    protected void txtNgayCV_TextChanged(object sender, EventArgs e)
    {
        panel1.Update();
    }
    protected void btnFileUpload_Click(object sender, EventArgs e)
    {

        string file_path = "Nodownload.aspx";
        string strStatusMessage;
        if (FileUpload1.HasFile)
        {


            if (CheckFileType(FileUpload1.FileName))
            {
                try
                {
                    file_path = "CV/di/" + (lastCV() + 1).ToString() + "_greated(" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + ")" + "_" + FileUpload1.FileName;
                    FileUpload1.SaveAs(MapPath("~/" + file_path));
                    

                    strStatusMessage = "Tên file: " +
                        FileUpload1.PostedFile.FileName + "<br>" + "Kích cỡ: " +
                        FileUpload1.PostedFile.ContentLength + " kb<br>" +
                        "Loại: " + FileUpload1.PostedFile.ContentType;
                }
                catch (Exception ex)
                {
                    strStatusMessage = "Không thể upload tập tin. Đã có lỗi: " + ex.Message.ToString();
                }
            }
            else
            {
                strStatusMessage = "Chỉ được phép upload tập tin jpg, gif, png hoặc bmp";
            }
        }
        else
        {
            strStatusMessage = "Đường dẫn không đúng!";
        }
        lblSaveResults.Text = strStatusMessage;
        lblTenFile.Text = FileUpload1.FileName;
        lblfile_path.Text = file_path;

    }
}
