/* ProgressBar - Simple reusable progress bar component */
component ProgressBar {
  property percentage : Number = 0
  property height : String = "4px"
  property color : String = ""
  property backgroundColor : String = ""
  property animated : Bool = false
  property showLabel : Bool = false

  connect ThemeStore exposing { currentTheme }

  style container {
    width: 100%;
    border-radius: clamp(6px, 2vw, 10px);
    overflow: hidden;
    position: relative;
    min-height: 2px;

    @media (max-width: 640px) {
      border-radius: 6px;
    }
  }

  style bar {
    height: 100%;
    border-radius: clamp(6px, 2vw, 10px);
    transition: width 0.4s ease;
    position: relative;
    min-width: 0;

    @media (max-width: 640px) {
      border-radius: 6px;
    }
  }

  style label {
    position: absolute;
    right: clamp(0.25rem, 1vw, 0.5rem);
    top: 50%;
    transform: translateY(-50%);
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 600;
    color: white;
    white-space: nowrap;

    @media (max-width: 640px) {
      font-size: 0.625rem;
      right: 0.25rem;
    }
  }

  fun getContainerStyles : String {
    let bgColor =
      if String.isEmpty(backgroundColor) {
        ThemeHelpers.getBorderPrimary(currentTheme)
      } else {
        backgroundColor
      }

    "
      height: #{height};
      background: #{bgColor};
    "
  }

  fun getBarStyles : String {
    let barColor =
      if String.isEmpty(color) {
        ThemeHelpers.getAccent(currentTheme)
      } else {
        color
      }

    let animation =
      if animated {
        "animation: progressPulse 1.5s ease-in-out infinite;"
      } else {
        ""
      }

    let safePercentage =
      if percentage > 100 {
        100
      } else {
        if percentage < 0 {
          0
        } else {
          percentage
        }
      }

    "
      background: #{barColor};
      width: #{Number.toString(safePercentage)}%;
      #{animation}
    "
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::bar style={getBarStyles()}>
        {
          if showLabel && percentage > 10 {
            <span::label>
              Number.toString(percentage)
              <> "%"</>
            </span>
          } else {
            <></>
          }
        }
      </div>
    </div>
  }
}
