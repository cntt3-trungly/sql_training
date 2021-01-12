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


public partial class NhanLuuCV : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load_cbCoQuan();
                load_cbLoaiCV();

            }
        }
        else Response.Redirect("default.aspx");

    }
    protected void calEventDate_SelectionChanged(object sender, EventArgs e)
    {
        txtNgayCV.Text = calendar.SelectedDate.ToShortDateString();
        
    }
    protected void calEventDate1_SelectionChanged(object sender, EventArgs e)
    {
        txtNgayNhan.Text = calendar1.SelectedDate.ToShortDateString();
    }

    private DataTable getCQ()
    {
        DS_VanThu.LayDanhSachCoQUanDataTable bangketnoi = new DS_VanThu.LayDanhSachCoQUanDataTable();
        DS_VanThuTableAdapters.LayDanhSachCoQUanTableAdapter bien = new DS_VanThuTableAdapters.LayDanhSachCoQUanTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi);
        return bangketnoi;
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
    private void load_cbCoQuan()
    {
        cbCoQuan.DataTextField = "TenCQ";
        cbCoQuan.DataValueField = "MaCQ";
        cbCoQuan.DataSource = getCQ();
        cbCoQuan.DataBind();
    }
    
    private DataTable getDanhsachCVden()
    {
        DS_VanThu.LayCongVanDenDataTable bangketnoi = new DS_VanThu.LayCongVanDenDataTable();
        DS_VanThuTableAdapters.LayCongVanDenTableAdapter bien = new DS_VanThuTableAdapters.LayCongVanDenTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi);
        return bangketnoi;
    }
    private int lastCV()
    {
        DataTable a = getDanhsachCVden();
        int max=int.Parse(a.Rows[0]["Soden"].ToString());
        for (int i = 1; i < a.Rows.Count; i++)
        {
            if (max < int.Parse(a.Rows[i]["Soden"].ToString())) max = int.Parse(a.Rows[i]["Soden"].ToString());
        }
        return max;
    }
    bool CheckFileType(string fileName)
    {
        string ext = Path.GetExtension(fileName);
           switch (ext.ToLower()) 
        { 
            case  ".doc": 
                return true; 
            case  ".pdf":  
                return true; 
            default: 
                return false ;  
        } 
    }

    protected void btnluu_Click(object sender, EventArgs e)
    {
        if (txtSoCV.Text != ""&& txtNgayCV.Text!="Chọn ngày..." && txtNgayNhan.Text!="Chọn ngày...")
        {

            ThemCongVan(txtSoCV.Text,cbLoaiCV.SelectedValue, txtNgayCV.Text, int.Parse(Session["Manv"].ToString()), txtNgayNhan.Text, cbCoQuan.SelectedValue, txtNoiDung.Text, lblfile_path.Text);
            
           string alert = "displayalert_thanhcong();";
           ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Lưu thành công');</script>");
        }
        else
        {
            string alert = "displayalert_thieu()";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript","<script>alert('Bạn cần điền đủ thông tin ');</script>");
        }
        
    }
    protected void btnhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("NhanLuuCV.aspx");
    }

    private void ThemCongVan(string socv,string LoaiCV, string ngayCV,int nguoiluu, string ngayNhan, string maCQ, string ND,string FP)
    {
        DS_VanThu.ThemCongVanDenDataTable bangketnoi = new DS_VanThu.ThemCongVanDenDataTable();
        DS_VanThuTableAdapters.ThemCongVanDenTableAdapter bien = new DS_VanThuTableAdapters.ThemCongVanDenTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi, socv, Convert.ToDateTime(ngayCV),int.Parse(LoaiCV), Convert.ToDateTime(ngayNhan), int.Parse(maCQ), ND, FP,nguoiluu);

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
                    file_path = "CV/den/" + (lastCV() + 1).ToString() + "_greated(" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + ")" + "_" + FileUpload1.FileName;
                    FileUpload1.SaveAs(MapPath("~/"+file_path));
                    

                    strStatusMessage = "Tên file: " +
                        FileUpload1.PostedFile.FileName + "<br>" +"Kích cỡ: "+
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
