$(function() {
    var form = $('#symptomsTracking');
    var form2 = $('#symptomATracking');
    var form3 = $('#summary');
    var btnSubmit = $('<button class="btn-submit btn btn-primary hidden mr-2" type="submit">Track Symptom</button>');
    var btnSubmit2 = $('<button class="btn-submit btn btn-primary mr-2" type="submit">Track Symptom</button>');
    var btn3 = $('<button class="btn-submit btn btn-outline-primary mr-2" type="submit">Back to Symptom Tracking</button>');

    form.smartWizard({
      selected: 0,  // Initial selected step, 0 = first step
      autoAdjustHeight: false,
      backButtonSupport: false,
      useURLhash: true,
      showStepURLhash: true,
      // toolbarSettings: {
      //   toolbarExtraButtons: [btnSubmit]
      // },
      anchorSettings: {
        anchorClickable: false
      },
      disabledSteps: [3]
    })
    .on('showStep', function(e, anchorObject, stepNumber, stepDirection) {
        var btn = form.find('.btn-submit');
        var btnNext = form.find('.sw-btn-next');

        // Enable finish button only on last step
        if (stepNumber === 2) {
          btn.show()
          btnNext.addClass('disabled');
          btnNext.addClass('hidden');
          btnNext.attr("disabled", true);

        } else {
          btn.hide()
          btnNext.removeClass('disabled');
          btnNext.removeClass('hidden');
          btnNext.attr("disabled", false)
        }
    });

    // Click on Track Symptom buttton
/*
    form.on('submit', function(e) {
      e.preventDefault();

      $.ajax({
        url: $(this).attr('action'),
        // beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        method: 'POST',
        data: $(this).serialize()
      }).done(function() {
          window.location = '/symptoms/summary';
        console.log('New symptom created!')
      }).fail(function(jqXHR, textStatus, errorThrown) {
        console.log('Failed to create symptom.', errorThrown)
      })
    })
*/

    btn3.on('click', function() {
      window.location = '/symptoms';
    })

    form2.smartWizard({
      selected: 2,  // Initial selected step, 0 = first step
      autoAdjustHeight: false,
      backButtonSupport: false,
      useURLhash: true,
      showStepURLhash: true,
      toolbarSettings: {
        showNextButton: false // show/hide a Next button
        // showPreviousButton: false, // show/hide a Previous button
        // toolbarExtraButtons: [btnSubmit2]
      },
      anchorSettings: {
        anchorClickable: false
      },
      disabledSteps: [3]
    })
    .on('showStep', function(e, anchorObject, stepNumber, stepDirection) {
      var btn = form2.find('.btn-submit');
      var btnNext = form2.find('.sw-btn-next');

      // Enable finish button only on last step
      if (stepNumber === 2) {
        btn.show();
        btnNext.addClass('disabled');
        btnNext.attr("disabled", true);

      } else {
        btn.hide();
        btnNext.removeClass('disabled');
        btnNext.removeClass('hidden');
        btnNext.attr("disabled", false)
      }
    })

    // Click on Track Symptom buttton
    /*
    form2.on('submit', function(e) {
      e.preventDefault();

      $.ajax({
        url: $(this).attr('action'),
        // beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
        method: 'POST',
        data: $(this).serialize()
      }).done(function() {
          window.location = '/symptoms/summary';
        console.log('New symptom created!')
      }).fail(function(jqXHR, textStatus, errorThrown) {
        console.log('Failed to create symptom.', errorThrown)
      })
    })
    */

    form3.smartWizard({
      selected: 3,  // Initial selected step, 0 = first step
      autoAdjustHeight: false,
      backButtonSupport: false,
      useURLhash: true,
      showStepURLhash: true,
      toolbarSettings: {
        showNextButton: false, // show/hide a Next button
        showPreviousButton: false, // show/hide a Previous button
        toolbarExtraButtons: [btn3]
      },
      anchorSettings: {
        anchorClickable: false
      },
      disabledSteps: [0,1,2]
    })

  });
