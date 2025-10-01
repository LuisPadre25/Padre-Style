/* Line Chart Component */
component LineChart {
  property data : Array(Number) = []
  property labels : Array(String) = []
  property height : String = "250px"
  property color : String = "#667eea"
  property showPoints : Bool = true
  property showArea : Bool = true
  property showValues : Bool = false

  state uniqueId : String = ""

  connect ThemeStore exposing { currentTheme }

  fun componentDidMount : Promise(Void) {
    next { uniqueId: "lineGradient-#{Number.toString(Math.random())}" }
  }

  style container {
    width: 100%;
    max-width: 100%;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    backdrop-filter: blur(20px);
    overflow: hidden;
  }

  style svg {
    width: 100%;
    height: calc(100% - 2.5rem);
    overflow: visible;
    max-width: 100%;
  }

  style gridLine {
    stroke-opacity: 0.1;
    stroke-width: 1;
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

  style pointValue {
    font-size: clamp(0.625rem, 1.2vw, 0.7rem);
    font-weight: 700;
    padding: 0.125rem 0.375rem;
    border-radius: 4px;
    white-space: nowrap;
  }

  fun getPointValueStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      height: #{height};
    "
  }

  fun getGridLineStyles : String {
    "stroke: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
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
      "0,100 100,100"
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
                100 - ((value / maxVal) * 80)
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
      <svg::svg viewBox="0 0 100 100" preserveAspectRatio="none">
        <defs>
          <linearGradient id={uniqueId} x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" style="stop-color:#{color};stop-opacity:0.4"/>
            <stop offset="100%" style="stop-color:#{color};stop-opacity:0"/>
          </linearGradient>
        </defs>

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

        {
          if showArea {
            <polygon
              points="0,100 #{getDataPoints()} 100,100"
              fill="url(##{uniqueId})"
              stroke="none"
            />
          } else {
            <g/>
          }
        }

        <polyline
          points={getDataPoints()}
          fill="none"
          stroke={color}
          stroke-width="3"
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
                      100 - ((value / maxVal) * 80)
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
