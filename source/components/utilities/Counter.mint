/* Counter Component */
component Counter {
  property value : Number = 0
  property min : Number = 0
  property max : Number = 100
  property step : Number = 1
  property onChange = (val : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  fun increment : Promise(Void) {
    if value < max {
      onChange(value + step)
    } else {
      Promise.never()
    }
  }

  fun decrement : Promise(Void) {
    if value > min {
      onChange(value - step)
    } else {
      Promise.never()
    }
  }

  style counter {
    display: inline-flex;
    align-items: center;
    gap: 0.5rem;
    border-radius: 8px;
    padding: 0.5rem;
  }

  style button {
    width: 2rem;
    height: 2rem;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 1.25rem;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
  }

  style value {
    min-width: 3rem;
    text-align: center;
    font-weight: 600;
    font-size: 1rem;
  }

  fun getCounterStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      border: 1px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  fun getButtonStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      color: #{ThemeHelpers.getTextInverse(currentTheme)};
    "
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun render : Html {
    <div::counter style={getCounterStyles()}>
      <button::button
        style={getButtonStyles()}
        onClick={(e : Html.Event) { decrement() }}
      >"-"</button>

      <span::value style={getValueStyles()}>
        {
          Number.toString(value)
        }
      </span>

      <button::button
        style={getButtonStyles()}
        onClick={(e : Html.Event) { increment() }}
      >"+"</button>
    </div>
  }
}
