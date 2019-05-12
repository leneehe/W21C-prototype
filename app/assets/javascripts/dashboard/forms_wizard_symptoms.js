$(function() {
    var form = $('#symptomsTracking');
    var btnSubmit = $('<button class="btn-submit btn btn-primary hidden mr-2" type="submit">Create Symptom</button>');

    form.smartWizard({
      selected: 0,  // Initial selected step, 0 = first step
      autoAdjustHeight: false,
      backButtonSupport: false,
      useURLhash: true,
      showStepURLhash: true,
      toolbarSettings: {
        toolbarExtraButtons: [btnSubmit]
      },
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

  });
