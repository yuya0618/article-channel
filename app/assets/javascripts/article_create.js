$(document).on('turbolinks:load', function() {

  // タブ切り替え
  $(function(){
    $('section').hide().eq(0).show();
    $('.article-create-tag li').eq(0).addClass('border-blue');
    // クリックしたタブが何番目のタブかをcontentに取得
    $('.article-create-tag li').on('click',function(){
      var content = $('.article-create-tag li').index(this);
      // 取得した番号と同じ番号のセクションを取得
      $('section').eq(content).show().siblings().hide();
      $('.article-create-tag li').eq(content).addClass('border-blue').siblings().removeClass('border-blue');
    });
  })

  // 削除ボタン表示
  $('.article-edit-detail-container').children().hover(
    function() {
      $(this).find('.operation-box').addClass('operation-active');
    },
    function() {
      $(this).find('.operation-box').removeClass('operation-active');
    }
  );

  // headの非同期投稿
  $("#form-head").on('submit', function(h){
    h.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'script',
    })
    .done(function(){
      // alert('保存しました');
      $('#head_submit').removeAttr("disabled");
    })
    .fail(function(){
      alert('保存できませんでした');
      $('#head_submit').removeAttr("disabled");
    })
  })

  // headの非同期削除
  $(".operation-box #head-delete").on('click', function(h){
    var headId = $(this).parent().attr('id');
    console.log(headId);
    h.preventDefault();
    var url = $(this).attr('action');
    console.log(url);
    $(this).parent().parent().hide();

    $.ajax({
      url: url,
      type: "DELETE",
      data: { id:headId },
      dataType: 'script',
    })
    .done(function(){
    })
    .fail(function(){
    })
  })


  // textの非同期投稿
  $("#form-text").on('submit', function(t){
    t.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'script',
    })
    .done(function(){
      // alert('保存しました');
      $('#head_submit').removeAttr("disabled");
    })
    .fail(function(){
      alert('保存できませんでした');
      $('#text_submit').removeAttr("disabled");
    })
  })

  // textの非同期削除
  $(".operation-box #text-delete").on('click', function(t){
    t.preventDefault();
    var textId = $(this).parent().attr('id');
    console.log(textId);
    var url = $(this).attr('action');
    console.log(url);
    $(this).parent().parent().hide();

    $.ajax({
      url: url,
      type: "DELETE",
      data: { id:textId },
      dataType: 'script',
    })
    .done(function(){
    })
    .fail(function(){
    })
  })


  // relationの非同期投稿
  $("#form-relation").on('submit', function(r){
    r.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'script',
    })
    .done(function(){
      // alert('保存しました');
      $('#relation_submit').removeAttr("disabled");
    })
    .fail(function(){
      alert('保存できませんでした');
      $('#relation_submit').removeAttr("disabled");
    })
  })


  // relationの非同期削除
  $(".operation-box #relation-delete").on('click', function(r){
    var relationId = $(this).parent().attr('id');
    console.log(relationId);
    r.preventDefault();
    var url = $(this).attr('action');
    console.log(url);
    $(this).parent().parent().hide();

    $.ajax({
      url: url,
      type: "DELETE",
      data: { id:relationId },
      dataType: 'script',
    })
    .done(function(){
    })
    .fail(function(){
    })
  })

});