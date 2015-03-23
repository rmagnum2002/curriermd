var $ = jQuery.noConflict();

//Only for demo version
var _default_skin = '';
var _active_skin  = '';
if ($.cookie("skin")) {
	_default_skin = $.cookie('skin').split(",");

	$('link.skin').attr('href', 'css/skins/' + _default_skin[0] + '/style-' + _default_skin[1] + '.css');

	$('#skins li').removeClass('active');
	$('#skins li').eq(_default_skin[1] - 1).addClass('active');

	$('#selectbox-color option').removeAttr('selected');
	$('#selectbox-color option[value="' + _default_skin[0] + '"]').attr('selected', 'selected');
	$('#skins li').attr({'data-value' : _default_skin[0]});
} else {
	$('#skins li').attr({'data-value' : $('#selectbox-color option[selected="selected"]').val()});
}

$(document).ready(function($) {
	/*-------------------------------------------------*/
	/* =  Only for demo version
	/*-------------------------------------------------*/
	$('#logo').css({'cursor': 'pointer'});
	$('#logo').on('click', function(){
		window.location = $(this).find('a').attr('href');
	});

	/* ---------------------------------------------------------------------- */
	/*	Style Switcher - [Only for demo version]
	/* ---------------------------------------------------------------------- */
	try {
		$('#selectbox-color').selectbox();
	} catch(err) {

	}

	var _style_switcher_animate = false;
	var _style_switcher_open = true;
	var _pos;

	$('#style-switcher-close').on('click', function(e){
		e.preventDefault();

		if (_style_switcher_animate == true) return;
		
		_style_switcher_animate = true;

		if (_style_switcher_open != true){
			_pos = '0px';
			_style_switcher_open = true;
			$(this).removeClass('open').text('x');
		} else {
			_pos = '-128px';
			_style_switcher_open = false;
			$(this).addClass('open').text('+');
		}

		$('#style-switcher').stop(true,true).animate({'left': _pos}, 300, function(){
			_style_switcher_animate = false;
		});
	});

	$('#selectbox-color').bind('change', function(){
		$('#skins li').hide().attr({'data-value' : $(this).val()}).fadeIn('fast', function(){
			$('#skins li').removeClass('active');
			_active_skin = [$('#skins li:first-child').attr('data-value'), $('#skins li:first-child').attr('class').replace('skin-','')];
			$('link.skin').attr('href', 'css/skins/' + _active_skin[0] + '/style-' + _active_skin[1] + '.css');
			$.cookie("skin", _active_skin, {expires: 365, path: '/'});
			$('#skins li:first-child').addClass('active');
		});
	});

	$('#skins li').on('click', function(){
		$('#skins li').removeClass('active');
		_active_skin = [$(this).attr('data-value'), $(this).attr('class').replace('skin-','')];
		$('link.skin').attr('href', 'css/skins/' + _active_skin[0] + '/style-' + _active_skin[1] + '.css');
		$.cookie("skin", _active_skin, {expires: 365, path: '/'});
		$(this).addClass('active');
	});
});