import consumer from "./consumer";
import Chart from "chart.js/auto";

document.querySelectorAll('.indicator-value').forEach(function(element) {
  consumer.subscriptions.create({
    channel: "IndicatorChannel",
    indicator_id: element.id.split('_')[2]
  }, {
    connected: function() {},
    disconnected: function() {
      console.log("Disconnected from IndicatorChannel");
    },
    received: function(data) {
      const indicatorValue = data.value;
      const indicatorId = data.indicator_id;
      const indicatorValueText = document.querySelector(`#indicator_id_${indicatorId}`);
      indicatorValueText.innerHTML = indicatorValue;
      const btn_id = `#indicator_btn_${indicatorId}`
      const btn = document.querySelector(btn_id)
      const valuesStr = btn.dataset.values;
      let values = JSON.parse(valuesStr);
      values.shift();
      values.push(indicatorValue);
      btn.dataset.values = JSON.stringify(values);
      const canvas = btn.parentElement.querySelector('canvas');
      if (canvas) {
        const chart = Chart.getChart(canvas);
        if (chart) {
          chart.destroy();
        }
        const ctx = canvas.getContext('2d');
        const chartData = {
          labels: Array.from(Array(values.length).keys()),
          datasets: [{
            label: 'Температура',
            data: values,
            borderColor: "rgb(18,175,45)"
          }]
        };
        const chartOptions = {
          responsive: true,
          maintainAspectRatio: false,
          aspectRatio: 0.3,
          scales: {
            y: {
              beginAtZero: true
            }
          }
        };
        const newChart = new Chart(ctx, {
          type: 'line',
          data: chartData,
          options: chartOptions
        });
      }
    }

  });
});
