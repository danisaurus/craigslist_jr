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
       current_upvote.find('.cheers').text(data.upvotes + " Cheers");
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
       current_downvote.find('.partyFails').text(data.downvotes + " Party Fails");
      }
    });
  });


// post a comment //

  $(".post-comment").on("click", function(event){
    event.preventDefault();
    var newCommentForm = new CommentFormView();
    var commentForm = newCommentForm.createCommentForm();
  
    $("#comments").prepend(commentForm)
  });


  $("form").on('submit', '#commentForm', function(event){
    event.preventDefault();
    var articleId = $('form').closest('article').attr('id')
    $.ajax({
      url: '/posts/'+articleId+'/comments',
      type: 'post',
      success: function(response){
        $('#comments').prepend(response)
        $('#commentForm').delete();
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
