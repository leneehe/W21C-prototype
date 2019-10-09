$(function() {

// Goal setting form
  var form = $('#smartgoal');
  var btnFinish = $('<button class="btn-finish btn btn-primary hidden mr-2" type="submit">Finish</button>');

  // Set up validator
  form.validate({
    errorPlacement: function errorPlacement(error, element) {
      $(element).parents('.form-group').append(
        error.addClass('invalid-feedback small d-block')
      )
    },
    highlight: function(element) {
      $(element).addClass('is-invalid');
    },
    unhighlight: function(element) {
      $(element).removeClass('is-invalid');
    }
  });

  form.smartWizard({
    autoAdjustHeight: false,
    backButtonSupport: false,
    useURLhash: false,
    showStepURLhash: true,
    toolbarSettings: {
      toolbarExtraButtons: [btnFinish]
    }
  })
  .on('leaveStep', function(e, anchorObject, stepNumber, stepDirection) {
      // stepDirection === 'forward' :- this condition allows to do the form validation
      // only on forward navigation, that makes easy navigation on backwards still do the validation when going next
      if (stepDirection === 'forward'){ return form.valid(); }
      return true;
  })
  .on('showStep', function(e, anchorObject, stepNumber, stepDirection) {
      var btn = form.find('.btn-finish');
      var nextBtn = form.find('.sw-btn-next');

      // Enable finish button only on last step
      if (stepNumber === 5) {
        btn.removeClass('hidden');
        nextBtn.addClass('hidden');
      } else {
        btn.addClass('hidden');
        nextBtn.removeClass('hidden');
      }
  })

  // Click on finish button
  form.on('submit', function(e){
    e.preventDefault();
    if (!form.valid()){ return; }

    $.ajax({
      url: $(this).attr('action'),
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      method: 'POST',
      data: $(this).serialize(),
    }).done(function(){
      window.location = '/dashboard/goals/goal_summary';
      console.log('Goal created!')
    }).fail(function() {
      console.log('failed to create goal.')
    })
  });

  var btnCreate = $('<button class="btn-create btn btn-primary hidden mr-2" type="submit"><a href="/dashboard/plan/display_report.html" target="_blank">Create Report</a></button>');

// Report to Care Provider form
  $('#report').smartWizard({
      autoAdjustHeight: false,
      backButtonSupport: false,
      useURLhash: false,
      showStepURLhash: true,
      toolbarSettings: {
        toolbarExtraButtons: [btnCreate]
      }
    })
    .on('showStep', function(e, anchorObject, stepNumber, stepDirection) {
        var btn = $('#report').find('.btn-create');

        // Enable finish button only on last step
        if (stepNumber === 7) {
          btn.removeClass('hidden');
        } else {
          btn.addClass('hidden');
        }
    });

  // Change markup
  //

  $('#report .sw-toolbar').appendTo($('#report .sw-container'));

  function checkEnter(e){
   e = e || event;
   var txtArea = /input/i.test((e.target || e.srcElement).tagName);
   return txtArea || (e.keyCode || e.which || e.charCode || 0) !== 13;
  }

  form.onkeypress = checkEnter;

});
