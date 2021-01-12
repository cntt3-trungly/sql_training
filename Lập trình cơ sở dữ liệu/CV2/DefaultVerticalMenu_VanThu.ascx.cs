using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class VMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Trang Cá nhân";
        if (!Page.IsPostBack)
        {
            string alert = "display_welcome()";
            ScriptManager.RegisterStartupScript(this, typeof(Page), UniqueID, alert, true);
        }
    }
}
