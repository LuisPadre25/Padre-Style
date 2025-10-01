/* Bullet Chart Component */
component BulletChart {
  property label : String = "Performance"
  property value : Number = 75
  property target : Number = 100
  property ranges : Array(Number) = [50, 75, 100]
  property height : String = "60px"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: clamp(0.75rem, 2vw, 1rem);
    border-radius: 12px;
    max-width: 100%;
    overflow: hidden;
  }

  style label {
    font-size: clamp(0.75rem, 1.5vw, 0.875rem);
    font-weight: 600;
    margin-bottom: 0.75rem;
  }

  style chartArea {
    position: relative;
    border-radius: 8px;
    overflow: hidden;
  }

  style range {
    height: 100%;
    position: absolute;
    top: 0;
    transition: all 0.4s ease;
  }

  style valueBar {
    height: 60%;
    position: absolute;
    top: 20%;
    border-radius: 4px;
    transition: all 0.6s cubic-bezier(0.4, 0, 0.2, 1);
  }

  style targetMarker {
    width: 3px;
    height: 100%;
    position: absolute;
    top: 0;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getChartAreaStyles : String {
    "background: #{ThemeHelpers.getSurface(currentTheme)}; height: #{height};"
  }

  fun getRangeStyles (index : Number) : String {
    let opacity =
      0.3 - (index * 0.1)

    let width =
      if index < Array.size(ranges) {
        Number.toString(
          Array.at(ranges, index)
          |> Maybe.withDefault(100))
      } else {
        "100"
      }

    "
      background: rgba(102, 126, 234, #{Number.toString(opacity)});
      width: #{width}%;
      left: 0;
    "
  }

  fun getValueBarStyles : String {
    "
      background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
      width: #{Number.toString(value)}%;
      left: 0;
      box-shadow: 0 2px 8px rgba(102, 126, 234, 0.4);
    "
  }

  fun getTargetMarkerStyles : String {
    "
      background: #ef4444;
      left: #{Number.toString(target)}%;
    "
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::label style={getLabelStyles()}>label</div>

      <div::chartArea style={getChartAreaStyles()}>
        {
          Array.mapWithIndex([0, 1, 2],
            (n : Number, index : Number) {
              <div::range style={getRangeStyles(index)}/>
            })
        }

        <div::valueBar style={getValueBarStyles()}/>
        <div::targetMarker style={getTargetMarkerStyles()}/>
      </div>
    </div>
  }
}
