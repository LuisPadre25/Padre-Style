/*
StatusDot - Professional status indicator component
 * Mobile-first and fully responsive
 * Based on Ant Design and Material UI standards
*/
component StatusDot {
  /* Core properties */
  property status : String = "default"

  // online, offline, away, busy, dnd, processing, success, error, warning, default
  property size : String = "default"

  // small, default, large
  property pulse : Bool = false

  property animation : String = "none"

  // none, pulse, ping, bounce

  /* Label */
  property text : String = ""

  property showText : Bool = false

  /* Styling */
  property color : String = ""

  // custom color override
  property bordered : Bool = false

  property borderColor : String = "#fff"

  /* Get status color */
  fun getStatusColor : String {
    if String.isNotEmpty(color) {
      color
    } else {
      case status {
        "online" => "#52c41a"
        "offline" => "#d9d9d9"
        "away" => "#faad14"
        "busy" => "#ff4d4f"
        "dnd" => "#722ed1"
        "processing" => "#1890ff"
        "success" => "#52c41a"
        "error" => "#ff4d4f"
        "warning" => "#faad14"
        "default" => "#d9d9d9"
        => "#d9d9d9"
      }
    }
  }

  /* Get size in pixels - Mobile-first */
  fun getDotSize : String {
    case size {
      "small" => "6px"
      "large" => "10px"
      => "8px"

      // default
    }
  }

  /* Get desktop size (larger for better visibility) */
  fun getDesktopDotSize : String {
    case size {
      "small" => "8px"
      "large" => "12px"
      => "10px"

      // default
    }
  }

  /* Dot style */
  style dot {
    display: inline-block;
    border-radius: 50%;
    flex-shrink: 0;
    background: #{getStatusColor()};
    transition: all 0.3s ease;

    /* Mobile-first sizing (touch-friendly) */
    width: #{getDotSize()};
    height: #{getDotSize()};
    min-width: #{getDotSize()};
    min-height: #{getDotSize()};

    /* Border for contrast */
    if bordered {
      box-shadow: 0 0 0 2px #{borderColor};
    }

    /* Smooth shadow for depth */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.15);

    /* Animations */
    if pulse || animation == "pulse" {
      animation: status-pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
    }

    if animation == "ping" {
      position: relative;

      &::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        border-radius: 50%;
        background: #{getStatusColor()};
        opacity: 0.75;
        animation: status-ping 1.5s cubic-bezier(0, 0, 0.2, 1) infinite;
      }
    }

    if animation == "bounce" {
      animation: status-bounce 1s ease infinite;
    }

    /* Tablet (641px - 1024px) */
    @media (min-width: 641px) and (max-width: 1024px) {
      width: calc(#{getDotSize()}* 1.2);
      height: calc(#{getDotSize()}* 1.2);
      min-width: calc(#{getDotSize()}* 1.2);
      min-height: calc(#{getDotSize()}* 1.2);
    }

    /* Desktop (1025px+) */
    @media (min-width: 1025px) {
      width: #{getDesktopDotSize()};
      height: #{getDesktopDotSize()};
      min-width: #{getDesktopDotSize()};
      min-height: #{getDesktopDotSize()};

      &:hover {
        transform: scale(1.15);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.25);
      }
    }
  }

  /* Container for dot + text */
  style container {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    vertical-align: middle;
  }

  /* Text label */
  style label {
    font-size: 14px;
    line-height: 1.5;
    color: rgba(0, 0, 0, 0.85);
    user-select: none;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Helvetica Neue', Arial, sans-serif;
    font-weight: 400;

    /* Mobile - slightly smaller */
    @media (max-width: 640px) {
      font-size: 13px;
    }

    /* Desktop - original size */
    @media (min-width: 1025px) {
      font-size: 14px;
    }
  }

  /* Render */
  fun render : Html {
    <>
      <style>
        "@keyframes status-pulse { 0%, 100% { opacity: 1; } 50% { opacity: 0.5; } }
         @keyframes status-ping { 0% { transform: scale(1); opacity: 0.75; } 75%, 100% { transform: scale(2); opacity: 0; } }
         @keyframes status-bounce { 0%, 100% { transform: translateY(0); } 50% { transform: translateY(-25%); } }"
      </style>

      if showText && String.isNotEmpty(text) {
        <span::container>
          <span::dot/>

          <span::label>
            {
              text
            }
          </span>
        </span>
      } else {
        <span::dot/>
      }
    </>
  }
}
