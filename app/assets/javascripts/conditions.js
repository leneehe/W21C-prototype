document.addEventListener('DOMContentLoaded', function() {
  $('input[type=checkbox]').change(function() {
    let form = $(this).closest("form");
    $.ajax({
      url: form.attr('action'),
      method: 'put',
      data: form.serialize(),
      dataType: 'html'
    }).done(function(responseData) {
      console.log($(this).is(':checked'))
      alert('Saved changes.')
    }).fail(function(jqXHR, textStatus, errorThrown) {
      alert('Cannot save', textStatus)
    })

  })

editConditions = () => {
    $('#displayConditions').hide();
    $('#editConditions').show();
  }

closeEdit = () => {
    $('#displayConditions').show();
    $('#editConditions').hide();
  }
})
