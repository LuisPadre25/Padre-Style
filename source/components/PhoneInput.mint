/* Phone Input Component */
component PhoneInput {
  property value : String = ""
  property countryCode : String = "+1"
  property placeholder : String = "(555) 123-4567"
  property disabled : Bool = false
  property onChange = (newValue : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  style container {
    display: flex;
    gap: 0.5rem;
    width: 100%;
  }

  style countryCodeSelect {
    width: 80px;
    padding: 0.75rem 0.5rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    font-weight: 600;
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

  style input {
    flex: 1;
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

  fun handleChange (event : Html.Event) : Promise(Void) {
    let inputVal = Dom.getValue(event.target)
    let formatted =
      `
      (() => {
        const cleaned = #{inputVal}.replace(/\D/g, '');
        let formatted = cleaned;

        if (cleaned.length >= 3) {
          formatted = '(' + cleaned.slice(0, 3) + ') ';
          if (cleaned.length > 3) {
            formatted += cleaned.slice(3, 6);
            if (cleaned.length > 6) {
              formatted += '-' + cleaned.slice(6, 10);
            }
          }
        }

        return formatted;
      })()
      `

    onChange(formatted)
  }

  fun getContainerStyles : String {
    "background: #{ThemeHelpers.getElevated(currentTheme)};"
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      <select::countryCodeSelect disabled={disabled}>
        <option value="+1">"+1"</option>
        <option value="+44">"+44"</option>
        <option value="+52">"+52"</option>
        <option value="+34">"+34"</option>
        <option value="+49">"+49"</option>
        <option value="+33">"+33"</option>
        <option value="+39">"+39"</option>
        <option value="+86">"+86"</option>
        <option value="+81">"+81"</option>
        <option value="+91">"+91"</option>
      </select>

      <input::input
        type="tel"
        value={value}
        placeholder={placeholder}
        disabled={disabled}
        onChange={handleChange}/>
    </div>
  }
}
