 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EventCalendar.aspx.cs" Inherits="EventCalendar" %>

<asp:Content ID="content1" ContentPlaceHolderID="Main" Runat="Server"><!--Main-->

<!--Imports for the calendar-->

<link href='dist/css/fullcalendar.min.css' rel='stylesheet' />
<link href='dist/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src="dist/js/moment.min.js"></script>
<script src="dist/js/jquery-1.10.2.min.js"></script>
<script src='dist/js/fullcalendar.min.js'></script>
<script src="dist/js/bootstrap-notify.min.js"></script>
<link href="dist/css/animate.css" rel="stylesheet" />
<script src='dist/js/calendar.js?=1'></script>
<link href='dist/css/calendar.css' rel='stylesheet'/>
    <script>
        function select (){

        };
    </script>
<!--Modal to add the events-->
<div class="modal fade" id="popupEventForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">Add New Event</h3><br />
            </div>
            <div class="modal-body">
                <div class="panel panel-default">    
                    <form id="EventForm" class="panel-body" data-toggle="validator" role="form">
                        
                        <label>Event Type: </label><br />
                 <!----><div id="listContainer" class="dropdown">
                            <a href="bootstrap-elements.html" data-target="#" class="dropdown-toggle btn btn-primary " id="button"data-toggle="dropdown">
                                <b class="list">Major/Midterm</b>
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu  ">
                                <li><a  href="#">Major/Midterm</a> </li>
                                <li><a  href="#">Final Exam</a></li>
                                <li><a  href="#">Quiz</a></li>
                                <li><a  href="#">Other</a></li>
                            </ul>
                        </div><br /><!---->

                        <label class="hidden" id="labelh">Other type: </label>    
                        <input   class="form-control hidden" id="inputh">
                        <div class="form-group" id="title">
                        <label for="eventTitle" class="control-label" > Event title: </label>
                        <input type="text" id="eventTitle" placeholder="Title here" class="form-control" required data-toggle="popover" data-placement="bottom"/><br />
                            </div>
                        <label>Start date: </label>
                        <input type="text" id="eventDate" class="form-control"><br />
                        <label>At: </label>
                        <input type="time" id="eventTime" class="form-control"><br />
                        <label>Duration (min): </label>
                        <input type="number" id="eventDuration" min="15" class="form-control">
                        <label>Repeat: </label>
                        <div class="togglebutton">
                            <label style="position:relative !important; margin-left:40%; "><input id="repeat" type="checkbox"></label>
                        </div><br />
                        <label class="hidden" id="dayLabel">Repeat on: </label>
                        <span class="checkbox checkbox-primary hidden" id="day" style="margin-left:40%;">
                            <label  title="Sunday" style="position:relative;"><input id="su" name="SU" title="Sunday" type="checkbox" checked style="margin-left:initial;  width:initial;">SU </label>
                            <label title="Monday" style="position:relative;"><input id="mu" name="MU" title="Monday" type="checkbox" checked  style="margin-left:initial; width:initial;">MU </label>
                            <label title="Tuesday" style="position:relative;"><input id="tu" name="TU" title="Tuesday" type="checkbox" checked  style="margin-left:initial; width:initial;">TU </label>
                            <label title="Wednesday" style="position:relative;"><input id="we" name="WE" title="Wednesday" type="checkbox" checked  style="margin-left:initial; width:initial;">WE </label>
                            <label title="Thursday" style="position:relative;"><input id="th" name="TH" title="Thursday" type="checkbox" checked  style="margin-left:initial; width:initial;">TH </label>
                            <label title="Monday"style="position:relative;"><input id="fr" name="FR" title="Friday" type="checkbox" style="margin-left:initial; width:initial;">FR </label>
                            <label title="Saturday" style="position:relative;"><input id="sa" name="SA" title="Saturday" type="checkbox" style="margin-left:initial; width:initial;">SA </label>
                        </span><br />
                        <label class="hidden" id="forWeekLabel">For (week): </label>
                        <input type="number" id="forWeek" class="form-control hidden" min="1" value="1"><br />
                        <label>Note: </label>
                       <br /> <textarea rows="4" cols="56" name="comment" form="EventForm" placeholder="NOTE..." class="form-control" id="note"></textarea>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="btnPopupCancel" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                <button type="button" id="btnPopupSave" class="btn btn-success">Save Event</button>
            </div>
        </div>
    </div>
</div>
<!--Calendar call-->
<div id='calendar'></div>
    
</asp:Content>


<asp:Content ID="content2" ContentPlaceHolderID="Left" Runat="Server"><!--Left-->
    <div class="panel panel-default">
        <div class="panel-body">
            Left Content goes here
        </div>
    </div>
</asp:Content>


<asp:Content ID="content3" ContentPlaceHolderID="Right" Runat="Server"><!--Right-->
        <!--<div class="panel panel-default">
        <div class="panel-body">
            Right Content goes here
        </div>
    </div>-->
</asp:Content>

<asp:Content ID="content4" ContentPlaceHolderID="head" Runat="server">
</asp:Content>


