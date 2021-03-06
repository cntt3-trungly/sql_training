﻿using System;
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

public partial class Baocao2 : System.Web.UI.Page
{
    protected string thang;
    protected string ngay = DateTime.Today.ToShortDateString();
    protected string nguoiin;
    protected int tong;
    protected void Page_Load(object sender, EventArgs e)
    {
        thang = Request.QueryString["thang"].ToString();
        load_data(thang);
        nguoiin = Request.QueryString["nguoiin"].ToString();

    }

    private DataTable getbaocao(int thang)
    {
        baocao.BaoCao_CongVanDi_ThangDataTable bangketnoi = new baocao.BaoCao_CongVanDi_ThangDataTable();
        baocaoTableAdapters.BaoCao_CongVanDi_ThangTableAdapter bien = new baocaoTableAdapters.BaoCao_CongVanDi_ThangTableAdapter();
        bangketnoi.Reset();
        bien.Fill(bangketnoi, thang);
        return bangketnoi;
    }
    private void load_data(string thang)
    {
        DataTable dt = getbaocao(int.Parse(thang));
        tong = dt.Rows.Count;
        gvbaocao.DataSource = dt;
        gvbaocao.DataBind();
    }
}
