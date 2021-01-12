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

public partial class QuanLyCongVanDi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Danh sách CV đi";
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load_cbLoaiCV();
                load_data();
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
        gvDanhsachCVdi.DataSource = getDanhsachCVdi(Session["Manv"].ToString());
        gvDanhsachCVdi.DataBind();

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
    private DataTable getDanhsachCVdi(string manv)
    {
        DS_VanThu.LayCongVanDi_byDataTable bangketnoi = new DS_VanThu.LayCongVanDi_byDataTable();
        DS_VanThuTableAdapters.LayCongVanDi_byTableAdapter bien = new DS_VanThuTableAdapters.LayCongVanDi_byTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,manv);
        return bangketnoi;
    }
    protected int getrowinGV(int sodi)
    {
        DataTable dt = getDanhsachCVdi(Session["Manv"].ToString());
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["Sodi"].ToString() == sodi.ToString())
                return i;
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
        int index = getrowinGV(Convert.ToByte(editButton.CommandArgument));
        hdfedit.Value = ((Label)gvDanhsachCVdi.Rows[index].FindControl("lblsodi")).Text;
        txtSoCV.Text = ((Label)gvDanhsachCVdi.Rows[index].FindControl("lblSocv")).Text;
        txtNgayCV.Text = ((Label)gvDanhsachCVdi.Rows[index].FindControl("lblngayki")).Text;
       
        lblsodi.Text = ((Label)gvDanhsachCVdi.Rows[index].FindControl("lblsodi")).Text;

        lblfile_path.Text = ((Label)gvDanhsachCVdi.Rows[index].FindControl("lblfile_path")).Text;
        cbLoaiCV.SelectedValue = get_LCV_index_cbinGV(((Label)gvDanhsachCVdi.Rows[index].FindControl("lblloaicv")).Text).ToString();
        txtNoiDung.Text = ((Label)gvDanhsachCVdi.Rows[index].FindControl("lblNoidung")).Text;
        // ((Label)gvDanhsachCVden.Rows[index - 1].FindControl("lblcoquan")).Text;
        
        panel1.Update();
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, "document.getElementById('panel3').style.visibility = 'visible';", true);

    }
    protected void calEventDate_SelectionChanged(object sender, EventArgs e)
    {
        txtNgayCV.Text = calendar.SelectedDate.ToShortDateString();
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
                    file_path = "CV/di/" + hdfedit.Value.ToString() + "_greated(" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + ")" + "_" + FileUpload1.FileName;
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
    protected void btnluu_Click(object sender, EventArgs e)
    {
        if (txtSoCV.Text != "" && txtNgayCV.Text != "Chọn ngày..." )
        {

            EditCongVan(int.Parse(hdfedit.Value.ToString()), txtSoCV.Text,cbLoaiCV.SelectedValue, txtNgayCV.Text, txtNoiDung.Text, lblfile_path.Text);

            string alert = "displayalert_thanhcong();";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            //Page.RegisterClientScriptBlock("ClientScript", "<script>alert('Thay đổi thành công');</script>");
            load_data();
            panel.Update();
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
    private void EditCongVan(int sodi, string socv,string LoaiCV, string ngayCV, string ND, string FP)
    {

        DS_VanThu.ChinhSuaCongVanDiDataTable bangketnoi = new DS_VanThu.ChinhSuaCongVanDiDataTable();
        DS_VanThuTableAdapters.ChinhSuaCongVanDiTableAdapter bien = new DS_VanThuTableAdapters.ChinhSuaCongVanDiTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi, sodi, socv,int.Parse(LoaiCV), Convert.ToDateTime(ngayCV), ND, FP);
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
}
