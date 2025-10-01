/* Date Time Input Component */
component DateTimeInput {
  property dateValue : String = ""
  property timeValue : String = ""
  property disabled : Bool = false

  property onDateChange =
    (event : Html.Event) : Promise(Void) { Promise.never() }

  property onTimeChange =
    (event : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    gap: 0.75rem;
    width: 100%;
  }

  style inputWrapper {
    position: relative;
    flex: 1;
  }

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
    cursor: pointer;

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

  style label {
    display: block;
    font-size: 0.875rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
    color: rgba(255, 255, 255, 0.9);
  }

  fun getContainerStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
    "
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun handleDateClick (event : Html.Event) : Promise(Void) {
    /*
    NOTE: showPicker() is a browser API not available in pure Mint.
       The date input will still work, users just need to click twice
       on some browsers to open the picker.
    */
    Promise.never()
  }

  fun handleTimeClick (event : Html.Event) : Promise(Void) {
    /*
    NOTE: showPicker() is a browser API not available in pure Mint.
       The time input will still work, users just need to click twice
       on some browsers to open the picker.
    */
    Promise.never()
  }

  fun render : Html {
    <div::container>
      <div style="flex: 1;">
        <label::label style={getLabelStyles()}>"Date"</label>

        <div::inputWrapper>
          <input::input
            type="date"
            value={dateValue}
            disabled={disabled}
            onChange={onDateChange}
            onClick={handleDateClick}
          />
        </div>
      </div>

      <div style="flex: 1;">
        <label::label style={getLabelStyles()}>"Time"</label>

        <div::inputWrapper>
          <input::input
            type="time"
            value={timeValue}
            disabled={disabled}
            onChange={onTimeChange}
            onClick={handleTimeClick}
          />
        </div>
      </div>
    </div>
  }
}
