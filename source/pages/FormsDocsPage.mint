/* FormsDocsPage - Documentación de componentes de Formularios */
component FormsDocsPage {
  connect ThemeStore exposing { currentTheme }

  state inputValue : String = ""
  state autocompleteValue : String = ""
  state selectValue : String = "option1"
  state checkboxValue : Bool = false
  state dateValue : String = ""
  state numberValue : Number = 0
  state radioValue : String = ""
  state toggleValue : Bool = false
  state sliderValue : Number = 50
  state tagsValue : Array(String) = ["Mint", "Frontend", "UI"]
  state otpValue : String = ""
  state colorValue : String = "#667eea"
  state passwordValue : String = ""

  style pageTitle {
    font-size: 2.5rem;
    font-weight: 800;
    margin-bottom: 1rem;
  }

  style pageDescription {
    font-size: 1.125rem;
    opacity: 0.8;
    margin-bottom: 3rem;
    line-height: 1.6;
  }

  style section {
    margin-bottom: 4rem;
  }

  style sectionTitle {
    font-size: 1.75rem;
    font-weight: 700;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid;
  }

  fun getSectionTitleStyles : String {
    "border-bottom-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};"
  }

  style componentCard {
    padding: 1.5rem;
    border-radius: 12px;
    margin-bottom: 2rem;
    border: 1px solid;
  }

  fun getComponentCardStyles : String {
    "
      background: #{ThemeHelpers.getSurface(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
      box-shadow: #{ThemeHelpers.getShadowMedium(currentTheme)};
    "
  }

  style componentName {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
  }

  style componentDescription {
    opacity: 0.8;
    margin-bottom: 1.5rem;
    line-height: 1.6;
  }

  style exampleContainer {
    padding: 2rem;
    border-radius: 8px;
    margin: 1.5rem 0;
    border: 1px dashed;
  }

  fun getExampleContainerStyles : String {
    "
      background: #{ThemeHelpers.getBackground(currentTheme)};
      border-color: #{ThemeHelpers.getBorderPrimary(currentTheme)};
    "
  }

  style codeBlock {
    padding: 1rem;
    border-radius: 8px;
    margin-top: 1rem;
    overflow-x: auto;
    font-family: 'Fira Code', monospace;
    font-size: 0.875rem;
    line-height: 1.6;
  }

  fun getCodeBlockStyles : String {
    "
      background: #{ThemeHelpers.getElevated(currentTheme)};
      color: #{ThemeHelpers.getTextPrimary(currentTheme)};
    "
  }

  style badge {
    display: inline-block;
    padding: 0.25rem 0.5rem;
    border-radius: 4px;
    font-size: 0.75rem;
    font-weight: 600;
    margin-left: 0.5rem;
  }

  fun getBadgeStyles (variant : String) : String {
    case variant {
      "new" => "background: #10b981; color: white;"
      "form" => "background: #3b82f6; color: white;"
      => "background: #{ThemeHelpers.getAccent(currentTheme)}; color: white;"
    }
  }

  fun handleInputChange (value : String) : Promise(Void) {
    next { inputValue: value }
  }

  fun handleAutocompleteChange (value : String) : Promise(Void) {
    next { autocompleteValue: value }
  }

  fun handleRadioChange (value : String) : Promise(Void) {
    next { radioValue: value }
  }

  fun handleCheckboxChange (checked : Bool) : Promise(Void) {
    next { checkboxValue: checked }
  }

  fun handleToggleChange (checked : Bool) : Promise(Void) {
    next { toggleValue: checked }
  }

  fun handleSliderChange (value : Number) : Promise(Void) {
    next { sliderValue: value }
  }

  fun handleTagsChange (tags : Array(String)) : Promise(Void) {
    next { tagsValue: tags }
  }

  fun handleOtpChange (value : String) : Promise(Void) {
    next { otpValue: value }
  }

  fun handleColorChange (color : String) : Promise(Void) {
    next { colorValue: color }
  }

  fun handlePasswordChange (event : Html.Event) : Promise(Void) {
    next { passwordValue: Dom.getValue(event.target) }
  }

  fun render : Html {
    <div>
      <h1::pageTitle>"Form Components"</h1>

      <p::pageDescription>
        "Comprehensive form components with built-in validation, theming, and accessibility.
        All components follow WCAG guidelines and support keyboard navigation."
      </p>

      // Input Component
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Text Input"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "Input"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Standard text input with label, placeholder, error states, and icons.
            Supports all HTML input types (text, email, password, etc.)."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <Input
              placeholder="Enter your email"
              value={inputValue}
              type="email"
              onChange={(e : Html.Event) { next { inputValue: Dom.getValue(e.target) } }}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<Input
  placeholder=\"Enter your email\"
  value={inputValue}
  type=\"email\"
  onChange={handleInputChange}
/>"
          />
        </div>
      </div>

      // AutocompleteInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Autocomplete Input"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "AutocompleteInput"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Input with autocomplete suggestions. Supports filtering, keyboard navigation,
            and custom suggestion rendering."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <AutocompleteInput
              placeholder="Search countries..."
              value={autocompleteValue}
              suggestions={["Spain", "France", "Germany", "Italy", "Portugal"]}
              onChange={handleAutocompleteChange}
              minChars={2}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<AutocompleteInput
  placeholder=\"Search countries...\"
  value={autocompleteValue}
  suggestions={[\"Spain\", \"France\", \"Germany\"]}
  onChange={handleAutocompleteChange}
  minChars={2}
/>"
          />
        </div>
      </div>

      // PasswordInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Password Input"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "PasswordInput"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Password input with show/hide toggle and strength indicator.
            Includes validation for password requirements."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <PasswordInput
              placeholder="Enter password"
              value={passwordValue}
              onChange={handlePasswordChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<PasswordInput
  placeholder=\"Enter password\"
  value=\"\"
/>"
          />
        </div>
      </div>

      // Select
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Select Dropdown"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "SelectInput"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Styled select dropdown with custom rendering and search functionality."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <SelectInput
              placeholder="Choose an option"
              options={["Option 1", "Option 2", "Option 3"]}
              value=""
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<SelectInput
  placeholder=\"Choose an option\"
  options={[\"Option 1\", \"Option 2\", \"Option 3\"]}
  value=\"\"
/>"
          />
        </div>
      </div>

      // Checkbox
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Checkbox"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "CheckboxInput"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Customizable checkbox with label and indeterminate state support."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <CheckboxInput
              label="Accept terms and conditions"
              checked={checkboxValue}
              onChange={handleCheckboxChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<CheckboxInput
  label=\"Accept terms and conditions\"
  checked={checkboxValue}
/>"
          />
        </div>
      </div>

      // RadioGroup
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Radio Group"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "RadioGroup"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Radio button group with custom styling and keyboard navigation."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <RadioGroup
              name="payment"
              options={["Credit Card", "PayPal", "Cryptocurrency"]}
              selectedValue={radioValue}
              onChange={handleRadioChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<RadioGroup
  name=\"payment\"
  options={[\"Credit Card\", \"PayPal\", \"Cryptocurrency\"]}
  selectedValue=\"\"
/>"
          />
        </div>
      </div>

      // ToggleSwitch
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Toggle Switch"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "ToggleSwitch"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "iOS-style toggle switch for boolean values."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ToggleSwitch
              label="Enable notifications"
              checked={toggleValue}
              onChange={handleToggleChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ToggleSwitch
  label=\"Enable notifications\"
  checked={toggleValue}
  onChange={handleToggleChange}
/>"
          />
        </div>
      </div>

      // DateInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Date Picker"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "DateInput"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Date picker with calendar dropdown and keyboard input support."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DateInput
              placeholder="Select date"
              value={dateValue}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<DateInput
  placeholder=\"Select date\"
  value={dateValue}
/>"
          />
        </div>
      </div>

      // DateRangePicker
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Date Range Picker"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "DateRangePicker"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Select date ranges with visual calendar. Perfect for filtering and booking."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <DateRangePicker
              startDate=""
              endDate=""
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<DateRangePicker
  startDate=\"\"
  endDate=\"\"
/>"
          />
        </div>
      </div>

      // NumberInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Number Input"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "NumberInput"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Numeric input with increment/decrement buttons and validation."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <NumberInput
              value={numberValue}
              min={0}
              max={100}
              step={1}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<NumberInput
  value={numberValue}
  min={0}
  max={100}
  step={1}
/>"
          />
        </div>
      </div>

      // SliderInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Slider"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "SliderInput"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Range slider with value display and customizable appearance."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <SliderInput
              min={0}
              max={100}
              value={sliderValue}
              step={5}
              showValue={true}
              onChange={handleSliderChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<SliderInput
  min={0}
  max={100}
  value={sliderValue}
  step={5}
  showValue={true}
  onChange={handleSliderChange}
/>"
          />
        </div>
      </div>

      // CurrencyInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Currency Input"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "CurrencyInput"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Formatted currency input with symbol and automatic formatting."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <CurrencyInput
              placeholder="Enter price"
              currency="USD"
              value={0}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<CurrencyInput
  placeholder=\"Enter price\"
  currency=\"USD\"
  value={0}
/>"
          />
        </div>
      </div>

      // TagsInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Tags Input"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "TagsInput"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "Input for adding and removing tags. Supports autocomplete and validation."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <TagsInput
              placeholder="Add tags..."
              tags={tagsValue}
              onTagsChange={handleTagsChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<TagsInput
  placeholder=\"Add tags...\"
  tags={tagsValue}
  onTagsChange={handleTagsChange}
/>"
          />
        </div>
      </div>

      // OTPInput
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"OTP Input"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "OTPInput"
            <span::badge style={getBadgeStyles("new")}>"New"</span>
          </h3>

          <p::componentDescription>
            "One-Time Password input with auto-focus and paste support."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <OTPInput
              length={6}
              value={otpValue}
              onChange={handleOtpChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<OTPInput
  length={6}
  value=\"\"
/>"
          />
        </div>
      </div>

      // FileUpload
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"File Upload"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "FileUpload"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Drag-and-drop file upload with preview and progress indication."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <FileUpload
              accept="image/*"
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<FileUpload
  accept=\"image/*\"
/>"
          />
        </div>
      </div>

      // ColorPicker
      <div::section>
        <h2::sectionTitle style={getSectionTitleStyles()}>"Color Picker"</h2>

        <div::componentCard style={getComponentCardStyles()}>
          <h3::componentName>
            "ColorPicker"
            <span::badge style={getBadgeStyles("form")}>"Form"</span>
          </h3>

          <p::componentDescription>
            "Visual color picker with hex, RGB, and HSL support."
          </p>

          <div::exampleContainer style={getExampleContainerStyles()}>
            <ColorPicker
              value={colorValue}
              onChange={handleColorChange}
            />
          </div>

          <CodeHighlight
            language="mint"
            code="<ColorPicker
  value={colorValue}
  onChange={handleColorChange}
/>"
          />
        </div>
      </div>
    </div>
  }
}
