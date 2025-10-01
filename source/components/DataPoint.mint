/* Data Point Component - Single metric display */
component DataPoint {
  property value : String = "0"
  property label : String = ""
  property sublabel : String = ""
  property icon : String = ""
  property variant : String = "default"

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 12px;
    min-width: clamp(100px, 20vw, 120px);
    max-width: 100%;
  }

  style iconWrapper {
    width: clamp(40px, 8vw, 48px);
    height: clamp(40px, 8vw, 48px);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: clamp(1.25rem, 2.5vw, 1.5rem);
    margin-bottom: 0.5rem;
  }

  style value {
    font-size: clamp(1.25rem, 3vw, 1.75rem);
    font-weight: 800;
    line-height: 1;
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 600;
    text-align: center;
  }

  style sublabel {
    font-size: clamp(0.625rem, 1.5vw, 0.65rem);
    font-weight: 500;
    text-align: center;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getIconWrapperStyles : String {
    case variant {
      "success" => "background: rgba(16, 185, 129, 0.15);"
      "warning" => "background: rgba(245, 158, 11, 0.15);"
      "error" => "background: rgba(239, 68, 68, 0.15);"
      "info" => "background: rgba(59, 130, 246, 0.15);"
      _ => "background: #{ThemeHelpers.getSurface(currentTheme)};"
    }
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getSublabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        if !String.isEmpty(icon) {
          <div::iconWrapper style={getIconWrapperStyles()}>icon</div>
        } else {
          <div/>
        }
      }

      <div::value style={getValueStyles()}>value</div>

      {
        if !String.isEmpty(label) {
          <div::label style={getLabelStyles()}>label</div>
        } else {
          <div/>
        }
      }

      {
        if !String.isEmpty(sublabel) {
          <div::sublabel style={getSublabelStyles()}>sublabel</div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
