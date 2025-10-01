/* Separator Component - Enhanced Design */
component Separator {
  property orientation : String = "horizontal"
  property thickness : String = "1px"
  property variant : String = "default"
  property spacing : String = "1rem"

  connect ThemeStore exposing { currentTheme }

  style horizontalSeparator {
    height: 1px;
    width: 100%;
    border: none;
    position: relative;
  }

  style verticalSeparator {
    width: 1px;
    min-height: 20px;
    border: none;
    position: relative;
  }

  fun getHorizontalStyles : String {
    let baseColor =
      ThemeHelpers.getBorderPrimary(currentTheme)

    let gradientStyle =
      case variant {
        "gradient" =>
          "background: linear-gradient(90deg, transparent 0%, #{baseColor} 50%, transparent 100%);"

        "dashed" =>
          "border-top: 2px dashed #{baseColor}; opacity: 0.6; background: transparent;"

        "dotted" =>
          "border-top: 2px dotted #{baseColor}; opacity: 0.6; background: transparent;"

        _ => "background: #{baseColor}; opacity: 0.3;"
      }

    "margin: #{spacing} 0; #{gradientStyle}"
  }

  fun getVerticalStyles : String {
    let baseColor =
      ThemeHelpers.getBorderPrimary(currentTheme)

    let gradientStyle =
      case variant {
        "gradient" =>
          "background: linear-gradient(180deg, transparent 0%, #{baseColor} 50%, transparent 100%);"

        "dashed" =>
          "border-left: 2px dashed #{baseColor}; opacity: 0.6; background: transparent;"

        "dotted" =>
          "border-left: 2px dotted #{baseColor}; opacity: 0.6; background: transparent;"

        _ => "background: #{baseColor}; opacity: 0.3;"
      }

    "margin: 0 #{spacing}; #{gradientStyle}"
  }

  fun render : Html {
    if orientation == "vertical" {
      <div::verticalSeparator style={getVerticalStyles()}/>
    } else {
      <div::horizontalSeparator style={getHorizontalStyles()}/>
    }
  }
}
