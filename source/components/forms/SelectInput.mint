/* Select/Dropdown Input Component */
component SelectInput {
  property options : Array(String) = []
  property value : String = ""
  property placeholder : String = "Select an option"
  property label : String = ""
  property helperText : String = ""
  property disabled : Bool = false
  property onChange = (value : String) : Promise(Void) { Promise.never() }

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

  style select {
    width: 100%;
    padding: 0.75rem 2.5rem 0.75rem 1rem;
    border: 2px solid;
    border-radius: 8px;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    outline: none;
    background: transparent;
    cursor: pointer;
    appearance: none;
    box-sizing: border-box;

    &:focus {
      outline: none;
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }
  }

  style iconWrapper {
    position: absolute;
    right: 1rem;
    top: 50%;
    transform: translateY(-50%);
    pointer-events: none;
    font-size: 1.25rem;
  }

  style helper {
    font-size: 0.75rem;
    margin-top: 0.25rem;
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    let newValue =
      event.target
      |> Dom.getValue

    onChange(newValue)
  }

  fun getSelectStyles : String {
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

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getIconStyles : String {
    "color: #{ThemeHelpers.getAccent(currentTheme)};"
  }

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun renderOption (option : String) : Html {
    <option value={option}>{option}</option>
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
        <select::select
          value={value}
          disabled={disabled}
          onChange={handleChange}
          style={getSelectStyles()}
        >
          <option value="" disabled={true}>{placeholder}</option>

          {
            for option of options {
              renderOption(option)
            }
          }
        </select>

        <div::iconWrapper style={getIconStyles()}>"▼"</div>
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
