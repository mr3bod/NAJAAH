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
function checkCookie() {
    var id = getCookie("id");
    if (id != "") {
        alert("Welcome again " + id);
    } else {
        id = prompt("Please enter your name:", "");
        if (id != "" && id != null) {
            setCookie("username", id, 365);
        }
    }
}