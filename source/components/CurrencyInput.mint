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

  fun cleanCurrencyInput (input : String) : String {
    /* Remove all characters except digits and dots */
    let cleaned =
      String.split(input, "")
      |> Array.select(
        (char : String) {
          char == "." || case Number.fromString(char) {
            Maybe.Just(_) => true
            Maybe.Nothing => false
          }
        })
      |> String.join("")

    /* Handle multiple dots - keep only first one */
    let parts =
      String.split(cleaned, ".")

    let partsSize =
      Array.size(parts)

    if partsSize > 2 {
      case Array.at(parts, 0) {
        Maybe.Just(first) =>
          {
            /* Join all parts after the first with empty string */
            let restIndices =
              Array.range(1, partsSize - 1)

            let restParts =
              Array.map(restIndices,
                (idx : Number) {
                  case Array.at(parts, idx) {
                    Maybe.Just(part) => part
                    Maybe.Nothing => ""
                  }
                })

            first + "." + String.join(restParts, "")
          }

        Maybe.Nothing => cleaned
      }
    } else {
      cleaned
    }
  }

  fun handleChange (event : Html.Event) : Promise(Void) {
    let inputVal =
      Dom.getValue(event.target)

    let cleanedValue =
      cleanCurrencyInput(inputVal)

    case Number.fromString(cleanedValue) {
      Maybe.Just(num) =>
        if num >= min && num <= max {
          onChange(num)
        } else if num > max {
          onChange(max)
        } else {
          onChange(min)
        }

      Maybe.Nothing => onChange(0)
    }
  }

  fun formatValue : String {
    /* Format to 2 decimal places */
    let valueStr =
      Number.toString(value)

    let parts =
      String.split(valueStr, ".")

    case Array.at(parts, 0) {
      Maybe.Just(integerPart) =>
        {
          case Array.at(parts, 1) {
            Maybe.Just(decimalPart) =>
              {
                /* Ensure we have at least 2 decimal digits */
                let padded =
                  decimalPart + "00"

                let size =
                  String.size(padded)

                /* Get first 2 characters */
                if size >= 2 {
                  let chars =
                    String.split(padded, "")

                  case Array.at(chars, 0) {
                    Maybe.Just(first) =>
                      case Array.at(chars, 1) {
                        Maybe.Just(second) => integerPart + "." + first + second

                        Maybe.Nothing => integerPart + ".00"
                      }

                    Maybe.Nothing => integerPart + ".00"
                  }
                } else {
                  integerPart + ".00"
                }
              }

            Maybe.Nothing => integerPart + ".00"
          }
        }

      Maybe.Nothing => "0.00"
    }
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
        onChange={handleChange}
      />
    </div>
  }
}
