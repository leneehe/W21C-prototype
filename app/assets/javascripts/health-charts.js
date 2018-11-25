document.addEventListener("DOMContentLoaded", function(e){
  let allCharts = document.querySelectorAll('.chart');
  // Build charts based on how many have data
  for (let i = 0; i < allCharts.length; i++) {
    let chart = document.getElementById(`chart${i}`);
    let chartData = JSON.parse(chart.dataset.nodes);
    console.log(chartData)

    // Convert the Ruby date into Javascript Date object
    if (chartData != 0) {
       for (let j = 0; j < chartData.length; j++) {
        chartData[j].data = chartData[j].data.map(item => ({
          ...item,
          x: new Date(item.x)
        }));
      }
    }
    // chartData = chartData.map(item => ({
    //   x: new Date(item.x),
    //   y: item.y,
    // }));
    // Dynamically build chart 
    new Chartist.Line(`#chart${i}`,
      {
        labels: [],
        series: chartData,
      },
      {
        showLine: false,
        fullWidth: true,
        chartPadding: {
          right: 40
        },
        axisX: {
          type: Chartist.FixedScaleAxis,
          divisor: 7,
          labelInterpolationFnc: function (label) {
            return moment(label).format('MMM D');
          },
        },
      },
    );
  }
});