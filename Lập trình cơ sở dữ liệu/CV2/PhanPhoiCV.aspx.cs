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

public partial class PhanPhoiCV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "CV đến chưa chuyển";
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load_data();
                load_cbCV();
                load_cbNV();
                load_cbNV2();

            }
            else
            {
               
            }
        }
        else Response.Redirect("default.aspx");
        


    }
    private void load_cbCV()
    {
        cbCV.DataTextField = "SoCV";
        cbCV.DataValueField = "Soden";
        cbCV.DataSource = getCVdenchuachuyen(Session["Manv"].ToString());
        cbCV.DataBind();
    }
    private void load_cbNV()
    {
        cbNV.DataSource = getNV();
        cbNV.DataTextField = "TenNV";
        cbNV.DataValueField = "Manv";
        cbNV.DataBind();

    }
    private void load_cbNV2()
    {
       
        //bang.Rows.Add(-1,"Chọn nếu có");
        
        
        /*
        DataTable dt = new DataTable();
        DataColumn dc = new DataColumn("col1", typeof(String));
        dt.Columns.Add(dc);
        dc = new DataColumn("col2", typeof(String));
        dt.Columns.Add(dc);
        */
        DataTable bang = getNV();
        DataRow dr= bang.NewRow();
        dr[0] = "-1";
        dr[1] = "Chọn nếu có..";
        bang.Rows.InsertAt(dr, 0);
        cbNV2.DataSource = bang;
        cbNV2.DataTextField = "TenNV";
        cbNV2.DataValueField = "Manv";
        cbNV2.DataBind();

    }
    private void load_data()
    {
        gvCVdenchuachuyen.DataSource = getCVdenchuachuyen(Session["Manv"].ToString());
        gvCVdenchuachuyen.DataBind();
    }

    private DataTable getCVdenchuachuyen(string manv)
    {
        DS_VanThu.LayCV_ChuaPhanPhoiDataTable bangketnoi = new DS_VanThu.LayCV_ChuaPhanPhoiDataTable();
        DS_VanThuTableAdapters.LayCV_ChuaPhanPhoiTableAdapter bien = new DS_VanThuTableAdapters.LayCV_ChuaPhanPhoiTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,manv);
        return bangketnoi;
    }
    private DataTable getNV()
    {
        DS_VanThu.LayDanhSachNhanVienDataTable bangketnoi = new DS_VanThu.LayDanhSachNhanVienDataTable();
        DS_VanThuTableAdapters.LayDanhSachNhanVienTableAdapter bien = new DS_VanThuTableAdapters.LayDanhSachNhanVienTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi);
        return bangketnoi;
       
    }
    protected void btnthem_Click(object sender, EventArgs e)
    {
        string a = txtNV.Text;
        string z = Convert.ToString(cbNV.SelectedItem) + ".";
        txtNV.Text = a+z;

        string b = txtManv.Text;
        z = Convert.ToString(cbNV.SelectedValue) + ".";
        txtManv.Text = b+z;
        
        
        pnCV.Update();
    }


    protected void btnxoa_Click(object sender, EventArgs e)
    {

        string a = txtNV.Text;
        string a_new="",b_new="";
        int k=0;
        char z = Convert.ToChar(".");
        for (int i = a.Length-2; i >= 0; i--)
        {
            if (a[i] == z)
            {
                a_new = a.Remove(i + 1);
                break; 
            }
            if (i == 0) a_new = a.Remove(0); ;
        }
        
        /////////////////
        string b = txtManv.Text;
        for (int i = b.Length - 2; i >= 0; i--)
        {
            if (b[i] == z)
            {
                b_new = b.Remove(i + 1);
                break; 
            }
            if (i == 0) b_new=b.Remove(0);
        }
        ////////////////
        txtNV.Text = a_new;
        txtManv.Text = b_new;
        pnCV.Update();
    }
    protected void btndongy_Click(object sender, EventArgs e)
    {
        if (txtManv.Text == "" && cbNV2.SelectedValue.ToString() == "-1")
        {
            string alert = "display_thieu()";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
        }
        else if (cbNV2.SelectedValue.ToString() == "-1")
        {

                ThemPhanPhoi(cbCV.SelectedValue.ToString(), txtManv.Text, cbNV2.SelectedValue.ToString(), "1/1/1991");
                string alert = "display_thanhcong()";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
                load_data();
                load_cbCV();
                txthanxl.Text = "Chọn thời gian ...";
                txtManv.Text = "";
                txtNV.Text = "";
                panel.Update();
                pnCV.Update();
         

        }
        
        else
        {
            if (txthanxl.Text != "Chọn thời gian ...")
            {
            string a = txtManv.Text + cbNV2.SelectedValue.ToString() + ".";
            ThemPhanPhoi(cbCV.SelectedValue.ToString(), a, cbNV2.SelectedValue.ToString(), txthanxl.Text);
            string alert = "display_thanhcong()";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            load_data();
            load_cbCV();
            txthanxl.Text = "Chọn thời gian ...";
            txtManv.Text = "";
            txtNV.Text = "";
            panel.Update();
            pnCV.Update();
            }
            else
            {
                string alert = "display_thieu()";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, alert, true);
            }
        }

    }
    protected void btnhuy_Click(object sender, EventArgs e)
    {
        load_cbCV();
        load_cbNV();
        load_cbNV2();
        txtManv.Text = "";
        txtNV.Text = "";
        pnCV.Update();
    }

    protected void calEventDate_SelectionChanged(object sender, EventArgs e)
    {
        txthanxl.Text = calendar.SelectedDate.ToShortDateString();
        string a = "show_hide_time()";
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, a, true);
    }
    private void ThemPhanPhoi(string soden, string nguoidoc, string nguoixl, string hanxuly)
    {
        DS_VanThu.ThemPhanPhoiCVDataTable bangketnoi = new DS_VanThu.ThemPhanPhoiCVDataTable();
        DS_VanThuTableAdapters.ThemPhanPhoiCVTableAdapter bien = new DS_VanThuTableAdapters.ThemPhanPhoiCVTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi, int.Parse(soden), nguoidoc,nguoixl, Convert.ToDateTime(hanxuly));

    }
    protected void cbNV2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cbNV2.SelectedValue != "-1")
        {
            string a="show_hide_time()";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, a, true);

        }
    }
}
