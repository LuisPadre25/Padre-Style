/* Metric Display Component */
component MetricDisplay {
  property label : String = "Metric"
  property value : String = "0"
  property change : String = ""
  property changeType : String = "positive"
  property icon : String = "📊"
  property size : String = "medium"

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    align-items: center;
    gap: clamp(0.5rem, 2vw, 1rem);
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 12px;
    transition: all 0.2s ease;
    max-width: 100%;
    flex-wrap: wrap;
  }

  style iconWrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    font-size: clamp(1rem, 2.5vw, 1.5rem);
  }

  style content {
    display: flex;
    flex-direction: column;
    gap: 0.25rem;
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  style value {
    font-weight: 800;
    line-height: 1;
  }

  style change {
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 600;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getIconWrapperStyles : String {
    let bgColor =
      case changeType {
        "positive" => "rgba(16, 185, 129, 0.15)"
        "negative" => "rgba(239, 68, 68, 0.15)"
        _ => ThemeHelpers.getSurface(currentTheme)
      }

    let padding =
      case size {
        "small" => "0.5rem"
        "large" => "1rem"
        _ => "0.75rem"
      }

    "background: #{bgColor}; padding: #{padding};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getValueStyles : String {
    let fontSize =
      case size {
        "small" => "clamp(1rem, 2.5vw, 1.25rem)"
        "large" => "clamp(1.5rem, 3vw, 2rem)"
        _ => "clamp(1.25rem, 2.5vw, 1.5rem)"
      }

    "color: #{ThemeHelpers.getTextPrimary(currentTheme)}; font-size: #{fontSize};"
  }

  fun getChangeStyles : String {
    case changeType {
      "positive" => "color: #10b981;"
      "negative" => "color: #ef4444;"
      _ => "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::iconWrapper style={getIconWrapperStyles()}>icon</div>

      <div::content>
        <div::label style={getLabelStyles()}>label</div>
        <div::value style={getValueStyles()}>value</div>

        {
          if !String.isEmpty(change) {
            <div::change style={getChangeStyles()}>change</div>
          } else {
            <div/>
          }
        }
      </div>
    </div>
  }
}
