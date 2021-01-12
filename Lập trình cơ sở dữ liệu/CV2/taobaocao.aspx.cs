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

public partial class taobaocao : System.Web.UI.Page
{
    protected DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        dt = load_nhanvien(int.Parse(Session["ID"].ToString()));
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
               
                load_cbCoQuan();

            }
        }
        else Response.Redirect("default.aspx");
        
    }
    private DataTable getCQ()
    {
        DS_VanThu.LayDanhSachCoQUanDataTable bangketnoi = new DS_VanThu.LayDanhSachCoQUanDataTable();
        DS_VanThuTableAdapters.LayDanhSachCoQUanTableAdapter bien = new DS_VanThuTableAdapters.LayDanhSachCoQUanTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi);
        return bangketnoi;
    }
    private void load_cbCoQuan()
    {
        cbCoQuan.DataTextField = "TenCQ";
        cbCoQuan.DataValueField = "MaCQ";
        cbCoQuan.DataSource = getCQ();
        cbCoQuan.DataBind();
    }
    protected void baocao_Click(object sender, EventArgs e)
    {
      
        
        Response.Redirect(String.Format("baocao.aspx?thang={0}&nguoiin={1}", cbthang.SelectedValue.ToString(),Convert.ToString(dt.Rows[0]["TenNV"])));
        //Response.Redirect(String.Format("AnotherPage.aspx?name={0}&password={1}", txtUsername.Text, txtPassword.Text))
    }
    protected void baocao1_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("baocao1.aspx?coquan={0}&nguoiin={1}", cbCoQuan.SelectedItem.Text, Convert.ToString(dt.Rows[0]["TenNV"])));
        //Response.Redirect(String.Format("AnotherPage.aspx?name={0}&password={1}", txtUsername.Text, txtPassword.Text))
    }
    protected void baocao2_Click(object sender, EventArgs e)
    {
        Response.Redirect(String.Format("baocao2.aspx?thang={0}&nguoiin={1}", cbthang1.SelectedValue.ToString(), Convert.ToString(dt.Rows[0]["TenNV"])));
        //Response.Redirect(String.Format("AnotherPage.aspx?name={0}&password={1}", txtUsername.Text, txtPassword.Text))
    }
    private DataTable load_nhanvien(int ID)
    {
        DataSet1.LayThongTinNhanVienDataTable bangketnoi = new DataSet1.LayThongTinNhanVienDataTable();
        DataSet1TableAdapters.LayThongTinNhanVienTableAdapter bien = new DataSet1TableAdapters.LayThongTinNhanVienTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi, ID);
        return bangketnoi;

    }


}
