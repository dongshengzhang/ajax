﻿<%@ Page Language="C#" CodeFile="DefaultCS.aspx.cs" Inherits="Grid.Examples.DataEditing.TemplateFormUpdate.DefaultCS" %>
 
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head id="Head1" runat="server">
    <title>Telerik ASP.NET Example</title>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }
        </script>
    </telerik:RadCodeBlock>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <p id="divMsgs" runat="server">
        <asp:Label ID="Label1" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#FF8080">
        </asp:Label>
        <asp:Label ID="Label2" runat="server" EnableViewState="False" Font-Bold="True" ForeColor="#00C000">
        </asp:Label>
    </p>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="divMsgs"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />
    <div id="demo" class="demo-container no-bg">
        <telerik:RadGrid ID="RadGrid1" runat="server" CssClass="RadGrid" GridLines="None"
            AllowPaging="True" PageSize="20" AllowSorting="True" AutoGenerateColumns="False"
            ShowStatusBar="true" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
            AllowAutomaticUpdates="True" DataSourceID="SqlDataSource1" OnItemDeleted="RadGrid1_ItemDeleted"
            OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated" OnItemCommand="RadGrid1_ItemCommand"
            OnPreRender="RadGrid1_PreRender">
            <MasterTableView CommandItemDisplay="TopAndBottom" DataSourceID="SqlDataSource1"
                DataKeyNames="EmployeeID">
                <Columns>
                    <telerik:GridEditCommandColumn>
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn UniqueName="EmployeeID" HeaderText="ID" DataField="EmployeeID">
                        <HeaderStyle ForeColor="Silver" Width="20px"></HeaderStyle>
                        <ItemStyle ForeColor="Gray"></ItemStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="TitleOfCourtesy" HeaderText="TOC" DataField="TitleOfCourtesy">
                        <HeaderStyle Width="60px"></HeaderStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="FirstName" HeaderText="FirstName" DataField="FirstName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="LastName" HeaderText="LastName" DataField="LastName">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="HireDate" HeaderText="Hire Date" DataField="HireDate"
                        DataFormatString="{0:d}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Title" HeaderText="Title" DataField="Title">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn CommandName="Delete" Text="Delete" UniqueName="column">
                    </telerik:GridButtonColumn>
                </Columns>
                <EditFormSettings EditFormType="Template">
                    <FormTemplate>
                        <table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="0" rules="none"
                            style="border-collapse: collapse;">
                            <tr class="EditFormHeader">
                                <td colspan="2">
                                    <b>Employee Details</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table id="Table3" width="450px" border="0" class="module">
                                        <tr>
                                            <td class="title" style="font-weight: bold;" colspan="2">Company Info:</td>
                                        </tr>
                                        <tr>
                                            <td>Country:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Country") %>'>
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>City:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("City") %>' TabIndex="1">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Region:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("Region") %>' TabIndex="2">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <b>Personal Info:</b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Title Of Courtesy
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlTOC" runat="server" SelectedValue='<%# Bind("TitleOfCourtesy") %>'
                                                    DataSource='<%# (new string[] { "Dr.", "Mr.", "Mrs.", "Ms." }) %>' TabIndex="7"
                                                    AppendDataBoundItems="True">
                                                    <asp:ListItem Selected="True" Text="Select" Value="">
                                                    </asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>FirstName:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox2" Text='<%# Bind( "FirstName") %>' runat="server" TabIndex="8">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Last Name:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox3" Text='<%# Bind( "LastName") %>' runat="server" TabIndex="9">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Birth Date:
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="BirthDatePicker" runat="server" MinDate="1/1/1900" DbSelectedDate='<%# Bind("BirthDate") %>'
                                                    TabIndex="4">
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Hire Date:
                                            </td>
                                            <td>
                                                <telerik:RadDatePicker ID="HireDatePicker" DbSelectedDate='<%# Bind( "HireDate") %>'
                                                    runat="server" TabIndex="10">
                                                </telerik:RadDatePicker>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Title:
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TextBox4" Text='<%# Bind( "Title") %>' runat="server" TabIndex="11">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Home Phone:
                                            </td>
                                            <td>
                                                <telerik:RadMaskedTextBox ID="HomePhoneBox" runat="server" SelectionOnFocus="SelectAll"
                                                    Text='<%# Bind("HomePhone") %>' PromptChar="_" Mask="(###) ###-####"
                                                    TabIndex="3">
                                                </telerik:RadMaskedTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="vertical-align: top">
                                    <table id="Table1" cellspacing="1" cellpadding="1" width="250" border="0" class="module">
                                        <tr>
                                            <td>Notes:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TextBox1" Text='<%# Bind("Notes") %>' runat="server" TextMode="MultiLine"
                                                    Rows="5" Columns="40" TabIndex="5">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Address:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="TextBox6" Text='<%# Bind("Address") %>' runat="server" TextMode="MultiLine"
                                                    Rows="2" Columns="40" TabIndex="6">
                                                </asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                                        runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                        CommandName="Cancel"></asp:Button>
                                </td>
                            </tr>
                        </table>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
            <ClientSettings>
                <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
            </ClientSettings>
        </telerik:RadGrid>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TelerikConnectionString35 %>"
        DeleteCommand="DELETE FROM [Employees_Northwind] WHERE [EmployeeID] = @EmployeeID"
        InsertCommand="INSERT INTO [Employees_Northwind] ([LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [Country], [HomePhone], [Notes], [ReportsTo]) VALUES (@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, @Address, @City, @Region, @Country, @HomePhone, @Notes, @ReportsTo)"
        SelectCommand="SELECT * FROM [Employees_Northwind]" UpdateCommand="UPDATE [Employees_Northwind] SET [LastName] = @LastName, [FirstName] = @FirstName, [Title] = @Title, [TitleOfCourtesy] = @TitleOfCourtesy, [BirthDate] = @BirthDate, [HireDate] = @HireDate, [Address] = @Address, [City] = @City, [Region] = @Region, [Country] = @Country, [HomePhone] = @HomePhone, [Notes] = @Notes WHERE [EmployeeID] = @EmployeeID">
        <DeleteParameters>
            <asp:Parameter Name="EmployeeID" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
            <asp:Parameter Name="TitleOfCourtesy" Type="String"></asp:Parameter>
            <asp:Parameter Name="BirthDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="HireDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="Region" Type="String"></asp:Parameter>
            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
            <asp:Parameter Name="HomePhone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Notes" Type="String"></asp:Parameter>
            <asp:Parameter Name="ReportsTo" Type="Int32" DefaultValue=""></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String"></asp:Parameter>
            <asp:Parameter Name="FirstName" Type="String"></asp:Parameter>
            <asp:Parameter Name="Title" Type="String"></asp:Parameter>
            <asp:Parameter Name="TitleOfCourtesy" Type="String"></asp:Parameter>
            <asp:Parameter Name="BirthDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="HireDate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="Address" Type="String"></asp:Parameter>
            <asp:Parameter Name="City" Type="String"></asp:Parameter>
            <asp:Parameter Name="Region" Type="String"></asp:Parameter>
            <asp:Parameter Name="Country" Type="String"></asp:Parameter>
            <asp:Parameter Name="HomePhone" Type="String"></asp:Parameter>
            <asp:Parameter Name="Notes" Type="String"></asp:Parameter>
            <asp:Parameter Name="EmployeeID" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </form>
</body>
</html>



<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="telerikExample.aspx.cs" Inherits="ajax.telerikExample" %>

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
</html>--%>
