$(document).on('turbolinks:load', function() {

  // $('#title-form').keyup(function(){
  //   let titleData = $("#title-form").val();
  //   let explanationData = $("#explanation-form").val();

  //   $.ajax({
  //     url: "/articles/update",
  //     type: "PATCH",
  //     data: {titleData,explanationData},
  //     dataType: 'json',
  //     processData: false,
  //     contentType: false
  //   })
  //   .done(function(){
  //     alert('保存しました')
  //   })
  //   .fail(function(){
  //     alert('保存できませんでした');
  //   })
  // })

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


});