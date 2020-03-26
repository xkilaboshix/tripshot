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


$(function(){
  $('.posts').infinitescroll({
    navSelector  : 'nav.pagination',          // この部分をスクロールが通ったら、ページングを実施
    nextSelector : 'nav.pagination a[rel=next]',
    itemSelector : '.post-image' // 次のページへのリンク（自動に書き換える、例の中で一回使ったものが次はmy_url/3になる）      // my_urlから取ったhtmlのid=targetの部分のliだけ表示する
  });
});