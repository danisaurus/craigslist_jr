$(document).foundation();

$(document).ready(function(){

    $(".add-image").on("click", function(event){
      event.preventDefault();
      $(this).before("<input type=\"file\" value=\"Upload\">")
    });


});
