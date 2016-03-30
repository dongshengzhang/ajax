<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="popupForm.aspx.cs" Inherits="ajax.popupForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Editform_csharp.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.EditFormCS" %>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit dialog</title>
</head>
<body>
    <form id="form2" runat="server">
    <div>
        <script type="text/javascript">
            function CloseAndRebind(args) {
                GetRadWindow().BrowserWindow.refreshGrid(args);
                GetRadWindow().close();
            }

            function GetRadWindow() {
                var oWindow = null;
                if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
                else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

                return oWindow;
            }

            function CancelEdit() {
                GetRadWindow().close();
            }
        </script>
        <asp:ScriptManager ID="ScriptManager2" runat="server" />
        <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" Skin="Vista" DecoratedControls="All" />
        <br />
        <br />
        <asp:DetailsView ID="DetailsView1" DataKeyNames="EmployeeID" runat="server" AutoGenerateRows="False"
            DataSourceID="SqlDataSource1" Height="50px" Width="125px" OnItemCommand="DetailsView1_ItemCommand"
            BorderWidth="0" CellPadding="0" CellSpacing="7" GridLines="None" OnItemUpdating="DetailsView1_ItemUpdating">
            <Fields>
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:CommandField ShowEditButton="True" ButtonType="Button" />
                <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString35 %>"
            InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Title]) VALUES (@LastName, @FirstName, @Title)"
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title] FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)"
            UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title WHERE [EmployeeID] = @EmployeeID">
            <InsertParameters>
                <asp:Parameter Name="LastName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                <asp:Parameter Name="FirstName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                <asp:Parameter Name="Title" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                <asp:Parameter Name="FirstName" Type="String" DefaultValue="" ConvertEmptyStringToNull="false" />
                <asp:Parameter Name="Title" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="EmployeeID" QueryStringField="EmployeeID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>