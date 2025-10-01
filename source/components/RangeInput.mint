/* Range Input Component - Dual Slider */
component RangeInput {
  property minValue : Number = 20
  property maxValue : Number = 80
  property min : Number = 0
  property max : Number = 100
  property step : Number = 1
  property disabled : Bool = false
  property onChange = (minVal : Number, maxVal : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 1rem;
  }

  style sliderWrapper {
    position: relative;
    width: 100%;
    height: 40px;
    display: flex;
    align-items: center;
  }

  style track {
    position: absolute;
    width: 100%;
    height: 8px;
    border-radius: 4px;
    background: rgba(255, 255, 255, 0.2);
    pointer-events: none;
  }

  style progress {
    position: absolute;
    height: 8px;
    border-radius: 4px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    pointer-events: none;
  }

  style slider {
    position: absolute;
    width: 100%;
    height: 20px;
    background: transparent;
    outline: none;
    cursor: pointer;
    -webkit-appearance: none;
    z-index: 10;
    margin: 0;
    padding: 0;
    pointer-events: none;

    &::-webkit-slider-thumb {
      -webkit-appearance: none;
      appearance: none;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(102, 126, 234, 0.4);
      pointer-events: auto;
      z-index: 20;
    }

    &::-webkit-slider-thumb:hover {
      transform: scale(1.2);
    }

    &::-moz-range-thumb {
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(102, 126, 234, 0.4);
      border: none;
      pointer-events: auto;
    }

    &::-moz-range-thumb:hover {
      transform: scale(1.2);
    }
  }

  style valueDisplay {
    display: flex;
    justify-content: space-between;
    font-size: 1rem;
    font-weight: 600;
  }

  fun handleMinChange (event : Html.Event) : Promise(Void) {
    let newMin =
      event.target
      |> Dom.getValue
      |> Number.fromString
      |> Maybe.withDefault(minValue)

    if (newMin < maxValue) {
      onChange(newMin, maxValue)
    } else {
      Promise.never()
    }
  }

  fun handleMaxChange (event : Html.Event) : Promise(Void) {
    let newMax =
      event.target
      |> Dom.getValue
      |> Number.fromString
      |> Maybe.withDefault(maxValue)

    if (newMax > minValue) {
      onChange(minValue, newMax)
    } else {
      Promise.never()
    }
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getProgressStyles : String {
    let range = max - min
    let leftPercent = ((minValue - min) / range) * 100
    let widthPercent = ((maxValue - minValue) / range) * 100
    "left: #{Number.toString(leftPercent)}%; width: #{Number.toString(widthPercent)}%;"
  }

  fun render : Html {
    <div::container>
      <div::valueDisplay style={getValueStyles()}>
        <span>Number.toString(minValue)</span>
        <span>Number.toString(maxValue)</span>
      </div>

      <div::sliderWrapper>
        <div::track></div>
        <div::progress style={getProgressStyles()}></div>

        <input::slider
          type="range"
          min={Number.toString(min)}
          max={Number.toString(max)}
          step={Number.toString(step)}
          value={Number.toString(minValue)}
          disabled={disabled}
          onInput={handleMinChange}
          onChange={handleMinChange}/>

        <input::slider
          type="range"
          min={Number.toString(min)}
          max={Number.toString(max)}
          step={Number.toString(step)}
          value={Number.toString(maxValue)}
          disabled={disabled}
          onInput={handleMaxChange}
          onChange={handleMaxChange}
          style="z-index: 11;"/>
      </div>
    </div>
  }
}
