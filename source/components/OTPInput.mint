/* OTP Input Component - One Time Password */
component OTPInput {
  property length : Number = 6
  property value : String = ""
  property disabled : Bool = false
  property onChange = (newValue : String) : Promise(Void) { Promise.never() }

  connect ThemeStore exposing { currentTheme }

  state focusedIndex : Number = 0

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

  fun handleInput (index : Number, event : Html.Event) : Promise(Void) {
    let inputVal = Dom.getValue(event.target)
    let digit =
      `
      (() => {
        return #{inputVal}.replace(/\D/g, '').slice(-1);
      })()
      `

    let newValue =
      `
      (() => {
        const current = #{value}.padEnd(#{length}, ' ');
        const arr = current.split('');
        arr[#{index}] = #{digit} || ' ';
        return arr.join('').trimEnd();
      })()
      `

    next { focusedIndex: index + 1 }
    onChange(newValue)

    if (!String.isEmpty(digit) && index < length - 1) {
      `
      (() => {
        const inputs = document.querySelectorAll('[data-otp-input]');
        if (inputs[#{index + 1}]) {
          inputs[#{index + 1}].focus();
        }
      })()
      `
      Promise.never()
    } else {
      Promise.never()
    }
  }

  fun handleKeyDown (index : Number, event : Html.Event) : Promise(Void) {
    `
    (() => {
      const key = #{event}.key;
      if (key === 'Backspace' && #{index} > 0) {
        const inputs = document.querySelectorAll('[data-otp-input]');
        const currentValue = #{event}.target.value;
        if (!currentValue) {
          #{event}.preventDefault();
          if (inputs[#{index - 1}]) {
            inputs[#{index - 1}].focus();
            inputs[#{index - 1}].value = '';
          }
        }
      } else if (key === 'ArrowLeft' && #{index} > 0) {
        const inputs = document.querySelectorAll('[data-otp-input]');
        if (inputs[#{index - 1}]) {
          inputs[#{index - 1}].focus();
        }
      } else if (key === 'ArrowRight' && #{index} < #{length - 1}) {
        const inputs = document.querySelectorAll('[data-otp-input]');
        if (inputs[#{index + 1}]) {
          inputs[#{index + 1}].focus();
        }
      }
    })()
    `
    Promise.never()
  }

  fun getDigitAt (index : Number) : String {
    `
    (() => {
      const padded = #{value}.padEnd(#{length}, ' ');
      return padded[#{index}] === ' ' ? '' : padded[#{index}];
    })()
    `
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
      onKeyDown={(e : Html.Event) { handleKeyDown(index, e) }}/>
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
