$(function() {
  $('.datatables-medications').dataTable();
  $('.datatables-journals').dataTable({
    "order": [[ 2, 'desc' ]]
  });
  $('.datatables-symptoms').dataTable({
    paging: false
  });
});
