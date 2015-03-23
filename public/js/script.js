var $ = jQuery.noConflict();

var sf_menu_width = 0;
var sub_menu_ul_width = 0;

$(document).ready(function($) {
	/*-------------------------------------------------*/
	/* =  jQuery Detect Mobile Devices
	/*-------------------------------------------------*/
	var deviceAgent = navigator.userAgent.toLowerCase();
    var agentID = deviceAgent.match(/(ipad|iphone|android|iemobile|blackberry)/);
    if (agentID) {
 		$('#main-menu-left-nav, #main-menu-right-nav').css({'top':'3px'});
    }

	/*-------------------------------------------------*/
	/* =  Superfish Menu
	/*-------------------------------------------------*/
	try {
		$("ul.sf-menu").superfish({ 
			autoArrows:  false, // disable generation of arrow mark-up 
		    dropShadows: false,
			delay: 50,
			animation:  {opacity:'show', height:'show'}
		});
	} catch(err) {

	}

	/*-------------------------------------------------*/
	/* =  Get first post type
	/*-------------------------------------------------*/
	$('#slider-item-icon').addClass($('.slides li:first-child a:first-child').attr('data-type'));
	
	/*-------------------------------------------------*/
	/* =  Slider - [Flexslider]
	/*-------------------------------------------------*/
  	try {
		$('.flexslider').flexslider({
			controlsContainer: ".slider-wrapper"
		});
	} catch(err) {

	}

	/*-------------------------------------------------*/
	/* =  Gallery in Single Post
	/*-------------------------------------------------*/
	try {
		$('.gallery-page').flexslider({
			directionNav: false
		});
	} catch(err) {

	}

	/*-------------------------------------------------*/
	/* =  Input & Textarea Placeholder
	/*-------------------------------------------------*/
	$('input[type="text"], textarea').focus(function(){
		$(this).removeClass('error');
		if ($(this).val() == $(this).attr('placeholder'))
			$(this).val('');
	}).blur( function(){ 
		if ($(this).val() == '')
			$(this).val($(this).attr('placeholder'));
	});


	/*-------------------------------------------------*/
	/* =  Toggle Shortcodes
	/*-------------------------------------------------*/
	$('.toggle-style-1 > ul > li > h6, .toggle-style-2 > ul > li > h6').live('click', function(){
		if (!$(this).hasClass('expand')){
			$(this).parents('ul').find('h6.expand').removeClass('expand');
			$(this).addClass('expand');

			$(this).parents('ul').find('div.inner').removeClass('active').stop(true,true).slideUp('slow');

			$(this).parent('li').children('div.inner').addClass('active').stop(true,true).slideDown('slow');
		} else {
			$(this).parents('ul').find('h6.expand').removeClass('expand');
			$(this).parents('ul').find('div.inner').removeClass('active').stop(true,true).slideUp('slow');
		}
	});


	/*-------------------------------------------------*/
	/* =  Fancybox Gallery Images
	/*-------------------------------------------------*/
	try {
		$("ul.gallery-images a, .singlepost a:has(img)").fancybox({
			nextEffect	: 'fade',
			prevEffect	: 'fade',
			openEffect	: 'fade',
	    	closeEffect	: 'fade',
	          helpers: {
	              title : {
	                  type : 'float'
	              }
	          }
		});
	} catch(err) {

	}

	/*-------------------------------------------------*/
	/* =  Gallery & Post Carousel
	/*-------------------------------------------------*/
	try {
		$('ul.gallery-images, ul.carousel-post').jcarousel({
			scroll: 1
		});
	} catch(err) {

	}
	

	/*-------------------------------------------------*/
	/* =  Tabs Widget - { Popular, Recent and Comments }
	/*-------------------------------------------------*/
	$('.tab-links li a').live('click', function(e){
		e.preventDefault();
		if (!$(this).parent('li').hasClass('active')){
			var link = $(this).attr('href');

			$(this).parents('ul').children('li').removeClass('active');
			$(this).parent().addClass('active');

			$('.tabs-widget > div').hide();

			$(link).fadeIn();

			_masonry(); //Masonry Effect
		}
	});


	/*-------------------------------------------------*/
	/* =  Tabs Shortcodes
	/*-------------------------------------------------*/
	$('.tabs > ul > li > a').live('click', function(e){
		e.preventDefault();
		if (!$(this).parent('li').hasClass('active')){
			var link = $(this).attr('href');

			$(this).parents('ul').children('li').removeClass('active');
			$(this).parent().addClass('active');

			$('.tabs > div').removeClass('active').hide();

			$(link).addClass('active').fadeIn();
		}
	});


	/*-------------------------------------------------*/
	/* =  Scroll to TOP
	/*-------------------------------------------------*/
	$('a[href="#top"]').click(function(){
        $('html, body').animate({scrollTop: 0}, 'slow');
        return false;
    });


    /*-------------------------------------------------*/
	/* =  Scroll to Reply From
	/*-------------------------------------------------*/
    $('a.comment-reply-link').click(function(e){
    	e.preventDefault();
    	var offset = $('#commentForm').offset();
        $('html, body').animate({scrollTop: offset.top}, 'slow');
        $('input[name="author"]').focus();

        var commentID = $(this).parent('div').parent('li').attr('id');
        commentID     = commentID.replace('comment-','');
        $("#next-comment-fields").html('<input type="hidden" name="comment_parent" id="comment_parent" value="'+commentID+'">');
        $('#cancel-comment-reply').fadeIn();
        return false;
    });
	
    $('#cancel-comment-reply a').click(function(e){
    	$("#next-comment-fields").html('<input type="hidden" name="comment_parent" id="comment_parent" value="0">');
    	$('#cancel-comment-reply').hide();
    	e.preventDefault();
    });

	/* ---------------------------------------------------------------------- */
	/*	Contact Map
	/* ---------------------------------------------------------------------- */
	try {
		$('#map').gmap3({
	            action: 'addMarker',
	            latLng:[map.latitude, map.longitude],
	            map:{
	            	center: [map.latitude,map.longitude],
	            	zoom: 14
	            	},
	        	}
		);
	} catch(err) {

	}

	/* ---------------------------------------------------------------------- */
	/*	Comment Tree
	/* ---------------------------------------------------------------------- */
	try {
		$('ul.children > li, ol#comments > li').each(function(){
			if($(this).find(' > ul.children').length == 0){
				$(this).addClass('last-child');
			}
		});

		$("ul.children").each(function() {
			if($(this).find(' > li').length > 1) {
				$(this).addClass('border');
			}
		});

		$('ul.children.border').each(function(){
			$(this).append('<span class="border-left"></span>');

			var _height = 0;

			for(var i = 0; i < $(this).find(' > li').length - 1; i++){
				_height = _height + parseInt($(this).find(' > li').eq(i).height()) + parseInt($(this).find(' > li').eq(i).css('margin-bottom'));
			}

			_height = _height + 29;

			$(this).find('span.border-left').css({'height': _height + 'px'});
		});
	} catch(err) {

	}

	/* ---------------------------------------------------------------------- */
	/*	Main Menu Events
	/* ---------------------------------------------------------------------- */
	$('#main-menu-left-nav a').on('click', function(e){
		e.preventDefault();
		var _left = parseInt($('#sf-menu-container .sf-menu').css('left'));
		if (_left < 0){
			$('#sf-menu-container .sf-menu').stop(true,true).animate({'left': '+=110'}, 100, function(){
				var _left = parseInt($('#sf-menu-container .sf-menu').css('left'));

				$('#main-menu-right-nav').fadeIn("fast");

				if (_left == 0) {
					$('#main-menu-left-nav').fadeOut("fast");
				}
			});
		}
	});

	$('#main-menu-right-nav a').on('click', function(e){
		e.preventDefault();

		var _left = parseInt($('#sf-menu-container .sf-menu').css('left'));
		var _width = sf_menu_width + _left;

		if (_left <= 0 && _width > parseInt($('#sf-menu-container').css('width'))){
			$('#sf-menu-container .sf-menu').stop(true,true).animate({'left': '-=110'}, 100, function(){
				var _left = parseInt($('#sf-menu-container .sf-menu').css('left'));
				var _width = sf_menu_width + _left;

				if (_width <= parseInt($('#sf-menu-container').css('width'))){
					$('#main-menu-right-nav').fadeOut("fast");
				}
			});

			$('#main-menu-left-nav').fadeIn("fast");
		}
	});

	/* ---------------------------------------------------------------------- */
	/*	Sub Menu Events
	/* ---------------------------------------------------------------------- */
	$('#sub-menu-left-nav a').on('click', function(e){
		e.preventDefault();
		var _left = parseInt($('#sub-menu-ul-container > ul').css('left'));
		if (_left < 0){
			$('#sub-menu-ul-container > ul').stop(true,true).animate({'left': '+=110'}, 100);
		}
	});

	$('#sub-menu-right-nav a').on('click', function(e){
		e.preventDefault();

		var _left = parseInt($('#sub-menu-ul-container > ul').css('left'));
		var _width = sub_menu_ul_width + _left;

		if (_left <= 0 && _width > parseInt($('#sub-menu-ul-container').css('width'))){
			$('#sub-menu-ul-container > ul').stop(true,true).animate({'left': '-=110'}, 100);
		}
	});

	_masonry(); //Masonry Effect
	
	$(window).bind('resize', function(){
		main_menu_scroll(); //Main Menu
		sub_menu_scroll(); //Sub Menu

		$('#main-menu-left-nav').hide();

		$('#sf-menu-container .sf-menu').css({'left': '0px'});
		$('#sub-menu-ul-container > ul').css({'left': '0px'});

		//Comment tree fix
		try {
			$('ul.children.border').each(function(){
			var _height = 0;

			for(var i = 0; i < $(this).find(' > li').length - 1; i++){
				_height = _height + parseInt($(this).find(' > li').eq(i).height()) + parseInt($(this).find(' > li').eq(i).css('margin-bottom'));
			}

			_height = _height + 29;

			$(this).find('span.border-left').css({'height': _height + 'px'});
		});
		} catch(err) {

		}
		
		//Carousel Fix
		try {
			$('.jcarousel-list-horizontal').css({'left': '0px'});

			$('.jcarousel-list-horizontal').each(function(){
				var _width = 0;

				$(this).children('li.jcarousel-item').each(function(){
					_width = _width + parseInt($(this).width()) + parseInt($(this).css('margin-left')) + parseInt($(this).css('margin-right'));
				});

				$(this).width(_width);
			});
		} catch(err) {

		}
		
		_masonry(); //Masonry Effect
	});

	setTimeout("main_menu_scroll();", 500);
	setTimeout("sub_menu_scroll();", 500);
});

function main_menu_scroll(){
	sf_menu_width = 0;

	$('#sf-menu-container .sf-menu > li').each(function(){
		sf_menu_width = sf_menu_width + parseInt($(this).css('width')) + parseInt($(this).css('margin-left')) + 3;
	});

	$('#sf-menu-container .sf-menu').css({'width': sf_menu_width + 'px'});

	if (sf_menu_width <= parseInt($('#sf-menu-container').width())){
		$('#main-menu-left-nav').hide();
		$('#main-menu-right-nav').hide();
	} else {
		$('#main-menu-right-nav').show();
		$('#sub-menu-ul-container > ul').css({'left':'0px'});
	}
}
	
function sub_menu_scroll(){
	sub_menu_ul_width = 0;

	$('#sub-menu-ul-container > ul > li').each(function(){
		sub_menu_ul_width = sub_menu_ul_width + parseInt($(this).css('width')) + parseInt($(this).css('padding-left')) + 3;
	});

	$('#sub-menu-ul-container > ul').css({'width': sub_menu_ul_width + 'px'});

	if (sub_menu_ul_width < parseInt($('#sub-menu-ul-container').width())){
		$('#sub-menu-left-nav').hide();
		$('#sub-menu-right-nav').hide();
		$('#sub-menu-ul-container').css({'margin-left':'0px'});
	} else {
		$('#sub-menu-left-nav').show();
		$('#sub-menu-right-nav').show();
		$('#sub-menu-ul-container').css({'margin-left':'24px'});
	}
}

/*-------------------------------------------------*/
/* =  Masonry Effect
/*-------------------------------------------------*/
function _masonry(){
	$('#sidebar').masonry({
		itemSelector: '.masonry',
		columnWidth: 320
	});
}