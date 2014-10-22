$(document).ready(function(){

  $(".upvotes").on("click", function(event){
    event.preventDefault();

    articleId = $(this).closest("article").attr("id");
    console.log(articleId)
    $.ajax({
      url: "/posts/" + articleId + "/votes",
      type: "get",
      success: function(data, status, xhr){
       console.log(data)
      }

    });

  });
});


// $(".vote-button").on("click", function(event){
//     event.preventDefault();
//     // var url = $(this).closest('a').attr('href');
//     var articleId = $(this).closest("article").attr("id");
//     $.ajax({
//       type: 'GET',
//       url: "/posts/" + articleId + "/vote",
//       dataType: "json",
//       data: $(this).serialize(),
//       success: function(data){
//         $("#" + data.post_id).find(".vote-button").css("color","red");
//         $("#" + data.post_id).find(".points").text(data.vote_total);
//       }
//     });
//   });
