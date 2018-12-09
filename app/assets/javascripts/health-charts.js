document.addEventListener("DOMContentLoaded", function(e){
  let allCharts = document.querySelectorAll('.chart');
  // Build charts based on how many have data
  for (let i = 0; i < allCharts.length; i++) {
    let chart = document.getElementById(`chart${i}`);
    let chartData = JSON.parse(chart.dataset.nodes);
    let divisors = 1;
    let xAxisTitle = chartData[0].unit_of_measure;
    // Convert the Ruby date into Javascript Date object
    if ("name" in chartData[0]) {
       for (let j = 0; j < chartData.length; j++) {
        chartData[j].data = chartData[j].data.map(item => ({
          ...item,
          x: new Date(item.x)
        }));
      }
      divisors = 7;
    } else {
      chartData = 0;
    }

    /**
     * ChartData expected output
     * [
     *  {
     *    name: 'name',
     *    meta: 'name',
     *    data:
     *      [
     *        {
     *          x: time
     *          y: measurement
     *        }
     *      ]
     *  },
     * ]
     */

    // Dynamically build chart 
    let ticks = []
    for (let i = 0; i < 7; i++) {
      ticks.push(new Date(new Date().setDate(new Date().getDate() - i)));
    }
    ticks.reverse();
    new Chartist.Line(`#chart${i}`,
      {
        labels: [],
        series: chartData,
      },
      {
        showLine: true,
        fullWidth: true,
        chartPadding: {
          left: 20
        },
        axisX: {
          // position: 'start',
          type: Chartist.StepAxis,
          // divisor: divisors,
          ticks: ticks,
          labelInterpolationFnc: function (label, index, chart) {
            // console.log(chart)
            return moment(label).format('MMM D');
          },
        },
        axisY: {
          onlyInteger: true
        },
        plugins: [
          Chartist.plugins.legend(),
          Chartist.plugins.tooltip({
            transformTooltipTextFnc: function (tooltip) {
              var xy = tooltip.split(",");
              return xy[1];
            }
          }),
          Chartist.plugins.ctAxisTitle({
            axisX: {
              axisTitle: "Time",
              textAnchor: "middle",
              offset: {
                x: 0,
                y: 40
              }
            },
            axisY: {
              axisTitle: xAxisTitle,
              textAnchor: 'middle',
              offset: {
                x: 0,
                y: 10
              },
              flipTitle: true              
            }
          })
        ]
      },
    );
  }
});