var setSitePing = function () {
    setTimeout("sitePing()", 60000);
}

var sitePing = function () {
    $.get(
        "/Ping.ashx",
        null,
        function (data) {
            setSitePing();            
        },
        "json"
    );
}

setSitePing();