/* Area Chart Component */
component AreaChart {
  property data : Array(Number) = []
  property labels : Array(String) = []
  property height : String = "200px"
  property color : String = "#667eea"
  property gradient : Bool = true
  property showPoints : Bool = true
  property showValues : Bool = false
  property showGrid : Bool = true

  state uniqueId : String = ""

  connect ThemeStore exposing { currentTheme }

  fun componentDidMount : Promise(Void) {
    next { uniqueId: "areaGradient-#{Number.toString(Math.random())}" }
  }

  style container {
    width: 100%;
    max-width: 100%;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    overflow: hidden;
  }

  style labelsContainer {
    display: flex;
    justify-content: flex-start;
    margin-top: 0.5rem;
    gap: 0;
    position: relative;
    width: 100%;
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 500;
    text-align: center;
    position: absolute;
    transform: translateX(-50%);
  }

  style gridLine {
    stroke-opacity: 0.1;
    stroke-width: 1;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      height: #{height};
    "
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getGridLineStyles : String {
    "stroke: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  fun getMaxValue : Number {
    if Array.size(data) == 0 {
      100
    } else {
      Array.reduce(data, 0,
        (acc : Number, value : Number) : Number {
          if value > acc {
            value
          } else {
            acc
          }
        })
    }
  }

  fun getDataPoints : String {
    let dataLength =
      Array.size(data)

    if dataLength == 0 {
      "0,100"
    } else {
      let maxVal =
        getMaxValue()

      let points =
        Array.mapWithIndex(data,
          (value : Number, index : Number) {
            let x =
              (index / Math.max(1, dataLength - 1)) * 100

            let y =
              if maxVal > 0 {
                100 - ((value / maxVal) * 90)
              } else {
                100
              }

            "#{Number.toString(x)},#{Number.toString(y)}"
          })

      String.join(points, " ")
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <svg
        width="100%"
        height="calc(100% - 2rem)"
        viewBox="0 0 100 100"
        preserveAspectRatio="none"
      >
        <defs>
          <linearGradient id={uniqueId} x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" style="stop-color:#{color};stop-opacity:0.6"/>
            <stop offset="100%" style="stop-color:#{color};stop-opacity:0.05"/>
          </linearGradient>
        </defs>

        {
          if showGrid {
            <>
              <line::gridLine
                x1="0"
                y1="25"
                x2="100"
                y2="25"
                style={getGridLineStyles()}
              />

              <line::gridLine
                x1="0"
                y1="50"
                x2="100"
                y2="50"
                style={getGridLineStyles()}
              />

              <line::gridLine
                x1="0"
                y1="75"
                x2="100"
                y2="75"
                style={getGridLineStyles()}
              />
            </>
          } else {
            <g/>
          }
        }

        <polygon
          points="0,100 #{getDataPoints()} 100,100"
          fill={
            if gradient {
              "url(##{uniqueId})"
            } else {
              color
            }
          }
          stroke="none"
        />

        <polyline
          points={getDataPoints()}
          fill="none"
          stroke={color}
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        />

        <g>
          {
            if showPoints || showValues {
              Array.mapWithIndex(data,
                (value : Number, index : Number) {
                  let dataLength =
                    Array.size(data)

                  let maxVal =
                    getMaxValue()

                  let x =
                    (index / Math.max(1, dataLength - 1)) * 100

                  let y =
                    if maxVal > 0 {
                      100 - ((value / maxVal) * 90)
                    } else {
                      100
                    }

                  <g>
                    {
                      if showPoints {
                        <circle
                          cx={Number.toString(x)}
                          cy={Number.toString(y)}
                          r="3"
                          fill={color}
                          stroke="white"
                          stroke-width="2"
                        />
                      } else {
                        <g/>
                      }
                    }

                    {
                      if showValues {
                        <text
                          x={Number.toString(x)}
                          y={Number.toString(y - 6)}
                          text-anchor="middle"
                          font-size="6"
                          font-weight="600"
                          fill={color}
                        >
                          {
                            Number.toString(value)
                          }
                        </text>
                      } else {
                        <g/>
                      }
                    }
                  </g>
                })
            } else {
              []
            }
          }
        </g>
      </svg>

      {
        if Array.size(labels) > 0 {
          <div::labelsContainer>
            {
              Array.mapWithIndex(labels,
                (label : String, index : Number) {
                  let dataLength =
                    Array.size(labels)

                  let xPercent =
                    if dataLength <= 1 {
                      50
                    } else {
                      (index / (dataLength - 1)) * 100
                    }

                  <span::label
                    style="#{getLabelStyles()}; left: #{Number.toString(
                      xPercent)}%;"
                  >
                    {
                      label
                    }
                  </span>
                })
            }
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
