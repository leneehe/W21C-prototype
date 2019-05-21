$(function() {
    var form = $('#symptomsTracking');
    var form2 = $('#symptomATracking');
    var form3 = $('#summary');
    var btnSubmit = $('<button class="btn-submit btn btn-primary hidden mr-2" type="submit">Create Symptom</button>');
    var btnSubmit2 = $('<button class="btn-submit btn btn-primary mr-2" type="submit">Create Symptom</button>');

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
      }
    })
    .on('showStep', function(e, anchorObject, stepNumber, stepDirection) {
        var btn = form.find('.btn-submit');
        var btnNext = form.find('.sw-btn-next');

        // Enable finish button only on last step
        if (stepNumber === 2) {
          btn.removeClass('hidden');
          btnNext.addClass('disabled');
          btnNext.attr("disabled", true);

        } else {
          btn.addClass('hidden');
          btnNext.removeClass('disabled');
          btnNext.attr("disabled", false)
        }
    });

    // Click on Create Symptom buttton
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

    form2.smartWizard({
      selected: 2,  // Initial selected step, 0 = first step
      autoAdjustHeight: false,
      backButtonSupport: false,
      useURLhash: true,
      showStepURLhash: true,
      toolbarSettings: {
        // showNextButton: false, // show/hide a Next button
        // showPreviousButton: false, // show/hide a Previous button
        // toolbarExtraButtons: [btnSubmit2]
      },
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
          btn.removeClass('hidden');
          btnNext.addClass('disabled');
          btnNext.attr("disabled", true);

        } else {
          btn.addClass('hidden');
          btnNext.removeClass('disabled');
          btnNext.attr("disabled", false)
        }
    });

    form3.smartWizard({
      selected: 3,  // Initial selected step, 0 = first step
      autoAdjustHeight: false,
      backButtonSupport: false,
      useURLhash: true,
      showStepURLhash: true,
      toolbarSettings: {
        showNextButton: false, // show/hide a Next button
        showPreviousButton: false, // show/hide a Previous button
        // toolbarExtraButtons: [btnSubmit2]
      },
      anchorSettings: {
        anchorClickable: false
      },
      disabledSteps: [0,1,2]
    })

  });
