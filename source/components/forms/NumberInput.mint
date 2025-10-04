/* Number Input Component - with increment/decrement buttons */
component NumberInput {
  property value : Number = 0
  property min : Number = 0
  property max : Number = 100
  property step : Number = 1
  property label : String = ""
  property helperText : String = ""
  property disabled : Bool = false
  property onChange = (newValue : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
    width: 100%;
  }

  style label {
    font-size: 0.875rem;
    font-weight: 600;
    margin-bottom: 0.25rem;
  }

  style inputWrapper {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    width: 100%;
  }

  style button {
    width: 2.5rem;
    height: 2.5rem;
    border: 2px solid;
    border-radius: 8px;
    color: white;
    font-size: 1.25rem;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    outline: none;

    &:hover {
      transform: scale(1.05);
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
    border: 2px solid;
    border-radius: 8px;
    font-family: inherit;
    font-size: 1.125rem;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    outline: none;
    background: transparent;

    &:focus {
      outline: none;
    }
  }

  style helper {
    font-size: 0.75rem;
    margin-top: 0.25rem;
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getButtonStyles : String {
    "
      background: #{ThemeHelpers.getAccent(currentTheme)};
      border-color: #{ThemeHelpers.getAccent(currentTheme)};

      &:hover {
        box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
      }
    "
  }

  fun getInputStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};

      &:focus {
        border-color: #{ThemeHelpers.getAccent(currentTheme)};
        box-shadow: #{ThemeHelpers.getFocusRing(currentTheme)};
      }
    "
  }

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
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
      if String.size(label) > 0 {
        <div::label style={getLabelStyles()}>
          {label}
        </div>
      } else {
        <></>
      }

      <div::inputWrapper>
        <button::button
          onClick={decrement}
          disabled={disabled || value <= min}
          type="button"
          style={getButtonStyles()}
        >"-"</button>

        <input::input
          type="number"
          value={Number.toString(value)}
          disabled={disabled}
          onChange={handleInputChange}
          style={getInputStyles()}
        />

        <button::button
          onClick={increment}
          disabled={disabled || value >= max}
          type="button"
          style={getButtonStyles()}
        >"+"</button>
      </div>

      if String.size(helperText) > 0 {
        <div::helper style={getHelperStyles()}>
          {helperText}
        </div>
      } else {
        <></>
      }
    </div>
  }
}
