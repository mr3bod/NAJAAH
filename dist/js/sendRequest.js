var user = {
    id: "",
    name: "",
    major: "",
    advisor_ID: "",
    advisor_Name: "",
    GPA: ""
};
var nextSems;
var count = 0;
$(document).ready(function () {
    var arr2 = [];
    updateMessage();
    var plan;
    var newTerms;
    var cTerm;
    nextSems = [[], [], []];
    setTimeout(function () {
        plan = GetCoursesList(user);
        cTerm = GetCurrentTerm(user);
    }, 100);
    var ntc = [];
    var sems = [ntc];
    var semsID = [];
    var semsVar = [];
    var semsDiv = [];
    setTimeout(function () {
        newTerms = GetNewTerms(cTerm);
    }, 300);
    setTimeout(function () {
        var arr = [];
        newTerms[0].forEach(function (item) {
            if (item !== undefined) {
                for (i in plan) {
                    for (j in plan[i]) {
                        if (plan[i][j].title === item.course) {
                            plan[i][j].semester = item.term
                            arr.push(plan[i][j]);
                            plan[i].splice(j, 1)
                        }
                    }
                }
            }
        });
        newTerms[1].forEach(function (item) {
            if (item !== undefined) {
                for (i in plan) {
                    for (j in plan[i]) {
                        if (plan[i][j].title === item.course) {
                            plan[i][j].semester = item.term
                            arr2.push(plan[i][j]);
                            plan[i].splice(j, 1)
                        }
                    }
                }
            }
        });
            plan.push(arr)
            console.log(plan)
        for (i in plan) {
            var rep = false
            for (j in plan[i]) {
                if (plan[i][j].semester == null) {
                    sems[0].push(plan[i][j])
                } else {
                    if (!rep) {
                        sems.push(plan[i])
                        rep = true;
                    }
                }
            }
        }
        sems.sort(compare);
        console.log(sems)
    }, 500);
    setTimeout(function () {

        for (var i = 1; i < sems.length; i++) {
            if (sems[i] !== undefined) {
                if (i == 1) {
                    $("#container").append("<div class='SemF' id ='" + i + "'></div>");
                } else {
                    $("#container").append("<div class='Sem'id ='" + i + "'></div>");
                }
                sems[i].forEach(function (item) {
                    if (item !== undefined)
                        drawCourse("#" + i, item, newTerms);
                });
            }
        }

        $("#container").append("<div class='Sem'id ='Sem1'></div>");
        for (i in arr2) {
            console.log(arr2[i])
            nextSems[0][i] = arr2[i]
            drawCourse("#" + 'Sem1', arr2[i], newTerms);
        }
        $("#container").append("<div class='Sem'id ='Sem2'></div>");
        $("#container").append("<div class='SemL'id ='Sem3'></div>");
        Sortable.create(Sem1, {
            group: "course",
            animation: 150,
            dragClass: "ghost",
            disabled: false,
            ghostClass: "sortable-ghost",  // Class name for the drop placeholder
            chosenClass: "filter",  // Class name for the chosen item
            //onStart:
            //onEnd:
            onAdd: function (evt) {
                var arr = evt.item.childNodes[0].id;
                var s = Snap("#" + arr)
                var course = {
                    title: s.data().title,
                    grade: s.data().grade,
                    semster: s.data().semester,
                    credit: s.data().credit,
                }
                nextSems[0].push(course);
                console.log(evt.from.id)
                //
                if (evt.from.id === 'Sem2') {
                    for (var t = 0; t < nextSems[1].length; t++) {
                        if (course.title == nextSems[1][t].title) {
                            nextSems[1].splice(t, 1);
                        }
                    }
                } else if (evt.from.id === 'Sem3') {
                    for (var t = 0; t < nextSems[2].length; t++) {
                        if (course.title == nextSems[2][t].title) {
                            nextSems[2].splice(t, 1);
                        }
                    }
                }
                console.log(nextSems)
                if (evt.from.id == 'ntcDiv') {
                    console.log($("#" + arr).parent())
                    //$("#" + arr).parent().remove();
                    //drawCourse("#Sem3", course, cTerm)
                    var rect = s.children()[2].attr().id;
                    s.animate({
                        width: "108",
                        height: "70",
                    }, 750);
                    $("#" + rect).animate({
                        x: "25%",
                        y: "20%",
                        width: "72%",
                        height: "65%",
                        rx: 5,
                        ry: 5
                    }, 750);
                    console.log()
                    var x = "#" + arr + " .title";
                    var title = s.select(x).animate({
                        x: "30%",
                        y: "45%",
                    }, 750);
                }
            }
        });
        Sortable.create(Sem2, {
            group: "course",
            animation: 150,
            dragClass: "ghost",
            disabled: false,
            ghostClass: "sortable-ghost",  // Class name for the drop placeholder
            chosenClass: "filter",  // Class name for the chosen item
            //onStart:
            //onEnd:
            onAdd: function (evt) {
                var arr = evt.item.childNodes[0].id;
                var s = Snap("#" + arr)
                var course = {
                    title: s.data().title,
                    grade: s.data().grade,
                    semster: s.data().semester,
                    credit: s.data().credit,
                }
                nextSems[1].push(course);
                //
                if (evt.from.id == 'Sem1') {
                    for (var t = 0; t < nextSems[0].length; t++) {
                        if (course.title === nextSems[0][t].title) {
                            nextSems[0].splice(t, 1);
                        }
                    }
                } else if (evt.from.id === 'Sem3') {
                    for (var t = 0; t < nextSems[2].length; t++) {
                        if (course.title == nextSems[2][t].title) {
                            nextSems[2].splice(t, 1);
                        }
                    }
                }
                console.log(nextSems)
                if (evt.from.id == 'ntcDiv') {
                    console.log($("#" + arr).parent())
                    //$("#" + arr).parent().remove();
                    //drawCourse("#Sem3", course, cTerm)
                    var rect = s.children()[2].attr().id;
                    s.animate({
                        width: "108",
                        height: "70",
                    }, 750);
                    $("#" + rect).animate({
                        x: "25%",
                        y: "20%",
                        width: "72%",
                        height: "65%",
                        rx: 5,
                        ry: 5
                    }, 750);
                    console.log()
                    var x = "#" + arr + " .title";
                    var title = s.select(x).animate({
                        x: "30%",
                        y: "45%",
                    }, 750);
                }
            }
        });
        Sortable.create(Sem3, {
            group: "course",
            animation: 150,
            dragClass: "ghost",
            disabled: false,
            ghostClass: "sortable-ghost",  // Class name for the drop placeholder
            chosenClass: "filter",  // Class name for the chosen item
            //onStart:
            //onEnd:
            onAdd: function (evt) {
                var arr = evt.item.childNodes[0].id;
                var s = Snap("#" + arr)
                var course = {
                    title: s.data().title,
                    grade: s.data().grade,
                    semster: s.data().semester,
                    credit: s.data().credit,
                }
                console.log(evt.from.id)
                nextSems[2].push(course);
                //
                if (evt.from.id == 'Sem1') {
                    for (var t = 0; t < nextSems[0].length; t++) {
                        if (course.title === nextSems[0][t].title) {
                            nextSems[0].splice(t, 1);
                        }
                    }
                } else if (evt.from.id === 'Sem2') {
                    for (var t = 0; t < nextSems[1].length; t++) {
                        if (course.title == nextSems[1][t].title) {
                            nextSems[1].splice(t, 1);
                        }
                    }
                }
                console.log(evt.from.id == 'ntcDiv')
                if (evt.from.id == 'ntcDiv') {
                    console.log($("#" + arr).parent())
                    //$("#" + arr).parent().remove();
                    //drawCourse("#Sem3", course, cTerm)
                    var rect = s.children()[2].attr().id;
                    if (course.title.includes("XXX")) {
                        var electTitle = prompt("What is the course", "");
                    }
                    //isValid(electTitle)
                    if (checkElective()) {
                        s.animate({
                            width: "108",
                            height: "70",
                        }, 750);
                        $("#" + rect).animate({
                            x: "25%",
                            y: "20%",
                            width: "72%",
                            height: "65%",
                            rx: 5,
                            ry: 5
                        }, 750);
                        console.log()
                        var x = "#" + arr + " .title";
                        var title = s.select(x).animate({
                            x: "30%",
                            y: "45%",
                        }, 750);
                } else {
                        if(evt.from.id !== 'ntcDiv'){
                            drawCourse("#" + evt.from.id, course, newTerms)
                        } else {
                            course.id = s.data().id
                            listCourse("#" + evt.from.id, course, newTerms)
                        }
                        $("#" + arr).parent().remove();
                }
                    }
            },

        });
        sems[0].forEach(function (item) {
            if (item !== undefined)
                listCourse("#ntcDiv", item, newTerms);
        });
    }, 1000);

    Sortable.create(ntcDiv, {
        group: "course",
        animation: 150,
        dragClass: "ghost",
        disabled: false,
        ghostClass: "sortable-ghost",  // Class name for the drop placeholder
        chosenClass: "filter",  // Class name for the chosen item
        //onStart:
        //onEnd:
        onAdd: function (evt) {
            var arr = evt.item.childNodes[0].id;
            var s = Snap("#" + arr)
            var course = {
                title: s.data().title,
                grade: s.data().grade,
                semster: s.data().semester,
                credit: s.data().credit,
            }
            //
            if (evt.from.id == 'Sem1') {
                for (var t = 0; t < nextSems[0].length; t++) {
                    if (course.title === nextSems[0][t].title) {
                        nextSems[0].splice(t, 1);
                    }
                }
            } else if (evt.from.id === 'Sem2') {
                for (var t = 0; t < nextSems[1].length; t++) {
                    if (course.title == nextSems[1][t].title) {
                        nextSems[1].splice(t, 1);
                    }
                }
            } else if (evt.from.id === 'Sem3') {
                for (var t = 0; t < nextSems[2].length; t++) {
                    if (course.title == nextSems[2][t].title) {
                        nextSems[2].splice(t, 1);
                    }
                }
            }
            console.log(nextSems)
                console.log($("#" + arr).parent())
                //$("#" + arr).parent().remove();
                //drawCourse("#Sem3", course, cTerm)
                var rect = s.children()[2].attr().id;
                s.animate({
                    width: "100%",
                    height: "34",
                }, 750);
                $("#" + rect).animate({
                    x: "0",
                    y: "0",
                    width: "100%",
                    height: "100%",
                    rx: 0,
                    ry: 0
                }, 750);
                console.log()
                var x = "#" + arr + " .title";
                var title = s.select(x).animate({
                    x: "8%",
                    y: "50%",
                }, 750);
            }
    });
    $("#send").click(save);
    });

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

    function GetCoursesList(user) {
        var plan = [];
        $.ajax({
            type: 'POST',
            data: JSON.stringify({ e: user }),
            cache: false,
            contentType: 'application/json',
            dataType: 'json',
            url: "Default2.aspx/GetCoursesBySemester",
            success: function (response) {
                response.d.forEach(function (el) {
                    plan.push(el);
                });
            },
            error: function (err) {
                alert("cannot get your courses");
            }
        });
        return plan;
    }

    function compare(a, b) {
        if (a[0].semester == b[0].semester) {
            return a[0].semester > b[0].semester ? 1 : a[0].semester < b[0].semester ? -1 : 0;
        }

        return a[0].semester > b[0].semester ? 1 : -1;
    }

    function drawCourse(semestar, course, cTerm) {
        var color = ['#aab2bd', '#F0AD4E', '#2ecc71', 'white', '#e1bee7'];
        var len = 0;
        if (course.semester !== null && course.semester !== undefined) {
            if (course.semester == null && course.semester.includes("\n")) {
                len = course.semester.split("\n");
                len = len.length;
            }
        }
        var ii = 0;
        var op = 0.8;
        var idName = course.title.replace(/\s/g, '');
        if (course.title.includes("XXX")) {
            ii = 1;
            op = 1;
            idName = count++;
        }
        else if (course.grade === null) {
            ii = 3;
            op = 1;
            cTerm[0].forEach(function (item) {
                if (item.course === course.title) {
                    ii = 2;
                    var n = item.term;
                    var digits = ("" + n).split("");
                    var num = "" + digits[2] + "" + digits[3] + "" + digits[4];
                    course.semester = num;
                }
            }
             );
            cTerm[1].forEach(function (item) {
                if (item.course === course.title) {
                    ii = 4;
                    var n = item.term;
                    var digits = ("" + n).split("");
                    var num = "" + digits[2] + "" + digits[3] + "" + digits[4];
                    course.semester = num;
                    op = 1;
                }
            });
        }
        $(semestar).append("<div class='hoverable'><svg id='svg-" + idName + "'width='108' height='70'></svg></div>");

        var s = Snap("#svg-" + idName);
        var rect = s.rect("25%", "20%", "72%", 65 + len * 5 + "%", 5, 5);
        var recID = "svg-" + idName + "rect"
        rect.attr({
            fill: color[ii],
            stroke: "#3b3939",
            strokeWidth: "2px",
            opacity: op,
            id: recID
        });
        var co = s.text("30%", "45%", course.title);
        co.attr(
            "fill", "black",
            "font-size", "12",
            "font-family", "Verdana"
        );
        co.addClass("title");
        if (course.grade !== null && course.grade.includes("\n")) {
            course.grade = course.grade.split("\n");
            for (var i = 0; i < course.grade.length; i++) {
                var g = s.text("30%", 68 + i * 20 + "%", course.grade[i]);
                g.attr(
                "fill", "black",
                "font-size", "12",
                "font-family", "Verdana"
                );
                g.addClass("grade");
            }

        } else {
            var g2 = s.text("30%", "68%", course.grade);
            g2.attr(
            "fill", "black",
            "font-size", "12",
            "font-family", "Verdana"
        );
            g2.addClass("grade");
        }
        var cdt = s.text("84%", 79 + len * 5 + "%", course.credit);
        cdt.attr(
        "fill", "black",
        "font-size", "12",
        "font-family", "Verdana"
    );
        cdt.addClass("credit");
        if (course.semester !== null && course.semester !== undefined) {
            if (course.semester.includes("\n")) {
                if (course.semester.includes("\n")) {
                    course.semester = course.semester.split("\n");
                    for (var i = 0; i < course.semester.length; i++) {
                        var sem = s.text("50%", 68 + i * 20 + "%", course.semester[i]);
                        sem.attr(
                        "fill", "black",
                        "font-size", "12",
                        "font-family", "Verdana");
                        sem.addClass("semester");
                    }
                } else {
                    var sem = s.text("50%", "68%", course.semester);
                    sem.attr(
                    "fill", "black",
                    "font-size", "12",
                    "font-family", "Verdana"
                    );
                    sem.addClass("semester");
                }
            }
        }
        if (!course.title.includes("XXX")) {
            s.data({
                "title": course.title,
                "grade": course.grade,
                "credit": course.credit,
                "semster": course.semster
            });
        } else {
            s.data({
                "title": course.title,
                "grade": course.grade,
                "credit": course.credit,
                "semster": course.semster,
                "xxx": count
            });
        }
    }

    function GetNewTerms(cTerm) {
        console.log(cTerm)
        var fTerm = [];
        var sTerm = [];
        var first = true;
        var newTerms;
        console.log(cTerm)
        for (var i = 0; i < cTerm.length; i++) {
            if (i === 0) {
                fTerm.push(cTerm[i]);
            } else {
                if (fTerm[0].term === cTerm[i].term) {
                    fTerm.push(cTerm[i]);
                } else {
                    sTerm.push(cTerm[i]);
                }
            }
        }
        if (fTerm[0].term < sTerm[0].term) {
            newTerms = [fTerm, sTerm];
        } else {
            newTerms = [sTerm, fTerm];
        }
        return newTerms;
    }

    function GetCurrentTerm(user) {
        var cTerm = [];
        $.ajax({
            type: 'POST',
            data: JSON.stringify({ e: user }),
            cache: false,
            contentType: 'application/json',
            dataType: 'json',
            url: "Default2.aspx/GetTemp",
            success:
                function (response) {
                    response.d.forEach(function (item) {
                        var t = new Object();
                        t.course = item.course;
                        t.crn = item.crn;
                        t.term = item.term;
                        cTerm.push(t);
                    });
                },
            error: function (err) {
                alert("cannot get the current term courses");
            }
        });

        return cTerm;

    }

    function listCourse(semestar, course, cTerm) {
        var color = ['#aab2bd', '#F0AD4E', '#2ecc71', 'white', '#e1bee7'];
        var len = 0;
        if (course.semester !== null && course.semester !== undefined) {
            if (course.semester.includes("\n")) {
                len = course.semester.split("\n");
                len = len.length;
            }
        }
        var ii = 0;
        var op = 0.8;
        var idName = course.title.replace(/\s/g, '');
        if (course.title.includes("XXX")) {
            ii = 1;
            op = 1;
            idName = count++;
        }
        else if (course.grade === null) {
            ii = 3;
            op = 1;
            cTerm[0].forEach(function (item) {
                if (item.course === course.title) {
                    ii = 2;
                    var n = item.term;
                    var digits = ("" + n).split("");
                    var num = "" + digits[2] + "" + digits[3] + "" + digits[4];
                    course.semester = num;
                }
            }
             );
            cTerm[1].forEach(function (item) {
                if (item.course === course.title) {
                    ii = 4;
                    var n = item.term;
                    var digits = ("" + n).split("");
                    var num = "" + digits[2] + "" + digits[3] + "" + digits[4];
                    course.semester = num;
                    op = 1;
                }
            });
        }
        $(semestar).append("<div class='hoverable'><svg id='svg-" + idName + "'width='100%' height='34'></svg></div>");
        console.log(idName)
        var s = Snap("#svg-" + idName);
        var rect = s.rect("0%", "0%", "100%","100%", 0, 0);
        var recID = "svg-" + idName + "rect"
        rect.attr({
            fill: color[ii],
            stroke: "#3b3939",
            strokeWidth: "2px",
            opacity: op,
            id: recID
        });
        var co = s.text("8%", "50%", course.title);
        co.attr(
            "fill", "black",
            "font-size", "12",
            "font-family", "Verdana"
        );
        co.addClass("title");
        if (course.grade !== null && course.grade !== undefined) {
            if (course.grade !== null && course.grade.includes("\n")) {
                course.grade = course.grade.split("\n");
                for (var i = 0; i < course.grade.length; i++) {
                    var g = s.text("30%", 68 + i * 20 + "%", course.grade[i]);
                    g.attr(
                    "fill", "black",
                    "font-size", "12",
                    "font-family", "Verdana"
                    );
                    g.addClass("grade");
                }

            } else {
                var g2 = s.text("30%", "68%", course.grade);
                g2.attr(
                "fill", "black",
                "font-size", "12",
                "font-family", "Verdana"
            );
                g2.addClass("grade");
            }
        }
        var cdt = s.text("84%", 79 + len * 5 + "%", course.credit);
        cdt.attr(
        "fill", "black",
        "font-size", "12",
        "font-family", "Verdana"
    );
        cdt.addClass("credit");
        if (course.semester !== null && course.semester !== undefined) {
            if (course.semester.includes("\n")) {
                course.semester = course.semester.split("\n");
                for (var i = 0; i < course.semester.length; i++) {
                    var sem = s.text("50%", 68 + i * 20 + "%", course.semester[i]);
                    sem.attr(
                    "fill", "black",
                    "font-size", "12",
                    "font-family", "Verdana");
                    sem.addClass("semester");
                }
            } else {
                var sem = s.text("50%", "68%", course.semester);
                sem.attr(
                "fill", "black",
                "font-size", "12",
                "font-family", "Verdana"
                );
                sem.addClass("semester");
            }
        }
        if (!course.title.includes("XXX")) {
            s.data({
                "title": course.title,
                "grade": course.grade,
                "credit": course.credit,
                "semster": course.semster
            });
        } else {
            s.data({
                "title": course.title,
                "grade": course.grade,
                "credit": course.credit,
                "semster": course.semster,
                "xxx": count
            });
        }
    }

    function save() {
        var item = [];
        count =[0, 0, 0];
        for (i in nextSems) {
            for (j in nextSems[i]) {
                console.log(j)
                var course = nextSems[i][j];
                count[i] += parseInt(course.credit);
                var x = parseInt(i) + 1
                console.log(x)
                course.semCode = x;
                    item.push(course)
            }
        }
        console.log(item)
        if (count[0] < 12 || count[1] < 12 || count[2] < 12) {
            alert("You cann ot register less than 12 hours");
        } else {
            $.ajax({
                type: 'POST',
                data: JSON.stringify({ u: user, items: item }),
                cache: false,
                contentType: 'application/json',
                dataType: 'json',
                url: "Default2.aspx/saveCourses",
                success: function () {
                    alert("success");
                },
                error: function (err) {
                    alert("nope");
                }
            });
        }
    }

    function checkElective(){
        var check = false;
            $.ajax({
                type: 'POST',
                data: JSON.stringify({i:}),
                cache: false,
                contentType: 'application/json',
                dataType: 'json',
                url: "Default2.aspx/================================================================================================",
                success: function (response) {
                    check = response.d;
                },
                error: function (err) {
                    alert("Could not check if this is valid course !!!");
                }
            });
            return check;
    }
