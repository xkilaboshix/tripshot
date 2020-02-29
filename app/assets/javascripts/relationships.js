// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
	//クリックしたときにfunctionが発火
	$('ul.tab_area li').click(function() {
		//indexでクリックされたタブが何番目かを調べる
		var index = $('ul.tab_area li').index(this);
		//非表示
		$('.content_area').css('display','none');
		//クリックされたタブの内容表示
		$('.content_area').eq(index).fadeIn();
		$('.tab_area li').removeClass('select');
		$(this).addClass('select')
	});
});

