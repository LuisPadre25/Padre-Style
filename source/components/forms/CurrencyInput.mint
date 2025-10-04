/* Currency Input Component */
component CurrencyInput {
  property value : Number = 0
  property currency : String = "$"
  property placeholder : String = "0.00"
  property label : String = ""
  property helperText : String = ""
  property disabled : Bool = false
  property min : Number = 0
  property max : Number = 999999
  property onChange = (newValue : Number) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

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
    display: flex;
    align-items: center;
  }

  style currencySymbol {
    position: absolute;
    left: 1rem;
    font-size: 1.125rem;
    font-weight: 600;
    pointer-events: none;
    z-index: 1;
    white-space: nowrap;
  }

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid;
    border-radius: 8px;
    font-family: inherit;
    font-size: 1rem;
    font-weight: 500;
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

  fun cleanCurrencyInput (input : String) : String {
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

    let parts =
      String.split(cleaned, ".")

    let partsSize =
      Array.size(parts)

    if partsSize > 2 {
      case Array.at(parts, 0) {
        Maybe.Just(first) =>
          {
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
                let padded =
                  decimalPart + "00"

                let size =
                  String.size(padded)

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

  fun calculatePaddingLeft : String {
    let baseMargin = 1.0
    let charWidth = 0.7
    let currencyLength = String.size(currency)
    let symbolWidth = (Number.fromString(Number.toString(currencyLength)) |> Maybe.withDefault(1)) * charWidth
    let totalPadding = baseMargin + symbolWidth + 0.5

    Number.toString(totalPadding) + "rem"
  }

  fun getLabelStyles : String {
    "color: #{ThemeHelpers.getTextPrimary(currentTheme)};"
  }

  fun getCurrencySymbolStyles : String {
    "color: #{ThemeHelpers.getAccent(currentTheme)};"
  }

  fun getInputStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      padding-left: #{calculatePaddingLeft()};

      &:focus {
        border-color: #{ThemeHelpers.getAccent(currentTheme)};
        box-shadow: #{ThemeHelpers.getFocusRing(currentTheme)};
      }
    "
  }

  fun getHelperStyles : String {
    "color: #{ThemeHelpers.getTextSecondary(currentTheme)};"
  }

  fun render : Html {
    <div::container>
      if String.size(label) > 0 {
        <div::label style={getLabelStyles()}>
          {label}
        </div>
      } else {
        <></>
      }

      <div::inputWrapper>
        <span::currencySymbol style={getCurrencySymbolStyles()}>{currency}</span>

        <input::input
          type="text"
          value={formatValue()}
          placeholder={placeholder}
          disabled={disabled}
          onChange={handleChange}
          style={getInputStyles()}
        />
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
