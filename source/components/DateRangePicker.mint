/* Date Range Picker Component */
component DateRangePicker {
  property startDate : String = ""
  property endDate : String = ""
  property disabled : Bool = false
  property onStartDateChange = (event : Html.Event) : Promise(Void) { Promise.never() }
  property onEndDateChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    gap: 0.75rem;
    width: 100%;
    align-items: center;
  }

  style inputWrapper {
    flex: 1;
    position: relative;
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

  style separator {
    color: rgba(255, 255, 255, 0.7);
    font-size: 1.25rem;
    font-weight: 600;
    margin-top: 1.5rem;
  }

  fun getContainerStyles : String {
    "background: #{ThemeHelpers.getElevated(currentTheme)};"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getSeparatorStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun handleStartClick (event : Html.Event) : Promise(Void) {
    /* NOTE: showPicker() is a browser API not available in pure Mint.
       The date input will still work, users just need to click twice
       on some browsers to open the picker. */
    Promise.never()
  }

  fun handleEndClick (event : Html.Event) : Promise(Void) {
    /* NOTE: showPicker() is a browser API not available in pure Mint.
       The date input will still work, users just need to click twice
       on some browsers to open the picker. */
    Promise.never()
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::inputWrapper>
        <label::label style={getLabelStyles()}>"From"</label>
        <input::input
          type="date"
          value={startDate}
          disabled={disabled}
          onChange={onStartDateChange}
          onClick={handleStartClick}/>
      </div>

      <div::separator style={getSeparatorStyles()}>"→"</div>

      <div::inputWrapper>
        <label::label style={getLabelStyles()}>"To"</label>
        <input::input
          type="date"
          value={endDate}
          disabled={disabled}
          min={startDate}
          onChange={onEndDateChange}
          onClick={handleEndClick}/>
      </div>
    </div>
  }
}
