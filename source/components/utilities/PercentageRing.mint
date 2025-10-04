/* Percentage Ring Component */
component PercentageRing {
  property percentage : Number = 75
  property size : Number = 80
  property thickness : Number = 8
  property label : String = ""
  property color : String = "#667eea"
  property showValue : Bool = true

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    max-width: 100%;
  }

  style ringWrapper {
    position: relative;
    display: inline-flex;
  }

  style centerContent {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  style percentageValue {
    font-size: clamp(0.875rem, 2vw, 1rem);
    font-weight: 800;
    line-height: 1;
  }

  style label {
    font-size: clamp(0.625rem, 1.5vw, 0.7rem);
    font-weight: 500;
    text-align: center;
  }

  fun getPercentageValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getRadius : Number {
    (size / 2) - (thickness / 2)
  }

  fun getCircumference : Number {
    2 * 3.14159 * getRadius()
  }

  fun getStrokeDashoffset : Number {
    let circumference =
      getCircumference()

    circumference - ((percentage / 100) * circumference)
  }

  fun render : Html {
    <div::container>
      <div::ringWrapper>
        <svg
          width={Number.toString(size)}
          height={Number.toString(size)}
          viewBox="0 0 #{Number.toString(size)} #{Number.toString(size)}"
        >
          <circle
            cx={Number.toString(size / 2)}
            cy={Number.toString(size / 2)}
            r={Number.toString(getRadius())}
            fill="none"
            stroke={ThemeHelpers.getSurface(currentTheme)}
            stroke-width={Number.toString(thickness)}
          />

          <circle
            cx={Number.toString(size / 2)}
            cy={Number.toString(size / 2)}
            r={Number.toString(getRadius())}
            fill="none"
            stroke={color}
            stroke-width={Number.toString(thickness)}
            stroke-dasharray={Number.toString(getCircumference())}
            stroke-dashoffset={Number.toString(getStrokeDashoffset())}
            stroke-linecap="round"
            transform="rotate(-90 #{Number.toString(size / 2)} #{Number.toString(
              size / 2)})"
            style="transition: stroke-dashoffset 0.6s ease;"
          />
        </svg>

        {
          if showValue {
            <div::centerContent>
              <div::percentageValue style={getPercentageValueStyles()}>
                "#{Number.toString(Math.floor(percentage))}%"
              </div>
            </div>
          } else {
            <div/>
          }
        }
      </div>

      {
        if !String.isEmpty(label) {
          <div::label style={getLabelStyles()}>label</div>
        } else {
          <div/>
        }
      }
    </div>
  }
}
