component FormsShowcase {
  state inputValue : String = ""
  state checkboxChecked : Bool = false
  state radioSelected : String = "option1"
  state passwordValue : String = ""
  state numberInputValue : Number = 5
  state sliderValue : Number = 50
  state searchValue : String = ""
  state dateValue : String = ""
  state timeValue : String = ""
  state dateTimeDate : String = ""
  state dateTimeTime : String = ""
  state colorValue : String = "#667eea"
  state radioGroupValue : String = "Option 1"
  state checkboxValue : Bool = false
  state toggleValue : Bool = false
  state selectValue : String = ""
  state rangeMinValue : Number = 20
  state rangeMaxValue : Number = 80
  state tagsValue : Array(String) = ["React", "Mint"]
  state autocompleteValue : String = ""
  state currencyValue : Number = 0
  state dateRangeStart : String = ""
  state dateRangeEnd : String = ""
  state phoneValue : String = ""
  state otpValue : String = ""

  connect ThemeStore exposing { currentTheme }

  style tabContent {
    margin-top: 2rem;
  }

  style sectionTitle {
    font-size: 2rem;
    font-weight: 600;
    margin-bottom: 2rem;
    text-align: center;
  }

  fun getSectionTitleStyles : String {
    "
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style formGrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 2rem;
    width: 100%;
    box-sizing: border-box;
    margin: 2rem 0;
  }

  fun handlePasswordChange (event : Html.Event) : Promise(Void) {
    next { passwordValue: Dom.getValue(event.target) }
  }

  fun handleNumberInputChange (newValue : Number) : Promise(Void) {
    next { numberInputValue: newValue }
  }

  fun handleSliderChange (newValue : Number) : Promise(Void) {
    next { sliderValue: newValue }
  }

  fun handleSearchChange (event : Html.Event) : Promise(Void) {
    next { searchValue: Dom.getValue(event.target) }
  }

  fun handleSearchSubmit (query : String) : Promise(Void) {
    Promise.never()
  }

  fun handleDateChange (event : Html.Event) : Promise(Void) {
    next { dateValue: Dom.getValue(event.target) }
  }

  fun handleTimeChange (event : Html.Event) : Promise(Void) {
    next { timeValue: Dom.getValue(event.target) }
  }

  fun handleDateTimeDate (event : Html.Event) : Promise(Void) {
    next { dateTimeDate: Dom.getValue(event.target) }
  }

  fun handleDateTimeTime (event : Html.Event) : Promise(Void) {
    next { dateTimeTime: Dom.getValue(event.target) }
  }

  fun handleColorChange (newColor : String) : Promise(Void) {
    next { colorValue: newColor }
  }

  fun handleRadioGroupChange (value : String) : Promise(Void) {
    next { radioGroupValue: value }
  }

  fun handleCheckboxInputChange (checked : Bool) : Promise(Void) {
    next { checkboxValue: checked }
  }

  fun handleToggleChange (checked : Bool) : Promise(Void) {
    next { toggleValue: checked }
  }

  fun handleSelectChange2 (value : String) : Promise(Void) {
    next { selectValue: value }
  }

  fun handleRangeChange (minVal : Number, maxVal : Number) : Promise(Void) {
    next { rangeMinValue: minVal, rangeMaxValue: maxVal }
  }

  fun handleTagsChange (newTags : Array(String)) : Promise(Void) {
    next { tagsValue: newTags }
  }

  fun handleAutocompleteChange (value : String) : Promise(Void) {
    next { autocompleteValue: value }
  }

  fun handleAutocompleteSelect (selected : String) : Promise(Void) {
    next { autocompleteValue: selected }
  }

  fun handleCurrencyChange (value : Number) : Promise(Void) {
    next { currencyValue: value }
  }

  fun handleDateRangeStart (event : Html.Event) : Promise(Void) {
    next { dateRangeStart: Dom.getValue(event.target) }
  }

  fun handleDateRangeEnd (event : Html.Event) : Promise(Void) {
    next { dateRangeEnd: Dom.getValue(event.target) }
  }

  fun handlePhoneChange (value : String) : Promise(Void) {
    next { phoneValue: value }
  }

  fun handleOTPChange (value : String) : Promise(Void) {
    next { otpValue: value }
  }

  fun render : Html {
    <div::tabContent>
      <h3::sectionTitle style={getSectionTitleStyles()}>"Form Components"</h3>

      <div::formGrid>
        <Card title="Input Fields">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Input placeholder="Ingrese su texto..." value={inputValue}/>
            <Input type="email" placeholder="email@ejemplo.com"/>
            <Input type="password" placeholder="Contraseña"/>
          </div>
        </Card>

        <Card title="Selections">
          <div style="display: flex; flex-direction: column; gap: 1rem;">
            <Checkbox
              label="Acepto términos y condiciones"
              checked={checkboxChecked}
            />

            <Radio label="Opción 1" checked={radioSelected == "option1"}/>
            <Radio label="Opción 2" checked={radioSelected == "option2"}/>
          </div>
        </Card>

        <Card title="Text Area">
          <Textarea placeholder="Escriba su mensaje aquí..." rows={4}/>
        </Card>

        <Card title="Password Input">
          <PasswordInput
            placeholder="Enter your password"
            value={passwordValue}
            onChange={handlePasswordChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >"Try clicking the eye icon!"</p>
        </Card>

        <Card title="Number Input">
          <NumberInput
            value={numberInputValue}
            min={0}
            max={10}
            step={1}
            onChange={handleNumberInputChange}
          />

          <p style="margin-top: 0.5rem; text-align: center;">
            "Value: "
            Number.toString(numberInputValue)
          </p>
        </Card>

        <Card title="Slider">
          <SliderInput
            value={sliderValue}
            min={0}
            max={100}
            step={5}
            showValue={true}
            onChange={handleSliderChange}
          />
        </Card>

        <Card title="Search Input">
          <SearchInputComponent
            placeholder="Search..."
            value={searchValue}
            onChange={handleSearchChange}
            onSearch={handleSearchSubmit}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Search: "
            searchValue
          </p>
        </Card>

        <Card title="File Upload"><FileUpload accept="image/*"/></Card>

        <Card title="Date Input">
          <DateInput
            value={dateValue}
            placeholder="Select date"
            onChange={handleDateChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "

            {
              if String.isEmpty(dateValue) {
                "None"
              } else {
                dateValue
              }
            }
          </p>
        </Card>

        <Card title="Time Input">
          <TimeInput
            value={timeValue}
            placeholder="Select time"
            onChange={handleTimeChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "

            {
              if String.isEmpty(timeValue) {
                "None"
              } else {
                timeValue
              }
            }
          </p>
        </Card>

        <Card title="Date & Time Input">
          <DateTimeInput
            dateValue={dateTimeDate}
            timeValue={dateTimeTime}
            onDateChange={handleDateTimeDate}
            onTimeChange={handleDateTimeTime}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            {
              if String.isEmpty(dateTimeDate) && String.isEmpty(dateTimeTime) {
                "No date/time selected"
              } else {
                "#{dateTimeDate} #{dateTimeTime}"
              }
            }
          </p>
        </Card>

        <Card title="Color Picker">
          <ColorPicker value={colorValue} onChange={handleColorChange}/>

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected color: "
            colorValue
          </p>
        </Card>

        <Card title="Radio Group">
          <RadioGroup
            options={["Option 1", "Option 2", "Option 3"]}
            selectedValue={radioGroupValue}
            name="demo-radio"
            onChange={handleRadioGroupChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "
            radioGroupValue
          </p>
        </Card>

        <Card title="Checkbox Input">
          <CheckboxInput
            label="Enable notifications"
            checked={checkboxValue}
            onChange={handleCheckboxInputChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Checked: "

            {
              if checkboxValue {
                "Yes"
              } else {
                "No"
              }
            }
          </p>
        </Card>

        <Card title="Toggle Switch">
          <ToggleSwitch
            label="Dark Mode"
            checked={toggleValue}
            onChange={handleToggleChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Status: "

            {
              if toggleValue {
                "ON"
              } else {
                "OFF"
              }
            }
          </p>
        </Card>

        <Card title="Select Dropdown">
          <SelectInput
            options={["JavaScript", "TypeScript", "Python", "Rust", "Go"]}
            value={selectValue}
            placeholder="Choose a language"
            onChange={handleSelectChange2}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Selected: "

            {
              if String.isEmpty(selectValue) {
                "None"
              } else {
                selectValue
              }
            }
          </p>
        </Card>

        <Card title="Range Input">
          <RangeInput
            minValue={rangeMinValue}
            maxValue={rangeMaxValue}
            min={0}
            max={100}
            step={5}
            onChange={handleRangeChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Range: "
            Number.toString(rangeMinValue)
            " - "
            Number.toString(rangeMaxValue)
          </p>
        </Card>

        <Card title="Tags Input">
          <TagsInput
            tags={tagsValue}
            placeholder="Add a tag..."
            onTagsChange={handleTagsChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Tags: "
            Number.toString(Array.size(tagsValue))
          </p>
        </Card>

        <Card title="Autocomplete Input">
          <AutocompleteInput
            value={autocompleteValue}
            suggestions={
              [
                "JavaScript",
                "TypeScript",
                "Python",
                "Ruby",
                "Go",
                "Rust",
                "Java",
                "Kotlin",
                "Swift"
              ]
            }
            placeholder="Type to search..."
            onChange={handleAutocompleteChange}
            onSelect={handleAutocompleteSelect}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Value: "

            {
              if String.isEmpty(autocompleteValue) {
                "None"
              } else {
                autocompleteValue
              }
            }
          </p>
        </Card>

        <Card title="Currency Input">
          <CurrencyInput
            value={currencyValue}
            currency="$"
            placeholder="0.00"
            onChange={handleCurrencyChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Amount: $"
            Number.toString(currencyValue)
          </p>
        </Card>

        <Card title="Date Range Picker">
          <DateRangePicker
            startDate={dateRangeStart}
            endDate={dateRangeEnd}
            onStartDateChange={handleDateRangeStart}
            onEndDateChange={handleDateRangeEnd}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            {
              if String.isEmpty(dateRangeStart) && String.isEmpty(dateRangeEnd) {
                "No range selected"
              } else {
                "#{dateRangeStart} to #{dateRangeEnd}"
              }
            }
          </p>
        </Card>

        <Card title="Phone Input">
          <PhoneInput
            value={phoneValue}
            countryCode="+1"
            placeholder="(555) 123-4567"
            onChange={handlePhoneChange}
          />

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Phone: "

            {
              if String.isEmpty(phoneValue) {
                "None"
              } else {
                phoneValue
              }
            }
          </p>
        </Card>

        <Card title="OTP Input">
          <OTPInput length={6} value={otpValue} onChange={handleOTPChange}/>

          <p
            style="margin-top: 0.5rem; text-align: center; font-size: 0.875rem;"
          >
            "Code: "

            {
              if String.isEmpty(otpValue) {
                "None"
              } else {
                otpValue
              }
            }
          </p>
        </Card>
      </div>
    </div>
  }
}
