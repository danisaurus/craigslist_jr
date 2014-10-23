function CommentView(){

  function createCommentForm {

  }

  this.render = function() {
    createCommentForm();
    //append
  }



}

var HTMLGenerator = {
  makeInput: function(type, name, placeholder, class_name, value) {
    return '<input type="'+type+'" name="'+name+'" placeholder="'+placeholder+'" class="'+class_name+'" value="'+value+'">'
  },
  makeForm: function(action, method, class_name){

  }
}
