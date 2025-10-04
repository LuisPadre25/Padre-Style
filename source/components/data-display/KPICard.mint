/* KPI Card Component */
component KPICard {
  property title : String = "KPI"
  property value : String = "0"
  property target : String = "100"
  property unit : String = ""
  property progress : Number = 0
  property trend : String = "+0%"
  property trendDirection : String = "up"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: clamp(1rem, 3vw, 2rem);
    border-radius: 20px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    max-width: 100%;
  }

  style backgroundGradient {
    position: absolute;
    top: -50%;
    right: -50%;
    width: 200%;
    height: 200%;
    opacity: 0.05;
    border-radius: 50%;
  }

  style content {
    position: relative;
    z-index: 1;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: clamp(0.75rem, 2vw, 1.5rem);
    flex-wrap: wrap;
    gap: 0.5rem;
  }

  style title {
    font-size: clamp(0.75rem, 1.5vw, 0.875rem);
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  style trendBadge {
    padding: 0.25rem 0.625rem;
    border-radius: 12px;
    font-size: clamp(0.625rem, 1.2vw, 0.75rem);
    font-weight: 700;
  }

  style valueSection {
    margin-bottom: clamp(0.75rem, 2vw, 1.5rem);
  }

  style mainValue {
    font-size: 2.5rem;
    font-weight: 800;
    line-height: 1;
    letter-spacing: -0.02em;
  }

  style targetText {
    font-size: 0.875rem;
    margin-top: 0.5rem;
  }

  style progressBar {
    height: 8px;
    border-radius: 10px;
    overflow: hidden;
    position: relative;
  }

  style progressFill {
    height: 100%;
    border-radius: 10px;
    transition: width 0.6s cubic-bezier(0.4, 0, 0.2, 1);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  fun getBackgroundGradientStyles : String {
    let color =
      case trendDirection {
        "up" => "#10b981"
        "down" => "#ef4444"
        _ => "#667eea"
      }

    "background: #{color};"
  }

  fun getTitleStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getTrendBadgeStyles : String {
    case trendDirection {
      "up" => "background: rgba(16, 185, 129, 0.15); color: #10b981;"
      "down" => "background: rgba(239, 68, 68, 0.15); color: #ef4444;"

      _ =>
        "background: #{ThemeHelpers.getSurface(currentTheme)}; color: #{ThemeHelpers.getTextSecondary(
          currentTheme)};"
    }
  }

  fun getMainValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getTargetTextStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getProgressBarStyles : String {
    "background: #{ThemeHelpers.getSurface(currentTheme)};"
  }

  fun getProgressFillStyles : String {
    let color =
      case trendDirection {
        "up" => "#10b981"
        "down" => "#ef4444"
        _ => "#667eea"
      }

    "background: #{color}; width: #{Number.toString(progress)}%;"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::backgroundGradient style={getBackgroundGradientStyles()}/>

      <div::content>
        <div::header>
          <div::title style={getTitleStyles()}>title</div>
          <div::trendBadge style={getTrendBadgeStyles()}>trend</div>
        </div>

        <div::valueSection>
          <div::mainValue style={getMainValueStyles()}>"#{value}#{unit}"</div>

          <div::targetText style={getTargetTextStyles()}>
            "of #{target}#{unit} target"
          </div>
        </div>

        <div::progressBar style={getProgressBarStyles()}>
          <div::progressFill style={getProgressFillStyles()}/>
        </div>
      </div>
    </div>
  }
}
