/* Radio Button Group Component */
component RadioGroup {
  property options : Array(String) = []
  property selectedValue : String = ""
  property name : String = "radio-group"
  property disabled : Bool = false
  property onChange = (value : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
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
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    cursor: pointer;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);

    &:hover {
      border-color: #667eea;
      transform: translateX(4px);
    }
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

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
    "
  }

  fun renderOption (option : String) : Html {
    let isSelected =
      option == selectedValue

    <div::radioOption
      class={
        if isSelected {
          "selectedOption"
        } else {
          ""
        }
      }
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
      >option</label>
    </div>
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        for option of options {
          renderOption(option)
        }
      }
    </div>
  }
}
