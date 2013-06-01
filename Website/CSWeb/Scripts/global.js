// JavaScript Document
window.onload = function() {
  scrollTo(0,0);
}

$(document).ready(function () {
    $(".fancybox").fancybox();


    $(".mbg").fancybox({
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 690,
        height: 320,
        autoSize: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.4
            }
        }
    });

    $(".cvv").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 550,
        height: 450,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.4
            }
        }
    });



});

$(document).ready(function () {
$('a.try,area.try').click(function(){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 500);
    return false;
});
});

function MM_showHideLayers() { //v9.0
    var i, p, v, obj, args = MM_showHideLayers.arguments;
    for (i = 0; i < (args.length - 2); i += 3)
        with (document) if (getElementById && ((obj = getElementById(args[i])) != null)) {
            v = args[i + 2];
            if (obj.style) { obj = obj.style; v = (v == 'show') ? 'visible' : (v == 'hide') ? 'hidden' : v; }
            obj.visibility = v;
        }
    }

 