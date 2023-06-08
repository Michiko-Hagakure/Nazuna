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
    public partial class MarksDetailsUserControl : System.Web.UI.UserControl
    {
        CommonFn fn = new CommonFn();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["admin"] == null)
            //{
            //    Response.Redirect("../Login.aspx");
            //}

            if (!IsPostBack)
            {
                GetClass();
                GetMarks();
            }
        }

        private void GetMarks()
        {
            DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY(Select 1)) as [Sr.No], Exam.ExamId,Exam.ClassId,Class.ClassName,
                                          Exam.SubjectId,Subject.SubjectName,Exam.RollNo,Exam.TotalMarks,Exam.OutOfMarks from Exam inner join Class on Class.ClassId = 
                                          Exam.ExamId inner join Subject on Subject.SubjectId = Exam.SubjectId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "ClassName";
            ddlClass.DataValueField = "ClassId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "Select Class");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classId = ddlClass.SelectedValue;
                string rollNo = txtRoll.Text.Trim();
                DataTable dt = fn.Fetch(@"Select ROW_NUMBER() OVER(ORDER BY(Select 1)) as [Sr.No], Exam.ExamId,Exam.ClassId,Class.ClassName,
                                          Exam.SubjectId,Subject.SubjectName,Exam.RollNo,Exam.TotalMarks,Exam.OutOfMarks from Exam inner join Class on Class.ClassId = 
                                          Exam.ExamId inner join Subject on Subject.SubjectId = Exam.SubjectId where Exam.ClassId = '" + classId + "' and Exam.RollNo = '" + rollNo + "' ");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", "doesAlEx()", true);
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
        }
    }
}