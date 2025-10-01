/* Password Input Component - with toggle visibility */
component PasswordInput {
  property placeholder : String = "Enter password"
  property value : String = ""
  property disabled : Bool = false
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state showPassword : Bool = false

  style container {
    position: relative;
    width: 100%;
  }

  style input {
    width: 100%;
    padding: 0.75rem 3rem 0.75rem 1rem;
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

  style toggleButton {
    position: absolute;
    right: 0.75rem;
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
      color: #667eea;
    }
  }

  fun toggleVisibility (event : Html.Event) : Promise(Void) {
    next { showPassword: !showPassword }
  }

  fun render : Html {
    <div::container>
      <input::input
        type={
          if showPassword {
            "text"
          } else {
            "password"
          }
        }
        placeholder={placeholder}
        value={value}
        disabled={disabled}
        onChange={onChange}
      />

      <button::toggleButton onClick={toggleVisibility} type="button">
        {
          if showPassword {
            "👁️"
          } else {
            "👁️‍🗨️"
          }
        }
      </button>
    </div>
  }
}
