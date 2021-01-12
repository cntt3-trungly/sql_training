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


public partial class ThongtinTK : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Thông tin tài khoản";
        


        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt;
                dt = load_nhanvien(int.Parse(Session["ID"].ToString()));
                lblten.Text = Convert.ToString(dt.Rows[0]["TenNV"]);
                lblchucvu.Text = Convert.ToString(dt.Rows[0]["Chucvu"]);
                lblngaysinh.Text = Convert.ToString(dt.Rows[0]["NS"]);
                lblngaylam.Text = Convert.ToString(dt.Rows[0]["NBDL"]);
                }


            
        }
        else Response.Redirect("default.aspx");
        
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
