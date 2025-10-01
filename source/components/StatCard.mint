/* Stat Card Component - Reuses Card and Badge */
component StatCard {
  property title : String = ""
  property value : String = ""
  property icon : String = ""
  property trend : String = ""
  property trendDirection : String = "neutral"
  property description : String = ""

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: 1.75rem;
    border-radius: 16px;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
  }

  style backgroundGradient {
    position: absolute;
    top: 0;
    right: 0;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    opacity: 0.1;
    filter: blur(40px);
    pointer-events: none;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 1rem;
  }

  style title {
    font-size: 0.875rem;
    font-weight: 500;
    opacity: 0.8;
  }

  style icon {
    font-size: 2rem;
    padding: 0.75rem;
    border-radius: 12px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
  }

  style value {
    font-size: 2.25rem;
    font-weight: 800;
    margin-bottom: 0.5rem;
    letter-spacing: -0.02em;
  }

  style footer {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    font-size: 0.875rem;
  }

  style trend {
    font-weight: 600;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getIconStyles : String {
    let bgColor =
      case trendDirection {
        "up" => "rgba(16, 185, 129, 0.15)"
        "down" => "rgba(239, 68, 68, 0.15)"
        _ => ThemeHelpers.getSurface(currentTheme)
      }

    "background: #{bgColor};"
  }

  fun getBackgroundGradientStyles : String {
    let gradientColor =
      case trendDirection {
        "up" => "#10b981"
        "down" => "#ef4444"
        _ => "#667eea"
      }

    "background: #{gradientColor};"
  }

  fun getTitleStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getTrendStyles : String {
    let color =
      case trendDirection {
        "up" => "#10b981"
        "down" => "#ef4444"
        _ => ThemeHelpers.getTextSecondary(currentTheme)
      }

    "color: #{color};"
  }

  fun getDescriptionStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::backgroundGradient style={getBackgroundGradientStyles()}/>

      <div::header>
        <div::title style={getTitleStyles()}>title</div>

        {
          if !String.isEmpty(icon) {
            <div::icon style={getIconStyles()}>icon</div>
          } else {
            <div/>
          }
        }
      </div>

      <div::value style={getValueStyles()}>value</div>

      {
        if !String.isEmpty(trend) || !String.isEmpty(description) {
          <div::footer>
            {
              if !String.isEmpty(trend) {
                <span::trend style={getTrendStyles()}>trend</span>
              } else {
                <span/>
              }
            }

            {
              if !String.isEmpty(description) {
                <span style={getDescriptionStyles()}>description</span>
              } else {
                <span/>
              }
            }
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
