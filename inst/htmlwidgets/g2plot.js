HTMLWidgets.widget({

  name: 'g2plot',

  type: 'output',

  factory: function (el, width, height) {

    // reference to g2plot
    const g2plot = new G2.Chart({
      container: document.getElementById(el.id), // 指定图表容器 ID
      width: width, // 指定图表宽度
      height: height // 指定图表高度
    });

    return {
      renderValue: function (x) {

        // add qt style if we are running under Qt
        if (window.navigator.userAgent.indexOf(" Qt/") > 0)
          el.className += " qt";
        const attrs = x.attrs;
        // get g2plot data and attrbutions
        const data = HTMLWidgets.dataframeToD3(x.data);
        // if there is no existing g2plot perform initialization
        if (0) {
          g2plot.data(data);
          for (const chart in x.geoms) {
            if (x.geoms[chart].type == "point")
              g2plot
                .point()
                .position(x.geoms[chart].position)
                .color(x.geoms[chart].color)
                .size(x.geoms[chart].size)
                .shape(x.geoms[chart].shape);
            if (x.geoms[chart].type == "line")
              g2plot
                .line()
                .position(x.geoms[chart].position)
                .color(x.geoms[chart].color)
                .size(x.geoms[chart].size)
                .shape(x.geoms[chart].shape);
            else if (x.geoms[chart].type == "area")
              g2plot
                .area()
                .position(x.geoms[chart].position)
                .color(x.geoms[chart].color)
                .shape(x.geoms[chart].shape);
            else if (x.geoms[chart].type == "interval")
              g2plot
                .interval()
                .position(x.geoms[chart].position)
                // .size(x.geoms[chart].size)
                .color(x.geoms[chart].color);
            // .shape(x.geoms[chart].shape);
          }
        };
        if (x.facet != null) { if (1) {
          g2plot.data(data);
            g2plot.facet('rect', {
              fields: x.facet.fields,
              showTitle: x.facet.showTitle, // 显示标题
              autoSetAxis: true,// 自动设置坐标轴的文本，避免重复和遮挡
              padding: 10, // 每个view 之间的间距
              eachView(view) {
                view
                  .interval()
                  .position(x.geoms.chart1.position)
                  .color(x.geoms.chart1.color);
              },
              // 列标题格式
              colTitle: {
                offsetY: -60,
                  style: {
                  fontSize: 14,
                    textAlign: 'center',
                      fill: '#444'
                }
              },
              // 行标题格式
              rowTitle: {
                offsetX:60,
                  style: {
                  fontSize: 14,
                    textAlign: 'center',
                      rotate: 90,
                        fill: '#444'
                }
              }
            })
          };

// 
g2plot.render();
g2plot;
el = g2plot;
            };
          
        },
      resize: function (width, height) {
  // if (g2plot)
  //   g2plot.resize();
        }
    };
  }
}
)