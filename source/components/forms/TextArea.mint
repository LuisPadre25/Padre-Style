/* TextArea - Multiline text input component */
component TextArea {
  property value : String = ""
  property placeholder : String = ""
  property disabled : Bool = false
  property validation : String = ""
  property label : String = ""
  property helperText : String = ""
  property rows : Number = 4
  property maxLength : Number = 0
  property resize : String = "vertical"
  property fullWidth : Bool = false
  property onChange = (value : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

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

  style textareaWrapper {
    position: relative;
    display: flex;
    flex-direction: column;
  }

  style textarea {
    border-radius: 8px;
    border: 2px solid;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    font-family: inherit;
    outline: none;
    line-height: 1.5;
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
  }

  style validationText {
    font-size: 0.75rem;
    margin-top: 0.25rem;
    color: #f56565;
  }

  style charCount {
    font-size: 0.75rem;
    text-align: right;
    margin-top: 0.25rem;
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

  fun getTextAreaStyles : String {
    let baseStyles =
      "
        background: #{ThemeHelpers.getSurface(currentTheme)};
        color: #{ThemeHelpers.getTextPrimary(currentTheme)};
        padding: 0.75rem;
        font-size: 1rem;
      "

    let hasValidation =
      String.size(validation) > 0

    let borderColor =
      if hasValidation {
        "#f56565"
      } else {
        if isFocused {
          ThemeHelpers.getAccent(currentTheme)
        } else {
          ThemeHelpers.getBorderPrimary(currentTheme)
        }
      }

    let boxShadow =
      if isFocused {
        "box-shadow: #{ThemeHelpers.getFocusRing(currentTheme)};"
      } else {
        "box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};"
      }

    let resizeStyle =
      if resize == "none" {
        "resize: none;"
      } else {
        if resize == "horizontal" {
          "resize: horizontal;"
        } else {
          if resize == "both" {
            "resize: both;"
          } else {
            "resize: vertical;"
          }
        }
      }

    let widthStyles =
      if fullWidth {
        "width: 100%;"
      } else {
        "min-width: 300px;"
      }

    "
      #{baseStyles}
      border-color: #{borderColor};
      #{boxShadow}
      #{resizeStyle}
      #{widthStyles}
    "
  }

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun getErrorStyles : String {
    "color: #f56565;"
  }

  fun getCharCountStyles : String {
    let currentLength = String.size(value)
    let color =
      if maxLength > 0 && currentLength > maxLength {
        "#f56565"
      } else {
        ThemeHelpers.getTextSecondary(currentTheme)
      }

    "color: #{color};"
  }

  fun handleInput (event : Html.Event) : Promise(Void) {
    `
    (() => {
      const value = #{event}.target.value;
      return #{onChange(`value` as String)};
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

      <div::textareaWrapper>
        <textarea::textarea
          value={value}
          placeholder=""
          disabled={disabled}
          rows={Number.toString(rows)}
          style={getTextAreaStyles()}
          onInput={handleInput}
          onFocus={handleFocus}
          onBlur={handleBlur}
        />
      </div>

      if String.size(validation) > 0 {
        <div::validationText style={getErrorStyles()}>
          {validation}
        </div>
      } else {
        <></>
      }

      if String.size(helperText) > 0 {
        <div::helper style={getHelperStyles()}>
          {helperText}
        </div>
      } else {
        <></>
      }

      if maxLength > 0 {
        <div::charCount style={getCharCountStyles()}>
          Number.toString(String.size(value))
          <> " / " </>
          Number.toString(maxLength)
        </div>
      } else {
        <></>
      }
    </div>
  }
}
