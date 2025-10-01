/* Donut Chart Component */
component DonutChart {
  property value : Number = 75
  property max : Number = 100
  property size : Number = 120
  property thickness : Number = 12
  property color : String = "#667eea"
  property label : String = ""
  property showPercentage : Bool = true

  connect ThemeStore exposing { currentTheme }

  style container {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    gap: 1rem;
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
  }

  style donutWrapper {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: center;
  }

  style centerText {
    position: absolute;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
  }

  style percentage {
    font-size: 1.5rem;
    font-weight: 800;
    line-height: 1;
  }

  style label {
    font-size: 0.75rem;
    font-weight: 500;
    margin-top: 0.25rem;
    text-align: center;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getPercentageStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getPercentage : Number {
    (value / max) * 100
  }

  fun getRadius : Number {
    (size / 2) - thickness
  }

  fun getCircumference : Number {
    2 * 3.14159 * getRadius()
  }

  fun getStrokeDashoffset : Number {
    let circumference =
      getCircumference()

    let progress =
      getPercentage()

    circumference - (progress / 100) * circumference
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::donutWrapper>
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

        <div::centerText>
          {
            if showPercentage {
              <div::percentage style={getPercentageStyles()}>
                "#{Number.toString(Math.floor(getPercentage()))}%"
              </div>
            } else {
              <div/>
            }
          }

          {
            if !String.isEmpty(label) {
              <div::label style={getLabelStyles()}>label</div>
            } else {
              <div/>
            }
          }
        </div>
      </div>
    </div>
  }
}
