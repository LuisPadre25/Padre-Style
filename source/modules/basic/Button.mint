/* Button Component - Superior to Vant UI with advanced features */
component Button {
  /* Properties */
  property children : Array(Html) = []

  /* Variant & Type */
  property variant : String = "default"

  property size : String = "medium"
  property shape : String = "rounded"
  property elevation : String = "none"

  /* Behavior */
  property block : Bool = false

  property plain : Bool = false
  property disabled : Bool = false
  property loading : Bool = false
  property ripple : Bool = true
  property haptic : Bool = false

  /* Custom styling */
  property color : String = ""

  property gradient : String = ""
  property gradientDirection : String = "to right"

  /* Icon */
  property icon : String = ""

  property iconPosition : String = "left"
  property iconSize : String = "16px"
  property iconColor : String = ""

  /* Loading */
  property loadingText : String = ""

  property loadingPosition : String = "left"
  property loadingSize : String = "16px"

  /* Badge */
  property badge : String = ""

  property badgeDot : Bool = false
  property badgeMax : Number = 99

  /* Events */
  property onClick : Function(Html.Event, Promise(Void)) = (event : Html.Event) : Promise(Void) { Promise.never() }

  /* State */
  state rippleActive : Bool = false

  state rippleX : Number = 0
  state rippleY : Number = 0

  /* Handle click with ripple effect */
  fun handleClick (event : Html.Event) : Promise(Void) {
    /* Trigger haptic feedback */
    `
    (() => {
      if (#{haptic} && navigator.vibrate) {
        navigator.vibrate(10);
      }
    })()
    `

    /* Trigger ripple effect and call onClick */
    if ripple {
      next
        {
          rippleX:
            `
            (() => {
              const rect = #{event}.currentTarget.getBoundingClientRect();
              return #{event}.clientX - rect.left;
            })()
            `,
          rippleY:
            `
            (() => {
              const rect = #{event}.currentTarget.getBoundingClientRect();
              return #{event}.clientY - rect.top;
            })()
            `,
          rippleActive: true
        }
    }

    onClick(event)
  }

  /* Get background color */
  fun getBackground : String {
    if !String.isEmpty(gradient) {
      "linear-gradient(" + gradientDirection + ", " + gradient + ")"
    } else if !String.isEmpty(color) {
      color
    } else {
      case variant {
        "primary" => "#1989fa"
        "success" => "#07c160"
        "warning" => "#ff9800"
        "danger" => "#ee0a24"
        "info" => "#909399"
        => "#ffffff"
      }
    }
  }

  /* Get text color */
  fun getTextColor : String {
    if !String.isEmpty(gradient) || !String.isEmpty(color) {
      "#ffffff"
    } else {
      case variant {
        "primary" => "#ffffff"
        "success" => "#ffffff"
        "warning" => "#ffffff"
        "danger" => "#ffffff"
        "info" => "#ffffff"
        => "#323233"
      }
    }
  }

  /* Get border color */
  fun getBorderColor : String {
    if !String.isEmpty(gradient) {
      "transparent"
    } else if !String.isEmpty(color) {
      color
    } else {
      case variant {
        "primary" => "#1989fa"
        "success" => "#07c160"
        "warning" => "#ff9800"
        "danger" => "#ee0a24"
        "info" => "#909399"
        => "#e5e5e5"
      }
    }
  }

  /* Get border width */
  fun getBorderWidth : String {
    if !String.isEmpty(gradient) {
      "0"
    } else {
      "1px"
    }
  }

  /* Styles */
  style container {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    font-family: var(--font-family, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif);
    font-weight: 500;
    text-align: center;
    cursor: pointer;
    user-select: none;
    transition: all 0.3s ease;
    overflow: hidden;
    border-style: solid;
    box-sizing: border-box;

    if block {
      width: 100%;
      display: flex;
    }

    /* Size variants */
    if size == "mini" {
      padding: 4px 8px;
      font-size: 10px;
      min-height: 24px;
      gap: 4px;
    } else if size == "small" {
      padding: 6px 12px;
      font-size: 12px;
      min-height: 32px;
      gap: 6px;
    } else if size == "medium" {
      padding: 10px 16px;
      font-size: 14px;
      min-height: 44px;
    } else if size == "large" {
      padding: 14px 20px;
      font-size: 16px;
      min-height: 52px;
      gap: 10px;
    }

    /* Shape variants */
    if shape == "square" {
      border-radius: 4px;
    } else if shape == "rounded" {
      border-radius: 8px;
    } else if shape == "pill" {
      border-radius: 999px;
    } else if shape == "circle" {
      border-radius: 50%;
      padding: 12px;
      aspect-ratio: 1;
    }

    /* Elevation variants */
    if elevation == "raised" {
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    } else if elevation == "lifted" {
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    } else if elevation == "floating" {
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
    }

    /* Disabled state */
    if disabled {
      opacity: 0.5;
      cursor: not-allowed;
    }

    /* Loading state */
    if loading {
      cursor: wait;
    }

    /* Hover effect */
    &:hover {
      if !disabled && !loading {
        transform: translateY(-1px);

        if elevation == "raised" {
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        } else if elevation == "lifted" {
          box-shadow: 0 6px 16px rgba(0, 0, 0, 0.2);
        } else if elevation == "floating" {
          box-shadow: 0 12px 32px rgba(0, 0, 0, 0.25);
        }
      }
    }

    /* Active effect */
    &:active {
      if !disabled && !loading {
        transform: translateY(0);
      }
    }
  }

  style rippleEffect {
    position: absolute;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.6);
    transform: scale(0);
    pointer-events: none;
    width: 20px;
    height: 20px;

    if rippleActive {
      animation: ripple 0.6s ease-out;
    }

    @keyframes ripple {
      to {
        transform: scale(20);
        opacity: 0;
      }
    }
  }

  style iconWrapper {
    display: inline-flex;
    align-items: center;
    justify-content: center;
  }

  style loadingSpinner {
    display: inline-flex;
    width: 16px;
    height: 16px;
    border: 2px solid currentColor;
    border-right-color: transparent;
    border-radius: 50%;
    animation: spin 0.6s linear infinite;

    @keyframes spin {
      to {
        transform: rotate(360deg);
      }
    }
  }

  style badgeWrapper {
    position: absolute;
    top: -4px;
    right: -4px;
    background: #ee0a24;
    color: #ffffff;
    font-size: 10px;
    font-weight: 600;
    padding: 2px 6px;
    border-radius: 10px;
    min-width: 18px;
    height: 18px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);

    if badgeDot {
      width: 8px;
      height: 8px;
      min-width: 8px;
      padding: 0;
      border-radius: 50%;
    }
  }

  style plainStyle {
    background: transparent !important;
  }

  /* Render icon */
  fun renderIcon : Html {
    if !String.isEmpty(icon) && !loading {
      <div::iconWrapper>
        <Icon name={icon} size={iconSize} color={iconColor}/>
      </div>
    } else {
      <></>
    }
  }

  /* Render loading */
  fun renderLoading : Html {
    if loading {
      <div>
        <div::loadingSpinner/>

        if !String.isEmpty(loadingText) {
          <span>
            {
              loadingText
            }
          </span>
        } else {
          <></>
        }
      </div>
    } else {
      <></>
    }
  }

  /* Render badge */
  fun renderBadge : Html {
    if !String.isEmpty(badge) || badgeDot {
      <div::badgeWrapper>
        if badgeDot {
          <></>
        } else {
          let displayValue =
            `
            (() => {
              const value = parseInt(#{badge});
              const max = #{badgeMax};
              if (!isNaN(value) && value > max) {
                return max + '+';
              }
              return #{badge};
            })()
            `

          <span>
            {
              displayValue
            }
          </span>
        }
      </div>
    } else {
      <></>
    }
  }

  /* Render content */
  fun renderContent : Html {
    case iconPosition {
      "top" =>
        <div style="display: flex; flex-direction: column; align-items: center; gap: 4px;">
          {
            renderIcon()
          }

          <div>
            for child of children {
              child
            }
          </div>
        </div>

      "bottom" =>
        <div style="display: flex; flex-direction: column; align-items: center; gap: 4px;">
          <div>
            for child of children {
              child
            }
          </div>

          {
            renderIcon()
          }
        </div>

      "right" =>
        <>
          <div>
            for child of children {
              child
            }
          </div>

          {
            renderIcon()
          }
        </>

      "only" => renderIcon()

      =>
        <>
          {
            renderIcon()
          }

          <div>
            for child of children {
              child
            }
          </div>
        </>
    }
  }

  /* Render */
  fun render : Html {
    let bgColor =
      if plain {
        "transparent"
      } else {
        getBackground()
      }

    let textColor =
      if plain {
        getBackground()
      } else {
        getTextColor()
      }

    let borderColor =
      getBorderColor()

    let borderWidth =
      getBorderWidth()

    let styleString =
      "background: " + bgColor + "; " + "color: " + textColor + "; " + "border-color: " + borderColor + "; " + "border-width: " + borderWidth + ";"

    <button::container
      onClick={handleClick}
      disabled={disabled || loading}
      style={styleString}
    >
      if ripple && rippleActive {
        <div::rippleEffect
          style={"left: " + Number.toString(rippleX) + "px; top: " + Number.toString(rippleY) + "px;"}
        />
      } else {
        <></>
      }

      if loading {
        renderLoading()
      } else {
        renderContent()
      }

      {
        renderBadge()
      }
    </button>
  }
}
