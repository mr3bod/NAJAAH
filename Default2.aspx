<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Left" Runat="Server">

        <div class="panel panel-default">
        <div class="panel-body" id="ntcDiv">

            </div>
            </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Main" Runat="Server">
    <script src="dist/js/jquery-1.10.2.min.js"></script>
    <script src="dist/js/login.js"></script>
    <script src="dist/js/Sortable.js"></script>
    <script src="dist/js/jquery-ui.min.js"></script>
    <link href="dist/css/animate.css" rel="stylesheet" />
    <script src="dist/js/snap.svg-min.js"></script>
    <script src="dist/js/sendRequest.js"></script>
        <style>
        .Sem {
            border:solid;
            border-bottom-style:dashed;
            border-top-style:dashed;
            margin-top:-5px;
            background-color:#EEEEEE;
            min-height:75px;
        }
        .SemF {
            border:solid;
            border-bottom-style:none;
            border-radius:8px 8px 0px 0px;
            background-color:#EEEEEE;
            min-height:75px;
        }
        .SemL {
            border:solid;
            border-top-style:none;
            border-radius:0px 0px 8px 8px;
            background-color:#EEEEEE;
            margin-bottom:10px;
            min-height:75px;
        }
        .ghost{
            width:108px;
            height:70px;

        }
        .SemF div, .SemL div, .Sem div, #ntc div{
            display:inline-block;
            width:16.6%;
            overflow-x: hidden;
            min-width:108px;
            height:80%;
            margin:0px;
        }
    </style>
<a name="m"></a>
	<div class="container" style="width:100%;" id="container">
	</div>
 
 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="right" Runat="Server">
     <div class="panel panel-default" >
        <div class="panel-body" ">

            <label>ID: </label>
            <input type="text" id="stuID" class="form-control" value=""  readonly ></<br />
            <label>NAME: </label>
            <input type="text" id="stuN" class="form-control" value="" readonly ><br />
            <label>MAJOR: </label>
            <input type="text" id="stuM" class="form-control" value="" readonly ><br />
            <label>ADVISOR ID: </label>
            <input type="text" id="stuADV" class="form-control" value="" readonly ><br />
            <label>ADVISOR NAME: </label>
            <input type="text" id="stuADVn" class="form-control" value="" readonly ><br />
            <label>Cumulative GPA: </label>
            <input type="text" id="stuG" class="form-control" value="" readonly ><br />
            <label>LEVEL: </label>
            <input type="text" id="stuL" class="form-control" value="" readonly ><br />
            <label>STANDING: </label>
            <input type="text" id="stuSTAND" class="form-control" value="" readonly ><br />
            <label>CLASS: </label>
            <input type="text" id="stuCLASS" class="form-control" value="" readonly ><br />
           
            
            <div >	
            <input class="btn btn-success" type="button" style=" width:100%; text-align:center; white-space: normal;"  onclick="location.href = 'Default3.aspx';" value="Back to the plan" />
            <input class="btn btn-success" id="send" type="button" style=" width:100%; text-align:center; white-space: normal;"  " value="request approval" />
</div>
        </div>
    </div>
</asp:Content>

