<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <script src="dist/js/jquery-1.10.2.min.js"></script>
     <script src="dist/js/login.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
    <script src="dist/js/Sortable.js"></script>
    <link href="dist/css/animate.css" rel="stylesheet" />
    <script src="dist/js/Sortable.js"></script>
    <script src="dist/js/snap.svg-min.js"></script>
    <script src="dist/js/plan.js"></script>
    
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Left" Runat="Server">

        <div class="panel panel-default">
        <div class="panel-body">
				<div id="D" class="tile__list" style="min-height:101px;">
                   
                                      
                                       
			</div>
            </div>
            </div>
<script>
    // Simple list
    Sortable.create(D, {
        group: "course", animation: 150, dropOnEmpty:true});
</script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Main" Runat="Server">
        <style>
        .Sem1 {
            border:solid;
            border-bottom-style:dashed;
            border-radius:8px 8px 0px 0px;
            background-color:#EEEEEE;
            min-height:75px;
            min-width:120px;
        }
        .Sem2 {
            border:solid;
            min-width:120px;
            border-top-style:none;
            border-radius:0px 0px 8px 8px;
            background-color:#EEEEEE;
            margin-bottom:10px;
            min-height:75px;
        }
        .summer {
            border:solid;
            min-width:120px;
            border-radius: 8px;
            background-color:#EEEEEE;
            margin-bottom:10px;
            min-height:10px;
            width:100%;
        }
.Sem1 div, .Sem2 div, .summer div{
    display:inline-block;
    width:16.6%;
    overflow-x: hidden;
    margin-left:10px;
    min-width:108px;
    height:80%;
    margin:0px;
}

    </style>
<a name="m"></a>
	<div class="container" style="width:100%;">
	    <div id="Freshman1" class="Sem1" ></div>
        <div id="Freshman2" class="Sem2" ></div>
        <div id="Summar1" class="summer"></div>
        <div id="Sphmor1" class="Sem1"></div>
        <div id="Sphmor2" class="Sem2"></div>
        <div id="Summar2" class="summer"></div>
        <div id="Junior1" class="Sem1"></div>
        <div id="Junior2" class="Sem2"></div>
        <div id="Summar3" class="summer"></div>
        <div id="Seneior1" class="Sem1"></div>
        <div id="Seneior2" class="Sem2"></div>
	</div>





</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="right" Runat="Server">
     <div class="panel panel-default">
        <div class="panel-body">
				
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
           
            
            <input class="btn btn-success" type="button" style=" width:100%; text-align:center; white-space: normal;" onclick="location.href = 'Default2.aspx';" value="Make Next Semester Plan"; />
            

            <button onclick ="save()">save</button>

              <script>

            function save() {

                var course = {
                    title: "ICS253",
                    grade: "A+",
                    semster: "171",
                    credit: "4"
                }

                $.ajax(
            {
                type: 'POST',
                data: JSON.stringify({ c: course }),
                cache: false,
                contentType: 'application/json',
                dataType: 'json',
                url: "Default3.aspx/GetCoursesAsList",
                success: function () {
                    alert(course.title);
                    alert("success");
                },
                error: function (err) {
                    alert("nope");
                }
            });
            }
        </script>
            </div>
    </div>
    <div class="jumbotron">
        color code
    </div>
</asp:Content>

