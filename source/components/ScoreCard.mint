/* Score Card Component */
component ScoreCard {
  property score : Number = 85
  property maxScore : Number = 100
  property title : String = "Score"
  property grade : String = "A"
  property color : String = "#10b981"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 20px;
    text-align: center;
    position: relative;
    overflow: hidden;
    max-width: 100%;
  }

  style backgroundCircle {
    position: absolute;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    opacity: 0.1;
    top: -50%;
    left: 50%;
    transform: translateX(-50%);
  }

  style content {
    position: relative;
    z-index: 1;
  }

  style title {
    font-size: clamp(0.625rem, 1.5vw, 0.875rem);
    font-weight: 600;
    margin-bottom: clamp(0.75rem, 2vw, 1rem);
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  style scoreDisplay {
    font-size: clamp(2.5rem, 6vw, 4rem);
    font-weight: 900;
    line-height: 1;
    margin-bottom: 0.5rem;
  }

  style maxScore {
    font-size: clamp(1rem, 2vw, 1.25rem);
    font-weight: 600;
    opacity: 0.6;
  }

  style grade {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: clamp(48px, 10vw, 60px);
    height: clamp(48px, 10vw, 60px);
    border-radius: 50%;
    font-size: clamp(1.25rem, 3vw, 1.75rem);
    font-weight: 900;
    margin-top: clamp(0.75rem, 2vw, 1rem);
    color: white;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowHeavy(currentTheme)};
    "
  }

  fun getBackgroundCircleStyles : String {
    "background: #{color};"
  }

  fun getTitleStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getScoreDisplayStyles : String {
    "color: #{color};"
  }

  fun getMaxScoreStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getGradeStyles : String {
    "background: #{color}; box-shadow: 0 4px 16px #{color}66;"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::backgroundCircle style={getBackgroundCircleStyles()}/>

      <div::content>
        <div::title style={getTitleStyles()}>title</div>

        <div::scoreDisplay style={getScoreDisplayStyles()}>
          Number.toString(score)
        </div>

        <div::maxScore style={getMaxScoreStyles()}>
          "/ #{Number.toString(maxScore)}"
        </div>

        {
          if !String.isEmpty(grade) {
            <div::grade style={getGradeStyles()}>grade</div>
          } else {
            <div/>
          }
        }
      </div>
    </div>
  }
}
