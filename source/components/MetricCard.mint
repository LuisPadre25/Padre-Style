/* Metric Card Component - Reuses Progress and Badge */
component MetricCard {
  property label : String = ""
  property current : Number = 0
  property target : Number = 100
  property unit : String = ""
  property variant : String = "primary"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: 1.5rem;
    border-radius: 12px;
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  style label {
    font-size: 0.875rem;
    font-weight: 500;
  }

  style values {
    display: flex;
    align-items: baseline;
    gap: 0.5rem;
  }

  style currentValue {
    font-size: 2rem;
    font-weight: 700;
  }

  style targetValue {
    font-size: 1rem;
    opacity: 0.6;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
    "
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getCurrentValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getTargetValueStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getPercentage : Number {
    if target > 0 {
      (current / target) * 100
    } else {
      0
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::header><div::label style={getLabelStyles()}>label</div></div>

      <div::values>
        <span::currentValue style={getCurrentValueStyles()}>
          Number.toString(current)
        </span>

        <span::targetValue style={getTargetValueStyles()}>
          "/ #{Number.toString(target)} #{unit}"
        </span>
      </div>

      <Progress value={getPercentage()} variant={variant} showLabel={true}/>
    </div>
  }
}
