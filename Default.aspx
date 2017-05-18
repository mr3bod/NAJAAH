<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="content1" ContentPlaceHolderID="Main" Runat="Server">
    Main Content goes here
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Left" Runat="Server">
            <!-- login -->
        <script src="dist/js/login.js"></script>
    <script src="dist/js/bootstrap-notify.min.js"></script>
    <link href="dist/css/animate.css" rel="stylesheet" />
    <link href="dist/css/login.css" rel="stylesheet" />
    <div class="panel panel-default">
        <div class="panel-body">
    <form id="myform">
        <label id="userNameText"><b>Username</b></label>
        <input type="text" id="username" placeholder="Enter Username" name="uname" autocomplete="ON" required>
        <!--<label><b>Password</b></label>
        <input type="password" id="password" placeholder="Enter Password" name="psw" required>-->
        <button type="button" id="btnPopupSave" class="btn btn-success">Login</button>

    </form>
        </div>
    </div>
</asp:Content>
<asp:Content ID="content3" ContentPlaceHolderID="Right" Runat="Server">
        <!--<div class="panel panel-default">
        <div class="panel-body">
            Right Content goes here
        </div>
    </div>-->
</asp:Content>


<asp:Content ID="content4" ContentPlaceHolderID="head" Runat="server">
</asp:Content>

