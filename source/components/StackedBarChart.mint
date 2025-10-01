/* Stacked Bar Chart Component */
component StackedBarChart {
  property data1 : Array(Number) = [30, 40, 50, 60]
  property data2 : Array(Number) = [20, 30, 25, 30]
  property labels : Array(String) = ["Q1", "Q2", "Q3", "Q4"]
  property color1 : String = "#667eea"
  property color2 : String = "#764ba2"
  property height : String = "250px"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
    overflow: hidden;
  }

  style chart {
    display: flex;
    align-items: flex-end;
    justify-content: space-around;
    height: 100%;
    gap: clamp(0.25rem, 1vw, 1rem);
    overflow-x: auto;
  }

  style barGroup {
    flex: 1;
    min-width: clamp(40px, 10vw, 80px);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: flex-end;
    gap: 0.5rem;
    height: 100%;
  }

  style stackedBar {
    width: 100%;
    display: flex;
    flex-direction: column-reverse;
    border-radius: 8px;
    overflow: hidden;
    min-height: 10px;
  }

  style segment {
    width: 100%;
    min-height: 2px;
    transition: all 0.4s ease;
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 500;
    text-align: center;
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

  fun getMaxTotal : Number {
    let totals =
      Array.mapWithIndex(data1,
        (v1 : Number, index : Number) {
          let v2 =
            if index < Array.size(data2) {
              Array.at(data2, index)
              |> Maybe.withDefault(0)
            } else {
              0
            }

          v1 + v2
        })

    if Array.size(totals) == 0 {
      100
    } else {
      Array.reduce(totals, 0,
        (acc : Number, value : Number) : Number {
          if value > acc {
            value
          } else {
            acc
          }
        })
    }
  }

  fun getSegmentHeightPercent (value : Number, totalForBar : Number) : String {
    if totalForBar > 0 {
      "#{Number.toString((value / totalForBar) * 100)}%"
    } else {
      "0%"
    }
  }

  fun getStackedBarHeight (index : Number) : String {
    let v1 =
      if index < Array.size(data1) {
        Array.at(data1, index)
        |> Maybe.withDefault(0)
      } else {
        0
      }

    let v2 =
      if index < Array.size(data2) {
        Array.at(data2, index)
        |> Maybe.withDefault(0)
      } else {
        0
      }

    let total =
      v1 + v2

    let maxTotal =
      getMaxTotal()

    if maxTotal > 0 {
      "#{Number.toString((total / maxTotal) * 100)}%"
    } else {
      "0%"
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::chart style={getChartStyles()}>
        {
          Array.mapWithIndex(data1,
            (value1 : Number, index : Number) {
              let value2 =
                if index < Array.size(data2) {
                  Array.at(data2, index)
                  |> Maybe.withDefault(0)
                } else {
                  0
                }

              let totalForBar =
                value1 + value2

              <div::barGroup>
                <div::stackedBar style="height: #{getStackedBarHeight(index)}">
                  <div::segment
                    style="background: #{color1}; height: #{getSegmentHeightPercent(
                      value1, totalForBar)}"
                  />

                  <div::segment
                    style="background: #{color2}; height: #{getSegmentHeightPercent(
                      value2, totalForBar)}"
                  />
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
