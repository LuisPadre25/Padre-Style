/* OTP Input Component - One Time Password */
component OTPInput {
  property length : Number = 6
  property value : String = ""
  property disabled : Bool = false
  property onChange = (newValue : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state focusedIndex : Number = 0
  state inputRefs : Array(Maybe(Dom.Element)) = []

  style container {
    display: flex;
    gap: 0.75rem;
    justify-content: center;
    width: 100%;
  }

  style input {
    width: 3rem;
    height: 3.5rem;
    text-align: center;
    font-size: 1.5rem;
    font-weight: 700;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
      transform: scale(1.05);
    }

    &:disabled {
      opacity: 0.6;
      cursor: not-allowed;
    }
  }

  fun extractDigit (input : String) : String {
    /* Remove non-digits and get last character */
    let digits =
      String.split(input, "")
      |> Array.select(
        (char : String) {
          case Number.fromString(char) {
            Maybe.Just(_) => true
            Maybe.Nothing => false
          }
        })

    case Array.at(digits, Array.size(digits) - 1) {
      Maybe.Just(lastDigit) => lastDigit
      Maybe.Nothing => ""
    }
  }

  fun updateValueAtIndex (
    currentValue : String,
    index : Number,
    digit : String
  ) : String {
    /* Pad value to length and update at index */
    let padded =
      if String.size(currentValue) < length {
        currentValue + String.repeat(" ", length - String.size(currentValue))
      } else {
        currentValue
      }

    let chars =
      String.split(padded, "")

    let digitToUse =
      if String.isEmpty(digit) {
        " "
      } else {
        digit
      }

    /* Map over chars and replace at index */
    let updated =
      Array.mapWithIndex(chars,
        (char : String, idx : Number) {
          if idx == index {
            digitToUse
          } else {
            char
          }
        })

    String.join(updated, "")
  }

  fun handleInput (index : Number, event : Html.Event) : Promise(Void) {
    let inputVal =
      Dom.getValue(event.target)

    let digit =
      extractDigit(inputVal)

    let newValue =
      updateValueAtIndex(value, index, digit)

    /* Focus next input if digit was entered */
    if !String.isEmpty(digit) && index < length - 1 {
      focusNextInput(index + 1)
    } else {
      Promise.never()
    }

    next { focusedIndex: index + 1 }
    onChange(newValue)
  }

  fun focusNextInput (index : Number) : Promise(Void) {
    `
    (() => {
      const inputs = document.querySelectorAll('[data-otp-input="true"]');
      const idx = #{index};
      if (inputs[idx]) {
        setTimeout(() => inputs[idx].focus(), 10);
      }
    })()
    `
    Promise.never()
  }

  fun focusPrevInput (index : Number) : Promise(Void) {
    `
    (() => {
      const inputs = document.querySelectorAll('[data-otp-input="true"]');
      const idx = #{index};
      if (inputs[idx]) {
        setTimeout(() => inputs[idx].focus(), 10);
      }
    })()
    `
    Promise.never()
  }

  fun handleKeyDown (index : Number, event : Html.Event) : Promise(Void) {
    /* Backspace - focus previous input if current is empty */
    if event.keyCode == 8 && String.isEmpty(getDigitAt(index)) && index > 0 {
      focusPrevInput(index - 1)
    } else {
      Promise.never()
    }
  }

  fun getDigitAt (index : Number) : String {
    let padded =
      if String.size(value) < length {
        value + String.repeat(" ", length - String.size(value))
      } else {
        value
      }

    case Array.at(String.split(padded, ""), index) {
      Maybe.Just(char) =>
        if char == " " {
          ""
        } else {
          char
        }

      Maybe.Nothing => ""
    }
  }

  fun getContainerStyles : String {
    "background: #{ThemeHelpers.getElevated(currentTheme)};"
  }

  fun renderInput (index : Number) : Html {
    <input::input
      type="text"
      maxlength="1"
      value={getDigitAt(index)}
      disabled={disabled}
      data-otp-input="true"
      onInput={(e : Html.Event) { handleInput(index, e) }}
      onKeyDown={(e : Html.Event) { handleKeyDown(index, e) }}
    />
  }

  fun render : Html {
    <div::container style={getContainerStyles()}>
      {
        for index of Array.range(0, length - 1) {
          renderInput(index)
        }
      }
    </div>
  }
}
