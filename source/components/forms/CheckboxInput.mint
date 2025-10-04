/* Checkbox Input Component */
component CheckboxInput {
  property checked : Bool = false
  property label : String = ""
  property disabled : Bool = false
  property onChange = (checked : Bool) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
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
    box-sizing: border-box;
    width: 100%;

    &:hover {
      border-color: #667eea;
      transform: translateX(4px);
    }
  }

  style checkedContainer {
    border-color: #667eea;
    background: rgba(102, 126, 234, 0.1);
  }

  style checkbox {
    width: 22px;
    height: 22px;
    cursor: pointer;
    accent-color: #667eea;
  }

  style label {
    flex: 1;
    color: #374151;
    font-size: 1rem;
    cursor: pointer;
    user-select: none;
  }

  style checkedLabel {
    color: #667eea;
    font-weight: 600;
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    onChange(!checked)
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
    "
  }

  fun render : Html {
    <div::container
      style={getContainerStyles()}
      class={
        if checked {
          "checkedContainer"
        } else {
          ""
        }
      }
      onClick={handleChange}
    >
      <input::checkbox
        type="checkbox"
        checked={checked}
        disabled={disabled}
      />

      <label::label
        class={
          if checked {
            "checkedLabel"
          } else {
            ""
          }
        }
      >label</label>
    </div>
  }
}
