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

public partial class quanlytaikhoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
                load();
            }
           
        }
        else Response.Redirect("default.aspx");
    
    }
    protected void load()
    {
        DataSet1.TaikhoanDataTable bang = new DataSet1.TaikhoanDataTable();
        DataSet1TableAdapters.TaikhoanTableAdapter bien = new DataSet1TableAdapters.TaikhoanTableAdapter();
        bang.Reset();
        bien.Fill(bang);
        Repeater1.DataSource = bang;
        Repeater1.DataBind();
    }
}
