/* Slider Component - Range Input */
component SliderInput {
  property value : Number = 50
  property min : Number = 0
  property max : Number = 100
  property step : Number = 1
  property disabled : Bool = false
  property showValue : Bool = true
  property onChange = (newValue : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }

  style sliderWrapper {
    position: relative;
    width: 100%;
    height: 20px;
    display: flex;
    align-items: center;
    cursor: pointer;
  }

  style track {
    position: absolute;
    width: 100%;
    height: 8px;
    border-radius: 4px;
    background: rgba(255, 255, 255, 0.2);
    pointer-events: none;
    top: 50%;
    transform: translateY(-50%);
  }

  style progress {
    position: absolute;
    height: 8px;
    border-radius: 4px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    pointer-events: none;
    top: 50%;
    transform: translateY(-50%);
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

    &::-webkit-slider-thumb {
      -webkit-appearance: none;
      appearance: none;
      width: 20px;
      height: 20px;
      border-radius: 50%;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      cursor: pointer;
      box-shadow: 0 2px 8px rgba(102, 126, 234, 0.4);
      transition: transform 0.2s ease;
      margin-top: -6px;
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
      transition: transform 0.2s ease;
    }

    &::-moz-range-thumb:hover {
      transform: scale(1.2);
    }

    &::-webkit-slider-runnable-track {
      background: transparent;
      height: 8px;
      border: none;
    }

    &::-moz-range-track {
      background: transparent;
      height: 8px;
      border: none;
    }
  }

  style valueDisplay {
    text-align: center;
    font-size: 1.125rem;
    font-weight: 600;
    color: rgba(255, 255, 255, 0.95);
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    let newValue =
      event.target
      |> Dom.getValue
      |> Number.fromString
      |> Maybe.withDefault(value)

    onChange(newValue)
  }

  fun handleInput (event : Html.Event) : Promise(Void) {
    let newValue =
      event.target
      |> Dom.getValue
      |> Number.fromString
      |> Maybe.withDefault(value)

    onChange(newValue)
  }

  fun getValueStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getProgressWidth : String {
    let range =
      max - min

    if range > 0 {
      let percentage =
        ((value - min) / range) * 100

      "#{Number.toString(percentage)}%"
    } else {
      "0%"
    }
  }

  fun getProgressStyles : String {
    "width: #{getProgressWidth()};"
  }

  fun render : Html {
    <div::container>
      {
        if showValue {
          <div::valueDisplay style={getValueStyles()}>Number.toString(value)</div>
        } else {
          <div/>
        }
      }

      <div::sliderWrapper>
        <div::track/>
        <div::progress style={getProgressStyles()}/>

        <input::slider
          type="range"
          min={Number.toString(min)}
          max={Number.toString(max)}
          step={Number.toString(step)}
          value={Number.toString(value)}
          disabled={disabled}
          onInput={handleInput}
          onChange={handleChange}
        />
      </div>
    </div>
  }
}
