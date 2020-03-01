HTMLWidgets.widget({

    name: 'g2plot',
  
    type: 'output',
  
    factory: function (el, width, height) {
  
      const chart = new G2.Chart({
        container: document.getElementById("g2plot"), // 指定图表容器 ID
        width: width, // 指定图表宽度
        height: height // 指定图表高度
      });
      const data = [
        { genre: 'Sports', sold: 275 },
        { genre: 'Strategy', sold: 115 },
        { genre: 'Action', sold: 120 },
        { genre: 'Shooter', sold: 350 },
        { genre: 'Other', sold: 150 },
      ];
      return {
        renderValue: function (x) {
          chart.data(data);
          chart.interval().position('genre*sold');
          chart.render();
          el=chart;
        },
  
        resize: function (width, height) {
  
          // TODO: code to re-render the widget with a new size
  
        }
      };
    },
  }
  );