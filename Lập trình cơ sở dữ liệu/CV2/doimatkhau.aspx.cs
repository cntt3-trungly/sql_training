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

public partial class doimatkhau : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["ID"] != null)
        {
            if (!Page.IsPostBack)
            {
               
            }
           
        }
        else Response.Redirect("default.aspx");
    }


    protected void btnok_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            DataSet1.DoiPassDataTable bang = new DataSet1.DoiPassDataTable();
            DataSet1TableAdapters.DoiPassTableAdapter bien = new DataSet1TableAdapters.DoiPassTableAdapter();
            bang.Reset();
            bien.Fill(bang, int.Parse(Session["ID"].ToString()), txtcu.Text, txtmoi.Text);
            lblmsg.Text = bang.Rows[0]["errmsg"].ToString();
        }
    }
}
