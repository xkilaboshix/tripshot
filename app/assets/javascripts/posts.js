// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// 投稿画像プレビュー
$(function(){
  $($('#file')).on('change', $('#file'), function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");
 
    reader.onload = function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,          
          width: "100%"
        }));
      };
    }(file);
    reader.readAsDataURL(file);   
  });
});

// 無限スクロール
$(window).on("scroll", function() {
  scrollHeight = $(document).height();
  scrollPosition = $(window).height() + $(window).scrollTop();
  if ((scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
    //スクロールの位置が下部5%の範囲に来た場合
    $(".jscroll").jscroll({
      contentSelector: ".jscroll",
      nextSelector: "a.page-link:last"
    });
  }
});