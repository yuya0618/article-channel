$(document).on('turbolinks:load', function() {

  // 削除ボタン表示
  $('.article-edit-detail-container').children().hover(
    function() {
      // console.log("yes")
      $(this).find('.operation-box').addClass('operation-active');
    },
    function() {
      $(this).find('.operation-box').removeClass('operation-active');
    }
  );

});