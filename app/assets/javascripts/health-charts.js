document.addEventListener("DOMContentLoaded", function(e){
  Array.prototype.unique = function () {
    var a = this.concat();
    for (var i = 0; i < a.length; ++i) {
      for (var j = i + 1; j < a.length; ++j) {
        if (a[i] === a[j])
          a.splice(j--, 1);
      }
    }

    return a;
  };

  let allCharts = document.querySelectorAll('.chart');
  // Build charts based on how many have data
  for (let i = 0; i < allCharts.length; i++) {
    let chart = document.getElementById(`chart${i}`);
    let chartData = JSON.parse(chart.dataset.nodes);
    let divisors = 1;
    let ticks = [];
    let tickSet = [];
    let xAxisTitle = chartData[0].unit_of_measure;

    // Convert the Ruby date into Javascript Date object
    if ("name" in chartData[0]) {
       for (let j = 0; j < chartData.length; j++) {
        //  console.log(chartData[j].data);
        chartData[j].data = chartData[j].data.map(item => ({
          ...item,
          x: new Date(item.x)
        }));

        tickSet = chartData[j].data.map(item => {
          return item.x;
        });

        ticks = ticks.concat(tickSet).unique();
        divisors = chartData[j].data.length;
      }
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

    // ticks.reverse();
     let chartDisplay = new Chartist.Line(`#chart${i}`,
      {
        labels: [],
        series: chartData,
      },
      {
        // targetLine: {
        //   value: chartData != 0 ? chartData[0].assistance_threshold : null,
        //   class: 'ct-target-line'
        // },
        showLine: true,
        fullWidth: true,
        chartPadding: {
          left: 20
        },
        axisX: {
          // position: 'start',
          type: Chartist.FixedScaleAxis,
          // divisor: 1,
          ticks: ticks,
          labelInterpolationFnc: function (label, index, chart) {
            if (label === 0) {
              return moment().format('MMM D');
            } else {
              return moment(label).local().format('MMM D hh:MM:SS');
            }
          },
        },
        axisY: {
          onlyInteger: true
        },
        plugins: [
          // Chartist.plugins.ctTargetLine({
          //   value: chartData != 0 ? chartData[0].assistance_threshold : null
          // }),
          // Chartist.plugins.legend(),
          Chartist.plugins.tooltip({
            transformTooltipTextFnc: function (tooltip) {
              let xy = tooltip.split(",");
              let formattedX = moment(parseInt(xy[0])).local().format('MMM D hh:MM:SS');
              // console.log(formattedX);
              return `x: ${formattedX}<br> y: ${xy[1]}`;
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
      }
    );
    // targetline drawing
    chartDisplay.on('created', function(context){
      // Searches for targetline option
      // let targetLineY = projectY(context.chartRect, context.bounds, context.options.targetLine.value);
      // context.svg.elem('line', {
      //   x1: context.chartRect.x1,
      //   x2: context.chartRect.x2,
      //   y1: targetLineY,
      //   y2: targetLineY
      // }, context.options.targetLine.class);
    });

    // Chartist call back for draw events
    chartDisplay.on('draw',function(context) {

      if (context.type === 'point') {

        // console.log(chartData[0])
        if (chartData[0].above_assistance) {
          if (context.value['y'] >= chartData[0].assistance_threshold) {
            context.element.attr({
              style: `stroke: #E06287`
            });
          }
        } else {
          if (context.value['y'] <= chartData[0].assistance_threshold) {
            context.element.attr({
              style: `stroke: #E06287;`
            });
          }
        }
      }
    });
  }
});

// function projectY(chartRect, bounds, value) {
//   return chartRect.y1 - (125 / bounds.max * value)
// }
