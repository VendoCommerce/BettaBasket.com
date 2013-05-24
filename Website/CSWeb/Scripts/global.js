// JavaScript Document

$(document).ready(function () {
    $(".fancybox").fancybox();


    $(".warranty_details").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 500,
        height: 685,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.4
            }
        }
    });

    $(".ordercall").fancybox({
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

    $(".guarantee").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 850,
        height: 330,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.4
            }
        }
    });



/* test video functionality */
var grp = $("#thumb_list").children();
				 var cnt = grp.length;
			  
				 var temp, x;
				 for (var i = 0; i < cnt; i++) {
					 temp = grp[i];
					 x = Math.floor(Math.random() * cnt);
					 grp[i] = grp[x];
					 grp[x] = temp;
				 }
				 $(grp).remove();
				 $("#thumb_list").append($(grp));
	
jQuery(".test1").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").show();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
			
  jwplayer('videotest1').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_1.mp4',
	autostart: true,    
	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test2').trigger('click');
}
}
  });
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();

	e.preventDefault();
});

jQuery(".test2").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").show();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
		
	jwplayer('videotest1').stop();
  jwplayer('videotest2').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_2.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test3').trigger('click');
}
}
  });
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();

		e.preventDefault();
});

jQuery(".test3").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").show();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
	
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
  jwplayer('videotest3').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_3.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test4').trigger('click');
}
}
  });
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();

		e.preventDefault();
});

jQuery(".test4").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").show();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
		
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();

  jwplayer('videotest4').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_4.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test5').trigger('click');
}
}
  });
		jwplayer('videotest5').stop();
		jwplayer('videotest6').stop();
		jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();
		
		e.preventDefault();
});

jQuery(".test5").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").show();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
		
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest6').stop();

  jwplayer('videotest5').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_5.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test6').trigger('click');
}
}
  });
		jwplayer('videotest6').stop();
		jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();
	
		e.preventDefault();
});

jQuery(".test6").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").show();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
		
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();

  jwplayer('videotest6').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_6.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test7').trigger('click');
}
}
  });
		jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();
	
	e.preventDefault();
});

jQuery(".test7").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").show();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
	
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest6').stop();
			
  jwplayer('videotest7').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_7.mp4',
	autostart: true,    
	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test8').trigger('click');
}
}
  });
	
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();

	e.preventDefault();
});

jQuery(".test8").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").show();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
		
	jwplayer('videotest1').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest7').stop();
	
  jwplayer('videotest8').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_8.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test9').trigger('click');
}
}
  });
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();

		e.preventDefault();
});

jQuery(".test9").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").show();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
	
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	
  jwplayer('videotest9').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_9.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test10').trigger('click');
}
}
  });
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();

		e.preventDefault();
});

jQuery(".test10").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").show();
	jQuery("#test11").hide();
	jQuery("#test12").hide();
		
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();

  jwplayer('videotest10').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_10.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test11').trigger('click');
}
}
  });
	jwplayer('videotest11').stop();
	jwplayer('videotest12').stop();
		
		e.preventDefault();
});

jQuery(".test11").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").show();
	jQuery("#test12").hide();
		
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest6').stop();
	jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();

  jwplayer('videotest11').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_11.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test12').trigger('click');
}
}
  });
	jwplayer('videotest12').stop();
	
		e.preventDefault();
});

jQuery(".test12").bind("click touch", function(e){
$('html, body').animate({
                    scrollTop: $("#hdr_testimonials").offset().top
                     }, 500);
	jQuery("#test1").hide();
	jQuery("#test2").hide();
	jQuery("#test3").hide();
	jQuery("#test4").hide();
	jQuery("#test5").hide();
	jQuery("#test6").hide();
	jQuery("#test7").hide();
	jQuery("#test8").hide();
	jQuery("#test9").hide();
	jQuery("#test10").hide();
	jQuery("#test11").hide();
	jQuery("#test12").show();
		
	jwplayer('videotest1').stop();
	jwplayer('videotest2').stop();
	jwplayer('videotest3').stop();
	jwplayer('videotest4').stop();
	jwplayer('videotest5').stop();
	jwplayer('videotest7').stop();
	jwplayer('videotest8').stop();
	jwplayer('videotest9').stop();
	jwplayer('videotest10').stop();
	jwplayer('videotest11').stop();

  jwplayer('videotest12').setup({
    flashplayer: '/scripts/jwplayer/player.swf',
	file: '/content/video/testimonial_12.mp4',
	autostart: true,	controlbar: 'bottom', width: 485,    height: 286,
	stretching: 'exactfit',	skin: '/scripts/jwplayer/glow2.zip',
	events: {
onComplete: function() { 
jQuery('.test1').trigger('click');
}
}
  });
	
	e.preventDefault();
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

function showPrepaidModal() {
    $(".prepaid_card_option").fancybox({
        closeBtn: false,
        fitToView: false,
        wrapCSS: 'nowrapper',
        padding: 0,
        width: 608,
        height: 414,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        helpers: {
            overlay: {
                opacity: 0.6,
                closeClick: false
            }
        }
    });
}


function showPrepaidModal(versionId) {

    $.fancybox({
        href: '/PrepaidCardDecline.aspx?version=' + versionId,
        closeBtn: false,
        fitToView: false,
        padding: 0,
        width: 624,
        height: 470,
        autoSize: false,
        closeClick: false,
        scrolling: 'no',
        type: 'iframe',
        helpers: {
            overlay: {
                opacity: 0.4,
				closeClick: false
            }
        }
    });
}