using SMS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMS.Admin
{
    public partial class EmpAttendanceDetails : System.Web.UI.Page
    {
        CommonFn fn = new CommonFn();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                GetTeacher();
            }
        }
        private void GetTeacher()
        {
            DataTable dt = fn.Fetch("Select * from Teacher");
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "Name";
            ddlTeacher.DataValueField = "TeacherId";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, "Select Teacher");
        }

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DateTime date = Convert.ToDateTime(txtMonth.Text);
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() over (Order by (Select 1)) as [Sr.No],Teacher.Name,TeacherAttendance.Status,TeacherAttendance.Date
                                      from TeacherAttendance inner join Teacher on Teacher.TeacherId = TeacherAttendance.TeacherId
                                      where DATEPART(yy, Date) = '" + date.Year + "' and DATEPART(M,Date) = '" + date.Month + "'  " +
                                      " and TeacherAttendance.TeacherId = '" + ddlTeacher.SelectedValue + "' ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}