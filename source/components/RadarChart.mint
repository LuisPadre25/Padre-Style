/* Radar Chart Component */
component RadarChart {
  property data : Array(Number) = [80, 90, 70, 85, 75]
  property data2 : Array(Number) = []
  property labels : Array(String) = ["A", "B", "C", "D", "E"]
  property size : Number = 300
  property color : String = "#667eea"
  property color2 : String = "#f56565"
  property showGrid : Bool = true
  property showFill : Bool = true
  property showValues : Bool = true
  property showPoints : Bool = true
  property showAxisLines : Bool = true
  property showVertexValues : Bool = false
  property animated : Bool = true
  property dataset1Name : String = "Dataset 1"
  property dataset2Name : String = "Dataset 2"

  state activeItems : Array(Bool) = [true, true, true, true, true, true]
  state dataset1Visible : Bool = true
  state dataset2Visible : Bool = true

  connect ThemeStore exposing { currentTheme }

  fun componentDidMount : Promise(Void) {
    let initialActive =
      Array.map(data, (n : Number) { true })

    next { activeItems: initialActive }
  }

  fun toggleItem (index : Number, event : Html.Event) : Promise(Void) {
    let newActive =
      Array.mapWithIndex(activeItems,
        (isActive : Bool, i : Number) {
          if i == index {
            !isActive
          } else {
            isActive
          }
        })

    next { activeItems: newActive }
  }

  fun toggleDataset1 (event : Html.Event) : Promise(Void) {
    next { dataset1Visible: !dataset1Visible }
  }

  fun toggleDataset2 (event : Html.Event) : Promise(Void) {
    next { dataset2Visible: !dataset2Visible }
  }

  fun hasData2 : Bool {
    Array.size(data2) > 0
  }

  fun getAverage (dataset : Array(Number)) : Number {
    let total =
      Array.reduce(dataset, 0,
        (acc : Number, val : Number) : Number { acc + val })

    if Array.size(dataset) > 0 {
      total / Array.size(dataset)
    } else {
      0
    }
  }

  fun getPointColor (index : Number) : String {
    let colors =
      ["#667eea", "#f56565", "#48bb78", "#ed8936", "#9f7aea", "#38b2ac"]

    let colorIndex =
      Math.floor(index % 6)

    Array.at(colors, colorIndex)
    |> Maybe.withDefault("#667eea")
  }

  style container {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
    overflow: hidden;
  }

  style label {
    font-size: clamp(0.75rem, 1.5vw, 0.875rem);
    font-weight: 600;
    text-align: center;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    padding: 0.25rem 0.5rem;
    border-radius: 6px;
    transition: all 0.2s ease;
  }

  fun getLabelHoverStyles : String {
    "
      &:hover {
        background: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      }
    "
  }

  style colorDot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    flex-shrink: 0;
    transition: opacity 0.2s ease;
  }

  style datasetLegend {
    display: flex;
    gap: 1rem;
    justify-content: center;
    margin-top: 1rem;
    flex-wrap: wrap;
  }

  style legendItem {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    padding: 0.5rem 0.75rem;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s ease;
    font-size: 0.875rem;
    font-weight: 600;
  }

  style statsText {
    font-size: 0.75rem;
    opacity: 0.7;
    margin-left: 0.25rem;
  }

  style valuesTable {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
    font-size: 0.875rem;
  }

  style tableHeader {
    font-weight: 700;
    padding: 0.75rem 0.5rem;
    text-align: left;
    border-bottom-width: 2px;
    border-bottom-style: solid;
  }

  style tableCell {
    padding: 0.5rem;
    border-bottom-width: 1px;
    border-bottom-style: solid;
  }

  style metricCell {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-weight: 600;
  }

  style valueCell {
    text-align: center;
    font-weight: 600;
    font-size: 1rem;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getTableBorderStyles : String {
    "border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  fun getTableHeaderStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getPolygonPoints (dataset : Array(Number)) : String {
    let center =
      size / 2

    let radius =
      (size / 2) - 50

    let dataLength =
      Array.size(dataset)

    if dataLength == 0 {
      "#{Number.toString(center)},#{Number.toString(center)}"
    } else {
      let points =
        Array.mapWithIndex(dataset,
          (value : Number, index : Number) {
            let isActive =
              Array.at(activeItems, index)
              |> Maybe.withDefault(true)

            let angle =
              (index / dataLength) * 2 * 3.14159 - (3.14159 / 2)

            let r =
              if isActive {
                (value / 100) * radius
              } else {
                0
              }

            let x =
              center + (r * Math.cos(angle))

            let y =
              center + (r * Math.sin(angle))

            "#{Number.toString(x)},#{Number.toString(y)}"
          })

      String.join(points, " ")
    }
  }

  fun getGridPolygonPoints (level : Number) : String {
    let center =
      size / 2

    let radius =
      ((size / 2) - 50) * (level / 100)

    let sides =
      Array.size(data)

    if sides == 0 {
      "#{Number.toString(center)},#{Number.toString(center)}"
    } else {
      let points =
        Array.mapWithIndex(data,
          (n : Number, index : Number) {
            let angle =
              (index / sides) * 2 * 3.14159 - (3.14159 / 2)

            let x =
              center + (radius * Math.cos(angle))

            let y =
              center + (radius * Math.sin(angle))

            "#{Number.toString(x)},#{Number.toString(y)}"
          })

      String.join(points, " ")
    }
  }

  fun getGridLineStyles : String {
    "stroke: #{ThemeHelpers.getBorderPrimary(currentTheme)}; stroke-opacity: 0.2;"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <svg
        width={Number.toString(size)}
        height={Number.toString(size)}
        viewBox="0 0 #{Number.toString(size)} #{Number.toString(size)}"
        style="max-width: 100%; height: auto;"
      >
        {
          if showGrid {
            <>
              <polygon
                points={getGridPolygonPoints(100)}
                fill="none"
                stroke-width="1"
                style={getGridLineStyles()}
              />

              <polygon
                points={getGridPolygonPoints(75)}
                fill="none"
                stroke-width="1"
                style={getGridLineStyles()}
              />

              <polygon
                points={getGridPolygonPoints(50)}
                fill="none"
                stroke-width="1"
                style={getGridLineStyles()}
              />

              <polygon
                points={getGridPolygonPoints(25)}
                fill="none"
                stroke-width="1"
                style={getGridLineStyles()}
              />
            </>
          } else {
            <g/>
          }
        }

        {
          if showAxisLines {
            let center =
              size / 2

            let radius =
              (size / 2) - 50

            let dataLength =
              Array.size(data)

            Array.mapWithIndex(data,
              (n : Number, index : Number) {
                let angle =
                  (index / dataLength) * 2 * 3.14159 - (3.14159 / 2)

                let x =
                  center + (radius * Math.cos(angle))

                let y =
                  center + (radius * Math.sin(angle))

                <line
                  x1={Number.toString(center)}
                  y1={Number.toString(center)}
                  x2={Number.toString(x)}
                  y2={Number.toString(y)}
                  stroke-width="1"
                  style={getGridLineStyles()}
                />
              })
          } else {
            []
          }
        }

        {
          if dataset1Visible {
            <polygon
              points={getPolygonPoints(data)}
              fill={
                if showFill {
                  color
                } else {
                  "none"
                }
              }
              fill-opacity={
                if showFill {
                  "0.3"
                } else {
                  "0"
                }
              }
              stroke={color}
              stroke-width="2"
              style={
                if animated {
                  "transition: all 0.3s ease;"
                } else {
                  ""
                }
              }
            />
          } else {
            <g/>
          }
        }

        {
          if hasData2() && dataset2Visible {
            <polygon
              points={getPolygonPoints(data2)}
              fill={
                if showFill {
                  color2
                } else {
                  "none"
                }
              }
              fill-opacity={
                if showFill {
                  "0.3"
                } else {
                  "0"
                }
              }
              stroke={color2}
              stroke-width="2"
              stroke-dasharray="5,5"
              style={
                if animated {
                  "transition: all 0.3s ease;"
                } else {
                  ""
                }
              }
            />
          } else {
            <g/>
          }
        }

        <g>
          {
            if showPoints && dataset1Visible {
              let center =
                size / 2

              let radius =
                (size / 2) - 50

              Array.mapWithIndex(data,
                (value : Number, index : Number) {
                  let isActive =
                    Array.at(activeItems, index)
                    |> Maybe.withDefault(true)

                  let dataLength =
                    Array.size(data)

                  let angle =
                    (index / dataLength) * 2 * 3.14159 - (3.14159 / 2)

                  let r =
                    if isActive {
                      (value / 100) * radius
                    } else {
                      0
                    }

                  let x =
                    center + (r * Math.cos(angle))

                  let y =
                    center + (r * Math.sin(angle))

                  if isActive {
                    <circle
                      cx={Number.toString(x)}
                      cy={Number.toString(y)}
                      r="6"
                      fill={getPointColor(index)}
                      stroke="white"
                      stroke-width="3"
                    />
                  } else {
                    <g/>
                  }
                })
            } else {
              []
            }
          }
        </g>

        <g>
          {
            if showPoints && hasData2() && dataset2Visible {
              let center =
                size / 2

              let radius =
                (size / 2) - 50

              Array.mapWithIndex(data2,
                (value : Number, index : Number) {
                  let isActive =
                    Array.at(activeItems, index)
                    |> Maybe.withDefault(true)

                  let dataLength =
                    Array.size(data2)

                  let angle =
                    (index / dataLength) * 2 * 3.14159 - (3.14159 / 2)

                  let r =
                    if isActive {
                      (value / 100) * radius
                    } else {
                      0
                    }

                  let x =
                    center + (r * Math.cos(angle))

                  let y =
                    center + (r * Math.sin(angle))

                  if isActive {
                    <circle
                      cx={Number.toString(x)}
                      cy={Number.toString(y)}
                      r="6"
                      fill={getPointColor(index)}
                      stroke="white"
                      stroke-width="3"
                    />
                  } else {
                    <g/>
                  }
                })
            } else {
              []
            }
          }
        </g>
      </svg>

      {
        if hasData2() {
          <div::datasetLegend>
            <div::legendItem
              style="#{getLabelStyles()}; background: #{if dataset1Visible {
                ThemeHelpers.getBorderPrimary(currentTheme)
              } else {
                "transparent"
              }};"
              onClick={toggleDataset1}
            >
              <div::colorDot style="background: #{color};"/>

              <span>
                {
                  dataset1Name
                }
              </span>

              <span::statsText>
                {
                  "(Avg: #{Number.toString(Math.floor(getAverage(data)))})"
                }
              </span>
            </div>

            <div::legendItem
              style="#{getLabelStyles()}; background: #{if dataset2Visible {
                ThemeHelpers.getBorderPrimary(currentTheme)
              } else {
                "transparent"
              }};"
              onClick={toggleDataset2}
            >
              <div::colorDot style="background: #{color2};"/>

              <span>
                {
                  dataset2Name
                }
              </span>

              <span::statsText>
                {
                  "(Avg: #{Number.toString(Math.floor(getAverage(data2)))})"
                }
              </span>
            </div>
          </div>
        } else {
          <div/>
        }
      }

      {
        if showValues {
          <table::valuesTable>
            <thead>
              <tr>
                <th::tableHeader style={getTableHeaderStyles()}>
                  {
                    "Metric"
                  }
                </th>

                <th::tableHeader
                  style="#{getTableHeaderStyles()}; text-align: center;"
                >
                  {
                    dataset1Name
                  }
                </th>

                {
                  if hasData2() {
                    <th::tableHeader
                      style="#{getTableHeaderStyles()}; text-align: center;"
                    >
                      {
                        dataset2Name
                      }
                    </th>
                  } else {
                    <th/>
                  }
                }
              </tr>
            </thead>

            <tbody>
              {
                Array.mapWithIndex(labels,
                  (label : String, index : Number) {
                    let isActive =
                      Array.at(activeItems, index)
                      |> Maybe.withDefault(true)

                    let value1 =
                      Array.at(data, index)
                      |> Maybe.withDefault(0)

                    let value2 =
                      Array.at(data2, index)
                      |> Maybe.withDefault(0)

                    <tr
                      style="#{if isActive {
                        "opacity: 1;"
                      } else {
                        "opacity: 0.4;"
                      }}; cursor: pointer; transition: all 0.2s ease;"
                      onClick={
                        (event : Html.Event) { toggleItem(index, event) }
                      }
                    >
                      <td::tableCell style={getTableBorderStyles()}>
                        <div::metricCell>
                          <div::colorDot
                            style="background: #{getPointColor(index)}; opacity: #{if isActive {
                              "1"
                            } else {
                              "0.3"
                            }};"
                          />

                          <span style={getLabelStyles()}>
                            {
                              label
                            }
                          </span>
                        </div>
                      </td>

                      <td::tableCell style={getTableBorderStyles()}>
                        <div::valueCell style="color: #{color};">
                          {
                            Number.toString(value1)
                          }
                        </div>
                      </td>

                      {
                        if hasData2() {
                          <td::tableCell style={getTableBorderStyles()}>
                            <div::valueCell style="color: #{color2};">
                              {
                                Number.toString(value2)
                              }
                            </div>
                          </td>
                        } else {
                          <td/>
                        }
                      }
                    </tr>
                  })
              }
            </tbody>
          </table>
        } else {
          <div/>
        }
      }
    </div>
  }
}
