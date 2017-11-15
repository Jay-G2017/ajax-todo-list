jQuery.fn.submitOnCheck = function() {
  this.find('input[type=checkbox]').click(function() {
    console.log('clicked');
    var data = $(this).parent('form').serialize(); 
    var url = $(this).parent('form').attr('action');
    $.ajax({
      type: "PATCH",
      url: url,
      data: data,
      dataType: 'script'
    });
  });
  return this;
};

$(function() {
  $('.edit_task').submitOnCheck();
});


