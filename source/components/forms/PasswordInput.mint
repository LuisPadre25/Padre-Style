/* Password Input Component - with toggle visibility */
component PasswordInput {
  property placeholder : String = ""
  property value : String = ""
  property disabled : Bool = false
  property label : String = "Password"
  property helperText : String = ""
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state showPassword : Bool = false
  state isFocused : Bool = false

  style container {
    display: flex;
    flex-direction: column;
    position: relative;
    width: 100%;
    padding-top: 0.5rem;
  }

  style inputWrapper {
    position: relative;
    display: flex;
  }

  style label {
    position: absolute;
    left: 0.875rem;
    top: 0.875rem;
    font-size: 1rem;
    font-weight: 500;
    pointer-events: none;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    transform-origin: left top;
    z-index: 1;
  }

  style input {
    width: 100%;
    padding: 0.5rem 3rem 0.5rem 0.875rem;
    border: 2px solid;
    border-radius: 8px;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    outline: none;
    background: transparent;
    box-sizing: border-box;

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }
  }

  style helper {
    font-size: 0.75rem;
    margin-top: 0.5rem;
    min-height: 1rem;
  }

  style toggleButton {
    position: absolute;
    right: 0.75rem;
    top: 50%;
    transform: translateY(-50%);
    background: transparent;
    border: none;
    cursor: pointer;
    font-size: 1.25rem;
    padding: 0.25rem;
    color: #6b7280;
    transition: color 0.2s ease;

    &:hover {
      color: #667eea;
    }
  }

  fun getLabelStyles : String {
    let baseColor = ThemeHelpers.getTextSecondary(currentTheme)
    let focusColor = ThemeHelpers.getAccent(currentTheme)
    let hasValue = String.size(value) > 0

    let color =
      if isFocused {
        focusColor
      } else {
        baseColor
      }

    let transform =
      if isFocused || hasValue {
        "transform: translateY(-1.75rem) scale(0.85);"
      } else {
        "transform: translateY(0) scale(1);"
      }

    let fontWeight =
      if isFocused || hasValue {
        "font-weight: 600;"
      } else {
        "font-weight: 500;"
      }

    "
      color: #{color};
      #{transform}
      #{fontWeight}
    "
  }

  fun getInputStyles : String {
    let baseStyles =
      "
        background: #{ThemeHelpers.getSurface(currentTheme)};
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      "

    let borderColor =
      if isFocused {
        ThemeHelpers.getAccent(currentTheme)
      } else {
        ThemeHelpers.getBorderPrimary(currentTheme)
      }

    let boxShadow =
      if isFocused {
        "box-shadow: #{ThemeHelpers.getFocusRing(currentTheme)};"
      } else {
        "box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};"
      }

    "
      #{baseStyles}
      border-color: #{borderColor};
      #{boxShadow}
    "
  }

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun handleFocus (event : Html.Event) : Promise(Void) {
    next { isFocused: true }
  }

  fun handleBlur (event : Html.Event) : Promise(Void) {
    next { isFocused: false }
  }

  fun toggleVisibility (event : Html.Event) : Promise(Void) {
    next { showPassword: !showPassword }
  }

  fun render : Html {
    <div::container>
      <label::label style={getLabelStyles()}>
        {label}
      </label>

      <div::inputWrapper>
        <input::input
          type={
            if showPassword {
              "text"
            } else {
              "password"
            }
          }
          placeholder=""
          value={value}
          disabled={disabled}
          style={getInputStyles()}
          onChange={onChange}
          onFocus={handleFocus}
          onBlur={handleBlur}
        />

        <button::toggleButton onClick={toggleVisibility} type="button">
          {
            if showPassword {
              "🙈"
            } else {
              "👁️"
            }
          }
        </button>
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
