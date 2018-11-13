document.addEventListener("DOMContentLoaded", function(e){
  let allCharts = document.querySelectorAll('.chart');
  // Build charts based on how many have data
  for (let i = 0; i < allCharts.length; i++) {
    let chart = document.getElementById(`chart${i}`);
    let chartData = JSON.parse(chart.dataset.nodes);
    // Convert the Ruby date into Javascript Date object
    chartData = chartData.map(item => ({
      x: new Date(item.x),
      y: item.y,
    }));
    // Dynamically build chart 
    new Chartist.Line(`#chart${i}`,
      {
        labels: [],
        series: [
          chartData
        ],
      },
      {
        showLine: false,
        fullWidth: true,
        chartPadding: {
          right: 40
        },
        axisX: {
          type: Chartist.FixedScaleAxis,
          labelInterpolationFnc: function () {
            return moment().format('MMM D');
          },
        },
      },
    );
  }
});