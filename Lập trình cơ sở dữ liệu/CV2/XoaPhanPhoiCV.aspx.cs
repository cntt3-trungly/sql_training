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

public partial class XoaPhanPhoiCV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Page.Title = "Xoá thao tác chuyển CV";
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load_data();
            }
            else
            {

            }
        }
        else Response.Redirect("default.aspx");
    }
    private void load_data()
    {
        gvCVdendachuyen.DataSource = getDanhsachCVden(Session["Manv"].ToString());
        gvCVdendachuyen.DataBind();
    }
    private DataTable getDanhsachCVden(string manv)
    {
        DS_VanThu.LayCV_DaPhanPhoiDataTable bangketnoi = new DS_VanThu.LayCV_DaPhanPhoiDataTable();
        DS_VanThuTableAdapters.LayCV_DaPhanPhoiTableAdapter bien = new DS_VanThuTableAdapters.LayCV_DaPhanPhoiTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,manv);
        return bangketnoi;
    }
    private void xoachuyenCVden(int soden)
    {

        DS_VanThu.XoaPhanPhoiCVDataTable bangketnoi = new DS_VanThu.XoaPhanPhoiCVDataTable();
        DS_VanThuTableAdapters.XoaPhanPhoiCVTableAdapter bien = new DS_VanThuTableAdapters.XoaPhanPhoiCVTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi,soden);
    }
    protected void btndel_Click(object sender, EventArgs e)
    {

        var editButton = ((Button)sender);
        Int16 index = Convert.ToByte(editButton.CommandArgument);
        xoachuyenCVden(index);
        load_data();
        panel.Update();
        string del_alert = "displayalert_del()";
        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), UniqueID, del_alert, true);

    }
}
