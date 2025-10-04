/* Heat Map Component */
component HeatMap {
  property data : Array(Number) = [10, 20, 30, 40, 50, 60, 70, 80, 90]
  property rows : Number = 3
  property cols : Number = 3
  property cellSize : Number = 50

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
    overflow: auto;
  }

  style grid {
    display: grid;
    gap: clamp(0.125rem, 0.5vw, 0.25rem);
  }

  style cell {
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 6px;
    font-size: clamp(0.625rem, 1.2vw, 0.75rem);
    font-weight: 700;
    color: white;
    transition: all 0.2s ease;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getGridStyles : String {
    "
      grid-template-columns: repeat(#{Number.toString(cols)}, minmax(30px, #{Number.toString(
      cellSize)}px));
      grid-template-rows: repeat(#{Number.toString(rows)}, minmax(30px, #{Number.toString(
      cellSize)}px));
    "
  }

  fun getCellStyles (value : Number) : String {
    let intensity =
      value / 100

    let r =
      Math.floor(102 + (153 * intensity))

    let g =
      Math.floor(126 - (58 * intensity))

    let b =
      Math.floor(234 - (172 * intensity))

    "background: rgb(#{Number.toString(r)}, #{Number.toString(g)}, #{Number.toString(
      b)});"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::grid style={getGridStyles()}>
        {
          Array.mapWithIndex(data,
            (value : Number, index : Number) {
              <div::cell style={getCellStyles(value)}>
                Number.toString(Math.floor(value))
              </div>
            })
        }
      </div>
    </div>
  }
}
