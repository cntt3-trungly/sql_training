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

public partial class Baocao1 : System.Web.UI.Page
{
    protected string coquan;
    protected string ngay = DateTime.Today.ToShortDateString();
    protected string nguoiin;
    protected int tong;
    protected void Page_Load(object sender, EventArgs e)
    {
        coquan = Request.QueryString["coquan"].ToString();
        load_data(coquan);
        nguoiin = Request.QueryString["nguoiin"].ToString();
    }
    private DataTable getbaocao(string cq)
    {
        baocao.BaoCao_CongVanDen_CQDataTable bangketnoi = new baocao.BaoCao_CongVanDen_CQDataTable();
        baocaoTableAdapters.BaoCao_CongVanDen_CQTableAdapter bien = new baocaoTableAdapters.BaoCao_CongVanDen_CQTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi, cq);
        return bangketnoi;
    }
    private void load_data(string coquan)
    {
        DataTable dt=getbaocao(coquan);
        tong = dt.Rows.Count;
        gvbaocao.DataSource =dt ;
        gvbaocao.DataBind();
    }
}
