/* Bar Chart Component - Enhanced */
component BarChart {
  property data : Array(Number) = []
  property labels : Array(String) = []
  property height : String = "250px"
  property color : String = "#667eea"
  property showValues : Bool = false
  property animated : Bool = true

  connect ThemeStore exposing { currentTheme }

  style container {
    width: 100%;
    max-width: 100%;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    backdrop-filter: blur(20px);
    overflow: hidden;
  }

  style chart {
    display: flex;
    align-items: flex-end;
    justify-content: space-around;
    height: 100%;
    gap: clamp(0.25rem, 1vw, 0.75rem);
    position: relative;
    overflow-x: auto;
  }

  style barWrapper {
    flex: 1;
    min-width: clamp(30px, 8vw, 60px);
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
  }

  style bar {
    width: 100%;
    min-height: 10px;
    border-radius: 8px 8px 0 0;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    box-shadow: 0 -4px 12px rgba(102, 126, 234, 0.2);
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 500;
    text-align: center;
    word-break: break-word;
  }

  style value {
    font-size: clamp(0.625rem, 1.5vw, 0.875rem);
    font-weight: 700;
    position: absolute;
    top: -1.5rem;
    left: 50%;
    transform: translateX(-50%);
    white-space: nowrap;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      height: #{height};
    "
  }

  fun getChartStyles : String {
    "height: calc(100% - 2rem);"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
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

  fun getBarHeight (value : Number) : String {
    let max =
      getMaxValue()

    if max > 0 {
      let percentage =
        (value / max) * 100

      "#{Number.toString(percentage)}%"
    } else {
      "0%"
    }
  }

  fun getBarStyles (value : Number, index : Number) : String {
    let animationDelay =
      if animated {
        Number.toString(index * 0.1)
      } else {
        "0"
      }

    "
      background: linear-gradient(180deg, #{color} 0%, #{color}cc 100%);
      height: #{getBarHeight(value)};
      transition-delay: #{animationDelay}s;
    "
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::chart style={getChartStyles()}>
        {
          Array.mapWithIndex(data,
            (value : Number, index : Number) {
              <div::barWrapper>
                <div::bar style={getBarStyles(value, index)}>
                  {
                    if showValues {
                      <span::value style={getValueStyles()}>
                        Number.toString(value)
                      </span>
                    } else {
                      <span/>
                    }
                  }
                </div>

                <span::label style={getLabelStyles()}>
                  {
                    if index < Array.size(labels) {
                      Array.at(labels, index)
                      |> Maybe.withDefault("")
                    } else {
                      ""
                    }
                  }
                </span>
              </div>
            })
        }
      </div>
    </div>
  }
}
