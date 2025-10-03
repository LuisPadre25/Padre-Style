/* Form Components */

/* Input Component - Modern text input */
component Input {
  property placeholder : String = ""
  property value : String = ""
  property type : String = "text"
  property disabled : Bool = false
  property size : String = "md"
  property variant : String = "outline"
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  state isFocused : Bool = false

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid var(--border-primary, rgba(255, 255, 255, 0.2));
    border-radius: 8px;
    background: var(--elevated, rgba(255, 255, 255, 0.95));
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    backdrop-filter: blur(10px);
    box-sizing: border-box;

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

  style small {
    padding: 0.5rem 0.75rem;
    font-size: 0.875rem;
  }

  style large {
    padding: 1rem 1.25rem;
    font-size: 1.125rem;
  }

  style filled {
    background: var(--glass-bg, rgba(102, 126, 234, 0.1));
    border-color: transparent;
  }

  fun handleFocus (event : Html.Event) : Promise(Void) {
    next { isFocused: true }
  }

  fun handleBlur (event : Html.Event) : Promise(Void) {
    next { isFocused: false }
  }

  fun render : Html {
    <input::input
      class="#{size} #{variant}"
      type={type}
      placeholder={placeholder}
      value={value}
      disabled={disabled}
      onChange={onChange}
      onFocus={handleFocus}
      onBlur={handleBlur}
    />
  }
}

/* Select Component - Custom dropdown */
component Select {
  property options : Array(String) = []
  property value : String = ""
  property placeholder : String = "Seleccionar..."
  property disabled : Bool = false
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  state isOpen : Bool = false

  style select {
    position: relative;
    width: 100%;
  }

  style trigger {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid var(--border-primary, rgba(255, 255, 255, 0.2));
    border-radius: 8px;
    background: var(--elevated, rgba(255, 255, 255, 0.95));
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
    display: flex;
    justify-content: space-between;
    align-items: center;

    &:hover {
      border-color: rgba(102, 126, 234, 0.5);
    }
  }

  style dropdown {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: rgba(255, 255, 255, 0.98);
    border: 2px solid var(--border-primary, rgba(255, 255, 255, 0.2));
    border-radius: 8px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
    backdrop-filter: blur(20px);
    z-index: 1000;
    margin-top: 0.25rem;
    max-height: 200px;
    overflow-y: auto;
  }

  style option {
    padding: 0.75rem 1rem;
    cursor: pointer;
    transition: background 0.2s ease;
    color: #374151;

    &:hover {
      background: var(--glass-bg, rgba(102, 126, 234, 0.1));
    }
  }

  fun toggleDropdown (event : Html.Event) : Promise(Void) {
    next { isOpen: !isOpen }
  }

  fun render : Html {
    <div::select>
      <div::trigger onClick={toggleDropdown}>
        <span>
          {
            if String.isEmpty(value) {
              placeholder
            } else {
              value
            }
          }
        </span>

        <span>"▼"</span>
      </div>

      {
        if isOpen {
          <div::dropdown>
            for option of options {
              <div::option
                onClick={(event : Html.Event) { next { isOpen: false } }}
              >option</div>
            }
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* Checkbox Component */
component Checkbox {
  property checked : Bool = false
  property label : String = ""
  property disabled : Bool = false
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  style wrapper {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    user-select: none;
  }

  style checkbox {
    width: 1.25rem;
    height: 1.25rem;
    border: 2px solid rgba(255, 255, 255, 0.3);
    border-radius: 4px;
    background: rgba(255, 255, 255, 0.9);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;
    position: relative;

    &:hover {
      border-color: #667eea;
    }
  }

  style checked {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-color: #667eea;
  }

  style checkmark {
    color: white;
    font-size: 0.875rem;
    font-weight: bold;
  }

  style label {
    color: white;
    font-size: 1rem;
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    onChange(event)
  }

  fun render : Html {
    <label::wrapper>
      <div::checkbox
        class={
          if checked {
            "checked"
          } else {
            ""
          }
        }
        onClick={handleChange}
      >
        {
          if checked {
            <span::checkmark>"✓"</span>
          } else {
            <span/>
          }
        }
      </div>

      {
        if !String.isEmpty(label) {
          <span::label>label</span>
        } else {
          <span/>
        }
      }
    </label>
  }
}

/* Radio Component */
component Radio {
  property name : String = ""
  property value : String = ""
  property checked : Bool = false
  property label : String = ""
  property disabled : Bool = false
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  style wrapper {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    user-select: none;
  }

  style radio {
    width: 1.25rem;
    height: 1.25rem;
    border: 2px solid rgba(255, 255, 255, 0.3);
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.9);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.2s ease;

    &:hover {
      border-color: #667eea;
    }
  }

  style checked {
    border-color: #667eea;
  }

  style dot {
    width: 0.5rem;
    height: 0.5rem;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 50%;
  }

  style label {
    color: white;
    font-size: 1rem;
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    onChange(event)
  }

  fun render : Html {
    <label::wrapper>
      <div::radio
        class={
          if checked {
            "checked"
          } else {
            ""
          }
        }
        onClick={handleChange}
      >
        {
          if checked {
            <div::dot/>
          } else {
            <div/>
          }
        }
      </div>

      {
        if !String.isEmpty(label) {
          <span::label>label</span>
        } else {
          <span/>
        }
      }
    </label>
  }
}

/* Textarea Component */
component Textarea {
  property placeholder : String = ""
  property value : String = ""
  property rows : Number = 4
  property disabled : Bool = false
  property onChange = (event : Html.Event) : Promise(Void) { Promise.never() }

  style textarea {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid var(--border-primary, rgba(255, 255, 255, 0.2));
    border-radius: 8px;
    background: var(--elevated, rgba(255, 255, 255, 0.95));
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
    resize: vertical;
    min-height: 100px;
    box-sizing: border-box;

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

  fun render : Html {
    <textarea::textarea
      placeholder={placeholder}
      value={value}
      rows={Number.toString(rows)}
      disabled={disabled}
      onChange={onChange}
    />
  }
}
