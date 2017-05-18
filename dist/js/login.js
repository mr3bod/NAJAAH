var user = {
    id: "",
    name: "",
    major: "",
    advisor_ID: "",
    advisor_Name: "",
    GPA: ""
};

$(document).ready(function () {
    if (document.cookie != false)
    {
        var arr = document.cookie.split(",");
        st = arr[1];
        var ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '(');
        ff = ff.replace('"', ')');

        if (ff != '') {
            if ($('#btnPopupSave').text() == "Login") {
                $('#btnPopupSave').addClass('btn-danger').removeClass('btn-success');
                $('#btnPopupSave').text("Logout");
                $('#username').hide();
                $('#userNameText').html("Welcome <br>" + ff);
                
            }
        }
    }
    $(document).ready(function () {
        arr = document.cookie.split(",");
        st = arr[0];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        $('#stuID').val(ff);

        st = arr[1];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        $('#stuN').val(ff);

        st = arr[2];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        $('#stuM').val(ff);

        st = arr[3];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        $('#stuADV').val(ff);

        st = arr[4];
        ss = st.split(":");
        ff = ss[1] +" "+ arr[5];
        ff = ff.replace(' ', ',');
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        ff = ff.replace('.', '');
        $('#stuADVn').val(ff);

        st = arr[6];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        $('#stuG').val(ff);

        st = arr[7];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        $('#stuL').val(ff);

        st = arr[8];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        $('#stuSTAND').val(ff);

        st = arr[9];
        ss = st.split(":");
        ff = ss[1];
        ff = ff.replace('"', '');
        ff = ff.replace('"', '');
        ff = ff.replace('}', '');
        if (ff == "FR")
        {
            $('#stuCLASS').val("Freshman");
        }
        if (ff == "JR")
        {
            $('#stuCLASS').val("Junior");
        }
        if (ff == "SO") {
            $('#stuCLASS').val("Sophomore");
        }
        if (ff == "SR") {
            $('#stuCLASS').val("Senior");
        }

        
       

    })
    
        


        //$('#btnPopupSave').addClass("btn-danger");
    
});
$(document).ready(function () {
    console.log($('#btnPopupSave').text())
    $('#btnPopupSave').click ( function (event) {
        if ($('#btnPopupSave').text() == "Logout") {
            console.log($('#btnPopupSave').text())
            //document.cookie = "";
            
                name = "cookie-msg-test";
                document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
                location.reload();
        }
    })
});

$(document).ready(function () {
    var log = "";
    // Get the modal
    var modal = document.getElementById('id01');

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target === modal) {
            //document.getElementById('login-modal').style.display = 'none'
        }
    }

    $("#btnPopupSave").click(function () {
        user.id = $("#username").val();
        setUser();
    });
});

function notify() {
    $.notify({
        // options
        icon: 'glyphicon glyphicon-warning-sign',
        title: "Wait, ",
        message: "User Not Found!!! "

    }, {
        // settings
        type: "minimalist",

        placement: {
            from: "top",
            align: "center"
        },
        z_index: '2000',
        delay: "1200",

        animate: {
            enter: 'animated shake',
            exit: 'animated fadeOutUp'
        }
    }
    );
}
function notifyf(msg) {
    $.notify({
        // options
        icon: 'glyphicon glyphicon-warning-sign',
       
        message: msg

    }, {
        // settings
        type: "minimalist",

        placement: {
            from: "top",
            align: "center"
        },
        z_index: '2000',
        delay: "1200",

        animate: {
            enter: 'animated shake',
            exit: 'animated fadeOutUp'
        }
    }
    );
}
    
function setUser() {
    $.ajax(
            {
                type: 'POST',
                data: JSON.stringify({ e: user }),
                cache: false,
                contentType: 'application/json',
                dataType: 'json',
                url: "Default.aspx/checkStudent",
                success: function (response) {
                    user = response.d;
                    delete user.__type;
                    console.log(response.d);
                    
                    if (user.name != "") {
                        
                        location.reload();
                        updateMessage();
                        
                           
                   
                        //setTimeout(location.reload(), 3000);
                    }
                    else
                    {
                        if ($('#btnPopupSave').text() == "Logout")
                            return false;
                        else
                        notify();
                        
                    }
                        

                },
                error: function (err) {
                   // alert("nope");
                }
            });
}

function getLog() {
    updateMessage();
    return log;
}

function setCookie(user) {
    var myJSON = JSON.stringify(user);
    //console.log(myJSON)
    document.cookie = "cookie-msg-test=" + myJSON + "; path=/";
    //console.log(document.cookie)
    return true;
}
function updateMessage() {
    //user.id = document.forms['myform'].elements['uname'];
    console.log(user)
    setCookie(user);
    setTimeout(updateMessage, 10000);
}