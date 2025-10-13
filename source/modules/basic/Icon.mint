/*
Icon - Mobile-first responsive icon component
 * Features: SVG, Emoji, Unicode, Custom HTML, Registry Support
 * Sizes, Colors, Rotation, Animations
 * Touch-friendly with accessibility
*/
component Icon {
  /* Connect to IconRegistry store */
  connect IconRegistry exposing { get, has, getType }

  /* Content */
  property name : String = ""

  property svg : String = ""
  property emoji : String = ""
  property text : String = ""

  /* Icon type - "stroke" or "fill" */
  property iconType : String = "stroke"

  /* Sizes - Mobile first approach */
  property size : String = "md"

  property customSize : String = ""

  /* Colors */
  property color : String = ""

  property bgColor : String = ""

  /* Variants */
  property variant : String = "default"

  property weight : String = "regular"

  /* Transform */
  property rotate : Number = 0

  property flip : String = ""

  /* Animations */
  property animated : Bool = false

  property animation : String = ""
  property spin : Bool = false
  property pulse : Bool = false

  /* Interaction */
  property clickable : Bool = false

  property disabled : Bool = false
  property badge : String = ""
  property badgeColor : String = "#ef4444"

  /* Accessibility */
  property ariaLabel : String = ""

  property ariaHidden : Bool = false

  /* Events */
  property onClick : Function(IconClickEvent, Promise(Void)) =
    (event : IconClickEvent) : Promise(Void) { Promise.never() }

  /* Get size value - Mobile first with touch targets */
  fun getSizeValue : String {
    if String.isNotEmpty(customSize) {
      customSize
    } else {
      case size {
        "xs" => "16px"
        "sm" => "20px"
        "md" => "24px"
        "lg" => "32px"
        "xl" => "40px"
        "xxl" => "48px"
        => "24px"
      }
    }
  }

  /* Get touch target size - Minimum 44x44px for mobile */
  fun getTouchSize : String {
    if clickable {
      let iconSize =
        case size {
          "xs" => 16
          "sm" => 20
          "md" => 24
          "lg" => 32
          "xl" => 40
          "xxl" => 48
          => 24
        }

      if iconSize < 44 {
        "44px"
      } else {
        getSizeValue()
      }
    } else {
      getSizeValue()
    }
  }

  /* Get color */
  fun getColor : String {
    if String.isNotEmpty(color) {
      color
    } else {
      case variant {
        "primary" => "#1989fa"
        "success" => "#10b981"
        "warning" => "#f59e0b"
        "error" => "#ef4444"
        "info" => "#3b82f6"
        "muted" => "#9ca3af"
        => "currentColor"
      }
    }
  }

  /* Get stroke weight for SVG */
  fun getStrokeWeight : String {
    case weight {
      "light" => "1.5"
      "regular" => "2"
      "bold" => "2.5"
      => "2"
    }
  }

  /* Get transform */
  fun getTransform : String {
    let rotateTransform =
      if rotate != 0 {
        "rotate(" + Number.toString(rotate) + "deg) "
      } else {
        ""
      }

    let flipTransform =
      case flip {
        "horizontal" => "scaleX(-1) "
        "vertical" => "scaleY(-1) "
        "both" => "scale(-1, -1) "
        => ""
      }

    rotateTransform + flipTransform
  }

  /* Get SVG from registry or prop */
  fun getSvg : String {
    if String.isNotEmpty(svg) {
      /* Use inline SVG if provided */
      svg
    } else if String.isNotEmpty(name) {
      /* Try to get from registry */
      get(name)
      |> Maybe.withDefault("")
    } else {
      ""
    }
  }

  /* Get effective icon type */
  fun getEffectiveIconType : String {
    if String.isNotEmpty(iconType) && iconType != "stroke" {
      /* User explicitly set the type */
      iconType
    } else if String.isNotEmpty(name) {
      /* Get type from registry */
      getType(name)
    } else {
      /* Default to stroke */
      "stroke"
    }
  }

  /* Handle click */
  fun handleClick (event : Html.Event) : Promise(Void) {
    if !disabled && clickable {
      onClick({ name: name, variant: variant })
    } else {
      Promise.never()
    }
  }

  /* Check if has badge */
  fun hasBadge : Bool {
    String.isNotEmpty(badge)
  }

  /* Styles - Mobile First */
  style wrapper {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    user-select: none;
    vertical-align: middle;

    /* Touch target for clickable icons */
    if clickable {
      min-width: #{getTouchSize()};
      min-height: #{getTouchSize()};
      cursor: pointer;

      /* Active feedback for mobile */
      -webkit-tap-highlight-color: transparent;

      &:active {
        transform: scale(0.95);
      }
    }

    if disabled {
      opacity: 0.4;
      cursor: not-allowed;
      pointer-events: none;
    }

    /* Desktop hover - only on larger screens */
    @media (min-width: 1025px) {
      if clickable && !disabled {
        transition: all 0.2s ease;

        &:hover {
          transform: scale(1.1);
        }
      }
    }
  }

  style iconContainer {
    display: flex;
    align-items: center;
    justify-content: center;

    if clickable {
      cursor: pointer;
    }

    /* Sizes */
    &.size-xs {
      width: 16px;
      height: 16px;
    }

    &.size-sm {
      width: 20px;
      height: 20px;
    }

    &.size-md {
      width: 24px;
      height: 24px;
    }

    &.size-lg {
      width: 32px;
      height: 32px;
    }

    &.size-xl {
      width: 40px;
      height: 40px;
    }

    &.size-xxl {
      width: 48px;
      height: 48px;
    }

    /* Colors - Variants */
    &.color-primary {
      color: #1989fa;
    }

    &.color-success {
      color: #10b981;
    }

    &.color-warning {
      color: #f59e0b;
    }

    &.color-error {
      color: #ef4444;
    }

    &.color-info {
      color: #3b82f6;
    }

    &.color-muted {
      color: #9ca3af;
    }

    &.color-current {
      color: currentColor;
    }

    /* Background color - when bgColor is set */
    &.has-bg {
      border-radius: 50%;
      padding: 8px;
    }

    /* Animations */
    &.spin {
      animation: iconSpin 1s linear infinite;
    }

    &.pulse {
      animation: iconPulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
    }

    /* Responsive scaling - adjust for smaller screens */
    @media (max-width: 640px) {
      &.size-xl,
      &.size-xxl {
        width: 32px;
        height: 32px;
      }
    }
  }

  style svg {
    width: 100%;
    height: 100%;

    if clickable {
      cursor: pointer;
    }

    if getEffectiveIconType() == "stroke" {
      fill: none;
      stroke: currentColor;
      stroke-width: #{getStrokeWeight()};
      stroke-linecap: round;
      stroke-linejoin: round;
    } else {
      fill: currentColor;
      stroke: none;
    }
  }

  style emoji {
    font-size: #{getSizeValue()};
    line-height: 1;

    /* Prevent emoji from being selected */
    user-select: none;
    -webkit-user-select: none;
  }

  style textContent {
    font-size: #{getSizeValue()};
    line-height: 1;
    font-weight: 500;
  }

  style badgeIndicator {
    position: absolute;
    top: -2px;
    right: -2px;
    min-width: 16px;
    height: 16px;
    padding: 0 4px;
    background-color: #{badgeColor};
    color: white;
    border-radius: 8px;
    font-size: 10px;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: center;
    border: 2px solid white;
    z-index: 1;

    /* Responsive badge */
    @media (max-width: 640px) {
      min-width: 14px;
      height: 14px;
      font-size: 9px;
      border-width: 1px;
    }
  }

  /* Keyframes for animations */
  style base {
    @keyframes iconSpin {
      from {
        transform: rotate(0deg);
      }

      to {
        transform: rotate(360deg);
      }
    }

    @keyframes iconPulse {
      0%, 100% {
        opacity: 1;
      }

      50% {
        opacity: 0.5;
      }
    }
  }

  /* Render SVG content */
  fun renderSvg : Html {
    let svgContent =
      getSvg()

    if String.isNotEmpty(svgContent) {
      <svg::svg
        viewBox="0 0 24 24"
        dangerouslySetInnerHTML={`{ __html: #{svgContent} }`}
      />
    } else {
      <></>
    }
  }

  /* Render emoji */
  fun renderEmoji : Html {
    if String.isNotEmpty(emoji) {
      <span::emoji role="img" aria-label={ariaLabel}>
        {
          emoji
        }
      </span>
    } else {
      <></>
    }
  }

  /* Render text/unicode */
  fun renderText : Html {
    if String.isNotEmpty(text) {
      <span::textContent>
        {
          text
        }
      </span>
    } else if String.isNotEmpty(name) {
      <span::textContent>
        {
          name
        }
      </span>
    } else {
      <></>
    }
  }

  /* Get color class */
  fun getColorClass : String {
    if String.isNotEmpty(color) {
      "color-current"
    } else {
      case variant {
        "primary" => "color-primary"
        "success" => "color-success"
        "warning" => "color-warning"
        "error" => "color-error"
        "info" => "color-info"
        "muted" => "color-muted"
        => "color-current"
      }
    }
  }

  /* Render icon content */
  fun renderIconContent : Html {
    let svgContent =
      getSvg()

    <div::iconContainer
      class={
        "size-" + (if String.isNotEmpty(customSize) {
          "md"
        } else {
          size
        }) + " " + getColorClass() + (if String.isNotEmpty(bgColor) {
          " has-bg"
        } else {
          ""
        }) + (if spin {
          " spin"
        } else {
          ""
        }) + (if pulse {
          " pulse"
        } else {
          ""
        })
      }
      style={
        (if String.isNotEmpty(customSize) {
          "width: " + customSize + "; height: " + customSize + ";"
        } else {
          ""
        }) + (if String.isNotEmpty(bgColor) {
          " background-color: " + bgColor + ";"
        } else {
          ""
        }) + (if String.isNotEmpty(color) {
          " color: " + color + ";"
        } else {
          ""
        }) + (if String.isNotEmpty(getTransform()) {
          " transform: " + getTransform() + ";"
        } else {
          ""
        })
      }
    >
      if String.isNotEmpty(svgContent) {
        renderSvg()
      } else if String.isNotEmpty(emoji) {
        renderEmoji()
      } else {
        renderText()
      }
    </div>
  }

  /* Main render */
  fun render : Html {
    <div::base>
      <div::wrapper
        onClick={handleClick}
        role={
          if clickable {
            "button"
          } else {
            ""
          }
        }
        tabindex={
          if clickable && !disabled {
            "0"
          } else {
            ""
          }
        }
        aria-label={ariaLabel}
        aria-hidden={
          if ariaHidden {
            "true"
          } else {
            "false"
          }
        }
      >
        {
          renderIconContent()
        }

        if hasBadge() {
          <span::badgeIndicator>
            {
              badge
            }
          </span>
        }
      </div>
    </div>
  }
}
