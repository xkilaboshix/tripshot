// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
  // 別ページから特定のタブにダイレクトリンク
  var hash = location.hash;
  //hashで取得した文字列から#より後を取得
  if (hash) {
    var tabname = hash.slice(1);
  } else {
    var tabname = "tab1";
  }
  //コンテンツを一度すべて非表示
  $(".content_area").hide();
  //一度タブについているクラスselectを消す
  $(".tab_area li").removeClass("select");
  $("#" + tabname).addClass("select");
  var area_num = tabname.slice(3);
  var area_name = "area" + area_num;
  $("#" + area_name).show();


	// タブをクリックしたときに発火
  $("ul.tab_area li").click(function() {
    var tab_id = $(this).attr("id"); //tab1
    var area_id = "area" + tab_id.slice(3);
    //非表示
    $(".content_area").hide();
    //クリックされたタブの内容表示
    $("#" + area_id).show();
    $(".tab_area li").removeClass("select");
    $(this).addClass("select");
  });
});

