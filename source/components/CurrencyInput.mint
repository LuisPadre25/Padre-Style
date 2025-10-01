/* Currency Input Component */
component CurrencyInput {
  property value : Number = 0
  property currency : String = "$"
  property placeholder : String = "0.00"
  property disabled : Bool = false
  property min : Number = 0
  property max : Number = 999999
  property onChange = (newValue : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    position: relative;
    width: 100%;
    display: flex;
    align-items: center;
  }

  style currencySymbol {
    position: absolute;
    left: 1rem;
    color: #667eea;
    font-size: 1.125rem;
    font-weight: 600;
    pointer-events: none;
    z-index: 1;
  }

  style input {
    width: 100%;
    padding: 0.75rem 1rem 0.75rem 2.5rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    font-weight: 500;
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

  fun handleChange (event : Html.Event) : Promise(Void) {
    let inputVal = Dom.getValue(event.target)
    let cleanedValue =
      `
      (() => {
        const cleaned = #{inputVal}.replace(/[^0-9.]/g, '');
        const parts = cleaned.split('.');
        if (parts.length > 2) {
          return parts[0] + '.' + parts.slice(1).join('');
        }
        return cleaned;
      })()
      `

    case (Number.fromString(cleanedValue)) {
      Maybe.Just(num) =>
        if (num >= min && num <= max) {
          onChange(num)
        } else if (num > max) {
          onChange(max)
        } else {
          onChange(min)
        }

      Maybe.Nothing =>
        onChange(0)
    }
  }

  fun formatValue : String {
    let formatted =
      `
      (() => {
        const num = #{value};
        return num.toFixed(2);
      })()
      `
    formatted
  }

  fun getContainerStyles : String {
    "background: #{ThemeHelpers.getElevated(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <span::currencySymbol>currency</span>
      <input::input
        type="text"
        value={formatValue()}
        placeholder={placeholder}
        disabled={disabled}
        onChange={handleChange}/>
    </div>
  }
}
