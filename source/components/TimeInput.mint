/* Time Input Component */
component TimeInput {
  property value : String = ""
  property placeholder : String = "Select time"
  property disabled : Bool = false
  property min : String = ""
  property max : String = ""
  property step : String = "60"
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: 100%;
  }

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
    cursor: pointer;

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }

    &::placeholder {
      color: #9ca3af;
    }
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
    "
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    /* NOTE: showPicker() is a browser API not available in pure Mint.
       The time input will still work, users just need to click twice
       on some browsers to open the picker. */
    Promise.never()
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <input::input
        type="time"
        value={value}
        placeholder={placeholder}
        disabled={disabled}
        min={min}
        max={max}
        step={step}
        onChange={onChange}
        onClick={handleClick}
      />
    </div>
  }
}
