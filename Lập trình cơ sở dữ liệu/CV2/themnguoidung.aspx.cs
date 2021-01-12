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

public partial class themnguoidung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataSet1.themnguoidungDataTable bang = new DataSet1.themnguoidungDataTable();
        DataSet1TableAdapters.themnguoidungTableAdapter b = new DataSet1TableAdapters.themnguoidungTableAdapter();
        bang.Reset();
        b.Fill(bang, TextBox1.Text, TextBox2.Text,int.Parse(TextBox3.Text), int.Parse(TextBox4.Text));
        Response.Redirect("quanlynguoidung.aspx");
    }
}
