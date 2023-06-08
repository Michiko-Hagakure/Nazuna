using SMS.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SMS.Models.CommonFn;

namespace SMS.Admin
{
    public partial class ExpenseDetails : System.Web.UI.Page
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
                GetExpenseDetails();
            }
        }

        private void GetExpenseDetails()
        {
            DataTable dt = fn.Fetch(@"Select Row_Number() over(Order by (Select 1)) as [Sr.No], Expense.ExpenseId, Expense.ClassId, 
                                      Class.ClassName, Expense.SubjectId, Subject.SubjectName, Expense.ChargeAmount from Expense 
                                      inner join Class on Expense.ClassId = Class.ClassId inner join Subject on  Expense.SubjectId = Subject.SubjectId; ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}