<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="telerikEditPopup.aspx.cs" Inherits="ajax.telerikEditPopup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%--<%@ Page Language="c#" CodeFile="DefaultCS.aspx.cs" Inherits="Telerik.Web.Examples.Grid.Integration.GridAndWindow.DefaultCS" %>--%>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">--%>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head id="Head1" runat="server">
    <title>Telerik ASP.NET Example</title>
    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <style type="text/css">
            .orderText
            {
                font: normal 12px Arial,Verdana;
                margin-top: 6px;
            }
        </style>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function ShowEditForm(id, rowIndex) {
                var grid = $find("<%= RadGrid1.ClientID %>");

                var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                grid.get_masterTableView().selectItem(rowControl, true);

                window.radopen("EditForm_csharp.aspx?EmployeeID=" + id, "UserListDialog");
                return false;
            }
            function ShowInsertForm() {
                window.radopen("EditForm_csharp.aspx", "UserListDialog");
                return false;
            }
            function refreshGrid(arg) {
                if (!arg) {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
                }
                else {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
                }
            }
            function RowDblClick(sender, eventArgs) {
                window.radopen("EditForm_csharp.aspx?EmployeeID=" + eventArgs.getDataKeyValue("EmployeeID"), "UserListDialog");
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="gridLoadingPanel"></telerik:RadAjaxLoadingPanel>
    <telerik:RadGrid OnItemCreated="RadGrid1_ItemCreated" ID="RadGrid1" runat="server"
        AllowPaging="True" Width="97%" DataSourceID="SqlDataSource1">
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="EmployeeID" ClientDataKeyNames="EmployeeID"
            Width="100%" CommandItemDisplay="Top" PageSize="5">
            <Columns>
                <telerik:GridBoundColumn DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True"
                    SortExpression="EmployeeID" UniqueName="EmployeeID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"
                    UniqueName="FirstName">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastName" HeaderText="LastName" SortExpression="LastName"
                    UniqueName="LastName">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Title" HeaderText="Title" SortExpression="Title"
                    UniqueName="Title">
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn UniqueName="TemplateEditColumn">
                    <ItemTemplate>
                        <asp:HyperLink ID="EditLink" runat="server" Text="Edit"></asp:HyperLink>
                    </ItemTemplate>
                </telerik:GridTemplateColumn>
            </Columns>
            <CommandItemTemplate>
                <a href="#" onclick="return ShowInsertForm();">Add New Record</a>
            </CommandItemTemplate>
        </MasterTableView>
        <ClientSettings>
            <Selecting AllowRowSelect="true"></Selecting>
            <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
        </ClientSettings>
    </telerik:RadGrid>
    <telerik:RadWindowManager ID="RadWindowManager1" runat="server" EnableShadow="true">
        <Windows>
            <telerik:RadWindow ID="UserListDialog" runat="server" Title="Editing record" Height="320px"
                Width="310px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                Modal="true">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString35 %>"
        SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title] FROM [Employees]">
    </asp:SqlDataSource>
    </form>
</body>
</html>