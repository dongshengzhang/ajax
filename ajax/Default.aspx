<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ajax._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"> </script>
<script type="text/javascript" src="/Content/json2.js"> </script>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>

<link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/bootstrap/css/bootstrap-theme.min.css">
<script src="Scripts/jquery-1.11.3.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
	.bs-example{
    	margin: 20px;
    }
</style>
<script type="text/javascript">
    window.index = 0;
    $(document).ready(function () {

        var d = Date.parse("02/23/2016 4:20:00");
        $('#Button2').click(function (evt) {
            evt.preventDefault();
            var dto = { name: $('#taskText').val() };

            $.ajax({
                type: "post",
                contentType: "application/json; charset-utf-8",
                dataType: "json",
                url: "/Default.aspx/AddTask",
                data: JSON.stringify(dto),
                success: function(response) {
                    $('<li>').text(response.d)
                            .attr('id',"TaskID-" + response.d)
                            .appendTo('#tasks');
                }
            });


            var incr = (function () {
                var i = window.index;

                return function () {
                    window.index = i++;
                    return window.index;
                }
            })();

            var uniqueID = incr(); // returns 1            
            uniqueID = incr(); // returns 2   
            $("#<%=Label1.ClientID %>").text(uniqueID);
        });
    });
    </script>
    <title></title>
    
</head>
<body>
<div class="bs-example">
    <nav id="myNavbar" class="navbar navbar-default" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="container">
            <%--<div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Brand</a>
            </div>--%>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Profile</a></li>
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Messages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Inbox</a></li>
                            <li><a href="#">Drafts</a></li>
                            <li><a href="#">Sent Items</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Trash</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" data-toggle="dropdown" class="dropdown-toggle">Admin <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Settings</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </nav>
</div>

  <ul id="tasks">
         <%--<li>item1</li>
         <li>item2</li>--%>
        </ul>
    <form id="form1" runat="server">
    <div>
      <asp:ScriptManager ID="ScriptManager1" runat="server">
	  </asp:ScriptManager>
	  <img src="image\lava_lamp.gif" style="width: 66px; height: 144px" /><br />
		
      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
          <div style="background-color:#FFFFE0;padding: 20px">
            <asp:Label ID="lblTime" runat="server" Font-Bold="True" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Button ID="cmdRefreshTime" runat="server" Text="Refresh Time" 
      	    	onclick="cmdRefreshTime_Click" Visible="False" />
          </div>
        </ContentTemplate>
      </asp:UpdatePanel>

      

        <asp:TextBox ID="taskText" runat="server"></asp:TextBox>

      <br />
      <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
    </div>
    <div style="background-color:#FFFFE0;height: 187px; width:10">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" 
                    Visible="False" />
              
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
      <asp:Button ID="Button2" runat="server" Text="Button" />
    </form>
</body>

<%--<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
    
    <img alt="Lava Lamp" src = "../image/lava_lap.gif", style="width: auto; height: auto" /> <br />

    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    </asp:UpdatePanel>
    </form>
</body>--%>
</html>
