/* Select/Dropdown Input Component */
component SelectInput {
  property options : Array(String) = []
  property value : String = ""
  property placeholder : String = "Select an option"
  property disabled : Bool = false
  property onChange = (value : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: 100%;
  }

  style select {
    width: 100%;
    padding: 0.75rem 2.5rem 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
    cursor: pointer;
    appearance: none;

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
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
    color: #667eea;
    font-size: 1.25rem;
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    let newValue =
      event.target
      |> Dom.getValue

    onChange(newValue)
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
    "
  }

  fun renderOption (option : String) : Html {
    <option value={option}>option</option>
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <select::select value={value} disabled={disabled} onChange={handleChange}>
        <option value="" disabled={true}>placeholder</option>

        {
          for option of options {
            renderOption(option)
          }
        }
      </select>

      <div::iconWrapper>"▼"</div>
    </div>
  }
}
