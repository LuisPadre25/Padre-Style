/* Number Input Component - with increment/decrement buttons */
component NumberInput {
  property value : Number = 0
  property min : Number = 0
  property max : Number = 100
  property step : Number = 1
  property disabled : Bool = false
  property onChange = (newValue : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    width: 100%;
  }

  style button {
    width: 2.5rem;
    height: 2.5rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    font-size: 1.25rem;
    cursor: pointer;
    transition: all 0.3s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;

    &:hover {
      transform: scale(1.05);
      box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
    }

    &:disabled {
      opacity: 0.5;
      cursor: not-allowed;
      transform: scale(1);
    }
  }

  style input {
    flex: 1;
    text-align: center;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: inherit;
    font-size: 1.125rem;
    font-weight: 600;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
  }

  fun increment (event : Html.Event) : Promise(Void) {
    if value + step <= max {
      onChange(value + step)
    } else {
      Promise.never()
    }
  }

  fun decrement (event : Html.Event) : Promise(Void) {
    if value - step >= min {
      onChange(value - step)
    } else {
      Promise.never()
    }
  }

  fun handleInputChange (event : Html.Event) : Promise(Void) {
    let newValue =
      event.target
      |> Dom.getValue
      |> Number.fromString
      |> Maybe.withDefault(value)

    if newValue >= min && newValue <= max {
      onChange(newValue)
    } else {
      Promise.never()
    }
  }

  fun render : Html {
    <div::container>
      <button::button
        onClick={decrement}
        disabled={disabled || value <= min}
        type="button"
      >"-"</button>

      <input::input
        type="number"
        value={Number.toString(value)}
        disabled={disabled}
        onChange={handleInputChange}
      />

      <button::button
        onClick={increment}
        disabled={disabled || value >= max}
        type="button"
      >"+"</button>
    </div>
  }
}
