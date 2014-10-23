$(document).ready(function(){

  $(".upvotes").on("click", function(event){
    event.preventDefault();
    var current_upvote = $(this);
    var articleId = $(this).closest("article").attr("id");
    console.log(articleId)
    $.ajax({
      url: "/posts/" + articleId + "/upvotes",
      type: "post",
      dataType: 'json',
      success: function(data, status, xhr){
       current_upvote.text(data.upvotes + " upvotes");
      }
    });
  });

  $(".downvotes").on("click", function(event){
    event.preventDefault();
    var current_downvote = $(this);
    var articleId = $(this).closest("article").attr("id");
    console.log(articleId)
    $.ajax({
      url: "/posts/" + articleId + "/downvotes",
      type: "post",
      dataType: 'json',
      success: function(data, status, xhr){
       current_downvote.text(data.downvotes + " downvotes");
      }
    });
  });

  $(".post-comment").on("click", function(event){
    event.preventDefault();
    new CommentView().render();
    $(".commentSection").prepend(comment.$commentForm)

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
