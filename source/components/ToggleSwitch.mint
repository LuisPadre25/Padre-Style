/* Toggle Switch Component */
component ToggleSwitch {
  property checked : Bool = false
  property label : String = ""
  property disabled : Bool = false
  property onChange = (checked : Bool) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 1rem;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    width: 100%;
    transition: all 0.3s ease;

    &:hover {
      border-color: #667eea;
    }
  }

  style label {
    color: #374151;
    font-size: 1rem;
    user-select: none;
  }

  style switchWrapper {
    position: relative;
    width: 52px;
    height: 28px;
    cursor: pointer;
  }

  style switchInput {
    opacity: 0;
    width: 0;
    height: 0;
  }

  style slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #ccc;
    transition: 0.3s;
    border-radius: 28px;

    &:before {
      position: absolute;
      content: "";
      height: 20px;
      width: 20px;
      left: 4px;
      bottom: 4px;
      background-color: white;
      transition: 0.3s;
      border-radius: 50%;
    }
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    onChange(!checked)
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
    "
  }

  fun getSliderStyles : String {
    if checked {
      "
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

        &:before {
          transform: translateX(24px);
        }
      "
    } else {
      ""
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <label::label>label</label>

      <div::switchWrapper>
        <input::switchInput
          type="checkbox"
          checked={checked}
          disabled={disabled}
          onChange={handleChange}
        />

        <div::slider style={getSliderStyles()}/>
      </div>
    </div>
  }
}
