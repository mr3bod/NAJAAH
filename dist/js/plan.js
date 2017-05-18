var user = {
    id: "",
    name: "",
    major: "",
    advisor_ID: "",
    advisor_Name: "",
    GPA: ""
};
var plan;
var toID ="";
var fromID="";
$(document).ready(function () {
    updateMessage();
    console.log(user)
    var newTerms;
    var cTerm;
    var preCors;

    setTimeout(function () {
        cTerm = GetCurrentTerm(user);
        preCors = GetPreCourses(user);
        plan = GetCoursesList(user);
    }, 100);
    var sems = ["#Freshman1", "#Freshman2", "#Summar1", "#Sphmor1", "#Sphmor2", "#Summar2", "#Junior1", "#Junior2", "#Summar3", "#Seneior1", "#Seneior2"];
    var Fr1, Fr2, Fr3, Sp1, Sp2, Sp3, Ju1, Ju2, Ju3, Se1, Se2
    var semsVar = [Fr1, Fr2, Fr3, Sp1, Sp2, Sp3, Ju1, Ju2, Ju3, Se1, Se2];
    var semsDiv = [Freshman1, Freshman2, Summar1, Sphmor1, Sphmor2, Summar2, Junior1, Junior2, Summar3, Seneior1, Seneior2];
    var count = 0;
    setTimeout(function () {
        newTerms = GetNewTerms(cTerm);
        for (var k = 0; k < 12; k++) {
            if (plan[k] !== undefined) {
                plan[k].forEach(function (item) {
                    if (item !== undefined)
  
                        drawCourse(sems[k], item, count++, newTerms, preCors, user);
                });
            }
        }
        var inn = false;
        $(".Sem1 div svg, .Sem2 div svg, .summer div svg").on("mouseover", function (event) {
            //$(".image").remove();
            //inn = true;
            var idName = event.target.id;
            if(idName != null){
            console.log(idName +"===============")
                idName = idName.replace("rect", '');
                preRequestRemove(preCors, idName);
                preRequest(preCors, idName);
            }
        });
       /* $(".Sem1 div svg, .Sem2 div svg, .summer div svg").on("mouseenter", function (event) {
                var idName = event.target.id;
                if(idName != null){
                    idName = idName.replace("rect",''); 
                    preRequestRemove(preCors, idName);
                }*/
      /*  }); $(".Sem1 div svg rect, .Sem2 div svg rect, .summer div svg rect").on("mouseenter", function (event) {
                var idName = event.target.id;
                if(idName != null){
                    idName = idName.replace("rect",''); 
                    preRequestRemove(preCors, idName);
                }
        });*/
    }, 1000);

    for(i in semsVar){
        semsVar[i] = Sortable.create(semsDiv[i], {
            group: "course", 
            animation: 150, 
            dragClass: "ghost", 
            disabled:false, 
            ghostClass: "sortable-ghost",  // Class name for the drop placeholder
            chosenClass: "filter",  // Class name for the chosen item
            onStart: function (/**Event*/evt) {
                var element = document.getElementsByClassName("filter")[0].firstChild.id;
                for( i in preCors){
                    pre = preCors[i][0].title.replace(/\s/g, '');
                    if(element.replace('svg-', '') === pre){
                        //console.log("pre = "+ pre)
                        for(j in plan){
                            for(k in plan[j]){
                                for(t in preCors[i]){
                                    if(plan[j][k].title === preCors[i][t].title)
                                        if(t != 0){
                                            var preDiv = $("#svg-"+plan[j][k].title.replace(/\s/g, '')).parent().parent()[0].id;
                                            var index = sems.indexOf("#" + preDiv)
                                            for( var x=index; x>=0; x--){
                                                semsVar[x].option("disabled", true);
                                                $(sems[x]).css({ opacity: 0.4 });
                                                var c = $(sems[x]).children();
                                                for (var y = 0; y < c.length; y++) {
                                                    var s = Snap("#"+c[y].childNodes[0].id);
                                                    var rect = s.select("rect");
                                                    rect.attr({
                                                        opacity: 0.8,
                                                    });
                                                }
                                                    
                                            }
                                        }
                                }
                            }
                        }
                    }
                    for(var y=1;y<preCors[i].length;i++){
                        if(element.replace('svg-', '') === preCors[i][y].title.replace(/\s/g, '')&& preCors[i].length>1){
                            var parDiv =$("#svg-"+preCors[i][0].title.replace(/\s/g, '')).parent().parent()[0].id
                            var index = sems.indexOf("#"+parDiv)
                            for( var x=index; x<plan.length; x++){
                                semsVar[x].option("disabled", true);
                                $(sems[x]).css({opacity: 0.4});
                                var c = $(sems[x]).children();
                                for (var y = 0; y < c.length; y++) {
                                    var s = Snap("#" + c[y].childNodes[0].id);
                                    var rect = s.select("rect");
                                    rect.attr({
                                        opacity: 0.2,
                                    });
                                }
                            }
                        }
                    }
                }
            },
            onEnd:function (/**Event*/evt) {
                for( i in semsVar){
                    semsVar[i].option("disabled", false); // set
                    $(sems[i]).css({ opacity: 1 });
                    var c = $(sems[i]).children();
                    for (var y = 0; y < c.length; y++) {
                        var s = Snap("#" + c[y].childNodes[0].id);
                        var rect = s.select("rect");
                        rect.attr({
                            opacity: 1,
                        });
                    }
                }
            }
        });
    }
});


function preV(element){
    $("#"+element).addClass("filter");
}

function GetCoursesList(user) {
    var plan = [];
    $.ajax({
        type: 'POST',
        data: JSON.stringify({ e: user }),
        cache: false,
        contentType: 'application/json',
        dataType: 'json',
        url: "Default3.aspx/GetCoursesList",
        success: function (response) {
            response.d.forEach(function (semstar) {
                semstar.forEach(function (item) {
                    var course = new Object();
                    course.title = item.title;
                    course.grade = item.grade;
                    course.credit = item.credit;
                    course.semster = item.semster;
                    course.semCode = item.semCode;
                    //console.log(course);
                });
                plan.push(semstar);
            });
            plan = response.d;
        },
        error: function (err) {
            alert("cannot get your courses");
        }
    });
    return plan;
}

function drawCourse(semestar, course, count, cTerm, preCors, user) {
    var color = ['#aab2bd', '#F0AD4E', '#2ecc71', 'white', '#e1bee7', 'red'];
    var stand = ['FR', 'SO', 'JR', 'SR'];
    var len = 0;
    if (course.semester !== null && course.semester.includes("\n")) {
        len = course.semester.split("\n");
        len = len.length;
    }
    var ii = 0;
    var op = 0.8;
    var idName = course.title.replace(/\s/g, '');
    if (course.title.includes("XXX")) {
        ii = 1;
        op = 1;
        idName = count;
    }
    else if(course.grade === null) {
        ii = 3;
        op = 1;
       cTerm[0].forEach(function (item) {
            if(item.course === course.title){
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
    if (course.semCode <= 3) {
        if (stand.indexOf(user.clas) >= 2 && (course.grade === null || course.grade === 'F' )) {
            ii = 5;
        }
    } else if (course.semCode <= 6) {
        if (stand.indexOf(user.clas) > 2 && (course.grade === null || course.grade === 'F')) {
            ii = 5;
        }
    }
    stand.indexOf(user.clas)
    var hh = len * 5 + 70;
    $(semestar).append("<div class='hoverable'><svg id='svg-" + idName + "'width='100%' height='"+hh+"'></svg></div>");
    var s = Snap("#svg-" + idName);
    var rect = s.rect("25%", "20%", "72%", 65+"%", 5, 5);
    var recID = "svg-"+idName+"rect"
    rect.attr({
        fill: color[ii],
        stroke: "#3b3939",
        strokeWidth: "2px",
        opacity: op,
        id:recID
    });
    var c = s.text("30%", "40%", course.title);
    c.attr(
         "fill", "black",
        "font-size", "12",
        "font-family", "Verdana"
        );

    if (course.grade !== null && course.grade.includes("\n")) {
        course.grade = course.grade.split("\n");
        for (var i = 0; i < course.grade.length; i++) {
            var g = s.text("30%", 60+i*20+"%", course.grade[i]);
            g.attr(
            "fill", "black",
            "font-size", "12",
            "font-family", "Verdana"
            );
        }

    }else{
    var g2 = s.text("30%", "65%", course.grade);
    g2.attr(
    "fill", "black",
    "font-size", "12",
    "font-family", "Verdana"
);}
    var cdt = s.text("84%", 75+len*5+"%", course.credit);
    cdt.attr(
    "fill", "black",
    "font-size", "12",
    "font-family", "Verdana"
);
    if (course.semester !== null && course.semester.includes("\n")) {
        course.semester = course.semester.split("\n");
        for (var i = 0; i < course.semester.length; i++) {
            var sem = s.text("50%", 60 + i * 20 + "%", course.semester[i]);
            sem.attr(
            "fill", "black",
            "font-size", "12",
            "font-family", "Verdana");
        }
    } else {
        var sem = s.text("50%", "65%", course.semester);
        sem.attr(
        "fill", "black",
        "font-size", "12",
        "font-family", "Verdana"
        );
    }
    s.data({
        "title": course.title,
        "grade": course.grade,
        "credit": course.credit,
        "semster": course.semster
    });
}


function GetCurrentTerm(user) {
    var cTerm = [];
    $.ajax({
        type: 'POST',
        data: JSON.stringify({ e: user }),
        cache: false,
        contentType: 'application/json',
        dataType: 'json',
        url: "Default3.aspx/GetTemp",
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

function GetNewTerms(cTerm) {
    console.log(cTerm)
    var fTerm= [];
    var sTerm= [];
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

function GetPreCourses(user) {
    var preCourses=[];
    $.ajax({
        type: 'POST',
        data: JSON.stringify({ e: user }),
        cache: false,
        contentType: 'application/json',
        dataType: 'json',
        url: "Default3.aspx/preCourses",
        success: function (response) {
            response.d.forEach(function (item) {
                preCourses.push(item);
            });
        }
        ,
        error: function (err) {
            alert("cannot get your pre requeset courses");
        }
    });
    return preCourses;
}

function preRequest(preCors, idName) {
            for (var k = 0; k < preCors.length; k++) {
                var c=0;
                if (idName.replace('svg-', '') === preCors[k][0].title.replace(/\s/g, '') && preCors[k].length > 1) {
                   // var idName = "#svg-" + crs.title.replace(/\s/g, '');
                    //console.log(idName);
                    var s = Snap("#" + idName);
                    var pre = s.image("./img/arrow.svg", "25%", 0, "70%", "19%");
                    pre.addClass("image");
                    //pre.attr({
                     //  id:"i"+0,
                    //});
                    var first = true;
                    for (i in preCors[k]) {
                        if (!first) {
                            //console.log(k)
                            var idName2 = "#svg-" + preCors[k][i].title.replace(/\s/g, '');
                            var s = Snap(idName2);
                            if (s !== null) {
                                c++
                                var pre3 = s.image("./img/arrow-180.svg", "25%", "80.7%", "70%", "19%");
                                pre3.addClass("image");
                                    //.attr({
                                    //id:"i"+c
                        //    });
                        }
                        } else {
                            first = false;
                        }
                    }
                }
            }
}

function preRequestRemove(preCors, idName) {
    for (var k = 0; k < preCors.length; k++) {
       // console.log(idName)
        if (idName.replace('svg-', '') === preCors[k][0].title.replace(/\s/g, '') && preCors[k].length > 1) {
           // console.log(idName+"true")
            // var idName = "#svg-" + crs.title.replace(/\s/g, '');
            //for (i in preCors[k]) {
                $(".image").remove();
            }
        //}
    }
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   