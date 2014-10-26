function CommentFormView(){

  this.createCommentForm = function() {
    var articleId = $('article').attr('id');
    var form = HTMLGenerator.makeForm('/post/'+articleId+'/comments', 'post', 'commentForm');
    var commentText = HTMLGenerator.makeTextArea('comment[text]', 'commentForm')
    var commentSubmit = HTMLGenerator.makeInput('submit', 'submit', "", "", "Submit")
    var $thing = $(form).append(commentText);
    return $thing.append(commentSubmit);

  }

  this.reset(){
    this.createCommentForm.remove();
  }


}


function CommentView(){

  function createComment(){

  }

  this.render = function() {


  }


}

var HTMLGenerator = {
  makeInput: function(type, name, placeholder, class_name, value) {
    return '<input type="'+type+'" name="'+name+'" placeholder="'+placeholder+'" class="'+class_name+'" value="'+value+'">'
  },
  makeForm: function(action, method, id_name){
    return '<form action="'+action+'" method="'+method+'" id="'+id_name+'"></form>';
  },
  makeTextArea: function(name, form){
    return '<textarea name="'+name+'" form="'+form+'" ></textarea>';
  },
  makeDiv: function(class_name, id_name){
    return '<div class="'+class_name+'" id="'+id_name+'"></div>';
  }
}