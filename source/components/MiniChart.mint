/* Mini Chart Component - Compact visualization */
component MiniChart {
  property data : Array(Number) = []
  property type : String = "line"
  property color : String = "#667eea"
  property width : String = "100px"
  property height : String = "40px"

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    border-radius: 6px;
    overflow: hidden;
    max-width: 100%;
  }

  fun getContainerStyles : String {
    "width: #{width}; height: #{height}; max-width: 100%;"
  }

  fun getDataPoints : String {
    let dataLength =
      Array.size(data)

    if dataLength == 0 {
      "0,20 100,20"
    } else {
      let points =
        Array.mapWithIndex(data,
          (value : Number, index : Number) {
            let x =
              (index / Math.max(1, dataLength - 1)) * 100

            let y =
              40 - ((value / 100) * 30)

            "#{Number.toString(x)},#{Number.toString(y)}"
          })

      String.join(points, " ")
    }
  }

  fun renderLine : Html {
    <svg
      width="100%"
      height="100%"
      viewBox="0 0 100 40"
      preserveAspectRatio="none"
    >
      <defs>
        <linearGradient id="miniGradient" x1="0%" y1="0%" x2="0%" y2="100%">
          <stop offset="0%" style="stop-color:#{color};stop-opacity:0.3"/>
          <stop offset="100%" style="stop-color:#{color};stop-opacity:0"/>
        </linearGradient>
      </defs>

      <polygon points="0,40 #{getDataPoints()} 100,40" fill="url(#miniGradient)"/>

      <polyline
        points={getDataPoints()}
        fill="none"
        stroke={color}
        stroke-width="2"
        stroke-linecap="round"
      />
    </svg>
  }

  fun renderBars : Html {
    <div
      style="display: flex; align-items: flex-end; justify-content: space-between; height: 100%; gap: 2px; padding: 4px;"
    >
      {
        for value of data {
          <div
            style="
              flex: 1;
              background: #{color};
              border-radius: 2px 2px 0 0;
              height: #{Number.toString((value / 100) * 100)}%;
              opacity: 0.8;
            "
          />
        }
      }
    </div>
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        if type == "bar" {
          renderBars()
        } else {
          renderLine()
        }
      }
    </div>
  }
}
