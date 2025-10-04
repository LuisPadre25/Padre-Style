/* Autocomplete Input Component */
component AutocompleteInput {
  property value : String = ""
  property suggestions : Array(String) = []
  property placeholder : String = "Type to search..."
  property label : String = ""
  property helperText : String = ""
  property disabled : Bool = false
  property minChars : Number = 2
  property onChange = (newValue : String) : Promise(Void) { Promise.never() }
  property onSelect = (selected : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state isOpen : Bool = false
  state selectedIndex : Number = -1

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

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid;
    border-radius: 8px;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    outline: none;
    background: transparent;
    box-sizing: border-box;

    &:focus {
      outline: none;
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }

    &::placeholder {
      color: #9ca3af;
    }
  }

  style helper {
    font-size: 0.75rem;
    margin-top: 0.25rem;
  }

  style dropdown {
    position: absolute;
    top: calc(100% + 0.25rem);
    left: 0;
    right: 0;
    background: rgba(255, 255, 255, 0.98);
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
    backdrop-filter: blur(20px);
    z-index: 1000;
    max-height: 200px;
    overflow-y: auto;
  }

  style suggestion {
    padding: 0.75rem 1rem;
    cursor: pointer;
    transition: all 0.2s ease;
    color: #374151;

    &:hover {
      background: rgba(102, 126, 234, 0.2);
    }
  }

  style selected {
    background: rgba(102, 126, 234, 0.3) !important;
    color: #667eea;
    font-weight: 600;
    border-left: 3px solid #667eea;
    padding-left: calc(1rem - 3px);
  }

  style noResults {
    padding: 0.75rem 1rem;
    color: #9ca3af;
    text-align: center;
    font-style: italic;
  }

  fun handleInputChange (event : Html.Event) : Promise(Void) {
    let newValue =
      Dom.getValue(event.target)

    onChange(newValue)
    next { isOpen: true, selectedIndex: -1 }
  }

  fun handleFocus (event : Html.Event) : Promise(Void) {
    next { isOpen: true }
  }

  fun handleClick (event : Html.Event) : Promise(Void) {
    next { isOpen: true }
  }

  fun handleKeyDown (event : Html.Event) : Promise(Void) {
    let filtered = getFilteredSuggestions()
    let filteredSize = Array.size(filtered)

    if event.keyCode == 40 {
      /* Arrow Down */
      if selectedIndex < filteredSize - 1 {
        next { selectedIndex: selectedIndex + 1 }
      } else {
        next { selectedIndex: 0 }
      }
    } else if event.keyCode == 38 {
      /* Arrow Up */
      if selectedIndex > 0 {
        next { selectedIndex: selectedIndex - 1 }
      } else {
        next { selectedIndex: filteredSize - 1 }
      }
    } else if event.keyCode == 13 {
      /* Enter */
      if selectedIndex >= 0 {
        case Array.at(filtered, selectedIndex) {
          Maybe.Just(suggestion) => selectSuggestion(suggestion)
          Maybe.Nothing => Promise.never()
        }
      } else {
        Promise.never()
      }
    } else if event.keyCode == 27 {
      /* Escape */
      next { isOpen: false, selectedIndex: -1 }
    } else {
      Promise.never()
    }
  }

  fun handleBlur (event : Html.Event) : Promise(Void) {
    /* Delay closing to allow mousedown on suggestions to process first */
    `
    setTimeout(() => {
      const container = document.querySelector('[data-autocomplete="true"]');
      if (container && !container.contains(document.activeElement)) {
        // Schedule a re-render to close dropdown
        const input = container.querySelector('input');
        if (input) {
          input.dispatchEvent(new Event('autocomplete-close', { bubbles: true }));
        }
      }
    }, 200)
    `
    Promise.never()
  }

  fun handleSuggestionMouseDown (suggestion : String, event : Html.Event) : Promise(Void) {
    /* Prevent blur and select immediately */
    `event.preventDefault()`
    selectSuggestion(suggestion)
  }

  fun selectSuggestion (suggestion : String) : Promise(Void) {
    next { isOpen: false, selectedIndex: -1 }
    onChange(suggestion)
    onSelect(suggestion)
  }

  fun getFilteredSuggestions : Array(String) {
    let valueLength = String.size(value)

    if valueLength < minChars {
      []
    } else {
      suggestions
      |> Array.select(
        (s : String) : Bool {
          String.toLowerCase(s)
          |> String.contains(String.toLowerCase(value))
        })
    }
  }

  fun shouldShowDropdown : Bool {
    let valueLength = String.size(value)

    isOpen && valueLength >= minChars
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getInputStyles : String {
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

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun renderSuggestionAtIndex (index : Number, filtered : Array(String)) : Html {
    case Array.at(filtered, index) {
      Maybe.Just(suggestion) =>
        {
          if index == selectedIndex {
            <div::suggestion::selected
              onMouseDown={(e : Html.Event) { handleSuggestionMouseDown(suggestion, e) }}
            >suggestion</div>
          } else {
            <div::suggestion
              onMouseDown={(e : Html.Event) { handleSuggestionMouseDown(suggestion, e) }}
            >suggestion</div>
          }
        }

      Maybe.Nothing => <div/>
    }
  }

  fun render : Html {
    let filtered =
      getFilteredSuggestions()

    <div::container data-autocomplete="true">
      if String.size(label) > 0 {
        <div::label style={getLabelStyles()}>
          {label}
        </div>
      } else {
        <></>
      }

      <div::inputWrapper>
        <input::input
          type="text"
          value={value}
          placeholder={placeholder}
          disabled={disabled}
          style={getInputStyles()}
          onInput={handleInputChange}
          onChange={handleInputChange}
          onFocus={handleFocus}
          onClick={handleClick}
          onKeyDown={handleKeyDown}
        />

        {
          if shouldShowDropdown() && Array.size(filtered) > 0 {
            <div::dropdown>
              {
                for index of Array.range(0, Array.size(filtered) - 1) {
                  renderSuggestionAtIndex(index, filtered)
                }
              }
            </div>
          } else if shouldShowDropdown() && Array.size(filtered) == 0 {
            <div::dropdown><div::noResults>"No results found"</div></div>
          } else {
            <div/>
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
