/* Comparison Card Component */
component ComparisonCard {
  property title : String = "Comparison"
  property currentValue : String = "0"
  property previousValue : String = "0"
  property currentLabel : String = "Current"
  property previousLabel : String = "Previous"

  connect ThemeStore exposing { currentTheme }

  style container {
    padding: clamp(0.75rem, 2vw, 1.5rem);
    border-radius: 16px;
    max-width: 100%;
    overflow: hidden;
  }

  style title {
    font-size: clamp(0.625rem, 1.5vw, 0.875rem);
    font-weight: 600;
    margin-bottom: clamp(1rem, 2vw, 1.5rem);
  }

  style comparison {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
    gap: clamp(0.75rem, 2vw, 1rem);
  }

  style valueBox {
    padding: clamp(0.75rem, 2vw, 1.25rem);
    border-radius: 12px;
    text-align: center;
  }

  style valueLabel {
    font-size: clamp(0.625rem, 1.5vw, 0.75rem);
    font-weight: 500;
    margin-bottom: 0.5rem;
  }

  style value {
    font-size: clamp(1.5rem, 3vw, 2rem);
    font-weight: 800;
    line-height: 1;
  }

  style differenceBar {
    margin-top: clamp(1rem, 2vw, 1.5rem);
    height: 6px;
    border-radius: 10px;
    overflow: hidden;
    position: relative;
    max-width: 100%;
  }

  style differenceFill {
    height: 100%;
    border-radius: 10px;
    transition: width 0.4s ease;
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  fun getTitleStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getCurrentBoxStyles : String {
    "
      background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
      border: 2px solid rgba(102, 126, 234, 0.3);
    "
  }

  fun getPreviousBoxStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getValueLabelStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getDifferenceBarStyles : String {
    "background: #{ThemeHelpers.getSurface(currentTheme)};"
  }

  fun getDifferenceFillStyles : String {
    "background: linear-gradient(90deg, #667eea 0%, #764ba2 100%); width: 75%;"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::title style={getTitleStyles()}>title</div>

      <div::comparison>
        <div::valueBox style={getCurrentBoxStyles()}>
          <div::valueLabel style={getValueLabelStyles()}>currentLabel</div>
          <div::value style={getValueStyles()}>currentValue</div>
        </div>

        <div::valueBox style={getPreviousBoxStyles()}>
          <div::valueLabel style={getValueLabelStyles()}>previousLabel</div>
          <div::value style={getValueStyles()}>previousValue</div>
        </div>
      </div>

      <div::differenceBar style={getDifferenceBarStyles()}>
        <div::differenceFill style={getDifferenceFillStyles()}/>
      </div>
    </div>
  }
}
