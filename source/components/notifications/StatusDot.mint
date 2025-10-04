/* Status Dot Component */
component StatusDot {
  property status : String = "default"
  property size : String = "medium"
  property pulse : Bool = false

  connect ThemeStore exposing { currentTheme }

  style dot {
    border-radius: 50%;
    display: inline-block;
  }

  fun getDotStyles : String {
    let dotSize =
      case size {
        "small" => "0.5rem"
        "large" => "1rem"
        _ => "0.75rem"
      }

    let color =
      case status {
        "success" => "#10b981"
        "warning" => "#f59e0b"
        "error" => "#ef4444"
        "info" => "#3b82f6"
        _ => ThemeHelpers.getTextSecondary(currentTheme)
      }

    let animation =
      if pulse {
        "animation: pulse 2s ease-in-out infinite;"
      } else {
        ""
      }

    "width: #{dotSize}; height: #{dotSize}; background: #{color}; #{animation}"
  }

  fun render : Html {
    <span::dot style={getDotStyles()}/>
  }
}
