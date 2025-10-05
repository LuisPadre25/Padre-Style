/* Badge - Professional notification badge and status indicator
 * Based on Ant Design and Material UI standards
 * Features: count badges, dot indicators, status badges, standalone labels
 */

component Badge {
  /* Core properties */
  property count : Number = 0
  property max : Number = 99
  property dot : Bool = false
  property showZero : Bool = false
  property standalone : Bool = false

  /* Styling */
  property variant : String = "default"  // default, success, processing, error, warning, info
  property color : String = ""  // custom color override
  property textColor : String = "#fff"

  /* Positioning (for non-standalone badges) */
  property position : String = "topRight"  // topRight, topLeft, bottomRight, bottomLeft
  property offset : Array(Number) = []  // [x, y] offset in pixels

  /* Text content (for standalone badges) */
  property text : String = ""

  /* Size */
  property size : String = "default"  // small, default, large

  /* Children (element to badge) */
  property children : Array(Html) = []

  /* Get variant color */
  fun getVariantColor : String {
    if String.isNotEmpty(color) {
      color
    } else {
      case variant {
        "success" => "#52c41a"
        "processing" => "#1890ff"
        "error" => "#ff4d4f"
        "warning" => "#faad14"
        "info" => "#1890ff"
        => "#ff4d4f"  // default red
      }
    }
  }

  /* Get display count */
  fun getDisplayCount : String {
    if count > max {
      Number.toString(max) + "+"
    } else {
      Number.toString(count)
    }
  }

  /* Should show badge */
  fun shouldShowBadge : Bool {
    if dot {
      true
    } else if standalone {
      true
    } else if count > 0 {
      true
    } else if count == 0 && showZero {
      true
    } else {
      false
    }
  }

  /* Get offset styles */
  fun getOffsetStyles : String {
    if Array.isEmpty(offset) {
      ""
    } else {
      let x =
        Array.first(offset)
        |> Maybe.withDefault(0)

      let y =
        offset
        |> Array.slice(1, 2)
        |> Array.first
        |> Maybe.withDefault(0)

      "transform: translate(calc(50% + " + Number.toString(x) + "px), calc(-50% + " + Number.toString(y) + "px));"
    }
  }

  /* Wrapper style */
  style wrapper {
    position: relative;
    display: inline-flex;
    vertical-align: middle;
    flex-shrink: 0;
  }

  /* Badge container (for count/dot badges) */
  style badge {
    position: absolute;
    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: center;
    align-content: center;
    align-items: center;
    box-sizing: border-box;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
    font-weight: 400;
    white-space: nowrap;
    text-align: center;
    background: #{getVariantColor()};
    color: #{textColor};
    box-shadow: 0 0 0 1px #fff;
    z-index: 10;

    /* Positioning */
    if position == "topRight" {
      top: 0;
      right: 0;
      transform: translate(50%, -50%);
      transform-origin: 100% 0%;
    } else if position == "topLeft" {
      top: 0;
      left: 0;
      transform: translate(-50%, -50%);
      transform-origin: 0% 0%;
    } else if position == "bottomRight" {
      bottom: 0;
      right: 0;
      transform: translate(50%, 50%);
      transform-origin: 100% 100%;
    } else if position == "bottomLeft" {
      bottom: 0;
      left: 0;
      transform: translate(-50%, 50%);
      transform-origin: 0% 100%;
    }

    /* Size variants */
    if size == "small" {
      height: 18px;
      padding: 0 6px;
      font-size: 12px;
      line-height: 18px;
      border-radius: 9px;
      min-width: 18px;
    } else if size == "large" {
      height: 24px;
      padding: 0 10px;
      font-size: 14px;
      line-height: 24px;
      border-radius: 12px;
      min-width: 24px;
    } else {
      height: 20px;
      padding: 0 8px;
      font-size: 12px;
      line-height: 20px;
      border-radius: 10px;
      min-width: 20px;
    }
  }

  /* Dot style */
  style dot {
    position: absolute;
    width: 6px;
    height: 6px;
    background: #{getVariantColor()};
    border-radius: 100%;
    box-shadow: 0 0 0 1px #fff;
    z-index: 10;

    /* Positioning */
    if position == "topRight" {
      top: 0;
      right: 0;
      transform: translate(50%, -50%);
    } else if position == "topLeft" {
      top: 0;
      left: 0;
      transform: translate(-50%, -50%);
    } else if position == "bottomRight" {
      bottom: 0;
      right: 0;
      transform: translate(50%, 50%);
    } else if position == "bottomLeft" {
      bottom: 0;
      left: 0;
      transform: translate(-50%, 50%);
    }
  }

  /* Standalone badge (status badge / tag) */
  style standaloneBadge {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0 8px;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
    font-weight: 400;
    white-space: nowrap;
    text-align: center;
    background: #{getVariantColor()};
    color: #{textColor};
    border-radius: 2px;
    line-height: 20px;
    font-size: 12px;
    height: 20px;

    if size == "small" {
      font-size: 11px;
      height: 18px;
      line-height: 18px;
      padding: 0 6px;
    } else if size == "large" {
      font-size: 14px;
      height: 24px;
      line-height: 24px;
      padding: 0 10px;
    }
  }

  /* Render */
  fun render : Html {
    if standalone {
      /* Standalone badge (status/tag) */
      <span::standaloneBadge>
        {text}
      </span>
    } else {
      /* Badge with children */
      if shouldShowBadge() {
        <span::wrapper>
          {children}

          if dot {
            <span::dot style={getOffsetStyles()}/>
          } else {
            <span::badge style={getOffsetStyles()}>
              {getDisplayCount()}
            </span>
          }
        </span>
      } else {
        <span::wrapper>
          {children}
        </span>
      }
    }
  }
}
