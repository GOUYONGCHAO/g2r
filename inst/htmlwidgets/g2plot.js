HTMLWidgets.widget({

    name: 'g2plot',
  
    type: 'output',
  
    factory: function (el, width, height) {
  
      const chart = new G2.Chart({
        container: document.getElementById(el.id), // 指定图表容器 ID
        width: width, // 指定图表宽度
        height: height // 指定图表高度
      });

      // 数据格式： [{"gender":"female","height":161.2,"weight":51.6}]
      

      return {
        renderValue: function (x) {
          const newdata=HTMLWidgets.dataframeToD3(x.data)
          chart.data(newdata);
          chart.scale({
            height: { nice: true },
            weight: { nice: true },
          });
          chart
            .point()
            .position('Sepal.Width*Sepal.Length')
            .size('Petal.Width')
             .color('Species')
            .shape('circle')
             .tooltip('Sepal.Width*Sepal.Length*Petal.Width*Species', (sw,sl,pw,s) => {
              return {
                name: s,
                value: sw + '(cm),' + sl + '(cm),'+pw+'(cm)'
              };
            })
            .style({
              fillOpacity: 0.85
            });
         chart.interaction('legend-highlight');
          chart.render();
          // chart.data(x.data);
          // chart.interval().position('genre*sold').label('sold');
          // const newdata=HTMLWidgets.dataframeToD3(x.data)
          // chart.annotation().text({
          //   top: true,
          //   position: ['Sports', 275],
          //   content: newdata,
          //   style: {
          //     fill: '#c0c0c0',
          //     fontSize: 12,
          //     fontWeight: '300',
          //     textAlign: 'center',
          //   },
          //   offsetX: -70,
          //   rotate: Math.PI * -0.5
          // });
          // // chart.annotation().text({
          // //   top: true,
          // //   position: [100, 110],
          // //   content: x.message,
          // //   style: {
          // //     fontSize: 16,
          // //     fontWeight: 'normal',
          // //     fill: 'rgba(0,0,0,0.45)'
          // //   }
          // // });
          // chart.render();
          el=chart;
        },
  
        resize: function (width, height) {
          const el=el;
        
          // TODO: code to re-render the widget with a new size
  
        }
      };
    },
  }
  );