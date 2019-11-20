$(document).on('turbolinks:load', function() {

  // タイトル自動保存
  $('#title-form').keyup(function(){
    var url = $(".article-edit-box-form").attr('action');
    var titleData = $("#title-form").val();
    var explanationData = $("#explanation-form").val();
    console.log(titleData);
    console.log(explanationData);

    $.ajax({
      url: url,
      type: "PATCH",
      data: { title:titleData, explanation:explanationData },
      dataType: 'script',
    })
    .done(function(){
      // alert('保存しました')
    })
    .fail(function(){
      // alert('保存できませんでした');
    })
  })

  // 説明文自動保存
  $('#explanation-form').keyup(function(){
    var url = $(".article-edit-box-form").attr('action');
    var titleData = $("#title-form").val();
    var explanationData = $("#explanation-form").val();
    console.log(titleData);
    console.log(explanationData);

    $.ajax({
      url: url,
      type: "PATCH",
      data: { title:titleData, explanation:explanationData },
      dataType: 'script',
    })
    .done(function(){
      // alert('保存しました')
    })
    .fail(function(){
      // alert('保存できませんでした');
    })
  })

});