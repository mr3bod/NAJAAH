var user = {
    id: "",
    name: "",
    major: "",
    advisor_ID: "",
    advisor_Name: "",
    GPA: ""
};
$(document).ready(function () {
    updateMessage();
    var notification;
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listWeek'
        },
        defaultView: 'month',
        editable: false,
        allDaySlot: false,
        unselectAuto: true,
        eventClick: function (calEvent, jsEvent, view) {

            //alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
           // alert('View: ' + view.name);

            // change the border color just for fun
           // $(this).css('background-color', '#044e2f');
            //$(this).adclass('btn-success');

            $.ajax(
              {
                  type: 'POST',
                  data: JSON.stringify({ e: calEvent }),
                  cache: false,
                  contentType: 'application/json',
                  dataType: 'json',
                  url: "EventCalendar.aspx/DeleteEvents",
                  success: function (d) {
                     // alert(d.id);
                  },
                  error: function (err) {
                      alert("nope");
                  }
              });

            $('#calendar').fullCalendar('removeEvents');

            $('#calendar').fullCalendar('refetchEvents');

           // $('#calendar').fullCalendar( 'rerenderEvents' );

           // $('#calendar').fullCalendar('renderEvent', calEvent, false);


        },
        eventRender: function (eventData, element) {
          //  $.ajax(
            //              {
              //                type: 'POST',
                //              data: JSON.stringify({ e: eventData }),
                  //            cache: false,
                    //          contentType: 'application/json',
                      //        dataType: 'json',
                        //      url: "EventCalendar.aspx/DeleteEvents",
                          //    error: function (err) {
                            //      alert("nope");
                              //}
                          //});
        },
        dayClick: function (start, end, allDay, jsEvent, view) {
            if (moment().isSameOrBefore(moment(start), 'day')) {
               
                //reset title
                $("#title").removeClass("has-error has-danger");
                $('#eventTitle').popover("hide");
                $('#eventTitle').val("");
                //reset startDate
                $('#eventDate').val($.fullCalendar.formatDate(start, 'DD-MMMM-YYYY'));
                $('#eventTime').val($.fullCalendar.formatDate(start, 'HH:mm'));
                
                //show modal
                $('#popupEventForm').modal('toggle');
                setTimeout(function () { $('#eventTitle').focus(); }, 500);
                //reset type
                $(".list:first-child").text("Major/Midterm");
                $(".list:first-child").val("Major/Midterm");
                $("#labelh").addClass("hidden");
                $("#inputh").addClass("hidden");
                //reset Toggole
                $("#dayLabel").addClass("hidden");
                $("#day").addClass("hidden");
                $("#forWeekLabel").addClass("hidden");
                $("#forWeek").addClass("hidden");
                $("#repeat").prop("checked", false);

            }else
            {
                notify();
            }
        },
        events:  function (start,end,timezone,callback){
            $.ajax(
                    {
                        type: 'POST',
                        contentType: 'application/json',
                        data: "{}",
                        dataType: 'json',
                        url: "EventCalendar.aspx/GetEvents",
                        cache: false,
                        success: function (response) {
                            var events = $.map(response.d, function (item, i) {
                                var event = new Object();
                                event.id = item.ID;
                                event.start = new Date(item.StartDate);
                                event.end = new Date(item.EndDate);
                                event.title = item.EventTitle;
                                event.type = item.type;
                                event.note = item.note;
                                event.repeat = item.repeat;
                                return event;
                            });
                            callback(events);
                        },

                        error: function (err) {
                            alert(err.d);
                        }

                  
                    });

        }
    });
    $(document.body).on('focusout', '#eventTitle', function (event) {
        var title = $('#eventTitle').val();
        if (title === "") {
            $('#eventTitle').popover({ placement: "bottom", content: "Event title is required", trigger: "manual" });
            $('#eventTitle').popover("toggle");
            //$('#eventTitle').get(0).focus();
            $("#title").addClass("has-error has-danger");
        } else {
            $("#title").removeClass("has-error has-danger");
            $('#eventTitle').popover("hide");
        }
    });
    $('#btnPopupSave').click(function () {
        var title = $('#eventTitle').val();
        if (title !== "") {
            var time = $('#eventTime').val();
            var start = moment($('#eventDate').val() + ' ' + time, "DD-MMMM-YYYY HH:mm");
            if (moment().isSameOrBefore(moment(start))) {
                $('#popupEventForm').modal('toggle');
                var type = $(".list:first-child").text();
                var other = $("#inputh").val();
                var duration = $('#eventDuration').val();
                //title is above
                // startDate is above
                var end = moment(moment(start).add(duration, 'm'), "DD-MMMM-YYYY HH:mm");
                var repeat = $('#repeat').prop("checked");
                var days = [$('#su').prop("checked"), $('#mu').prop("checked"), $('#tu').prop("checked"), $('#we').prop("checked"), $('#th').prop("checked"), $('#fr').prop("checked"), $('#sa').prop("checked")];
                var forWeek = $('#forWeek').val();
                var endRepeat = moment(moment(start).add(forWeek, 'w'), "DD-MMMM-YYYY HH:mm");
                var eventData;
                var note = $('#note').val();
                eventData = {
                        id: 0,
                        type: type,
                        other:other,
                        title: title,
                        start: start,
                        end: end,
                        repeat: repeat,
                        days: days,
                        endRepeat: endRepeat,
                        note:note
                    };
                eventDataToSave = {
                        id: 0,
                        type: type,
                        other: other,
                        EventTitle: title,
                        StartDate: start,
                        EndDate: end,
                        repeat: repeat,
                        days: days,
                        endRepeat: endRepeat,
                        note: note
                    };
                    if (repeat) {
                        var tempDate = start;
                        while (moment(tempDate).isBefore(moment(endRepeat))) {
                            if (days[moment(eventData.start).weekday()]) {
                                $('#calendar').fullCalendar('renderEvent', eventData, true);
                            }
                            eventData.start = tempDate;
                            eventData.end = moment(tempDate).add(duration, 'm');
                            tempDate = tempDate.add(1, 'd');
                        }
                    } else {
                        $('#calendar').fullCalendar('renderEvent', eventData, true);
                    }
                 // stick? = true
                    $('#calendar').fullCalendar('unselect');
                    save(eventDataToSave);
            } else {
                notify();
            }

        }
    });


    $(function () {
        $(".dropdown-menu li a").click(function () {
            $(".list:first-child").text($(this).text());
            $(".list:first-child").val($(this).text());
            if ($(this).text() === "Other") {
                $("#labelh").removeClass("hidden");
                $("#inputh").removeClass("hidden");  
            }
            else {
                $("#labelh").addClass("hidden");
                $("#inputh").addClass("hidden");
            }
        });
    });

    $(function () {
        $("#repeat").click(function () {
            if ($('#repeat').prop("checked") === true) {
                $("#dayLabel").removeClass("hidden");
                $("#day").removeClass("hidden");
                $("#forWeekLabel").removeClass("hidden");
                $("#forWeek").removeClass("hidden");
            }
            else {
                
                $("#dayLabel").addClass("hidden");
                $("#day").addClass("hidden");
                $("#forWeekLabel").addClass("hidden");
                $("#forWeek").addClass("hidden");
            }
        });
    });
    console.log(user.id);
});
function notify() {
    $.notify({
        // options
        icon: 'glyphicon glyphicon-warning-sign',
        title: "Wait, ",
        message: "Isn't this event in the past !!! "
        
    }, {
        // settings
        type: "minimalist",
        
        placement: {
            from: "top",
            align: "center"
        },
        z_index:'2000',
        delay: "1200",

        animate: {
            enter: 'animated shake',
            exit: 'animated fadeOutUp'
        }
    }
    );
}

function save(eventData) {
        $.ajax(
                {
                    type: 'POST',
                    data: JSON.stringify({ e: eventData }),
                    cache: false,
                    contentType: 'application/json',
                    dataType: 'json',
                    url: "EventCalendar.aspx/SaveEvents",
                    error: function (err) {
                        alert("nope");
                    }                 
                });
}

function getCookie() {
    var cname = "cookie-msg-test=";
    var ca = document.cookie.split(';');
    var decodedCookie = decodeURIComponent(ca);
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
    }
    return c.substring(cname.length, c.length);
}

function updateMessage() {
    var myJSON = getCookie();
    user = JSON.parse(myJSON);
    setTimeout(updateMessage, 100);
}