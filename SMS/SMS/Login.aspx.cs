using SMS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS
{
    public partial class Login : System.Web.UI.Page
    {
        CommonFn fn = new CommonFn();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = inputEmail.Value.Trim();
            string password = inputPassword.Value.Trim();
            DataTable dt = fn.Fetch("Select * from Teacher where Email = '" + email + "' and password = '" + password + "' ");
            if(email == "Admin" && password == "123")
            {
                Session["admin"] = email;
                Response.Redirect("Admin/AdminHome.aspx");
            }
            else if(dt.Rows.Count > 0)
            {
                Session["staff"] = email;
                Response.Redirect("Teacher/TeacherHome.aspx");
                ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", "logSuccess()", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", "logFailed()", true);
            }
        }
    }
}