/* Advanced Form Components */

/* DatePicker Component - Date selection with calendar */
component DatePicker {
  property value : String = ""
  property placeholder : String = "Seleccionar fecha"
  property disabled : Bool = false
  property onChange = (date : String) : Promise(Void) { Promise.never() }

  state isOpen : Bool = false
  state selectedDate : String = value
  state currentMonth : Number = 12
  state currentYear : Number = 2024

  style datePicker {
    position: relative;
    width: 100%;
  }

  style input {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 8px;
    background: rgba(255, 255, 255, 0.95);
    color: #374151;
    font-family: inherit;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);

    &:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }
  }

  style calendar {
    position: absolute;
    top: 100%;
    left: 0;
    right: 0;
    background: rgba(255, 255, 255, 0.98);
    border: 2px solid rgba(255, 255, 255, 0.2);
    border-radius: 12px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
    backdrop-filter: blur(20px);
    z-index: 1000;
    margin-top: 0.5rem;
    padding: 1rem;
    min-width: 280px;
  }

  style header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1rem;
    color: #374151;
  }

  style navButton {
    background: none;
    border: none;
    color: #667eea;
    cursor: pointer;
    padding: 0.5rem;
    border-radius: 6px;
    transition: background 0.2s ease;

    &:hover {
      background: rgba(102, 126, 234, 0.1);
    }
  }

  style monthYear {
    font-weight: 600;
    font-size: 1rem;
  }

  style grid {
    display: grid;
    grid-template-columns: repeat(7, 1fr);
    gap: 0.25rem;
  }

  style dayHeader {
    text-align: center;
    font-size: 0.75rem;
    font-weight: 600;
    color: #6b7280;
    padding: 0.5rem 0;
  }

  style day {
    aspect-ratio: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    border-radius: 6px;
    font-size: 0.875rem;
    transition: all 0.2s ease;
    color: #374151;

    &:hover {
      background: rgba(102, 126, 234, 0.1);
    }
  }

  style selected {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;

    &:hover {
      background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
    }
  }

  style today {
    border: 2px solid #667eea;
    font-weight: 600;
  }

  style otherMonth {
    opacity: 0.3;
  }

  fun toggleCalendar (event : Html.Event) : Promise(Void) {
    next { isOpen: !isOpen }
  }

  fun closeCalendar (event : Html.Event) : Promise(Void) {
    next { isOpen: false }
  }

  fun previousMonth (event : Html.Event) : Promise(Void) {
    if currentMonth == 1 {
      next { currentMonth: 12, currentYear: currentYear - 1 }
    } else {
      next { currentMonth: currentMonth - 1 }
    }
  }

  fun nextMonth (event : Html.Event) : Promise(Void) {
    if currentMonth == 12 {
      next { currentMonth: 1, currentYear: currentYear + 1 }
    } else {
      next { currentMonth: currentMonth + 1 }
    }
  }

  fun selectDate (day : Number) : Promise(Void) {
    let dateStr =
      "#{Number.toString(currentYear)}-#{Number.toString(currentMonth)}-#{Number.toString(
        day)}"

    next { selectedDate: dateStr, isOpen: false }
  }

  fun getMonthName : String {
    case currentMonth {
      1 => "Enero"
      2 => "Febrero"
      3 => "Marzo"
      4 => "Abril"
      5 => "Mayo"
      6 => "Junio"
      7 => "Julio"
      8 => "Agosto"
      9 => "Septiembre"
      10 => "Octubre"
      11 => "Noviembre"
      12 => "Diciembre"
      _ => "Mes"
    }
  }

  fun getDaysInMonth : Number {
    case currentMonth {
      2 =>
        if currentYear % 4 == 0 && (currentYear % 100 != 0 || currentYear % 400 == 0) {
          29
        } else {
          28
        }

      4 | 6 | 9 | 11 => 30
      _ => 31
    }
  }

  fun formatDisplayDate : String {
    if String.isEmpty(selectedDate) {
      placeholder
    } else {
      selectedDate
    }
  }

  fun render : Html {
    <div::datePicker>
      <input::input
        type="text"
        readonly={true}
        value={formatDisplayDate()}
        disabled={disabled}
        onClick={toggleCalendar}
      />

      {
        if isOpen {
          <div::calendar>
            <div::header>
              <button::navButton onClick={previousMonth}>"←"</button>

              <div::monthYear>
                "#{getMonthName()} #{Number.toString(currentYear)}"
              </div>

              <button::navButton onClick={nextMonth}>"→"</button>
            </div>

            <div::grid>
              <div::dayHeader>"Dom"</div>
              <div::dayHeader>"Lun"</div>
              <div::dayHeader>"Mar"</div>
              <div::dayHeader>"Mié"</div>
              <div::dayHeader>"Jue"</div>
              <div::dayHeader>"Vie"</div>
              <div::dayHeader>"Sáb"</div>

              {
                for day of Array.range(1, getDaysInMonth()) {
                  <div::day
                    class={
                      if selectedDate == "#{Number.toString(currentYear)}-#{Number.toString(
                        currentMonth)}-#{Number.toString(day)}" {
                        "selected"
                      } else {
                        ""
                      }
                    }
                    onClick={(event : Html.Event) { selectDate(day) }}
                  >
                    {
                      Number.toString(day)
                    }
                  </div>
                }
              }
            </div>
          </div>
        } else {
          <div/>
        }
      }
    </div>
  }
}

/* Slider Component - Range input slider */
component Slider {
  property value : Number = 50
  property min : Number = 0
  property max : Number = 100
  property step : Number = 1
  property disabled : Bool = false
  property showValue : Bool = true
  property onChange = (value : Number) : Promise(Void) { Promise.never() }

  state isDragging : Bool = false

  style slider {
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  }

  style track {
    position: relative;
    height: 6px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 3px;
    cursor: pointer;
  }

  style progress {
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-radius: 3px;
    transition: width 0.1s ease;
  }

  style thumb {
    position: absolute;
    top: 50%;
    width: 20px;
    height: 20px;
    background: white;
    border: 3px solid #667eea;
    border-radius: 50%;
    cursor: grab;
    transform: translate(-50%, -50%);
    transition: all 0.2s ease;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);

    &:hover {
      transform: translate(-50%, -50%) scale(1.1);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    &:active {
      cursor: grabbing;
      transform: translate(-50%, -50%) scale(1.2);
    }
  }

  style disabled {
    opacity: 0.6;
    cursor: not-allowed;
  }

  style valueDisplay {
    display: flex;
    justify-content: space-between;
    align-items: center;
    color: rgba(255, 255, 255, 0.8);
    font-size: 0.875rem;
  }

  style currentValue {
    background: rgba(102, 126, 234, 0.2);
    color: white;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-weight: 600;
  }

  fun getPercentage : Number {
    ((value - min) / (max - min)) * 100
  }

  fun handleTrackClick (event : Html.Event) : Promise(Void) {
    if !disabled {
      let newValue =
        min + (max - min) * 0.5

      onChange(newValue)
    } else {
      Promise.never()
    }
  }

  fun handleThumbDrag (event : Html.Event) : Promise(Void) {
    if !disabled {
      next { isDragging: true }
    } else {
      Promise.never()
    }
  }

  fun render : Html {
    <div::slider
      class={
        if disabled {
          "disabled"
        } else {
          ""
        }
      }
    >
      {
        if showValue {
          <div::valueDisplay>
            <span>
              {
                Number.toString(min)
              }
            </span>

            <span::currentValue>
              {
                Number.toString(value)
              }
            </span>

            <span>
              {
                Number.toString(max)
              }
            </span>
          </div>
        } else {
          <div/>
        }
      }

      <div::track onClick={handleTrackClick}>
        <div::progress style="width: #{Number.toString(getPercentage())}%"/>

        <div::thumb
          style="left: #{Number.toString(getPercentage())}%"
          onMouseDown={handleThumbDrag}
        />
      </div>
    </div>
  }
}

/* Switch Component - Toggle switch */
component Switch {
  property checked : Bool = false
  property disabled : Bool = false
  property size : String = "md"
  property label : String = ""
  property onChange = (checked : Bool) : Promise(Void) { Promise.never() }

  style wrapper {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    cursor: pointer;
    user-select: none;
  }

  style switch {
    position: relative;
    display: inline-block;
    border-radius: 9999px;
    transition: all 0.3s ease;
    cursor: pointer;
    border: 2px solid rgba(255, 255, 255, 0.2);
  }

  style small {
    width: 2.5rem;
    height: 1.25rem;
  }

  style medium {
    width: 3rem;
    height: 1.5rem;
  }

  style large {
    width: 3.5rem;
    height: 1.75rem;
  }

  style track {
    width: 100%;
    height: 100%;
    border-radius: 9999px;
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.2);
  }

  style checked {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border-color: #667eea;
  }

  style thumb {
    position: absolute;
    top: 2px;
    left: 2px;
    background: white;
    border-radius: 50%;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  style thumbSmall {
    width: 1rem;
    height: 1rem;
  }

  style thumbMedium {
    width: 1.25rem;
    height: 1.25rem;
  }

  style thumbLarge {
    width: 1.5rem;
    height: 1.5rem;
  }

  style thumbChecked {
    transform: translateX(100%);
  }

  style disabled {
    opacity: 0.6;
    cursor: not-allowed;
  }

  style label {
    color: white;
    font-size: 1rem;
    font-weight: 500;
  }

  fun getThumbTransform : String {
    case size {
      "small" =>
        if checked {
          "translateX(1.25rem)"
        } else {
          "translateX(0)"
        }

      "large" =>
        if checked {
          "translateX(1.5rem)"
        } else {
          "translateX(0)"
        }

      _ =>
        if checked {
          "translateX(1.25rem)"
        } else {
          "translateX(0)"
        }
    }
  }

  fun handleToggle (event : Html.Event) : Promise(Void) {
    if !disabled {
      onChange(!checked)
    } else {
      Promise.never()
    }
  }

  fun render : Html {
    <label::wrapper
      class={
        if disabled {
          "disabled"
        } else {
          ""
        }
      }
    >
      <div::switch class={size} onClick={handleToggle}>
        <div::track
          class={
            if checked {
              "checked"
            } else {
              ""
            }
          }
        >
          <div::thumb
            class="thumb#{String.capitalize(size)}"
            style="transform: #{getThumbTransform()}"
          />
        </div>
      </div>

      {
        if !String.isEmpty(label) {
          <span::label>
            {
              label
            }
          </span>
        } else {
          <span/>
        }
      }
    </label>
  }
}
