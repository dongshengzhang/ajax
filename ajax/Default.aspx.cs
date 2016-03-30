
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Text;
namespace ajax
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //taskText.Text = "test";
            if (!IsPostBack)
            {
                System.Collections.Specialized.NameValueCollection nv = Request.Form;
                if (nv.Count != 0)
                {
                    string strname = Request.Form["username"];
                    //string strPwd = nv["txtbox2"];
                    Response.Write(strname);

                    string stremail = nv["email"];
                    //string strPwd = nv["txtbox2"];
                    Response.Write(stremail);
                }
            }
        }

        protected void cmdRefreshTime_Click(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToLongTimeString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToLongTimeString();
        }

        [WebMethod]
        public static string AddTask(string name)
        {
            return name;
        }

        [WebMethod]
        public static string GetQueryInfo()
        {
            String daresult = null;
            DataTable dt = new DataTable();
            dt.Columns.Add("Dosage", typeof(int));
            dt.Columns.Add("Drug", typeof(string));
            dt.Columns.Add("Patient", typeof(string));
            dt.Columns.Add("Date", typeof(DateTime));

            // Here we add five DataRows.
            dt.Rows.Add(25, "Indocin", "David", DateTime.Now);
            dt.Rows.Add(50, "Enebrel", "Sam", DateTime.Now);
            dt.Rows.Add(10, "Hydralazine", "Christoff", DateTime.Now);
            dt.Rows.Add(21, "Combivent", "Janet", DateTime.Now);
            dt.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now);
            DataSet ds = new DataSet();
            ds.Tables.Add(dt);
            daresult = DataSetToJSON(ds);

            //daresult = DataTableToJsonWithJsonNet(dt);
            return daresult;
        }


        public static string DataSetToJSON(DataSet ds)
        {

            Dictionary<string, object> dict = new Dictionary<string, object>();
            foreach (DataTable dt in ds.Tables)
            {
                object[] arr = new object[dt.Rows.Count + 1];

                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    arr[i] = dt.Rows[i].ItemArray;
                }

                dict.Add(dt.TableName, arr);
            }

            JavaScriptSerializer json = new JavaScriptSerializer();
            return json.Serialize(dict);

        }

        public DataTable getData()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("UserId", typeof(Int32));
            dt.Columns.Add("UserName", typeof(string));
            dt.Columns.Add("Education", typeof(string));
            dt.Columns.Add("Location", typeof(string));
            dt.Rows.Add(1, "Satinder Singh", "Bsc Com Sci", "Mumbai");
            dt.Rows.Add(2, "Amit Sarna", "Mstr Com Sci", "Mumbai");
            dt.Rows.Add(3, "Andrea Ely", "Bsc Bio-Chemistry", "Queensland");
            dt.Rows.Add(4, "Leslie Mac", "MSC", "Town-ville");
            dt.Rows.Add(5, "Vaibhav Adhyapak", "MBA", "New Delhi");
            dt.Rows.Add(6, "Johny Dave", "MCA", "Texas");
            return dt;
        }

        public static string DataTableToJsonWithJsonNet(DataTable table)
        {
            string jsonString = string.Empty;
            jsonString = JsonConvert.SerializeObject(table);
            //jsonString = "{\"data\":" + jsonString + "}";
            return jsonString;
        }

        public string DataTableToJsonWithJavaScriptSerializer(DataTable table)
        {
            JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
            List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
            Dictionary<string, object> childRow;
            foreach (DataRow row in table.Rows)
            {
                childRow = new Dictionary<string, object>();
                foreach (DataColumn col in table.Columns)
                {
                    childRow.Add(col.ColumnName, row[col]);
                }
                parentRow.Add(childRow);
            }
            return jsSerializer.Serialize(parentRow);
        }

        public string DataTableToJsonWithStringBuilder(DataTable table)
        {
            var jsonString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                jsonString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    jsonString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            jsonString.Append("\"" + table.Columns[j].ColumnName.ToString()
                                              + "\":" + "\""
                                              + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            jsonString.Append("\"" + table.Columns[j].ColumnName.ToString()
                                              + "\":" + "\""
                                              + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        jsonString.Append("}");
                    }
                    else
                    {
                        jsonString.Append("},");
                    }
                }
                jsonString.Append("]");
            }
            return jsonString.ToString();
        }
    }
}



//using System;
//using System.Web.UI.WebControls;
//using Telerik.Web.UI;


//namespace Grid.Examples.DataEditing.TemplateFormUpdate
//{
//    public partial class DefaultCS : System.Web.UI.Page
//    {
//        protected void RadGrid1_ItemUpdated(object source, Telerik.Web.UI.GridUpdatedEventArgs e)
//        {
//            if (e.Exception != null)
//            {
//                e.KeepInEditMode = true;
//                e.ExceptionHandled = true;
//                DisplayMessage(true, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"] + " cannot be updated. Reason: " + e.Exception.Message);
//            }
//            else
//            {
//                DisplayMessage(false, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"] + " updated");
//            }
//        }

//        protected void RadGrid1_ItemInserted(object source, GridInsertedEventArgs e)
//        {
//            if (e.Exception != null)
//            {
//                e.ExceptionHandled = true;
//                e.KeepInInsertMode = true;
//                DisplayMessage(true, "Employee cannot be inserted. Reason: " + e.Exception.Message);
//            }
//            else
//            {
//                DisplayMessage(false, "Employee inserted");
//            }
//        }

//        protected void RadGrid1_ItemDeleted(object source, GridDeletedEventArgs e)
//        {
//            if (e.Exception != null)
//            {
//                e.ExceptionHandled = true;
//                DisplayMessage(true, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"] + " cannot be deleted. Reason: " + e.Exception.Message);
//            }
//            else
//            {
//                DisplayMessage(false, "Employee " + e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EmployeeID"] + " deleted");
//            }
//        }

//        private void DisplayMessage(bool isError, string text)
//        {
//            Label label = (isError) ? this.Label1 : this.Label2;
//            label.Text = text;
//        }

//        protected void Page_Load(object sender, System.EventArgs e)
//        {
//        }

//        protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
//        {
//            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
//            {
//                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGrid1.MasterTableView.GetColumn("EditCommandColumn");
//                editColumn.Visible = false;
//            }
//            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
//            {
//                e.Canceled = true;
//            }
//            else
//            {
//                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGrid1.MasterTableView.GetColumn("EditCommandColumn");
//                if (!editColumn.Visible)
//                    editColumn.Visible = true;
//            }
//        }
//        protected void RadGrid1_PreRender(object sender, EventArgs e)
//        {
//            if (!Page.IsPostBack)
//            {
//                RadGrid1.EditIndexes.Add(0);
//                RadGrid1.Rebind();
//            }
//        }
//    }
//}

