/* TextInput - Basic text input component */
component TextInput {
  property value : String = ""
  property placeholder : String = ""
  property disabled : Bool = false
  property label : String = ""
  property helperText : String = ""
  property type : String = "text"
  property size : String = "medium"
  property fullWidth : Bool = false
  property onValueChange = (value : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state internalValue : String = ""
  state isFocused : Bool = false

  style container {
    display: flex;
    flex-direction: column;
    position: relative;
    padding-top: 0.5rem;
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

  style inputWrapper {
    position: relative;
    display: flex;
  }

  style input {
    border-radius: 8px;
    border: 2px solid;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    font-family: inherit;
    outline: none;
    background: transparent;

    &:disabled {
      cursor: not-allowed;
      opacity: 0.6;
    }
  }

  style helper {
    font-size: 0.75rem;
    margin-top: 0.5rem;
    min-height: 1rem;
    transition: color 0.2s ease;
  }

  fun getContainerStyles : String {
    if fullWidth {
      "width: 100%;"
    } else {
      ""
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

    let sizeStyles =
      if size == "small" {
        "padding: 0.375rem 0.75rem; font-size: 0.875rem;"
      } else {
        if size == "large" {
          "padding: 0.75rem 1rem; font-size: 1.125rem;"
        } else {
          "padding: 0.5rem 0.875rem; font-size: 1rem;"
        }
      }

    let widthStyles =
      if fullWidth {
        "width: 100%;"
      } else {
        ""
      }

    "
      #{baseStyles}
      border-color: #{borderColor};
      #{boxShadow}
      #{sizeStyles}
      #{widthStyles}
    "
  }

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun handleInput (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const value = #{event}.target.value;
      return #{next { internalValue: `value` as String }};
    })()
    `
  }

  fun handleFocus (event : Html.Event) : Promise(Void) {
    next { isFocused: true }
  }

  fun handleBlur (event : Html.Event) : Promise(Void) {
    next { isFocused: false }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <label::label style={getLabelStyles()}>
        {label}
      </label>

      <div::inputWrapper>
        <input::input
          type={type}
          value={value}
          placeholder=""
          disabled={disabled}
          style={getInputStyles()}
          onInput={handleInput}
          onFocus={handleFocus}
          onBlur={handleBlur}
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
