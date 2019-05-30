$(function () {
  var today = new Date();
  var y = today.getFullYear();
  var m = today.getMonth();
  var d = today.getDate();

  var eventList = [{
    title: 'All Day Event XXX',
    start: new Date(y, m, d - 12)
  },
  {
    title: 'Long Event',
    start: new Date(y, m, d - 8),
    end: new Date(y, m, d - 5),
    className: 'fc-event-warning'
  },
  {
    id: 999,
    title: 'Repeating Event',
    start: new Date(y, m, d - 6, 16, 0)
  },
  {
    id: 999,
    title: 'Repeating Event',
    start: new Date(y, m, d + 1, 16, 0),
    className: 'fc-event-success',
  },
  {
    title: 'Conference',
    start: new Date(y, m, d - 4),
    end: new Date(y, m, d - 2),
  },
  {
    title: 'Meeting',
    start: new Date(y, m, d - 3, 10, 30),
    end: new Date(y, m, d - 3, 12, 30),
    className: 'fc-event-danger'
  },
  {
    title: 'Lunch',
    start: new Date(y, m, d  - 3, 12, 0),
    className: 'fc-event-info'
  },
  {
    title: 'Meeting',
    start: new Date(y, m, d - 3, 14, 30),
    className: 'fc-event-dark'
  },
  {
    title: 'Happy Hour',
    start: new Date(y, m, d - 3, 17, 30)
  },
  {
    title: 'Dinner',
    start: new Date(y, m, d - 3, 20, 0)
  },
  {
    title: 'Birthday Party',
    start: new Date(y, m, d - 2, 7, 0)
  },
  {
    title: 'Background event',
    start: new Date(y, m, d + 5),
    end: new Date(y, m, d + 7),
    rendering: 'background'
  },
  {
    title: 'Click for Google',
    url: 'http://google.com/',
    start: new Date(y, m, d + 13)
  }];

  // Default view
  // color classes: [ fc-event-success | fc-event-info | fc-event-warning | fc-event-danger | fc-event-dark ]
  $('#fullcalendar-default-view').fullCalendar({
    // Bootstrap styling
    themeSystem: 'bootstrap4',
    bootstrapFontAwesome: {
      close: ' ion ion-md-close',
      prev: ' ion ion-ios-arrow-back scaleX--1-rtl',
      next: ' ion ion-ios-arrow-forward scaleX--1-rtl',
      prevYear: ' ion ion-ios-arrow-dropleft-circle scaleX--1-rtl',
      nextYear: ' ion ion-ios-arrow-dropright-circle scaleX--1-rtl'
    },

    header: {
      left: 'title',
      center: 'month,agendaWeek,agendaDay',
      right: 'prev,next today'
    },

    defaultDate: today,
    navLinks: true, // can click day/week names to navigate views
    selectable: true,
    selectHelper: true,
    weekNumbers: true, // Show week numbers
    nowIndicator: true, // Show "now" indicator
    firstDay: 1, // Set "Monday" as start of a week
    businessHours: {
      dow: [1, 2, 3, 4, 5], // Monday - Friday
      start: '9:00',
      end: '18:00',
    },
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: {
      url: 'events.json',
      type: "GET"
    },
    select: function (start, end) {
      $('#fullcalendar-default-view-modal')
        .on('shown.bs.modal', function() {
          $(this).find('input[type="text"]').trigger('focus');
          document.querySelector('input[type="submit"]').removeAttribute("disabled");
          document.querySelector('input#event_start').value = start

          if (end - start !== 86400000) {
            document.querySelector('input#event_end').value = end
          }
        })
        .on('hidden.bs.modal', function() {
          $(this)
            .off('shown.bs.modal hidden.bs.modal submit')
            .find('input[type="text"], select').val('');
          $('#fullcalendar-default-view').fullCalendar('unselect');
        })
        .on('submit', function(e) {
          e.preventDefault();

          var title = $(this).find('input[type="text"]').val();

          // make the ajax callback to submit form
          $.ajax({
            url: $('#fullcalendar-default-view-modal').attr('action'),
            method: $('#fullcalendar-default-view-modal').attr('method'),
            data: $('#fullcalendar-default-view-modal').serialize(),
            dataType: 'html'
          }).done(function(responseData) {
            alert("New event " + title + " has been saved!")
            window.location = '/dashboard/organize/events';
          }).fail(function(jqXHR, textStatus, errorThrown) {
            alert("Cannot save! " + errorThrown)
          })


          var selectBox = document.getElementById("selectBox");
          var className = selectBox.options[selectBox.selectedIndex].dataset.class || null;
          // var className = $(this).find('select').val() || null;

          if (title) {
            var eventData = {
              title: title,
              start: start,
              end: end,
              className: className
            }
            $('#fullcalendar-default-view').fullCalendar('renderEvent', eventData, true);

          }

          $(this).modal('hide');
        })
        .modal('show');
    },
    eventClick: function(calEvent, jsEvent, view) {
      window.location.href = '/dashboard/organize/events/' + calEvent.id;
    },
    eventDrop: function(calEvent, delta, revertFunc) {

       alert(calEvent.title + " was dropped on " + calEvent.start.format());

       if (!confirm("Are you sure about this change?")) {
         revertFunc();
       } else {
         updateEvent(calEvent)
       }

     },
     eventResize: function(calEvent, delta, revertFunc) {

        alert(calEvent.title + " is now ending at " + calEvent.end.format());

        if (!confirm("Do you want to change to this time?")) {
          revertFunc();
        } else {
          updateEvent(calEvent)
        }

      }
  });

  // List view
  // color classes: [ fc-event-success | fc-event-info | fc-event-warning | fc-event-danger | fc-event-dark ]
  $('#fullcalendar-list-view').fullCalendar({
    // Bootstrap styling
    themeSystem: 'bootstrap4',
    bootstrapFontAwesome: {
      close: ' ion ion-md-close',
      prev: ' ion ion-ios-arrow-back scaleX--1-rtl',
      next: ' ion ion-ios-arrow-forward scaleX--1-rtl',
      prevYear: ' ion ion-ios-arrow-dropleft-circle scaleX--1-rtl',
      nextYear: ' ion ion-ios-arrow-dropright-circle scaleX--1-rtl'
    },

    header: {
      left: 'title',
      center: 'listDay,listWeek,month',
      right: 'prev,next today'
    },

    // customize the button names,
    views: {
      listDay: {
        buttonText: 'list day'
      },
      listWeek: {
        buttonText: 'list week'
      }
    },

    defaultView: 'listWeek',
    defaultDate: today,
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    eventLimit: true, // allow "more" link when too many events
    events: {
      url: 'events.json',
      type: "GET"
    },
    eventClick: function(calEvent, jsEvent, view) {
      window.location.href = '/dashboard/organize/events/' + calEvent.id;
    }

  });


});

// Report to care proivder list view
$('.report-calendar').fullCalendar({
  defaultView: 'listYear',
  themeSystem: 'bootstrap4',
  header: {
      left: 'title',
      center: '',
      right: ''
  },
  events: {
    url: 'report.json',
    type: "GET"
  },
});

function changeFunc() {
 var selectBox = document.getElementById("selectBox");
 var selectedValue = selectBox.options[selectBox.selectedIndex].dataset.class;
 document.querySelector('.btn.dropdown-toggle').setAttribute("class", "btn dropdown-toggle fc-event " + selectedValue);
}

function updateEvent(calEvent) {
  let event_data = {
      name: calEvent.title,
      id: calEvent.id,
      start: calEvent.start.format(),
      end: calEvent.end.format()
    }
  // make the ajax call to edit
  $.ajax({
    url: '/dashboard/organize/events/' + calEvent.id,
    method: 'PUT',
    data: event_data,
    dataType: 'json'
  }).done(function(responseData) {
    alert("Saved changes!")
  }).fail(function(jqXHR, textStatus, errorThrown) {
    alert("Cannot save! " + errorThrown)
  })
}
