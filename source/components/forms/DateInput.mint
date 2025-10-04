/* Date Input Component */
component DateInput {
  property value : String = ""
  property placeholder : String = "Select date"
  property label : String = ""
  property helperText : String = ""
  property disabled : Bool = false
  property min : String = ""
  property max : String = ""
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

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
    position: relative;
    width: 100%;
  }

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid;
    border-radius: 8px;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    outline: none;
    background: transparent;
    box-sizing: border-box;
    cursor: pointer;

    &:focus {
      outline: none;
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }

    &::placeholder {
      color: #9ca3af;
    }
  }

  style helper {
    font-size: 0.75rem;
    margin-top: 0.25rem;
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
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
        <input::input
          type="date"
          value={value}
          placeholder={placeholder}
          disabled={disabled}
          min={min}
          max={max}
          onChange={onChange}
          style={getInputStyles()}
        />
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
