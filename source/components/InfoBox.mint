/* Info Box Component */
component InfoBox {
  property title : String = ""
  property value : String = ""
  property icon : String = ""
  property trend : String = ""

  connect ThemeStore exposing { currentTheme }

  style card {
    padding: 1.5rem;
    border-radius: 12px;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
  }

  style title {
    font-size: 0.875rem;
    font-weight: 500;
  }

  style icon {
    font-size: 1.5rem;
  }

  style value {
    font-size: 2rem;
    font-weight: 700;
  }

  style trend {
    font-size: 0.875rem;
    margin-top: 0.5rem;
  }

  fun getCardStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getTitleStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getTrendStyles : String {
    case trend {
      "up" => "color: #10b981;"
      "down" => "color: #ef4444;"
      _ => "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
    }
  }

  fun render : Html {
    <div::card style={getCardStyles()}>
      <div::header>
        <span::title style={getTitleStyles()}>title</span>

        {
          if !String.isEmpty(icon) {
            <span::icon>icon</span>
          } else {
            <span/>
          }
        }
      </div>

      <div::value style={getValueStyles()}>value</div>

      {
        if !String.isEmpty(trend) {
          <div::trend style={getTrendStyles()}>trend</div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
