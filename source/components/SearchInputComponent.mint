/* Search Input Component */
component SearchInputComponent {
  property placeholder : String = "Search..."
  property value : String = ""
  property disabled : Bool = false
  property onSearch = (query : String) : Promise(Void) { Promise.never() }
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: 100%;
  }

  style input {
    width: 100%;
    padding: 0.75rem 3rem 0.75rem 3rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 12px;
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

    &::placeholder {
      color: #9ca3af;
    }
  }

  style iconLeft {
    position: absolute;
    left: 1rem;
    top: 50%;
    transform: translateY(-50%);
    font-size: 1.25rem;
    color: #6b7280;
  }

  style clearButton {
    position: absolute;
    right: 1rem;
    top: 50%;
    transform: translateY(-50%);
    background: transparent;
    border: none;
    cursor: pointer;
    font-size: 1.25rem;
    padding: 0.25rem;
    color: #6b7280;
    transition: color 0.2s ease;

    &:hover {
      color: #ef4444;
    }
  }

  fun handleClear (event : Html.Event) : Promise(Void) {
    onSearch("")
  }

  fun handleKeyPress (event : Html.Event) : Promise(Void) {
    Promise.never()
  }

  fun render : Html {
    <div::container>
      <span::iconLeft>"🔍"</span>

      <input::input
        type="text"
        placeholder={placeholder}
        value={value}
        disabled={disabled}
        onChange={onChange}
        onKeyPress={handleKeyPress}
      />

      {
        if !String.isEmpty(value) {
          <button::clearButton onClick={handleClear} type="button">"✕"</button>
        } else {
          <span/>
        }
      }
    </div>
  }
}
