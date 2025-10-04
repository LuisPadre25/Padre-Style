/* Avatar Component
 * Displays user avatar with multiple variants
 * Supports: image, initials, icon, status indicator, sizes, shapes
 */

component Avatar {
  // Avatar source (image URL or initials)
  property src : String = ""
  property alt : String = "Avatar"
  property initials : String = ""

  // Size variants: xs, sm, md, lg, xl, 2xl
  property size : String = "md"

  // Shape: circle, rounded, square
  property shape : String = "circle"

  // Status indicator
  property showStatus : Bool = false
  property status : String = "online"  // online, offline, away, busy

  // Border
  property bordered : Bool = false

  // Custom colors for initials
  property bgColor : String = ""
  property textColor : String = ""

  connect ThemeStore exposing { currentTheme }

  // Get size styles
  fun getSizeStyles : String {
    case size {
      "xs" => "width: 24px; height: 24px; font-size: 0.625rem;"
      "sm" => "width: 32px; height: 32px; font-size: 0.75rem;"
      "md" => "width: 40px; height: 40px; font-size: 0.875rem;"
      "lg" => "width: 48px; height: 48px; font-size: 1rem;"
      "xl" => "width: 64px; height: 64px; font-size: 1.25rem;"
      "2xl" => "width: 96px; height: 96px; font-size: 1.875rem;"
      => "width: 40px; height: 40px; font-size: 0.875rem;"
    }
  }

  // Get shape styles
  fun getShapeStyles : String {
    case shape {
      "circle" => "border-radius: 50%;"
      "rounded" => "border-radius: 8px;"
      "square" => "border-radius: 0;"
      => "border-radius: 50%;"
    }
  }

  // Get border styles
  fun getBorderStyles : String {
    if bordered {
      "border: 2px solid #{ThemeHelpers.getBackground(currentTheme)}; box-shadow: 0 0 0 2px #{ThemeHelpers.getBorderPrimary(currentTheme)};"
    } else {
      ""
    }
  }

  // Get background color for initials
  fun getInitialsBackground : String {
    if String.isEmpty(bgColor) {
      "background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);"
    } else {
      "background: #{bgColor};"
    }
  }

  // Get text color for initials
  fun getInitialsColor : String {
    if String.isEmpty(textColor) {
      "color: white;"
    } else {
      "color: #{textColor};"
    }
  }

  // Get status color
  fun getStatusColor : String {
    case status {
      "online" => "#10b981"
      "offline" => "#6b7280"
      "away" => "#f59e0b"
      "busy" => "#ef4444"
      => "#10b981"
    }
  }

  // Get status size based on avatar size
  fun getStatusSize : String {
    case size {
      "xs" => "width: 6px; height: 6px; border-width: 1px;"
      "sm" => "width: 8px; height: 8px; border-width: 1.5px;"
      "md" => "width: 10px; height: 10px; border-width: 2px;"
      "lg" => "width: 12px; height: 12px; border-width: 2px;"
      "xl" => "width: 16px; height: 16px; border-width: 2px;"
      "2xl" => "width: 20px; height: 20px; border-width: 3px;"
      => "width: 10px; height: 10px; border-width: 2px;"
    }
  }

  style container {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    overflow: hidden;
    transition: all 0.2s ease;
  }

  style image {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  style initials {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    font-weight: 600;
    user-select: none;
  }

  style statusIndicator {
    position: absolute;
    bottom: 0;
    right: 0;
    border-radius: 50%;
    border-style: solid;
  }

  style placeholder {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
  }

  fun getContainerStyles : String {
    "
      #{getSizeStyles()}
      #{getShapeStyles()}
      #{getBorderStyles()}
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  fun getPlaceholderStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
    "
  }

  fun getStatusStyles : String {
    "
      #{getStatusSize()}
      background: #{getStatusColor()};
      border-color: #{ThemeHelpers.getBackground(currentTheme)};
    "
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      if String.isEmpty(src) == false {
        <img::image src={src} alt={alt}/>
      } else if String.isEmpty(initials) == false {
        <div::initials style={getInitialsBackground() + getInitialsColor()}>
          initials
        </div>
      } else {
        <div::placeholder style={getPlaceholderStyles()}>
          <svg
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            stroke="currentColor"
            stroke-width="2"
          >

            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
            <circle cx="12" cy="7" r="4"/>

          </svg>
        </div>
      }

      if showStatus {
        <span::statusIndicator style={getStatusStyles()}/>
      } else {
        <span/>
      }
    </div>
  }
}
