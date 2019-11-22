$(function(){
  // .article-edit-detail-containerの直下の子要素全てが並び替えの対象
  $('.article-edit-detail-container').sortable({
    update: function(e, ui){
      // let item = ui.item;
      // let item_data = item.data();
      // let params = {_method: 'put'};
      // // paramsの各名前のposition_positionにindex,idにupdateするpositionのidを入れる
      // params[item_data.modelName] = { position_position: item.index(),id: item.attr("id") }
      // console.log(params);

      // $.ajax({
      //   type: 'POST',
      //   url: item_data.updateUrl,
      //   dataType: 'json',
      //   data: params
      // });

      // 並び替えしたら、各要素のindexを取得してそれぞれをupdate
      $(".content-box").each(function(i, content){
        let url = $(content).data().updateUrl;
        let params = {_method: 'put'};
        // paramsの各名前のposition_positionにindex,idにupdateするpositionのidを入れる
        params[$(content).data().modelName] = { position_position: (i * 3) ,id: $(content).attr("id") }
        // console.log(params);
        console.log(i);

        $.ajax({
          type: 'POST',
          url: url,
          dataType: 'json',
          data: params
        });

      });
    },
  });

  // ページ遷移時にcontent-boxのid順(position順)に並び替え
  // $(".content-box").hide();
  let $arr = $('.article-edit-detail-container .content-box').sort(function(a, b){
    return ($(a).attr("index") - $(b).attr("index"));  //ソート条件
  });
  // console.log($arr);

  //ソートした結果をコンソールに出力する
  $arr.each(function(){
    console.log(this);
    $(".article-edit-detail-container").append(this);
    // console.log($(this).text());
  });

});