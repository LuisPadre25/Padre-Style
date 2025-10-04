/* Number Counter Component - Animated number display */
component NumberCounter {
  property value : Number = 0
  property label : String = ""
  property prefix : String = ""
  property suffix : String = ""
  property size : String = "large"
  property color : String = ""

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
  }

  style number {
    font-weight: 900;
    line-height: 1;
    letter-spacing: -0.02em;
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.875rem);
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getNumberStyles : String {
    let fontSize =
      case size {
        "small" => "clamp(1.5rem, 3vw, 2rem)"
        "medium" => "clamp(2rem, 4vw, 3rem)"
        "large" => "clamp(2.5rem, 5vw, 4rem)"
        _ => "clamp(2rem, 4vw, 3rem)"
      }

    let textColor =
      if String.isEmpty(color) {
        ThemeHelpers.getTextPrimary(currentTheme)
      } else {
        color
      }

    "font-size: #{fontSize}; color: #{textColor};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::number style={getNumberStyles()}>
        "#{prefix}#{Number.toString(value)}#{suffix}"
      </div>

      {
        if !String.isEmpty(label) {
          <div::label style={getLabelStyles()}>label</div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
