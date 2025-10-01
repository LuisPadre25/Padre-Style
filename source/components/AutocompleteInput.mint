/* Autocomplete Input Component */
component AutocompleteInput {
  property value : String = ""
  property suggestions : Array(String) = []
  property placeholder : String = "Type to search..."
  property disabled : Bool = false
  property onChange = (newValue : String) : Promise(Void) { Promise.never() }
  property onSelect = (selected : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state isOpen : Bool = false
  state selectedIndex : Number = -1

  style container {
    position: relative;
    width: 100%;
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

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }

    &::placeholder {
      color: #9ca3af;
    }
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
    transition: background 0.2s ease;
    color: #374151;

    &:hover {
      background: rgba(102, 126, 234, 0.1);
    }
  }

  style selected {
    background: rgba(102, 126, 234, 0.15);
  }

  style noResults {
    padding: 0.75rem 1rem;
    color: #9ca3af;
    text-align: center;
    font-style: italic;
  }

  fun handleInputChange (event : Html.Event) : Promise(Void) {
    let newValue = Dom.getValue(event.target)
    next { isOpen: true, selectedIndex: -1 }
    onChange(newValue)
  }

  fun handleFocus (event : Html.Event) : Promise(Void) {
    next { isOpen: true }
  }

  fun handleBlur (event : Html.Event) : Promise(Void) {
    /* Simplified - no delayed close */
    next { isOpen: false, selectedIndex: -1 }
  }

  fun selectSuggestion (suggestion : String) : Promise(Void) {
    next { isOpen: false, selectedIndex: -1 }
    onSelect(suggestion)
  }

  fun getFilteredSuggestions : Array(String) {
    if (String.isEmpty(value)) {
      []
    } else {
      suggestions
      |> Array.select((s : String) : Bool {
        String.toLowerCase(s)
        |> String.contains(String.toLowerCase(value))
      })
    }
  }

  fun getContainerStyles : String {
    "background: #{ThemeHelpers.getElevated(currentTheme)};"
  }

  fun renderSuggestionAtIndex (index : Number, filtered : Array(String)) : Html {
    case (Array.at(filtered, index)) {
      Maybe.Just(suggestion) =>
        <div::suggestion
          class={if (index == selectedIndex) { "selected" } else { "" }}
          onClick={(e : Html.Event) { selectSuggestion(suggestion) }}>
          suggestion
        </div>

      Maybe.Nothing => <div></div>
    }
  }

  fun render : Html {
    let filtered = getFilteredSuggestions()

    <div::container style={getContainerStyles()}>
      <input::input
        type="text"
        value={value}
        placeholder={placeholder}
        disabled={disabled}
        onChange={handleInputChange}
        onFocus={handleFocus}
        onBlur={handleBlur}/>

      {
        if (isOpen && Array.size(filtered) > 0) {
          <div::dropdown>
            {
              for index of Array.range(0, Array.size(filtered) - 1) {
                renderSuggestionAtIndex(index, filtered)
              }
            }
          </div>
        } else if (isOpen && !String.isEmpty(value) && Array.size(filtered) == 0) {
          <div::dropdown>
            <div::noResults>"No results found"</div>
          </div>
        } else {
          <div></div>
        }
      }
    </div>
  }
}
