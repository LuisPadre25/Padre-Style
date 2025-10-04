/* Radio Button Group Component */
component RadioGroup {
  property options : Array(String) = []
  property selectedValue : String = ""
  property name : String = "radio-group"
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

  style groupLabel {
    font-size: 0.875rem;
    font-weight: 600;
    margin-bottom: 0.25rem;
  }

  style optionsContainer {
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
    width: 100%;
  }

  style radioOption {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    padding: 0.75rem 1rem;
    border: 2px solid;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    background: transparent;

    &:hover {
      transform: translateX(4px);
    }
  }

  style helper {
    font-size: 0.75rem;
    margin-top: 0.25rem;
  }

  style selectedOption {
    border-color: #667eea;
    background: rgba(102, 126, 234, 0.1);
  }

  style radioInput {
    width: 20px;
    height: 20px;
    cursor: pointer;
    accent-color: #667eea;
  }

  style radioLabel {
    flex: 1;
    color: #374151;
    font-size: 1rem;
    cursor: pointer;
    user-select: none;
  }

  style selectedLabel {
    color: #667eea;
    font-weight: 600;
  }

  fun handleChange (value : String) : Promise(Void) {
    onChange(value)
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getOptionStyles (isSelected : Bool) : String {
    let borderColor =
      if isSelected {
        ThemeHelpers.getAccent(currentTheme)
      } else {
        ThemeHelpers.getBorderPrimary(currentTheme)
      }

    let bgColor =
      if isSelected {
        "background: rgba(102, 126, 234, 0.1);"
      } else {
        "background: #{ThemeHelpers.getSurface(currentTheme)};"
      }

    "
      border-color: #{borderColor};
      #{bgColor}
      &:hover {
        border-color: #{ThemeHelpers.getAccent(currentTheme)};
      }
    "
  }

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun renderOption (option : String) : Html {
    let isSelected =
      option == selectedValue

    <div::radioOption
      style={getOptionStyles(isSelected)}
      onClick={(event : Html.Event) : Promise(Void) { handleChange(option) }}
    >
      <input::radioInput
        type="radio"
        name={name}
        value={option}
        checked={isSelected}
        disabled={disabled}
      />

      <label::radioLabel
        class={
          if isSelected {
            "selectedLabel"
          } else {
            ""
          }
        }
      >{option}</label>
    </div>
  }

  fun render : Html {
    <div::container>
      if String.size(label) > 0 {
        <div::groupLabel style={getLabelStyles()}>
          {label}
        </div>
      } else {
        <></>
      }

      <div::optionsContainer>
        {
          for option of options {
            renderOption(option)
          }
        }
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
