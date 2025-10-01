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

  fun formatPhoneNumber (input : String) : String {
    /* Remove all non-digit characters */
    let cleaned =
      String.split(input, "")
      |> Array.select(
        (char : String) {
          case Number.fromString(char) {
            Maybe.Just(_) => true
            Maybe.Nothing => false
          }
        })
      |> String.join("")

    let length =
      String.size(cleaned)

    let chars =
      String.split(cleaned, "")

    if length >= 3 {
      /* Get area code (first 3 digits) */
      let areaIndices =
        Array.range(0, 2)

      let areaDigits =
        Array.map(areaIndices,
          (idx : Number) {
            case Array.at(chars, idx) {
              Maybe.Just(c) => c
              Maybe.Nothing => ""
            }
          })

      let areaCode =
        String.join(areaDigits, "")

      if length > 3 {
        /* Get middle (next 3 digits) */
        let middleIndices =
          Array.range(3, 5)

        let middleDigits =
          Array.map(middleIndices,
            (idx : Number) {
              case Array.at(chars, idx) {
                Maybe.Just(c) => c
                Maybe.Nothing => ""
              }
            })

        let middle =
          String.join(middleDigits, "")

        if length > 6 {
          /* Get end (last 4 digits) */
          let endIndices =
            Array.range(6, 9)

          let endDigits =
            Array.map(endIndices,
              (idx : Number) {
                case Array.at(chars, idx) {
                  Maybe.Just(c) => c
                  Maybe.Nothing => ""
                }
              })

          let end =
            String.join(endDigits, "")

          "(" + areaCode + ") " + middle + "-" + end
        } else {
          "(" + areaCode + ") " + middle
        }
      } else {
        "(" + areaCode + ") "
      }
    } else {
      cleaned
    }
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    let inputVal =
      Dom.getValue(event.target)

    let formatted =
      formatPhoneNumber(inputVal)

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
        onChange={handleChange}
      />
    </div>
  }
}
