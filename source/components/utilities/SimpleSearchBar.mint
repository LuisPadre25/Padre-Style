/* Simple Search Bar Component - Enhanced Design */
component SimpleSearchBar {
  property placeholder : String = "Search..."
  property onSearch = (query : String) : Promise(Void) { Promise.never() }
  property size : String = "medium"

  connect ThemeStore exposing { currentTheme }

  state query : String = ""
  state isFocused : Bool = false

  style container {
    display: flex;
    align-items: center;
    border-radius: 16px;
    gap: 0.75rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    overflow: hidden;
  }

  style iconWrapper {
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
  }

  style icon {
    font-size: 1.25rem;
    filter: grayscale(20%);
    transition: all 0.3s ease;
  }

  style input {
    flex: 1;
    border: none;
    outline: none;
    background: transparent;
    font-size: 0.875rem;
    font-weight: 500;
    transition: all 0.2s ease;
  }

  style clearButton {
    padding: 0.25rem;
    border: none;
    background: transparent;
    cursor: pointer;
    font-size: 1.25rem;
    opacity: 0.6;
    transition: all 0.2s ease;
    border-radius: 50%;
    width: 24px;
    height: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  fun getSizeStyles : String {
    case size {
      "small" => "padding: 0.5rem 0.875rem;"
      "large" => "padding: 1rem 1.5rem;"
      _ => "padding: 0.75rem 1.25rem;"
    }
  }

  fun getContainerStyles : String {
    let focusStyles =
      if isFocused {
        "
          border: 2px solid #{ThemeHelpers.getAccent(currentTheme)};
          box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1), #{ThemeHelpers.getShadowMedium(
          currentTheme)};
          transform: translateY(-1px);
        "
      } else {
        "
          border: 2px solid #{ThemeHelpers.getBorderPrimary(currentTheme)};
          box-shadow: #{ThemeHelpers.getShadowLight(currentTheme)};
        "
      }

    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      #{getSizeStyles()}
      #{focusStyles}
    "
  }

  fun getIconStyles : String {
    let focusFilter =
      if isFocused {
        "filter: grayscale(0%) brightness(1.2);"
      } else {
        ""
      }

    "#{focusFilter}"
  }

  fun getInputStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getClearButtonStyles : String {
    "
      color: #{ThemeHelpers.getTextSecondary(currentTheme)};
      background: #{ThemeHelpers.getSurface(currentTheme)};
    "
  }

  fun handleInput (event : Html.Event) : Promise(Void) {
    next { query: Dom.getValue(event.target) }
  }

  fun handleFocus (event : Html.Event) : Promise(Void) {
    next { isFocused: true }
  }

  fun handleBlur (event : Html.Event) : Promise(Void) {
    next { isFocused: false }
  }

  fun handleClear (event : Html.Event) : Promise(Void) {
    next { query: "" }
  }

  fun handleKeyPress (event : Html.Event) : Promise(Void) {
    if event.keyCode == 13 {
      onSearch(query)
    } else {
      Promise.never()
    }
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <div::iconWrapper><span::icon style={getIconStyles()}>"🔍"</span></div>

      <input::input
        type="text"
        placeholder={placeholder}
        value={query}
        style={getInputStyles()}
        onInput={handleInput}
        onFocus={handleFocus}
        onBlur={handleBlur}
        onKeyDown={handleKeyPress}
      />

      {
        if !String.isEmpty(query) {
          <button::clearButton
            style={getClearButtonStyles()}
            onClick={handleClear}
          >"×"</button>
        } else {
          <div/>
        }
      }
    </div>
  }
}
