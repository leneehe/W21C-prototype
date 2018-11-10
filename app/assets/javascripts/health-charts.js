document.addEventListener("DOMContentLoaded", function(e){
  console.log('hello');
  // var info = document.getElementById('chartdiv');
  // var chartData = JSON.parse(info.dataset.chartarray);
  new Chartist.Line('#chartist-graph', {
    labels: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
    series: [
      [8, 14, 5, 13, 12],
      [7, 8, 1, 3, 1],
      [5, 12, 1, 9, 7]
    ],
  }, {
      fullWidth: true,
      chartPadding: {
        right: 40
      }
    });

  new Chartist.Line('#chartist-bi-polar', {
    labels: [1, 2, 3, 4, 5, 6, 7, 8],
    series: [
      [1, -1, -2, 0, 2, -1, -2, -1],
      [-2, -1, 0, -3, -2, 1, -3, 2],
      [2, -1, -1, -3, -2, 0, -1, 1],
      [1, -3, 2, -3, -3, 2, -2, -3]]
  }, {
      high: 3,
      low: -3,
      showArea: true,
      showLine: false,
      showPoint: false,
      fullWidth: true,
      axisX: {
        showLabel: false,
        showGrid: false
      }
    });
});