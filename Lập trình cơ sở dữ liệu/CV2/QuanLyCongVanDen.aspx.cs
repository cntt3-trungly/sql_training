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
using System.IO;

public partial class QuanLyCongVanDen : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
     
        Page.Title = "Danh sách CV đến đã nhận";
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load_data();
                load_cbCoQuan();
                load_cbLoaiCV();
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
        gvDanhsachCVden.DataSource = getDanhsachCVden(Session["Manv"].ToString());
        gvDanhsachCVden.DataBind();
    }

    private DataTable getDanhsachCVden(string manv)
    {
        DS_VanThu.LayCongVanDen_byDataTable bangketnoi = new DS_VanThu.LayCongVanDen_byDataTable();
        DS_VanThuTableAdapters.LayCongVanDen_byTableAdapter bien = new DS_VanThuTableAdapters.LayCongVanDen_byTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,manv);
        return bangketnoi;
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
    private void xoaCVden(int soden)
    {

        DS_VanThu.XoaCongVanDenDataTable bangketnoi= new DS_VanThu.XoaCongVanDenDataTable();  
        DS_VanThuTableAdapters.XoaCongVanDenTableAdapter bien = new DS_VanThuTableAdapters.XoaCongVanDenTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,soden);
    }
    private void load_cbCoQuan()
    {
        cbCoQuan.DataTextField = "TenCQ";
        cbCoQuan.DataValueField = "MaCQ";
        cbCoQuan.DataSource = getCQ();
        cbCoQuan.DataBind();
    }
    protected int getrowinGV(int soden)
    {
        DataTable dt = getDanhsachCVden(Session["Manv"].ToString());
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["Soden"].ToString() == soden.ToString())
                return i;
        }
        return 0;
    }
    protected int get_CQ_index_cbinGV(string CQ)
    {
        DataTable dt = getCQ();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["TenCQ"].ToString() == CQ)
                return Convert.ToInt32(dt.Rows[i]["MaCQ"]);
        }
        return 0;
    }
    protected int get_LCV_index_cbinGV(string LCV)
    {
        DataTable dt = getLCV();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["TenLoaiCV"].ToString() == LCV)
                return Convert.ToInt32(dt.Rows[i]["MaLoaiCV"]);
        }
        return 0;
    }
    protected void btnsua_Click(object sender, EventArgs e)
    {



        var editButton = ((Button)sender);
        int index = getrowinGV(Convert.ToInt32(editButton.CommandArgument));


        hdfedit.Value = ((Label)gvDanhsachCVden.Rows[index].FindControl("lblsoden")).Text;
        txtSoCV.Text = ((Label)gvDanhsachCVden.Rows[index].FindControl("lblsocv")).Text;
        txtNgayCV.Text = ((Label)gvDanhsachCVden.Rows[index].FindControl("lblngaycongvan")).Text;
        txtNgayNhan.Text = ((Label)gvDanhsachCVden.Rows[index].FindControl("lblngaynhan")).Text;
        lblsoden1.Text = ((Label)gvDanhsachCVden.Rows[index].FindControl("lblsoden")).Text;

        lblfile_path.Text = ((Label)gvDanhsachCVden.Rows[index].FindControl("lblfile_path")).Text;

        txtNoiDung.Text = ((Label)gvDanhsachCVden.Rows[index].FindControl("lblnoidung")).Text;
       // ((Label)gvDanhsachCVden.Rows[index - 1].FindControl("lblcoquan")).Text;
        cbCoQuan.SelectedValue = get_CQ_index_cbinGV(((Label)gvDanhsachCVden.Rows[index].FindControl("lblcoquan")).Text).ToString();
        cbLoaiCV.SelectedValue = get_LCV_index_cbinGV(((Label)gvDanhsachCVden.Rows[index].FindControl("lblloaicv")).Text).ToString();
        panel1.Update();
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "document.getElementById('panel3').style.visibility = 'visible';", true);

    }

    protected void btndel_Click(object sender, EventArgs e)
    {



        var editButton = ((Button)sender);
        Int16 index = Convert.ToByte(editButton.CommandArgument);
        xoaCVden(index);
        load_data();
        panel1.Update();
        string del_alert = "displayalert_del()";
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, del_alert, true);

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
        if (txtSoCV.Text != "" && txtNgayCV.Text != "Chọn ngày..." && txtNgayNhan.Text != "Chọn ngày...")
        {
            string fp;
            if (attach.Checked == true)
            {
                fp = "Nodownload.aspx";
            }
            else
            {
                fp = lblfile_path.Text;
            }
           
            EditCongVan(int.Parse(hdfedit.Value.ToString()),cbLoaiCV.SelectedValue,txtSoCV.Text, txtNgayCV.Text, txtNgayNhan.Text, cbCoQuan.SelectedValue, txtNoiDung.Text,fp);

            string alert = "displayalert_thanhcong();";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Thay đổi thành công');</script>");
            load_data();
            panel.Update();
            ScriptManager.RegisterStartupScript(this, typeof(Page), UniqueID, "document.getElementById('panel3').style.visibility = 'visible';", true);
        }
        else
        {
            string alert = "displayalert_thieu()";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Bạn cần điền đủ thông tin ');</script>");
        }

    }
    protected void btnhuy_Click(object sender, EventArgs e)
    {
        Response.Redirect("QuanLyCongVanDen.aspx");
    }
    private void EditCongVan(int soden,string LoaiCV, string socv, string ngayCV, string ngayNhan, string maCQ, string ND, string FP)
    {

        DS_VanThu.ChinhSuaCongVanDenDataTable bangketnoi = new DS_VanThu.ChinhSuaCongVanDenDataTable();
        DS_VanThuTableAdapters.ChinhSuaCongVanDenTableAdapter bien = new DS_VanThuTableAdapters.ChinhSuaCongVanDenTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,soden,socv,int.Parse(maCQ), Convert.ToDateTime(ngayCV), Convert.ToDateTime(ngayNhan),int.Parse(LoaiCV), ND, FP);

    }
    protected void calEventDate_SelectionChanged(object sender, EventArgs e)
    {
        txtNgayCV.Text = calendar.SelectedDate.ToShortDateString();
        panel1.Update();
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "document.getElementById('panel3').style.visibility = 'visible';", true);

    }
    protected void calEventDate1_SelectionChanged(object sender, EventArgs e)
    {
        txtNgayNhan.Text = calendar1.SelectedDate.ToShortDateString();
        panel1.Update();
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "document.getElementById('panel3').style.visibility = 'visible';", true);
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
                    file_path = "CV/den/" + hdfedit.Value.ToString() + "_greated(" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + ")" + "_" + FileUpload1.FileName;
                    FileUpload1.SaveAs(MapPath("~/"+file_path));
                    

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
