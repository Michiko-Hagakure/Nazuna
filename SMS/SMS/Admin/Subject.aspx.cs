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
    public partial class Subject : System.Web.UI.Page
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
                GetClass();
                GetSubject();
            }
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
                string classVal = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("Select * From Subject where ClassId = '" + ddlClass.SelectedItem.Value + 
                    "' and SubjectName = '"+ txtSubject.Text.Trim() +"' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert Into Subject values('" + ddlClass.SelectedItem.Value + "','" + txtSubject.Text.Trim() + "')";
                    fn.Query(query);
                    ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", "success2()", true);
                    txtSubject.Text = string.Empty;
                    ddlClass.SelectedIndex = 0;
                    GetSubject();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", "failed2()", true);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void GetSubject()
        {
            DataTable dt = fn.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], s.SubjectId, s.ClassId, c.ClassName,
            s.SubjectName from Subject s inner join Class c on c.ClassId = s.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetSubject();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetSubject();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int subjId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Subject where SubjectId = '" + subjId + "' ");
                ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", "deleted1()", true);
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int subjId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
                string subjName = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Subject set ClassId = '" + classId + "',SubjectName='"+ subjName + "' where SubjectId = '" + subjId + "' ");
                ScriptManager.RegisterStartupScript(this, GetType(), "PopUp", "update2()", true);
                GridView1.EditIndex = -1;
                GetSubject();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}