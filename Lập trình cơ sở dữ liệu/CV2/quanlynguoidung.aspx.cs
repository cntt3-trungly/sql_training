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

public partial class quanlynguoidung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            load();
           
        }
    }
    public void load()
    { 
        DataSet1.TaikhoanDataTable bang =new DataSet1.TaikhoanDataTable();
        DataSet1TableAdapters.TaikhoanTableAdapter b = new DataSet1TableAdapters.TaikhoanTableAdapter();
        bang.Reset();
        b.Fill(bang);
        rptnguoidung.DataSource=bang;
        rptnguoidung.DataBind();

    }
    protected void btXoa_Click(object sender, EventArgs e)
    {
        string cb=Request["chon"];
        DataSet1.xoanguoidungDataTable bang = new DataSet1.xoanguoidungDataTable();
        DataSet1TableAdapters.xoanguoidungTableAdapter b = new DataSet1TableAdapters.xoanguoidungTableAdapter();
        b.Fill(bang, cb);
        load();

    }
}
