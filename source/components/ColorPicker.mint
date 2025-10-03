/* Color Picker Component */
component ColorPicker {
  property value : String = "#667eea"
  property disabled : Bool = false
  property onChange = (color : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    gap: 0.75rem;
    align-items: center;
    width: 100%;
  }

  style colorDisplay {
    flex: 1;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: 'Courier New', monospace;
    font-size: 1rem;
    font-weight: 600;
    text-align: center;
    backdrop-filter: blur(10px);
  }

  style colorPickerWrapper {
    position: relative;
    width: 60px;
    height: 48px;
  }

  style colorInput {
    position: absolute;
    width: 100%;
    height: 100%;
    border: 3px solid rgba(255, 255, 255, 0.3);
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-sizing: border-box;

    &:hover {
      border-color: #667eea;
      transform: scale(1.05);
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    let newColor =
      event.target
      |> Dom.getValue

    onChange(newColor)
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
    "
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::colorDisplay>value</div>

      <div::colorPickerWrapper>
        <input::colorInput
          type="color"
          value={value}
          disabled={disabled}
          onChange={handleChange}
        />
      </div>
    </div>
  }
}
