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
        const data = x.data
        // if there is no existing g2plot perform initialization
        if(length(x.geoms)!=0)
        {
          g2plot.data(x.data);
          for(const chart in x.geoms ){
            if(x.geoms[chart].type=='line')        
            g2plot
            .line()
            .postion(x.geoms[chart].postion)
            .size(x.geoms[chart].size)
            .shape(x.geoms[chart].shape)
            .opacity(x.geoms[chart].opacity)    
          }
        }
      g2plot.render()  ; 
      g2plot;
      },
      resize: function (width, height) {
        if (g2plot)
          g2plot.resize();
      }
    };
  },
}
);