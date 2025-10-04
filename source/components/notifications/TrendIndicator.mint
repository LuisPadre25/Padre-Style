/* Trend Indicator Component */
component TrendIndicator {
  property value : String = "0"
  property change : String = "+12.5%"
  property trend : String = "up"
  property label : String = ""
  property size : String = "medium"

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    align-items: center;
    gap: clamp(0.5rem, 2vw, 0.75rem);
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 10px;
    max-width: 100%;
    flex-wrap: wrap;
  }

  style valueSection {
    display: flex;
    flex-direction: column;
    gap: 0.125rem;
  }

  style value {
    font-weight: 800;
    line-height: 1;
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.7rem);
    font-weight: 500;
  }

  style trendIcon {
    font-size: clamp(1.25rem, 2.5vw, 1.5rem);
    font-weight: 900;
  }

  style change {
    font-size: clamp(0.625rem, 1.5vw, 0.875rem);
    font-weight: 700;
  }

  fun getContainerStyles : String {
    let bgColor =
      case trend {
        "up" => "rgba(16, 185, 129, 0.1)"
        "down" => "rgba(239, 68, 68, 0.1)"
        _ => ThemeHelpers.getSurface(currentTheme)
      }

    let borderColor =
      case trend {
        "up" => "rgba(16, 185, 129, 0.3)"
        "down" => "rgba(239, 68, 68, 0.3)"
        _ => ThemeHelpers.getBorderPrimary(currentTheme)
      }

    "background: #{bgColor}; border: 2px solid #{borderColor};"
  }

  fun getValueStyles : String {
    let fontSize =
      case size {
        "small" => "clamp(0.875rem, 2vw, 1rem)"
        "large" => "clamp(1.5rem, 3vw, 2rem)"
        _ => "clamp(1.25rem, 2.5vw, 1.5rem)"
      }

    "color: #{ThemeHelpers.getTextPrimary(currentTheme)}; font-size: #{fontSize};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getTrendIconStyles : String {
    case trend {
      "up" => "color: #10b981;"
      "down" => "color: #ef4444;"
      _ => "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
    }
  }

  fun getChangeStyles : String {
    case trend {
      "up" => "color: #10b981;"
      "down" => "color: #ef4444;"
      _ => "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
    }
  }

  fun getTrendIcon : String {
    case trend {
      "up" => "↗"
      "down" => "↘"
      _ => "→"
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::valueSection>
        <div::value style={getValueStyles()}>value</div>

        {
          if !String.isEmpty(label) {
            <div::label style={getLabelStyles()}>label</div>
          } else {
            <div/>
          }
        }
      </div>

      <div::trendIcon style={getTrendIconStyles()}>getTrendIcon()</div>

      <div::change style={getChangeStyles()}>change</div>
    </div>
  }
}
